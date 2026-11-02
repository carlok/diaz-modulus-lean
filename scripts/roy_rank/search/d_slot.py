#!/usr/bin/env python3
"""Rank 3 in the slot layout. usage: d_slot.py space w workers timeout solver log dlist [Nc]"""
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from solve import job
if __name__ == "__main__":
    space, w, W, tl, solver, log = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), sys.argv[5], sys.argv[6]
    ds = list(map(int, sys.argv[7].split(",")))
    Nc = int(sys.argv[8]) if len(sys.argv) > 8 else 15
    n = int(sys.argv[9]) if len(sys.argv) > 9 else 3
    J = [dict(tag=f"{space}r{n}slot", space=space, n=n, d=d, w=w, layout="slot", Nr=min(d, w), Nc=Nc, log=log, timeout=tl, solver=solver) for d in ds]
    with ProcessPoolExecutor(max_workers=W) as ex:
        for f in as_completed([ex.submit(job, j) for j in J]):
            r = f.result()
            print(r["window"], r["d"], r["Nr"], r["Nc"], r["solver"], r["result"], r["seconds"], r["encode_seconds"], r["vars"], r["clauses"], r.get("model"), (r.get("verified") or {}).get("genuine"), flush=True)
