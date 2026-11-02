#!/usr/bin/env python3
"""Rank two, the windows the extended batch did not reach."""
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from solve import job
J = [dict(tag="probe", space="S0", n=2, d=d, w=w, xmode="rc", Sx=[0], dcap=d, lcap=12, Lmax=40, log="probe.jsonl", timeout=120) for w in (10, 12) for d in range(3, 25)]
if __name__ == "__main__":
    with ProcessPoolExecutor(max_workers=int(sys.argv[1])) as ex:
        for f in as_completed([ex.submit(job, j) for j in J]):
            r = f.result()
            print(r["rank"], r["window"], r["d"], r["result"], r["seconds"], flush=True)
