#!/usr/bin/env python3
"""The reduced set {named points, named lines, whole space} at the full window, and with the linear-space axiom removed."""
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from solve import job
J = []
for d in range(4, 16):
    J.append(dict(tag="PL_w117", space="S4", n=3, d=d, w=117, layout="slot", Nr=d, Nc=15, families=["P", "L"], log="families2.jsonl", timeout=600, verify=False))
    J.append(dict(tag="PL_noLS_w10", space="S4", n=3, d=d, w=10, families=["P", "L"], linear_space=False, log="families2.jsonl", timeout=600, verify=False))
if __name__ == "__main__":
    with ProcessPoolExecutor(max_workers=int(sys.argv[1])) as ex:
        for f in as_completed([ex.submit(job, j) for j in J]):
            r = f.result()
            print(r["tag"], r["d"], r["result"], r["seconds"], r["clauses"], flush=True)
