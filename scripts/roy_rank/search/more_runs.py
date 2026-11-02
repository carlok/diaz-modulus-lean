#!/usr/bin/env python3
"""Second batch: growth table, rank-two full window, runs with every WLOG switched off, near-S4 controls."""
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from solve import job
J = []
# growth table for the pilot's five cases, slot layout and position layout
for d in (5, 7, 8, 9, 10):
    for w in (8, 10, 12, 16, 24, 32, 48, 64, 96):
        J.append(dict(tag="growth_slot", space="S4", n=3, d=d, w=w, layout="slot", Nr=min(d, w), Nc=15, log="growth.jsonl", timeout=900))
    for w in (10, 12, 14, 16):
        J.append(dict(tag="growth_pos", space="S4", n=3, d=d, w=w, log="growth.jsonl", timeout=900))
# rank two, full window: at most 10+10 classes, span <= 4*19 = 76
for d in range(3, 11):
    J.append(dict(tag="S4r2full", space="S4", n=2, d=d, w=77, layout="slot", Nr=d, Nc=10, log="full_s4r2.jsonl", timeout=900))
    J.append(dict(tag="S4r2full", space="S4", n=2, d=d, w=77, layout="slot", Nr=d, Nc=10, log="full_s4r2.jsonl", timeout=900, solver="cadical"))
# every WLOG off: no reflection, no gap rule, column mass bound raised
for d in (4, 6, 8, 10, 13, 15):
    J.append(dict(tag="S4r3_nowlog", space="S4", n=3, d=d, w=117, layout="slot", Nr=d, Nc=15, reflect=False, gaprule=False, Lmax=30, log="nowlog.jsonl", timeout=1200))
# near-S4 controls, slot layout at window 60; the meet/join test
for sp, m in (("S4p2", 21), ("S4p3", 21), ("S2x3", 15)):
    for d in (6, 8, 9):
        J.append(dict(tag=sp, space=sp, n=3, d=d, w=60, layout="slot", Nr=d, Nc=m, log="near.jsonl", timeout=600))
for d in (6, 8, 10):
    J.append(dict(tag="S4_nomeets", space="S4", n=3, d=d, w=8, meets="none", log="near.jsonl", timeout=600))
if __name__ == "__main__":
    with ProcessPoolExecutor(max_workers=int(sys.argv[1])) as ex:
        for f in as_completed([ex.submit(job, j) for j in J]):
            r = f.result()
            print(r["tag"], r["rank"], r["window"], r["d"], r["solver"], r["result"], r["seconds"], r.get("model") if r["result"] == "SAT" else "", (r.get("verified") or {}).get("genuine", ""), flush=True)
