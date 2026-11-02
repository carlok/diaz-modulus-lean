#!/usr/bin/env python3
"""Graded structural probe (the note, Section 8): S0 = {-1,0,1}, x allowed only at weight 0."""
import json, sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from solve import job
LOG = "probe.jsonl"
def jobs(maxw2, maxw3, maxd, tl):
    J = []
    for w in range(2, maxw2 + 1):
        for d in range(3, maxd + 1):
            J.append(dict(tag="probe", space="S0", n=2, d=d, w=w, xmode="rc", Sx=[0], dcap=d, lcap=12, Lmax=40, log=LOG, timeout=tl))
    for w in range(2, maxw3 + 1):
        for d in range(4, maxd + 1):
            J.append(dict(tag="probe", space="S0", n=3, d=d, w=w, xmode="rc", Sx=[0], dcap=d, lcap=12, Lmax=40, log=LOG, timeout=tl))
    return J
if __name__ == "__main__":
    a = list(map(int, sys.argv[1:]))
    J = jobs(a[0], a[1], a[2], a[3])
    with ProcessPoolExecutor(max_workers=a[4]) as ex:
        fs = [ex.submit(job, j) for j in J]
        for f in as_completed(fs):
            r = f.result()
            print(r["rank"], r["window"], r["d"], r["result"], r["seconds"], r["encode_seconds"], r["clauses"], r.get("model"), r.get("verified"), flush=True)
