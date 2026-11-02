#!/usr/bin/env python3
"""S4 rank 3, position layout, growing windows. usage: d_pos.py wmin wmax workers timeout solver log [d list]"""
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from solve import job
if __name__ == "__main__":
    wmin, wmax, W, tl, solver, log = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), sys.argv[5], sys.argv[6]
    ds = list(map(int, sys.argv[7].split(","))) if len(sys.argv) > 7 else list(range(4, 16))
    J = [dict(tag=f"S4r3pos", space="S4", n=3, d=d, w=w, log=log, timeout=tl, solver=solver) for w in range(wmin, wmax + 1) for d in ds]
    with ProcessPoolExecutor(max_workers=W) as ex:
        for f in as_completed([ex.submit(job, j) for j in J]):
            r = f.result()
            print(r["window"], r["d"], r["solver"], r["result"], r["seconds"], r["encode_seconds"], r["vars"], r["clauses"], r.get("verified"), flush=True)
