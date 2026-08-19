#!/usr/bin/env python3
"""Regenerate dependency-graph.dot and the README mermaid block from the
formalization.

Dependencies come from Lean's own printed proof terms, not from matching
text in the sources -- an earlier text-matching version produced six
false edges and missed ten real ones.  Run:

    lean scripts/dump_prints.lean > /tmp/prints.txt     # (with LEAN_PATH set)
    python3 scripts/depgraph.py /tmp/prints.txt

Nothing produced here is hand-maintained.  Edit the Lean, then rerun.
"""
import re, sys, pathlib

FILES = ["Axioms", "Closure", "Model", "Exponential", "Transfer", "Rigidity",
         "Instantiation"]
TITLE = {"Axioms": "Imported results", "Closure": "The closure theorem",
         "Model": "The model", "Exponential": "The formal exponential",
         "Transfer": "Transfer", "Rigidity": "The rank-one matrix",
         "Instantiation": "The intended base"}
SKIP_IN_MERMAID = {"Exp0_pos", "Exp0_ne_zero", "mem_hull_of_mem_base",
                   "self_mem_hull", "injective_of_hom", "conj_not_linear_of_I",
                   "Exp0_swap", "two_rpow_eq_one_iff", "mem_of_lin_rel",
                   "hullsEquiv", "coeff_factor"}

HDR = re.compile(r'^(?:noncomputable\s+)?(theorem|lemma|def|abbrev|axiom|instance)\s+([A-Za-z_][A-Za-z0-9_\']*)', re.M)


def blank_comments(txt):
    """Replace comment bodies with spaces, preserving offsets.

    Without this, a line inside a docstring that happens to begin with a
    keyword is matched as a declaration -- which happened, from a
    docstring explaining this very generator.
    """
    out = list(txt)
    for m in re.finditer(r'/-.*?-/', txt, re.S):
        for i in range(m.start() + 2, m.end() - 2):
            if out[i] != "\n":
                out[i] = " "
    return "".join(out)


def read_sources():
    """name -> (file, kind, signature, docstring)"""
    info, order = {}, []
    for f in FILES:
        raw = pathlib.Path(f"Diaz/{f}.lean").read_text()
        txt = blank_comments(raw)
        ms = list(HDR.finditer(txt))
        for i, m in enumerate(ms):
            name = m.group(2)
            end = ms[i + 1].start() if i + 1 < len(ms) else len(txt)
            sig = re.split(r':=|\bby\b', txt[m.start():end])[0].strip()
            # a docstring counts only if it ends immediately before this header,
            # separated by whitespace alone.  Read it from the raw text.
            pre = raw[:m.start()]
            doc = ""
            mm = re.search(r'/--((?:(?!-/).)*)-/\s*\Z', pre, re.S)
            if mm:
                doc = re.sub(r'\s+', ' ', mm.group(1)).strip()
            info[name] = (f, m.group(1), sig, doc)
            order.append(name)
    return info, order


def read_deps(printfile, names):
    """Parse `#print` output: name -> set of Diaz names its term mentions."""
    txt = pathlib.Path(printfile).read_text()
    blocks, cur, curname = {}, [], None
    for line in txt.splitlines():
        m = re.match(r'^(?:theorem|def|axiom|opaque)\s+Diaz\.([A-Za-z_][A-Za-z0-9_\']*)', line)
        if m:
            if curname:
                blocks[curname] = "\n".join(cur)
            curname, cur = m.group(1), [line]
        elif curname:
            cur.append(line)
    if curname:
        blocks[curname] = "\n".join(cur)
    deps = {}
    for n in names:
        body = blocks.get(n, "")
        found = set(re.findall(r'Diaz\.([A-Za-z_][A-Za-z0-9_\']*)', body))
        deps[n] = {d for d in found if d in names and d != n}
    return deps, set(blocks)


def transitive_reduction(deps):
    def reach(n, seen):
        for m in deps.get(n, ()):
            if m not in seen:
                seen.add(m); reach(m, seen)
        return seen
    out = {}
    for n, ds in deps.items():
        out[n] = {m for m in ds
                  if not any(m in reach(k, set()) for k in ds if k != m)}
    return out




def write_dump(order):
    """Emit the Lean file that produces the printed terms.

    Written by the same reader that consumes them, so the two cannot
    drift -- they did once, leaving `#print Diaz.has` from a word in a
    docstring and breaking the pipeline."""
    pathlib.Path("scripts/dump_prints.lean").write_text(
        "import Diaz\nset_option pp.fullNames true\n" +
        "\n".join(f"#print Diaz.{n}" for n in order) + "\n")


def main(printfile):
    info, order = read_sources()
    write_dump(order)
    names = set(info)
    raw, seen = read_deps(printfile, names)
    missing = names - seen
    if missing:
        print(f"warning: no printed term for {sorted(missing)}", file=sys.stderr)
    deps = transitive_reduction(raw)
    AX = {n for n in names if info[n][1] == "axiom"}

    memo = {}
    def on_axiom(n):
        if n in memo: return memo[n]
        memo[n] = False
        memo[n] = n in AX or any(on_axiom(m) for m in raw[n])
        return memo[n]
    ONAX = {n for n in names if on_axiom(n) and n not in AX}
    GREEN = names - AX - ONAX

    # ---- DOT: every declaration ----
    dot = ["digraph Diaz {", "  rankdir=TB;",
           '  node [shape=box, style=filled, fontname="Helvetica", fontsize=10];',
           '  graph [fontname="Helvetica", labelloc="t", '
           'label="amber: imported axiom   blue: rests on one   green: proved outright"];']
    for i, f in enumerate(FILES):
        ns = sorted(n for n in names if info[n][0] == f)
        dot.append(f'  subgraph cluster_{i} {{ label="{f}.lean"; style=dotted; color=gray;')
        for n in ns:
            fill = "#f5c26b" if n in AX else ("#bcd9f5" if n in ONAX else "#c6e9c6")
            dot.append(f'    "{n}" [fillcolor="{fill}"];')
        dot.append("  }")
    for n in sorted(names):
        for m in sorted(deps[n]):
            dot.append(f'  "{m}" -> "{n}";')
    dot.append("}")
    pathlib.Path("dependency-graph.dot").write_text("\n".join(dot))

    # ---- mermaid: headline declarations only ----
    keep = [n for n in order if n not in SKIP_IN_MERMAID]
    mer = ["flowchart TD"]
    for f in FILES:
        ns = [n for n in keep if info[n][0] == f]
        if not ns: continue
        mer.append(f'  subgraph {f}["{f}.lean"]')
        for n in ns:
            mer.append(f'    {n}[["{n}"]]' if n in AX else f'    {n}("{n}")')
        mer.append("  end")
    for n in keep:
        for m in sorted(deps[n]):
            if m in keep:
                mer.append(f"  {m} --> {n}")
    mer += ["  classDef ax fill:#f5c26b,stroke:#b8860b,color:#000",
            "  classDef onax fill:#bcd9f5,stroke:#3a6ea5,color:#000",
            "  classDef proved fill:#c6e9c6,stroke:#3c8a3c,color:#000"]
    for cls, sel in [("ax", AX), ("onax", ONAX), ("proved", GREEN)]:
        ns = [n for n in keep if n in sel]
        if ns: mer.append(f"  class {','.join(ns)} {cls}")
    mermaid = "\n".join(mer)

    readme = pathlib.Path("README.md"); r = readme.read_text()
    r = re.sub(r"```mermaid\n.*?\n```", "```mermaid\n" + mermaid + "\n```", r, flags=re.S)
    readme.write_text(r)

    print(f"{len(names)} declarations: {len(GREEN)} proved, "
          f"{len(ONAX)} on an import, {len(AX)} imported")
    print(f"edges: {sum(len(deps[n]) for n in names)}")



if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "/tmp/prints.txt")
