#!/usr/bin/env python3
"""S2, rank 3: many models per d (different solver seeds, both layouts); every SAT model goes through realisation and exact verification."""
import sys, json
from concurrent.futures import ProcessPoolExecutor, as_completed
from solve import job
J = []
for d in range(4, 16):
    for seed in range(1, 9):
        J.append(dict(tag="S2models", space="S2", n=3, d=d, w=6, log="s2_models.jsonl", timeout=120, seed=seed))
        J.append(dict(tag="S2models", space="S2", n=3, d=d, w=20, layout="slot", Nr=d, Nc=15, log="s2_models.jsonl", timeout=120, seed=seed))
if __name__ == "__main__":
    with ProcessPoolExecutor(max_workers=int(sys.argv[1])) as ex:
        for f in as_completed([ex.submit(job, j) for j in J]):
            r = f.result()
            print(r["layout"], r["d"], r["result"], r["seconds"], (r.get("verified") or {}).get("genuine"), (r.get("verified") or {}).get("dl"), flush=True)
