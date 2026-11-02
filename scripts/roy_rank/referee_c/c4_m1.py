#!/usr/bin/env python3
"""Referee C: M1 over V''_b, I2 dimensions, blow-up semi-invariant test mod p.
semistable test: det(sum M_e tensor Z_e) != 0 for random Z_e of size 8k x 5k certifies theta-semistable
(Schofield/Derksen-Weyman determinantal semi-invariants) [memory]. M0 itself is the control."""
import random, itertools as it
import sympy as sp

p = 2**31 - 1
IN0 = [-4, -1, 0, 1, 3]
a = [0, 1, 2, 3, 4]
P = {0: (1, 0, 0), 2: (0, 1, 0), 1: (0, 0, 1), 4: (1, 1, 1), 3: (1, 1, 0)}
X = sp.Matrix([P[i] for i in a])
cols = []
for b in range(-12, 12):
    Z = [i for i in a if a[i] + b not in IN0]
    ns = sp.Matrix([P[i] for i in Z]).nullspace()
    for v in ns:
        cols.append((b, v))
bs = [b for b, _ in cols]
C = X * sp.Matrix.hstack(*[v for _, v in cols])
d, l = C.shape
T = sp.symbols("T")
print("bs", bs)

def M0(i, j):
    return C[i, j] * T ** (a[i] + bs[j])

def rank_mod(rows, p=p):
    rows = [r[:] for r in rows]
    rk = 0
    n = len(rows)
    m = len(rows[0]) if rows else 0
    for c in range(m):
        piv = None
        for i in range(rk, n):
            if rows[i][c] % p:
                piv = i
                break
        if piv is None:
            continue
        rows[rk], rows[piv] = rows[piv], rows[rk]
        inv = pow(rows[rk][c], -1, p)
        rows[rk] = [x * inv % p for x in rows[rk]]
        for i in range(n):
            if i != rk and rows[i][c] % p:
                f = rows[i][c]
                rows[i] = [(x - f * y) % p for x, y in zip(rows[i], rows[rk])]
        rk += 1
    return rk

def blowup_rank(Ms, k, seed=1):
    """Ms: list of d x l integer matrices (lists); Z_e: l k x d k random. Returns rank of sum M_e tensor Z_e, size d*l*k"""
    rnd = random.Random(seed)
    d_, l_ = len(Ms[0]), len(Ms[0][0])
    n = d_ * l_ * k
    A = [[0] * n for _ in range(n)]
    for Me in Ms:
        Z = [[rnd.randrange(p) for _ in range(d_ * k)] for _ in range(l_ * k)]
        for i in range(d_):
            for j in range(l_):
                v = Me[i][j] % p
                if not v:
                    continue
                for r in range(l_ * k):
                    for s in range(d_ * k):
                        A[i * l_ * k + r][j * d_ * k + s] = (A[i * l_ * k + r][j * d_ * k + s] + v * Z[r][s]) % p
    return rank_mod(A), n

def coeff_mats(M, basis):
    """M sympy d x l over span(basis) -> list of coefficient matrices wrt basis (solve by coefficient comparison)."""
    syms = sp.symbols(f"u0:{len(basis)}")
    out = [[[0] * M.shape[1] for _ in range(M.shape[0])] for _ in basis]
    for i in range(M.shape[0]):
        for j in range(M.shape[1]):
            e = M[i, j]
            if e == 0:
                continue
            eq = sp.together(e - sum(s * v for s, v in zip(syms, basis)))
            num = sp.numer(eq)
            sol = sp.solve(sp.Poly(num, T).coeffs(), syms, dict=True)[0]
            for n, s in enumerate(syms):
                val = sol.get(s, 0)
                assert val.is_Rational if hasattr(val, "is_Rational") else True
                out[n][i][j] = int(sp.Rational(val).p * pow(int(sp.Rational(val).q), -1, p) % p)
    return out

m0 = sp.Matrix(d, l, M0)
print("M0 rank", m0.rank())
basis0 = [T**-4, T**-1, sp.Integer(1), T, T**3]
Ms0 = coeff_mats(m0, basis0)
print("control M0 blow-up rank k=1:", blowup_rank(Ms0, 1))

for bv in (sp.Integer(1), sp.Integer(-3), sp.Rational(5, 7)):
    diag = sp.diag(*([1 + bv * T] * 2 + [1] * 6))
    m1 = m0 * diag
    basis = [T**-4 + bv * T**-3, T**-1, sp.Integer(1), T, T**3]
    Ms = coeff_mats(m1, basis)
    # rank of m1 exact over Q(T)
    print("b =", bv, "M1 rank", m1.rank(), "blow-up rank k=1:", blowup_rank(Ms, 1), "entries in V'' ok")

# I_2 dimensions by coefficient comparison
A_, B_, c_, cp = sp.symbols("a b c cp")
def I2dim(vs):
    prods = []
    for i, j in it.combinations_with_replacement(range(len(vs)), 2):
        prods.append(sp.expand(vs[i] * vs[j] * T**8))
    exps = sorted({m[0] for q in prods for m in sp.Poly(q, T).monoms()})
    Mat = sp.Matrix([[sp.Poly(q, T).coeff_monomial(T**e) for q in prods] for e in exps])
    return len(prods) - Mat.rank(), Mat

for cval, cpval in [(1, 0), (1, 1), (2, 3), (-1, 5), (sp.Rational(1, 3), sp.Rational(-2, 5)), (0, 0), (0, 2)]:
    vs = [sp.Integer(1), T, 1 / T, T**4 + cval * T**3, T**-4 + cpval * T**-3]
    print("c,c' =", cval, cpval, "dim I2 =", I2dim(vs)[0])
print("in0 dim I2 =", I2dim([sp.Integer(1), T, 1 / T, T**3, T**-4])[0])
print("V''_b (b=1) dim I2 =", I2dim([sp.Integer(1), T, 1 / T, T**3, T**-4 + T**-3])[0])

# quadric relation certificate: no element of I2(V(c,c')) contains (1/T)*v3: symbolic c,c'
vs = [sp.Integer(1), T, 1 / T, T**4 + c_ * T**3, T**-4 + cp * T**-3]
names = ["1", "T", "Ti", "v3", "v4"]
pairs = list(it.combinations_with_replacement(range(5), 2))
prods = [sp.expand(vs[i] * vs[j] * T**8) for i, j in pairs]
exps = sorted({m[0] for q in prods for m in sp.Poly(q, T).monoms()})
Mat = sp.Matrix([[sp.Poly(q, T).coeff_monomial(T**e) for q in prods] for e in exps])
ns = Mat.nullspace()
print("generic I2 basis (c,c' symbolic):")
for v in ns:
    print({names[pairs[n][0]] + "*" + names[pairs[n][1]]: sp.simplify(v[n]) for n in range(len(pairs)) if v[n] != 0})
