#!/usr/bin/env python3
"""Refresh archive/prove2me/ from the live board and regenerate MIRROR_CHECKLIST.md.

    PROVE2ME_API_KEY=... python3 scripts/refresh_prove2me_archive.py          # write
    PROVE2ME_API_KEY=... python3 scripts/refresh_prove2me_archive.py --check  # exit 1 if stale

What it does, in order:

1. Lists every node of the Diaz mission (names starting `Diaz.` or `DiazModulus.`).
2. For each Proved node, pages through its ACCEPTED and SKETCH_ACCEPTED submissions
   and downloads any not yet in the archive via GET /submissions/:id/solution.
3. Redacts **comments only** in newly downloaded files: private file names, document
   labels that do not exist in this repository's public notes under tex/, and platform
   uuids. It refuses to write a file whose code changed, and never touches files that
   are already archived, so hand-polished redactions survive a refresh.
4. Regenerates MIRROR_CHECKLIST.md from the board, the archive, the Diaz/ library and
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
PREFIXES = ("Diaz.", "DiazModulus.")


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
    def fix(c):
        c = re.sub(r"`?\b([\w-]+\.tex)\b`?",
                   lambda m: m.group(0) if m.group(1) in pub_names else "an earlier unpublished note", c)
        c = re.sub(r"`?\b((?:thm|prop|cor|lem|sec|rem|eq|def):[a-z][a-z-]*)\b`?",
                   lambda m: m.group(0) if m.group(1) in pub_labels else "", c)
        c = re.sub(r",?\s*uuid\s*`?[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}`?", "", c)
        c = re.sub(r"`?[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}`?", "", c)
        c = re.sub(r"\(\s*\)", "", c)
        c = re.sub(r"[ \t]{2,}", " ", c)
        c = re.sub(r" +([,.;:)])", r"\1", c)
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
    decls = {}
    for f in sorted((ROOT / "Diaz").glob("*.lean")):
        for d in re.findall(r"^(?:private )?(?:theorem|lemma) ([\w.']+)", f.read_text(), re.M):
            decls.setdefault(d, "Diaz/" + f.name)
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

Open nodes are not listed: they have no accepted proof to mirror. Work that was
never published on the platform lives under `archive/local/`.

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

    nodes = [r for r in api.paged("/theorems?q=Diaz", "theorems", 200)
             if (r.get("theorem_name") or "").startswith(PREFIXES)]
    proved = [r for r in nodes if r["status"] == "Proved"]

    ARCHIVE.mkdir(parents=True, exist_ok=True)
    manifest = json.loads(MANIFEST.read_text()) if MANIFEST.exists() else []
    have = {e["submission_id"] for e in manifest}
    pub_names, pub_labels = public_notes()
    new, redacted, no_proof = [], [], []

    for r in proved:
        subs = []
        for st in ("ACCEPTED", "SKETCH_ACCEPTED"):
            subs += [s for s in api.paged(f"/theorems/{r['theorem_id']}/submissions?status={st}", "submissions", 50)
                     if s["status"] == st]
        if not subs:
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

    manifest_after = manifest + [e for _, _, e in new]
    text, counts = render_checklist(proved, manifest_after, json.loads(PRIORITIES.read_text()))
    stale = bool(new) or not CHECKLIST.exists() or CHECKLIST.read_text() != text

    print(f"nodes {len(nodes)} | proved {len(proved)} | new submissions {len(new)} | redacted {len(redacted)}")
    for f in redacted:
        print(f"  redacted comments in {f} — read it before committing")
    for n in no_proof:
        print(f"  no accepted proof found for {n}")
    print(f"checklist: {counts}")

    if args.check:
        print("stale" if stale else "up to date")
        return 1 if stale else 0
    for fname, clean, _ in new:
        (ARCHIVE / fname).write_text(clean)
    MANIFEST.write_text(json.dumps(manifest_after, indent=1) + "\n")
    CHECKLIST.write_text(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
