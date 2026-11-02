#!/usr/bin/env python3
"""Which subspaces W does the refutation over S4 actually need?  Greedy removal of W families, window 10, every d. Experiment only:
fewer constraints means a weaker encoding, so UNSAT with a subset is a stronger statement; a SAT here need not be a real failure."""
import sys
from concurrent.futures import ProcessPoolExecutor
from solve import job
ALL = ["P", "GP", "L", "GL", "TP", "GN", "M", "J"]
def test(fam, w=10, tl=300, ds=range(4, 16)):
    J = [dict(tag="fam", space="S4", n=3, d=d, w=w, families=fam, log="families.jsonl", timeout=tl, verify=False) for d in ds]
    with ProcessPoolExecutor(max_workers=int(sys.argv[1])) as ex:
        rs = list(ex.map(job, J))
    return {r["d"]: r["result"] for r in rs}
if __name__ == "__main__":
    cur = list(ALL)
    for f in ALL:
        trial = [x for x in cur if x != f]
        r = test(trial)
        allun = all(v == "UNSAT" for v in r.values())
        print("drop", f, "->", trial, "all UNSAT" if allun else {d: v for d, v in r.items() if v != "UNSAT"}, flush=True)
        if allun:
            cur = trial
    print("minimal family set under greedy removal:", cur, flush=True)
