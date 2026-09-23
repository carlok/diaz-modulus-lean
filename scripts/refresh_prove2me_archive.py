#!/usr/bin/env python3
"""Refresh archive/prove2me/ from the live board and regenerate MIRROR_CHECKLIST.md.

    PROVE2ME_API_KEY=... python3 scripts/refresh_prove2me_archive.py          # write
    PROVE2ME_API_KEY=... python3 scripts/refresh_prove2me_archive.py --check  # exit 1 if stale

What it does, in order:

1. Lists every node of the Diaz mission (names starting `Diaz.`, `DiazModulus.` or `FourExp.`),
   plus the nodes of other missions in EXTRA_NODES that this project proved.
2. For each Proved or Open node, pages through its ACCEPTED and SKETCH_ACCEPTED
   submissions and downloads any not yet in the archive via GET /submissions/:id/solution.
   Open nodes matter too: an accepted sketch reduces a node to its children and exists
   nowhere else.
3. Redacts **comments only** in newly downloaded files: private file names, document
   labels that do not exist in this repository's public notes under tex/, and platform
   uuids. It refuses to write a file whose code changed, and never touches files that
   are already archived, so hand-polished redactions survive a refresh.
4. Mirrors every **Open** node under the prefixes in OPEN_PREFIXES into
   archive/prove2me/open/: `<name>.lean` holds the preamble and formal statement, `<name>.md`
   the title, source and write-up. These files are regenerated whenever the board changes, and
   removed once a node is no longer Open. An Open statement that a reduction imports would
   otherwise exist only on the platform.
5. Regenerates MIRROR_CHECKLIST.md from the board, the archive, the Diaz/ library and
   scripts/mirror_priorities.json.

Standard library only; no curl, no shell. The key is read from the environment and
never printed.
"""
import argparse, json, os, pathlib, re, sys, time, urllib.error, urllib.request

BASE = "https://prove2.me/api/v1"
ROOT = pathlib.Path(__file__).resolve().parent.parent
ARCHIVE = ROOT / "archive" / "prove2me"
MANIFEST = ARCHIVE / "manifest.json"
CHECKLIST = ROOT / "MIRROR_CHECKLIST.md"
PRIORITIES = ROOT / "scripts" / "mirror_priorities.json"
PREFIXES = ("Diaz.", "DiazModulus.", "FourExp.")
# Nodes of other missions that this project proved, from results in this library. Only this
# account's submissions are archived for them: the other mission's reductions are not ours to keep.
EXTRA_NODES = ("Schanuel.six_exponentials", "Schanuel.hermite_lindemann",
               "Schanuel.lindemann_weierstrass", "Schanuel.gelfond_schneider")
OPEN = ARCHIVE / "open"
OPEN_PREFIXES = ("FourExp.",)
OPEN_README = """# Open statements

Formal statements and write-ups of the **Open** nodes of the four exponentials subtree
(`FourExp.*`) of the Diaz mission. They are copied from the Prove2Me board by
`scripts/refresh_prove2me_archive.py` and regenerated on every refresh. A file disappears once
its node is proved, when the accepted proof lands in `archive/prove2me/`.

These are statements, not proofs: each `.lean` file ends in `sorry`. They are kept because
accepted reductions elsewhere in the archive import them (`import Theorems.Thm_<name>`), and
without them those reductions would point at text that exists only on the platform.

Not built by this repository.

## A superseded branch

The statements here are a documented dead branch. Each was replaced by a corrected node that is
Proved, and each one's `Source` line says so on the platform:

| Here | Replaced by | Why |
| --- | --- | --- |
| `FourExp.auxiliary_function` | `FourExp.auxiliary_function_alg` | omits the hypothesis that the four `exp (xᵢyⱼ)` are algebraic, without which the `ω`-degree of their powers is unbounded |
| `FourExp.norm_to_polynomial` | `FourExp.norm_to_polynomial_alg` | the same missing hypothesis |

Two more nodes of the branch are closed, both on 2026-09-23, and both are mirrored:

- `FourExp.construction_core` fixes `S = ⌊N²√log N⌋` where the 1973 text has `S = ⌊N²/√log N⌋`.
  Its hypotheses are those of the four exponentials theorem in transcendence degree one, so they
  are contradictory, and it is proved by citing that theorem. The corrected version is
  `FourExp.construction_core_1973`.
- `FourExp.construction_count` had the same wrong `S`, but its inequality holds either way.
  Another contributor proved it. The corrected version is `FourExp.construction_count_1973`.

The corrected nodes are in `archive/prove2me/` and in `Diaz/Mirror/`. Nothing depends on the
statements here except two reductions accepted before the defects were found, the first sketches
of `auxiliary_construction` and `construction_core_1973`; both nodes are Proved through their
second sketches.
"""


def render_open(r):
    """The two files that mirror one Open node: statement (.lean) and write-up (.md)."""
    name = r["theorem_name"]
    lean = (f"-- Open on Prove2Me: statement only, not a proof. Node `{name}`, theorem id {r['theorem_id']}.\n"
            f"-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.\n\n"
            f"{(r.get('preamble') or '').strip()}\n\n{(r.get('formal_statement') or '').strip()}\n")
    md = (f"# {(r.get('theorem_title') or name).strip()}\n\n"
          f"- **Node:** `{name}`\n- **Status:** Open\n- **Theorem id:** `{r['theorem_id']}`\n"
          f"- **Source:** {(r.get('source') or '—').strip()}\n\n"
          f"{(r.get('natural_language_statement') or '').strip()}\n")
    return {f"{name}.lean": lean, f"{name}.md": md}


# ---------------------------------------------------------------- API

class Api:
    def __init__(self, key):
        self.key, self.token, self.expires = key, None, 0

    def _raw(self, method, path, body=None, auth=True):
        req = urllib.request.Request(BASE + path, data=body, method=method)
        if body is not None:
            req.add_header("Content-Type", "application/json")
        if auth:
            req.add_header("Authorization", "Bearer " + self._token())
        for attempt in range(4):
            try:
                with urllib.request.urlopen(req, timeout=60) as r:
                    return json.loads(r.read().decode())
            except urllib.error.HTTPError as e:
                if e.code in (429, 502, 503, 504) and attempt < 3:
                    time.sleep(2 ** attempt); continue
                raise SystemExit(f"{method} {path}: HTTP {e.code}")
            except urllib.error.URLError:
                if attempt < 3:
                    time.sleep(2 ** attempt); continue
                raise

    def _token(self):
        if not self.token or self.expires < time.time() + 120:
            d = self._raw("POST", "/agent/refresh", json.dumps({"api_key": self.key}).encode(), auth=False)
            self.token, self.expires = d["access_token"], int(d["expires_at"])
        return self.token

    def get(self, path):
        return self._raw("GET", path)

    def paged(self, path, key, limit):
        off, out = 0, []
        sep = "&" if "?" in path else "?"
        while True:
            rows = self.get(f"{path}{sep}limit={limit}&offset={off}").get(key, [])
            out += rows
            if len(rows) < limit:
                return out
            off += limit


# ---------------------------------------------------------------- redaction

def comment_spans(t):
    spans, i, n = [], 0, len(t)
    while i < n:
        if t.startswith("/-", i):
            depth, j = 1, i + 2
            while j < n and depth:
                if t.startswith("/-", j): depth += 1; j += 2
                elif t.startswith("-/", j): depth -= 1; j += 2
                else: j += 1
            spans.append((i, j)); i = j
        elif t.startswith("--", i):
            j = t.find("\n", i); j = n if j < 0 else j
            spans.append((i, j)); i = j
        elif t[i] == '"':
            j = i + 1
            while j < n and t[j] != '"':
                j += 2 if t[j] == "\\" else 1
            i = j + 1
        else:
            i += 1
    return spans


def strip_comments(t):
    out, last = [], 0
    for a, b in comment_spans(t):
        out.append(t[last:a]); last = b
    out.append(t[last:])
    return re.sub(r"\s+", " ", "".join(out)).strip()


def public_notes():
    names, labels = set(), set()
    for p in (ROOT / "tex").glob("*.tex"):
        names.add(p.name)
        labels |= set(re.findall(r"\\label\{([^}]+)\}", p.read_text(errors="ignore")))
    return names, labels


def redact(text, pub_names, pub_labels):
    """Redact comments only, and only what a public reader cannot resolve.

    Private file names, labels that do not exist in the public notes under tex/, and local
    paths. Platform uuids are kept: they name public nodes. No whitespace is normalised:
    this is an archive, and every change should be one somebody would notice and want.
    """
    LABEL = r"(?:thm|prop|cor|lem|sec|rem|eq|def):[a-z][a-z-]*"

    def fix(c):
        c = re.sub(r"([A-Z][\w.-]*(?: [A-Z][\w.-]*)*)'s note `?([\w-]+\.tex)`?",
                   lambda m: m.group(0) if m.group(2) in pub_names
                   else f"an earlier unpublished note by {m.group(1)}", c)
        c = re.sub(r"`?\b([\w-]+\.tex)\b`?",
                   lambda m: m.group(0) if m.group(1) in pub_names else "an earlier unpublished note", c)
        c = re.sub(r"`?\b[A-Z][A-Z0-9_]{3,}\.md\b`?", "an unpublished working note", c)
        c = re.sub(r"`?(?:/Users|/home|/private/tmp)/[^\s`]*`?", "a local path", c)
        keep = lambda m, label: m.group(0) if label in pub_labels else None
        # "(`cor:x`, *Title*)" -> "(*Title*)"
        c = re.sub(r"\(`?(" + LABEL + r")`?,\s*", lambda m: m.group(0) if m.group(1) in pub_labels else "(", c)
        # " (`cor:x`)" -> ""
        c = re.sub(r" ?\(`?(" + LABEL + r")`?\)", lambda m: m.group(0) if m.group(1) in pub_labels else "", c)
        # a bare label between two words keeps exactly one space
        c = re.sub(r"( ?)`?(" + LABEL + r")`?( ?)",
                   lambda m: m.group(0) if m.group(2) in pub_labels
                   else (" " if m.group(1) and m.group(3) else ""), c)
        return c

    parts, last = [], 0
    for a, b in comment_spans(text):
        parts.append(text[last:a]); parts.append(fix(text[a:b])); last = b
    parts.append(text[last:])
    out = "".join(parts)
    if strip_comments(out) != strip_comments(text):
        raise SystemExit("redaction changed code; refusing to write")
    return out


# ---------------------------------------------------------------- checklist

def library_decls():
    """Declarations in modules the library actually builds.

    Only modules reachable by imports from `Diaz.lean` count. A file that sits under
    `Diaz/` but is not imported — typically a port that does not compile yet — is not
    in the library, and counting it would mark a broken result as done.
    """
    reachable, todo = set(), ["Diaz"]
    while todo:
        mod = todo.pop()
        if mod in reachable:
            continue
        path = ROOT / (mod.replace(".", "/") + ".lean")
        if not path.exists():
            continue
        reachable.add(mod)
        todo += [m for m in re.findall(r"^import (Diaz(?:\.[\w']+)*)\s*$", path.read_text(), re.M)]
    decls = {}
    for mod in sorted(reachable):
        f = ROOT / (mod.replace(".", "/") + ".lean")
        for d in re.findall(r"^(?:private )?(?:theorem|lemma) ([\w.']+)", f.read_text(), re.M):
            decls.setdefault(d.split(".")[-1], str(f.relative_to(ROOT)))
    return decls


def render_checklist(proved, manifest, prio):
    decls, arch = library_decls(), {}
    for e in manifest:
        arch.setdefault(e["theorem_name"], []).append(e["file"])
    aliases, low, high, bad = prio["aliases"], set(prio["low"]), set(prio["high"]), prio["defective"]
    counts = dict(library=0, high=0, normal=0, low=0, defective=0)
    rows = []
    for r in sorted(proved, key=lambda r: r["theorem_name"]):
        n = r["theorem_name"]; s = n.split(".", 1)[1]
        lib = decls.get(s) or decls.get(aliases.get(s, ""))
        if lib: p = "done"; counts["library"] += 1
        elif s in bad: p = "skip (defective)"; counts["defective"] += 1
        elif s in low: p = "low"; counts["low"] += 1
        elif s in high: p = "high"; counts["high"] += 1
        else: p = "normal"; counts["normal"] += 1
        rows.append(f"| `{n}` | {'yes' if n in arch else '**no**'} | "
                    f"{('`' + lib + '`') if lib else '—'} | {p} | {bad.get(s, '')} |")
    asof = max((e["created_at"] for e in manifest), default="")[:10]
    total = len(proved)
    return f"""# Mirror checklist — Diaz

What this repository holds of the Diaz mission's proved results, and what is left
to port. **Generated** by `scripts/refresh_prove2me_archive.py` from the live
Prove2Me board, the archive, the `Diaz/` library and `scripts/mirror_priorities.json`.
Do not edit rows by hand: change the priorities file or port a result, then rerun.

Two tiers.

- **Archive** — `archive/prove2me/`: every accepted submission, verbatim from the
  platform apart from redacted comments. Not built; see the README there.
- **Library** — `Diaz/`: results ported to compile against this repository's pinned
  Mathlib, checked by CI. This checklist tracks it.

As of the latest archived submission ({asof}): **{counts['library']}** of {total}
Proved nodes are in the library. Of the rest, **{counts['high']}** marked high
priority, **{counts['normal']}** normal, **{counts['low']}** low (folklore,
scaffolding, or an elementary case), **{counts['defective']}** skipped as defective.

**Every Proved node is to be ported, trivial or not.** The companion note selects
what it presents; the library does not select. The priority column only sets the
order: *high* first — results the note or its manuscript relies on, or the only
formal record of an argument — then *normal*, then *low*. It is a judgement, not a
measurement.

Open nodes are not listed: they have no accepted proof to mirror. The statements and
write-ups of the Open `FourExp.*` nodes, which accepted reductions import, are kept under
`archive/prove2me/open/`. Work that was never published on the platform lives under
`archive/local/`.

| Node | Archived | In library | Priority | Note |
|---|---|---|---|---|
""" + "\n".join(rows) + "\n", counts


# ---------------------------------------------------------------- main

def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--check", action="store_true", help="write nothing; exit 1 if the archive or checklist is stale")
    args = ap.parse_args()
    key = os.environ.get("PROVE2ME_API_KEY")
    if not key:
        sys.exit("set PROVE2ME_API_KEY")
    api = Api(key)

    # `q=` is a text search, so a FourExp node is returned for `q=Diaz` only if its description
    # happens to mention Diaz. Search each namespace and merge.
    seen, nodes = set(), []
    for term in ("Diaz", "FourExp"):
        for r in api.paged(f"/theorems?q={term}", "theorems", 200):
            if (r.get("theorem_name") or "").startswith(PREFIXES) and r["theorem_id"] not in seen:
                seen.add(r["theorem_id"]); nodes.append(r)
    for name in EXTRA_NODES:
        for r in api.paged(f"/theorems?q={name.split('.', 1)[1]}", "theorems", 200):
            if r.get("theorem_name") == name and r["theorem_id"] not in seen:
                seen.add(r["theorem_id"]); nodes.append(r)
    me = api.get("/me").get("user_id")
    proved = [r for r in nodes if r["status"] == "Proved"]

    ARCHIVE.mkdir(parents=True, exist_ok=True)
    manifest = json.loads(MANIFEST.read_text()) if MANIFEST.exists() else []
    have = {e["submission_id"] for e in manifest}
    pub_names, pub_labels = public_notes()
    new, redacted, no_proof = [], [], []

    # Every accepted submission is archived, including sketches accepted for nodes that are
    # still Open: those reductions exist nowhere else.
    for r in [x for x in nodes if x["status"] in ("Proved", "Open")]:
        subs = []
        for st in ("ACCEPTED", "SKETCH_ACCEPTED"):
            subs += [s for s in api.paged(f"/theorems/{r['theorem_id']}/submissions?status={st}", "submissions", 50)
                     if s["status"] == st]
        if r["theorem_name"] in EXTRA_NODES:
            subs = [s for s in subs if s.get("user_id") == me]
        if not subs and r["status"] == "Proved":
            no_proof.append(r["theorem_name"])
        for s in subs:
            if s["id"] in have:
                continue
            content = api.get(f"/submissions/{s['id']}/solution").get("content")
            if not content:
                no_proof.append(r["theorem_name"] + " (empty solution " + s["id"][:8] + ")"); continue
            clean = redact(content, pub_names, pub_labels)
            fname = f"{r['theorem_name']}__{s['id'][:8]}.lean"
            entry = dict(theorem_name=r["theorem_name"], theorem_id=r["theorem_id"], submission_id=s["id"],
                         status=s["status"], submitted_by=s.get("username"), created_at=s["created_at"],
                         file=fname, bytes=len(content),
                         imports_children=bool(re.search(r"^import Theorems\.", content, re.M)),
                         redacted_comments=clean != content)
            new.append((fname, clean, entry)); have.add(s["id"])
            if clean != content:
                redacted.append(fname)

    # Open statements of the mirrored subtrees: regenerate, and drop nodes no longer Open.
    open_want = {"README.md": OPEN_README}
    for r in nodes:
        if r["status"] == "Open" and r["theorem_name"].startswith(OPEN_PREFIXES):
            open_want.update(render_open(api.get(f"/theorems/{r['theorem_id']}")))
    open_have = {f.name: f.read_text() for f in OPEN.glob("*")} if OPEN.exists() else {}
    open_write = {k: v for k, v in open_want.items() if open_have.get(k) != v}
    open_drop = sorted(set(open_have) - set(open_want))

    manifest_after = manifest + [e for _, _, e in new]
    text, counts = render_checklist(proved, manifest_after, json.loads(PRIORITIES.read_text()))
    stale = (bool(new) or bool(open_write) or bool(open_drop)
             or not CHECKLIST.exists() or CHECKLIST.read_text() != text)

    print(f"nodes {len(nodes)} | proved {len(proved)} | new submissions {len(new)} | redacted {len(redacted)}")
    for f in redacted:
        print(f"  redacted comments in {f} — read it before committing")
    for n in no_proof:
        print(f"  no accepted proof found for {n}")
    print(f"open statements: {(len(open_want) - 1) // 2} | rewritten {len(open_write)} | removed {len(open_drop)}")
    print(f"checklist: {counts}")

    if args.check:
        print("stale" if stale else "up to date")
        return 1 if stale else 0
    for fname, clean, _ in new:
        (ARCHIVE / fname).write_text(clean)
    OPEN.mkdir(parents=True, exist_ok=True)
    for fname, body in open_write.items():
        (OPEN / fname).write_text(body)
    for fname in open_drop:
        (OPEN / fname).unlink()
    MANIFEST.write_text(json.dumps(manifest_after, indent=1) + "\n")
    CHECKLIST.write_text(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
