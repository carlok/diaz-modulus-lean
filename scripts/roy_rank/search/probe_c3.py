#!/usr/bin/env python3
"""Larger masses for the structural probe, and S4 with free entries at weight 0 (free entries). usage: probe_c3.py workers timeout"""
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from solve import job
tl = int(sys.argv[2]) if len(sys.argv) > 2 else 600
J = []
for w in (3, 4, 6):
    for d in (10, 20, 30, 40, 60):
        J.append(dict(tag="probe_big", space="S0", n=2, d=d, w=w, xmode="rc", Sx=[0], dcap=d, lcap=d, Lmax=2 * d, log="probe.jsonl", timeout=tl))
for w in (3, 4):
    for d in (10, 20, 30, 40):
        J.append(dict(tag="probe_big", space="S0", n=3, d=d, w=w, xmode="rc", Sx=[0], dcap=d, lcap=d, Lmax=2 * d, log="probe.jsonl", timeout=tl))
# S4 plus free logarithms at weight 0 (free entries), same termwise factorisation scope
for w in (4, 6, 8):
    for d in range(3, 13):
        J.append(dict(tag="S4free", space="S4", n=2, d=d, w=w, xmode="rc", Sx=[0], dcap=d, lcap=8, Lmax=30, log="s4free.jsonl", timeout=tl))
for w in (3, 4, 5, 6):
    for d in range(4, 19):
        J.append(dict(tag="S4free", space="S4", n=3, d=d, w=w, xmode="rc", Sx=[0], dcap=d, lcap=8, Lmax=40, log="s4free.jsonl", timeout=tl))
if __name__ == "__main__":
    with ProcessPoolExecutor(max_workers=int(sys.argv[1])) as ex:
        for f in as_completed([ex.submit(job, j) for j in J]):
            r = f.result()
            print(r["tag"], r["rank"], r["window"], r["d"], r["result"], r["seconds"], r["encode_seconds"], r["clauses"], r.get("model"), r.get("verified"), flush=True)
