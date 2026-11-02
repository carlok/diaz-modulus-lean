#!/usr/bin/env python3
"""Small exact sanity checks for the note tex/diaz-roy-rank-three.tex (1 core, seconds). No SAT, no search of the real model.

(1) Property (P) and the shift counts for the spaces named in the note.
(2) The 5 x 8 rank-three example: Sigma satisfies (P), yet a graded matrix fails (star).
(3) Random colour models at rank two: whenever (star) holds, Sigma violates (P).
(4) The Sec. 3 worked example: the naive limit loses semistability, the moduli limit does not.
"""
import itertools
import random
from fractions import Fraction as Fr


def reps(S):
    out = {}
    for s, t in itertools.product(S, S):
        if s != t:
            out[s - t] = out.get(s - t, 0) + 1
    return out


def has_P(S):
    return all(v <= 2 for v in reps(S).values())


def rank(mat):
    m = [[Fr(x) for x in r] for r in mat]
    rk = 0
    for c in range(len(m[0]) if m else 0):
        p = next((i for i in range(rk, len(m)) if m[i][c] != 0), None)
        if p is None:
            continue
        m[rk], m[p] = m[p], m[rk]
        for i in range(len(m)):
            if i != rk and m[i][c] != 0:
                f = m[i][c] / m[rk][c]
                m[i] = [a - f * b for a, b in zip(m[i], m[rk])]
        rk += 1
    return rk


print("== (1) property (P)")
for name, S in [("S4 {-4,-1,0,1,4}", [-4, -1, 0, 1, 4]),
                ("S1 {-1,0,1}", [-1, 0, 1]),
                ("S2 {-2..2}", [-2, -1, 0, 1, 2]),
                ("in_0 hull u^4+cu^3 {-4,-1,0,1,3}", [-4, -1, 0, 1, 3]),
                ("in_inf hull u^4+cu^3 {-3,-1,0,1,4}", [-3, -1, 0, 1, 4])]:
    r = reps(S)
    print(f"{name}: (P)={has_P(S)}  max reps={max(r.values())}  "
          f"delta>0 with 2 reps={sorted(d for d, v in r.items() if d > 0 and v == 2)}  "
          f"delta>0 with 1 rep={sorted(d for d, v in r.items() if d > 0 and v == 1)}")
S4 = [-4, -1, 0, 1, 4]
tri = max(len(set(S4) & {s + d1 for s in S4} & {s + d2 for s in S4})
          for d1 in range(-9, 10) for d2 in range(-9, 10) if d1 and d2 and d1 != d2)
print("S4: max |S cap (S+d1) cap (S+d2)| =", tri)

print("\n== (2) the 5 x 8 rank-three example")
# rows: p0,p1,p2 on the line y=0; p0,p3,p4 on the line x=0 (homogeneous (x,y,z))
rows = {0: (0, 0, 1), 1: (1, 0, 1), 2: (2, 0, 1), 3: (0, 1, 1), 4: (0, 2, 1)}
# columns: functionals (kernel = line); W1 and W2 twice each, then the four cross lines
cols = [(0, 1, 0), (0, 1, 0), (1, 0, 0), (1, 0, 0),
        (1, 1, -1), (2, 1, -2), (1, 2, -2), (1, 1, -2)]
C = [[sum(a * b for a, b in zip(rows[i], c)) for c in cols] for i in range(5)]
print("rank C =", rank(C), " (d,l)=", (5, 8), " (d-3)(l-3)=", 2 * 5)
random.seed(20261102)
while True:
    a = [random.randrange(10**4) for _ in range(5)]
    b = [random.randrange(10**4) for _ in range(8)]
    Sig = {a[i] + b[j] for i in range(5) for j in range(8) if C[i][j] != 0}
    if has_P(Sig) and len(set(a)) == 5 and len(set(b)) == 8:
        break
print("weights a =", a)
print("weights b =", b)
print("|Sigma| =", len(Sig), " (P) holds:", has_P(Sig))
# Test (star) on all relevant W. By Lemma 2.2 of the note graded (R,C) suffice and they
# are dominated by subspaces W. Here all classes are one-dimensional, so d'(W) = #rows in W,
# c(W) = #columns vanishing on W. Only W containing a row matter.
n, d, l = 3, 5, 8


def vanish(phi, v):
    return sum(x * y for x, y in zip(phi, v)) == 0


def cross(u, v):
    return (u[1] * v[2] - u[2] * v[1], u[2] * v[0] - u[0] * v[2], u[0] * v[1] - u[1] * v[0])


worst = []
for i, p in rows.items():            # W = a row point
    c = sum(vanish(phi, p) for phi in cols)
    worst.append((("pt", i), 1, c))
lines = set()
for i, j in itertools.combinations(rows, 2):
    lines.add(cross(rows[i], rows[j]))
for phi in cols:
    lines.add(phi)


def norm(v):
    g = next(x for x in v if x)
    return tuple(Fr(x, g) for x in v)


for phi in {norm(v) for v in lines}:  # W = kernel of phi, with W containing a row
    r = sum(vanish(phi, p) for p in rows.values())
    if r == 0:
        continue
    c = sum(norm(q) == phi for q in cols)
    worst.append((("line", phi), r, c))
worst.append((("generic line through a row", None), 1, 0))
worst.append((("whole", None), d, 0))
ok = all((d - n) * (l - c) > n * r for _, r, c in worst)
print("tests:", [(t[0], r, c) for t, r, c in worst if t[0] != "line"][:7], "...")
print("line tests (r,c):", sorted((r, c) for t, r, c in worst if t[0] == "line"))
print("(star) holds on all W:", ok)

print("\n== (3) random rank-two colour models: (star) => not (P)")
random.seed(7)
trials = star = viol = 0
for _ in range(300000):
    trials += 1
    dd, ll = random.randint(3, 7), random.randint(3, 7)
    wr = random.randint(2, 7)
    ncol = random.randint(2, 4)
    if dd > wr * ncol or ll > (wr + 5) * ncol:
        continue
    R = set()
    while len(R) < dd:
        R.add((random.randrange(wr), random.randrange(ncol)))
    Q = set()
    while len(Q) < ll:
        Q.add((random.randrange(-wr - 2, 3), random.randrange(ncol)))
    # at most two rows per weight; distinct colours automatically
    if max(sum(1 for x in R if x[0] == w) for w in {x[0] for x in R}) > 2:
        continue
    if max(sum(1 for x in Q if x[0] == w) for w in {x[0] for x in Q}) > 2:
        continue
    if len({x[1] for x in R}) < 2 or len({x[1] for x in Q}) < 2:
        continue  # rank < 2
    if not (dd - 2) * ll > 2 * dd:
        continue
    fullr = {w for w in {x[0] for x in R} if sum(1 for x in R if x[0] == w) == 2}
    fullq = {w for w in {x[0] for x in Q} if sum(1 for x in Q if x[0] == w) == 2}
    good = True
    for p in range(ncol + 1):      # colour ncol stands for a point outside the used colours
        dp = len(fullr) + sum(1 for w, c in R if c == p and w not in fullr)
        if dp == 0:
            continue
        cp = len(fullq) + sum(1 for w, c in Q if c == p and w not in fullq)
        if not (dd - 2) * (ll - cp) > 2 * dp:
            good = False
            break
    if not good:
        continue
    star += 1
    Sig2 = {a0 + b0 for a0, c0 in R for b0, c1 in Q if c0 != c1}
    if has_P(Sig2):
        viol += 1
        print("COUNTEREXAMPLE", R, Q)
print(f"trials={trials}  models satisfying (star)={star}  of those with (P)={viol}")

print("\n== (4) worked example M = [[1,T],[1,T+1]], S={0,1}")
A = [[1, 0], [1, 1]]
B = [[0, 1], [0, 1]]
print("rank A =", rank(A), " rank B =", rank(B), " det(A+TB) = 1 identically")
print("top form B has a common kernel, so it is not semistable; row op gives [[1,T],[0,1]], "
      "and diag(1,t^2) conjugation sends t.M to the identity as t -> infinity (a remark, not checked here).")
