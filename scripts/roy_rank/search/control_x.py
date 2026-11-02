#!/usr/bin/env python3
"""Positive control for the x-machinery: x allowed at every weight of S0 (Sx = {-1,0,1}), where (1,x) tensor (T,1,1/T) is a known 2x3 rank-one failure.
Run under: uv run --offline --with sympy --with numpy python control_x.py"""
import json
from solve import job
for n, ds in ((2, (4, 6, 8)), (3, (6, 9))):
    for d in ds:
        for xm in ("r", "c", "rc"):
            r = job(dict(tag=f"ctrlx_{xm}", space="S0", n=n, d=d, w=3, xmode=xm, Sx=[-1, 0, 1], dcap=8, lcap=8, Lmax=30, log="probe.jsonl", timeout=120))
            print(n, d, xm, r["result"], r["seconds"], r.get("model"), r.get("verified"))
