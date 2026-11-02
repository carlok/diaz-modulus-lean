#!/usr/bin/env python3
import json, sys, time
from concurrent.futures import ProcessPoolExecutor
from solve import job
LOG = "controls.jsonl"
jobs = []
# S2 rank 3: SAT with every model confirmed
for d in range(4, 11):
    jobs.append(dict(tag="S2r3", space="S2", n=3, d=d, w=6, log=LOG, timeout=300))
# S1 rank 2 and 3 : UNSAT
for n, ds in ((2, range(3, 11)), (3, range(4, 10))):
    for d in ds:
        jobs.append(dict(tag="S1", space="S1", n=n, d=d, w=6, log=LOG, timeout=300))
# S4 rank 2 window 12, d 3-10
for d in range(3, 11):
    jobs.append(dict(tag="S4r2", space="S4", n=2, d=d, w=12, log=LOG, timeout=600))
# S2 rank 2 positive
jobs.append(dict(tag="S2r2", space="S2", n=2, d=4, w=8, log=LOG, timeout=300))
# S4 rank 3 window 6 pilot sample
for d in (4, 6, 9, 12, 15):
    jobs.append(dict(tag="S4r3w6", space="S4", n=3, d=d, w=6, log=LOG, timeout=600))
if __name__ == "__main__":
    with ProcessPoolExecutor(max_workers=int(sys.argv[1]) if len(sys.argv) > 1 else 6) as ex:
        for r in ex.map(job, jobs):
            print(r["tag"], r["rank"], "w", r["window"], "d", r["d"], r["result"], r["seconds"], r["vars"], r["clauses"], r.get("verified", ""), flush=True)
