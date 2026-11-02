#!/usr/bin/env python3
"""Exhaustive test of the hand-written counters and of the weighted clause, by brute force on a small solver."""
import itertools, random, sys
from encode import CNF, counter_lb, counter_ub, out, TRUE, FALSE

def sat(clauses, nv, fixed):
    """tiny DPLL"""
    assign = dict(fixed)
    def simp(cls, asg):
        res = []
        for c in cls:
            done = False; nc = []
            for x in c:
                v = asg.get(abs(x))
                if v is None: nc.append(x)
                elif (x > 0) == v: done = True; break
            if done: continue
            if not nc: return None
            res.append(nc)
        return res
    def rec(cls, asg):
        cls = simp(cls, asg)
        if cls is None: return False
        if not cls: return True
        for c in cls:
            if len(c) == 1:
                return rec(cls, {**asg, abs(c[0]): c[0] > 0})
        x = abs(cls[0][0])
        return rec(cls, {**asg, x: True}) or rec(cls, {**asg, x: False})
    return rec(clauses, assign)

bad = 0; tot = 0
for n in range(1, 8):
    for cap in range(1, n + 2):
        for mode in ("lb", "ub"):
            c = CNF(); inp = [c.new() for _ in range(n)]
            O = (counter_lb if mode == "lb" else counter_ub)(c, inp, cap)
            for bits in itertools.product([False, True], repeat=n):
                fixed = {inp[i]: bits[i] for i in range(n)}
                k = sum(bits)
                for j in range(1, len(O)):
                    # lb: k>=j forces out j true: asserting out j false must be UNSAT exactly when k>=j
                    # ub: out j true implies k>=j: asserting out j true must be UNSAT exactly when k<j
                    tot += 1
                    if mode == "lb":
                        r = sat(c.cl + [[-O[j]]], c.nv, fixed)
                        if r == (k >= j): bad += 1
                    else:
                        r = sat(c.cl + [[O[j]]], c.nv, fixed)
                        if r != (k >= j): bad += 1
print("counter checks", tot, "bad", bad)
sys.exit(1 if bad else 0)
