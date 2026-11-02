#!/usr/bin/env python3
"""Rank one over S4: a graded rank-one failure is x tensor y with Qbar-free x,y, i.e. sets A,B of weights with A+B in S
(free means distinct weights, since a class of a rank-one matrix has dimension 1), and dl > d+l.  Exhaustive over A containing 0."""
from itertools import combinations
S = {-4, -1, 0, 1, 4}
best = []
for da in range(1, 6):
    for rest in combinations(range(1, 9), da - 1):
        A = (0,) + rest
        B = [b for b in range(-20, 21) if all(a + b in S for a in A)]
        d, l = len(A), len(B)
        if l and d * l > d + l:
            best.append((A, B))
print("rank-one failures over S4 (A,B):", best)
pairs = {}
for da in range(1, 6):
    for rest in combinations(range(1, 9), da - 1):
        A = (0,) + rest
        B = [b for b in range(-20, 21) if all(a + b in S for a in A)]
        pairs[(da, len(B))] = pairs.get((da, len(B)), 0) + 1
print("(|A|,max |B|) occurring:", sorted(pairs))
