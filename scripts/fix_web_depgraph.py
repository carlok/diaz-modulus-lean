#!/usr/bin/env python3
"""Draw the dependency graph's nodes as rounded rectangles instead of ellipses.

plastexdepgraph gives every node that is not a definition the Graphviz shape `ellipse`, and leanblueprint offers
no option to change it. This rewrites the DOT source that blueprint/web/dep_graph_document.html passes to
`renderDot`: `shape=ellipse` becomes `shape=box`, and the style of those nodes gains `rounded` (filled nodes
become `style="rounded,filled"`). Definitions keep plain boxes. The legend is updated to match. Run it after
`leanblueprint web`; it exits 1 if the page no longer has the expected form, so a format change cannot pass
silently.
"""
import pathlib
import re
import sys

WEB = pathlib.Path(__file__).resolve().parent.parent / "blueprint" / "web"
DOT = re.compile(r"(\.renderDot\(`)(.*?)(`\))", re.S)
NODE = re.compile(r"\[[^\[\]]*\]")  # one attribute list of the DOT source
LEGEND_OLD = "<dt>Ellipses</dt><dd>theorems and lemmas</dd>"
LEGEND_NEW = "<dt>Rounded boxes</dt><dd>theorems and lemmas</dd>"


def round_node(attrs: str) -> str:
    if "shape=ellipse" not in attrs:
        return attrs
    attrs = attrs.replace("shape=ellipse", "shape=box")
    if re.search(r"style=filled\b", attrs):
        return re.sub(r"style=filled\b", 'style="rounded,filled"', attrs)
    if re.search(r'style=""', attrs):
        return attrs.replace('style=""', "style=rounded")
    return attrs[:-1] + ", style=rounded]"


def main():
    page = WEB / "dep_graph_document.html"
    if not page.is_file():
        sys.exit(f"{page} does not exist; run `leanblueprint web` first")
    s = page.read_text(encoding="utf-8")
    m = DOT.search(s)
    if m is None:
        sys.exit("no renderDot(`...`) call found in the dependency graph page")
    dot = m.group(2)
    n_ellipse = dot.count("shape=ellipse")
    if n_ellipse == 0:
        sys.exit("no ellipse nodes in the dependency graph; has the page already been rewritten?")
    new_dot = NODE.sub(lambda a: round_node(a.group(0)), dot)
    if "ellipse" in new_dot:
        sys.exit("some ellipse nodes were not rewritten")
    s = s[:m.start(2)] + new_dot + s[m.end(2):]
    if s.count(LEGEND_OLD) != 1:
        sys.exit("the legend entry for ellipses was not found exactly once")
    s = s.replace(LEGEND_OLD, LEGEND_NEW)
    page.write_text(s, encoding="utf-8")
    print(f"rounded {n_ellipse} graph nodes")


if __name__ == "__main__":
    main()
