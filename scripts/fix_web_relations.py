#!/usr/bin/env python3
r"""Restore relation spacing for < and > in the built web blueprint.

plasTeX writes `<` and `>` inside math as `{\lt}` and `{\gt}`. The braces make each a group, which
MathJax typesets as an ordinary symbol, so `d+l<dl` loses the space a relation gets. This rewrites
them to `\lt ` and `\gt ` in every HTML file under blueprint/web. Run it after `leanblueprint web`.
"""
import pathlib
import sys

WEB = pathlib.Path(__file__).resolve().parent.parent / "blueprint" / "web"


def main():
    if not WEB.is_dir():
        sys.exit(f"{WEB} does not exist; run `leanblueprint web` first")
    files = n = 0
    for f in sorted(WEB.rglob("*.html")):
        s = f.read_text(encoding="utf-8")
        k = s.count("{\\lt}") + s.count("{\\gt}")
        if k:
            f.write_text(s.replace("{\\lt}", "\\lt ").replace("{\\gt}", "\\gt "), encoding="utf-8")
            files += 1
            n += k
    print(f"rewrote {n} relations in {files} files")


if __name__ == "__main__":
    main()
