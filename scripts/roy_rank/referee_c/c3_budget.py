#!/usr/bin/env python3
"""Referee C: budgets and the count of Section 5 of the note redone for in0, own code."""
import itertools as it
from math import comb
for name, S in (("in0", {-4, -1, 0, 1, 3}), ("S", {-4, -1, 0, 1, 4})):
    c = {}
    for d in range(-20, 21):
        c[d] = len(S & {s + d for s in S})
    print(name, "c(delta)", {d: c[d] for d in range(1, 12) if c[d]}, "(P):", all(c[d] <= 2 for d in c if d))
    def bud(A):
        return sum(c.get(x - y, 0) for x, y in it.combinations(A, 2))
    B = {}
    for k in range(2, 10):
        best = 0
        arg = None
        # gaps in 1..8: a gap >=8 behaves as 8 since c(delta)=0 for delta>=8 and sums of gaps stay >=8
        for gaps in it.product(range(1, 9), repeat=k - 1):
            A = [0]
            for g in gaps:
                A.append(A[-1] + g)
            v = sum(c.get(A[j] - A[i], 0) for i in range(k) for j in range(i + 1, k))
            if v > best:
                best, arg = v, A
        B[k] = best
        print(" B", k, best, arg, "<= k(k-1):", best <= k * (k - 1), flush=True)
        if k >= 8 and name == "S":
            break
    if name == "in0":
        Bin0 = B
def alpha(r):
    return min(comb(r - s, 2) + comb(s, 2) for s in range(r + 1))
print("alpha", {r: alpha(r) for r in range(4, 12)})
B = Bin0
def Bk(k):
    return B.get(k, k * (k - 1))
def lmin(d):
    l = max(d, 4)
    while (d - 3) * (l - 3) <= 9:
        l += 1
    return l
print("d l  [eta=0,eps=0: alpha_d*l vs B_d+C(d,2)] [eta=0,eps=1: alpha_d(l-2) vs B_d] | eta=1 rho=d-1: [e0 Lcol][e0 Lnot][e1 Lcol][e1 Lnot] vs B_rho")
excl = {}
for d in range(5, 60):
    l = lmin(d)
    r = d - 1
    k = d - 2
    A0 = alpha(d)
    Ar = alpha(r)
    c1 = (A0 * l, Bk(d) + comb(d, 2))
    c2 = (A0 * (l - 2), Bk(d))
    c3 = (Ar * (l - 1), Bk(r))
    c4 = (Ar * l - comb(k, 2), Bk(r))
    c5 = (Ar * (l - 3) + comb(k, 2), Bk(r))
    c6 = (Ar * (l - 2), Bk(r))
    cases = [c1, c2, c3, c4, c5, c6]
    ok = [x > y for x, y in cases]
    if d <= 12 or not all(ok):
        print(d, l, cases, "all excluded" if all(ok) else "NOT all excluded: %s" % ok)
