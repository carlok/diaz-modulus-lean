#!/usr/bin/env python3
"""Extended structural probe. usage: probe_c2.py workers timeout"""
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from solve import job
LOG = "probe.jsonl"
J = []
for w in (5, 6, 7, 8):
    for d in range(4, 25):
        J.append(dict(tag="probe", space="S0", n=3, d=d, w=w, xmode="rc", Sx=[0], dcap=d, lcap=12, Lmax=40, log=LOG, timeout=int(sys.argv[2])))
for w in (10, 12):
    for d in range(3, 25):
        J.append(dict(tag="probe", space="S0", n=2, d=d, w=w, xmode="rc", Sx=[0], dcap=d, lcap=12, Lmax=40, log=LOG, timeout=int(sys.argv[2])))
if __name__ == "__main__":
    with ProcessPoolExecutor(max_workers=int(sys.argv[1])) as ex:
        for f in as_completed([ex.submit(job, j) for j in J]):
            r = f.result()
            print(r["rank"], r["window"], r["d"], r["result"], r["seconds"], r["encode_seconds"], r["clauses"], r.get("model"), r.get("verified"), flush=True)
