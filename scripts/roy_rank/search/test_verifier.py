#!/usr/bin/env python3
"""Hand-built tests of verify_exact.py, plus V1/V2 cross-checks on random graded matrices."""
import random, sys
from fractions import Fraction as Fr
from verify_exact import verify

def mat(S, a, b, C, Sx=None):
    d, l = len(a), len(b)
    return {"S": S, "Sx": Sx or [], "d": d, "l": l, "a": a, "b": b,
            "M": [[([{"c": str(C[i][j]), "t": a[i] + b[j], "x": None}] if C[i][j] != 0 else []) for j in range(l)] for i in range(d)]}

def kron1(a, b):
    return mat(sorted({x + y for x in a for y in b}), a, b, [[1] * len(b) for _ in a])

def t(name, cond):
    print(("ok  " if cond else "FAIL"), name)
    if not cond: sys.exit(1)

# rank one: x tensor y with free x,y fails iff d+l < dl
r = verify(kron1([0, 1], [0, 1, 2]));   t("2x3 rank one fails", r["v1"] == "fail" and r["v2_certificate"] and r["genuine_failure"])
r = verify(kron1([0, 1], [0, 1]));      t("2x2 rank one holds", r["v1"] == "holds" and not r["v2_certificate"] and not r["genuine_failure"])
r = verify(kron1([0, 1, 2], [0, 1, 2]));t("3x3 rank one fails", r["v1"] == "fail" and r["v2_certificate"])
# membership
m = kron1([0, 1], [0, 1, 2]); m["S"] = [0, 1, 2]
r = verify(m); t("entry T^3 outside S rejected", not r["membership"] and not r["genuine_failure"])
# zero row: never a failure
m = mat([0], [0, 1], [0, 0, 0], [[1, 2, 3], [0, 0, 0]])
m["S"] = [0, 1]
r = verify(m); t("zero row holds", r["v1"] == "holds")
# dependent rows inside a class
m = mat([0, 1, 2, 3], [0, 0], [0, 1, 2], [[1, 1, 1], [2, 2, 2]])
r = verify(m); t("dependent rows holds", r["v1"] == "holds" and not r["v2_certificate"])
# direct sum of two 2x3 rank-one failures (rank two): (star) survives? cross-check only
C = [[1,1,1,0,0,0],[1,1,1,0,0,0],[0,0,0,1,1,1],[0,0,0,1,1,1]]
m = mat(list(range(-10, 11)), [0,1,5,6], [0,1,2,10,11,12], C)
r = verify(m); t("direct sum: V1 and V2 agree", not r.get("inconsistent"))
print("direct sum", r["rank"], r["v1"], r["v2_certificate"])
# random graded rank<=3 cross-checks over S2
rnd = random.Random(7)
agree = fails = holds = incon = 0
S2 = [-2, -1, 0, 1, 2]
def rv(n): return [Fr(rnd.randint(-3, 3)) for _ in range(n)]
for trial in range(300):
    d, l = rnd.randint(4, 8), rnd.randint(4, 9)
    a = sorted(rnd.randint(0, 3) for _ in range(d))
    b = sorted(rnd.randint(-5, 0) for _ in range(l))
    # random rank 3 with forced zeros: iterative projection via explicit X,Y from a small pool
    pool = [rv(3) for _ in range(rnd.randint(2, 5))]
    X = [rnd.choice(pool) for _ in range(d)]
    # choose Y in the perp of the rows it must vanish on
    from verify_exact import nullspace
    Y = []
    for j in range(l):
        must = [X[i] for i in range(d) if a[i] + b[j] not in S2]
        ns = nullspace(must, 3) if must else [[Fr(int(u == v)) for v in range(3)] for u in range(3)]
        if ns:
            c = [Fr(rnd.randint(-3, 3)) for _ in ns]
            Y.append([sum(ci * v[k] for ci, v in zip(c, ns)) for k in range(3)])
        else:
            Y.append([Fr(0)] * 3)
    C = [[sum(X[i][k] * Y[j][k] for k in range(3)) for j in range(l)] for i in range(d)]
    if all(v == 0 for row in C for v in row): continue
    r = verify(mat(S2, a, b, C))
    if r.get("v1") == "fail": fails += 1
    else: holds += 1
    if r.get("inconsistent"): incon += 1
    if r.get("v2_certificate") and r.get("v1") == "holds": incon += 1
print("random:", "fails", fails, "holds", holds, "inconsistent", incon)
t("no V1/V2 inconsistency", incon == 0)
