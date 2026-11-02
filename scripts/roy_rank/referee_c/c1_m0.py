#!/usr/bin/env python3
"""Referee C, own derivation of M0 from the row geometry, tangent space by grade,
gauge by grade, stability, End, the 4x4 certificate.  Nothing imported from ../hull."""
import itertools as it
from fractions import Fraction as Fr
import sympy as sp

IN0 = [-4, -1, 0, 1, 3]
a = [0, 1, 2, 3, 4]
# frame: p0,p2,p1,p4 ; p3 = p0p2 meet p1p4
P = {0: (1, 0, 0), 2: (0, 1, 0), 1: (0, 0, 1), 4: (1, 1, 1), 3: (1, 1, 0)}
X = sp.Matrix([P[i] for i in a])
assert X.rank() == 3

cols = []
for b in range(-12, 12):
    Z = [i for i in a if a[i] + b not in IN0]
    if Z:
        A = sp.Matrix([P[i] for i in Z])
        ns = A.nullspace()
    else:
        ns = [sp.Matrix([1, 0, 0]), sp.Matrix([0, 1, 0]), sp.Matrix([0, 0, 1])]
    for v in ns:
        cols.append((b, v))
bs = [b for b, _ in cols]
print("column weights of N^max:", bs, "l =", len(bs))
Y = sp.Matrix.hstack(*[v for _, v in cols])
C = X * Y
print("C =", C.tolist(), "rank", C.rank())
d, l = C.shape
assert all(C[i, j] == 0 or a[i] + bs[j] in IN0 for i in range(d) for j in range(l))

# ---- tangent by grade
Lker = C.T.nullspace()
Rker = C.nullspace()
print("left kernel", len(Lker), "right kernel", len(Rker))
coords = [(i, j, e) for i in range(d) for j in range(l) for e in IN0]
bygrade = {}
for (i, j, e) in coords:
    bygrade.setdefault(e - a[i] - bs[j], []).append((i, j, e))
print("grade: ncoords rank(10 eqs) tangent gauge")
total_t = total_g = 0
gauge_by = {}
# gauge: delta = E_{ii'} M0 (row) and M0 E_{j'j} (col)
gauge_vectors = {}
for i in range(d):
    for i2 in range(d):
        # (X M0)_{i,j} = M0_{i2,j}; exponent a_i2 + b_j ; grade = a_i2+b_j - a_i - b_j
        k = a[i2] - a[i]
        vec = {}
        for j in range(l):
            if C[i2, j] != 0:
                vec[(i, j, a[i2] + bs[j])] = C[i2, j]
        if vec:
            gauge_vectors.setdefault(k, []).append(vec)
for j in range(l):
    for j2 in range(l):
        k = bs[j2] - bs[j]
        vec = {}
        for i in range(d):
            if C[i, j2] != 0:
                vec[(i, j, a[i] + bs[j2])] = C[i, j2]
        if vec:
            gauge_vectors.setdefault(k, []).append(vec)

rows_table = []
for k in sorted(bygrade):
    cs = bygrade[k]
    # equation matrix
    Eq = sp.zeros(len(Lker) * len(Rker), len(cs))
    idx = {c: n for n, c in enumerate(cs)}
    for al, L in enumerate(Lker):
        for be, R in enumerate(Rker):
            for n, (i, j, e) in enumerate(cs):
                Eq[al * len(Rker) + be, n] = L[i] * R[j]
    r = Eq.rank()
    t = len(cs) - r
    g = 0
    if k in gauge_vectors:
        G = sp.zeros(len(gauge_vectors[k]), len(cs))
        for n, vec in enumerate(gauge_vectors[k]):
            for c, val in vec.items():
                G[n, idx[c]] = val
        g = G.rank()
    total_t += t
    total_g += g
    rows_table.append((k, len(cs), r, t, g))
    if abs(k) <= 8:
        print(k, len(cs), r, t, g)
print("beyond |k|>8 nonzero tangent:", [(k, t) for k, n, r, t, g in rows_table if abs(k) > 8 and t])
print("total tangent", total_t, "total gauge", total_g, "expected 88")
print("all grades tangent == gauge:", all(t == g for _, _, _, t, g in rows_table))

# ---- grade-1 with epsilon direction
A, B = sp.symbols("a b")
cs = bygrade[1]
Eq = sp.zeros(10, len(cs))
rhs = sp.zeros(10, 1)
for al, L in enumerate(Lker):
    for be, R in enumerate(Rker):
        row = al * 5 + be
        for n, (i, j, e) in enumerate(cs):
            Eq[row, n] = L[i] * R[j]
        for i in range(d):
            for j in range(l):
                if C[i, j] != 0 and a[i] + bs[j] == 3:
                    rhs[row] += A * L[i] * R[j] * C[i, j]
                if C[i, j] != 0 and a[i] + bs[j] == -4:
                    rhs[row] += B * L[i] * R[j] * C[i, j]
print("grade 1: rank", Eq.rank(), "augmented rank", Eq.row_join(rhs).rank())

# ---- stability on graded sub-pairs (rows have distinct weights => coordinate subsets)
classes = {}
for j, b in enumerate(bs):
    classes.setdefault(b, []).append(j)
best = {}
for s in range(1, d + 1):
    for R in it.combinations(range(d), s):
        c = 0
        for b, js in classes.items():
            sub = C.extract(list(R), js)
            c += len(js) - sub.rank()
        ratio = Fr(l - c, s)
        best[R] = (ratio, c)
mn = min(v[0] for v in best.values())
print("min ratio over graded sub-pairs", mn, "attained at", [R for R, v in best.items() if v[0] == mn])

# ---- End(M0)
vars_ = sp.symbols("x0:25") + sp.symbols("y0:64")
Xv = sp.Matrix(5, 5, vars_[:25])
Yv = sp.Matrix(8, 8, vars_[25:])
eqs = []
for e in IN0:
    Me = sp.zeros(d, l)
    for i in range(d):
        for j in range(l):
            if a[i] + bs[j] == e:
                Me[i, j] = C[i, j]
    eqs += list(Xv * Me - Me * Yv)
Am, _ = sp.linear_eq_to_matrix(eqs, vars_)
print("End dim =", 89 - Am.rank())

# ---- the block from the grades
T = sp.symbols("T")
w = T**3 + A * T**4
letters = []
def fresh():
    s = sp.Symbol(f"z{len(letters)}")
    letters.append(s)
    return s
basis = [(-4, T**-4 + B * T**-3), (-1, 1 / T), (0, sp.Integer(1)), (1, T), (3, w)]
def entry(i, j):
    s = a[i] + bs[j]
    val = 0
    for o, v in basis:
        if o == s:
            val += C[i, j] * v
        elif o > s:
            val += fresh() * v
    return val
rowsel = [0, 2, 3, 4]
colsel = [j for j, b in enumerate(bs) if b in (-1, 0, 1)]
print("block rows wt", [a[i] for i in rowsel], "cols wt", [bs[j] for j in colsel])
Mblock = sp.Matrix([[entry(i, j) for j in colsel] for i in rowsel])
sp.pprint(Mblock.applyfunc(lambda e: sp.simplify(e)), wrap_line=False)
det = sp.together(Mblock.det(method="berkowitz"))
quot = sp.cancel(det / (4 * w**2))
qn, qd = sp.fraction(sp.together(quot))
print("denominator of det/(4w^2):", qd)
poly = sp.Poly(sp.expand(quot * T**0), T) if qd.has(T) is False else None
if poly is None:
    q = sp.expand(sp.cancel(quot))
    coeff = lambda n: q.coeff(T, n)
else:
    coeff = lambda n: poly.coeff_monomial(T**n)
E3, E4, E5 = coeff(3), coeff(4), coeff(5)
print("a*E4-E5-a^2*E3 =", sp.expand(A * E4 - E5 - A**2 * E3))
print("number of letters in block", len(letters))
print("factor of a^3 is letter-free: see line above; scale differs from hull/hand_check.py because the frame scales columns differently")
