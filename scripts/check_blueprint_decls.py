#!/usr/bin/env python3
"""Check that every \\lean{...} name in the blueprint is a declaration of the library.

Reads the names from the \\lean{} commands of blueprint/src/**/*.tex, writes a scratch Lean
file that imports Diaz and runs `#check @Name` on each, and runs it with `lake env lean` in a
built checkout of this repository: by default this one, or the one given by --project (for
instance the main checkout, when this is an unbuilt worktree at the same commit). The names
must be the library's own, as `#check` accepts them after `import Diaz`.

This stands in for leanblueprint's `checkdecls`, which would need a lakefile change.

Usage
  python3 scripts/check_blueprint_decls.py [--project PATH] [--list]

Exit status 0 when every name resolves, 1 when one does not, 2 when Lean could not run.
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "blueprint" / "src"
LEAN_RE = re.compile(r"\\lean\{([^}]*)\}")
COMMENT_RE = re.compile(r"(?<!\\)%.*$")
# Lean 4.34 prints `file:line:col: error(lean.unknownIdentifier): ...`; older ones `error: ...`.
ERROR_RE = re.compile(r"^[^\n]*?:(\d+):\d+: error(?:\([^)]*\))?: (.*)$", re.M)


def blueprint_names() -> list[str]:
    names: list[str] = []
    for tex in sorted(SRC.rglob("*.tex")):
        for line in tex.read_text().splitlines():
            for m in LEAN_RE.finditer(COMMENT_RE.sub("", line)):
                for name in m.group(1).split(","):
                    name = name.strip()
                    if name and name not in names:
                        names.append(name)
    return names


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--project", type=Path, default=ROOT,
                    help="a built checkout of the library (default: this repository)")
    ap.add_argument("--list", action="store_true", help="print the names and stop")
    args = ap.parse_args()

    names = blueprint_names()
    if not names:
        sys.exit("check_blueprint_decls: no \\lean{} names found under blueprint/src")
    if args.list:
        print("\n".join(names))
        return

    with tempfile.TemporaryDirectory() as tmp:
        scratch = Path(tmp) / "BlueprintDecls.lean"
        scratch.write_text("import Diaz\n" + "".join(f"#check @{n}\n" for n in names))
        proc = subprocess.run(["lake", "env", "lean", str(scratch)], cwd=args.project,
                              capture_output=True, text=True)
    output = proc.stdout + proc.stderr

    errors = [line for line in output.splitlines() if "error" in line]
    failed: dict[str, str] = {}
    for m in ERROR_RE.finditer(output):
        line = int(m.group(1))
        if line >= 2 and line - 2 < len(names):
            failed.setdefault(names[line - 2], m.group(2))
        else:
            print("\n".join(errors), file=sys.stderr)
            sys.exit(f"check_blueprint_decls: Lean failed outside the #check lines (line {line}); "
                     "is the project built?")
    if proc.returncode != 0 and not failed:
        print("\n".join(errors) or output[-2000:], file=sys.stderr)
        sys.exit(2)

    for name, err in failed.items():
        print(f"not found: {name}: {err}")
    print(f"{len(names) - len(failed)} of {len(names)} \\lean{{}} names resolve after `import Diaz` "
          f"(Lean run in {args.project})")
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
