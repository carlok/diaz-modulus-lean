#!/usr/bin/env python3
"""Exact verifier for a claimed failure of Roy's Cor. 1 (condition (star) of the note, Section 2).

Shares no code with the encoder.  Input: JSON with
  S   : list of T-exponents allowed for x-free terms
  Sx  : list of T-exponents allowed for terms carrying one x_k (default [])
  d,l : matrix size
  M   : d x l array; M[i][j] is a list of terms {"c":"p/q","t":int,"x":null|int}
Two independent tests of (star):
  V1  graded matrices without x, rank <= 3: finite list of subspaces W (complete by the profile argument in the note, Section 8).
      A violated W is turned into an explicit zero block (R,C), rechecked directly on M.
  V2  no grading, no geometry, works with x: blow-up certificate.  If for integer matrices W_mon of
      size q1 x q2 the matrix sum_mon A_mon (tensor) W_mon has full row rank d*q1, then
      dim R * q1 <= (l - dim C) * q2 for every zero block with R != 0, because
      R (tensor) Q^q1 injects into A(R) (tensor) Q^q2.  So q1/q2 > r/(d-r) proves (star)
      for every zero block over Qbar.  Rank is taken mod p, a lower bound for the rank over Q.
Rank over Q(x,T) is computed exactly (sympy frac_field when x occurs; Q-rank of C when x-free graded).
"""
import json, random, sys
from fractions import Fraction as Fr
from itertools import combinations

P = (1 << 61) - 1

def parse(path_or_obj):
    o = json.load(open(path_or_obj)) if isinstance(path_or_obj, str) else path_or_obj
    M = [[[(Fr(t["c"]), int(t["t"]), t.get("x")) for t in e] for e in row] for row in o["M"]]
    return o, M

def check_membership(o, M):
    S, Sx = set(o["S"]), set(o.get("Sx", []))
    for row in M:
        for e in row:
            for (c, t, x) in e:
                if x is None and t not in S: return False
                if x is not None and t not in Sx: return False
    return True

def norm_entry(e):
    d = {}
    for (c, t, x) in e:
        d[(t, x)] = d.get((t, x), Fr(0)) + c
    return {k: v for k, v in d.items() if v != 0}

def monomials(M):
    mons = {}
    for i, row in enumerate(M):
        for j, e in enumerate(row):
            for k, v in norm_entry(e).items():
                mons.setdefault(k, {})[(i, j)] = v
    return mons

# ---------- exact linear algebra over Q (lists of Fractions) ----------
def rref(rows, ncols):
    rows = [list(r) for r in rows]
    piv, r = [], 0
    for c in range(ncols):
        p = next((i for i in range(r, len(rows)) if rows[i][c] != 0), None)
        if p is None: continue
        rows[r], rows[p] = rows[p], rows[r]
        inv = 1 / rows[r][c]
        rows[r] = [v * inv for v in rows[r]]
        for i in range(len(rows)):
            if i != r and rows[i][c] != 0:
                f = rows[i][c]
                rows[i] = [a - f * b for a, b in zip(rows[i], rows[r])]
        piv.append(c); r += 1
    return rows[:r], piv

def rank_q(rows, ncols): return len(rref(rows, ncols)[0]) if rows else 0

def nullspace(rows, ncols):
    """basis of {v : rows * v = 0}"""
    R, piv = rref(rows, ncols) if rows else ([], [])
    free = [c for c in range(ncols) if c not in piv]
    out = []
    for f in free:
        v = [Fr(0)] * ncols; v[f] = Fr(1)
        for r, p in zip(R, piv): v[p] = -r[f]
        out.append(v)
    return out

def span_key(B, n):
    R, _ = rref(B, n) if B else ([], [])
    return tuple(tuple(r) for r in R)

def inter(A, B, n):
    # A cap B = perp(perp A + perp B)
    pa, pb = nullspace(A, n), nullspace(B, n)
    return nullspace(pa + pb, n)

def dim_inter(A, B, n):
    return len(A) + len(B) - rank_q(A + B, n) if (A or B) else 0

# ---------- rank over Q(x,T) ----------
def rank_field(o, M):
    has_x = any(x is not None for row in M for e in row for (_, _, x) in e)
    d, l = o["d"], o["l"]
    grad = graded_weights(o, M)
    if not has_x and grad is not None:
        C = [[sum((c for c, _, _ in M[i][j]), Fr(0)) for j in range(l)] for i in range(d)]
        return rank_q(C, l), "Q-rank of C (graded, x-free)"
    from sympy import QQ, symbols
    from sympy.polys.matrices import DomainMatrix
    xs = sorted({x for row in M for e in row for (_, _, x) in e if x is not None})
    names = ["T"] + [f"x{k}" for k in xs]
    K = QQ.frac_field(*symbols(names))
    gens = K.gens
    T = gens[0]; xv = {k: gens[i + 1] for i, k in enumerate(xs)}
    rows = []
    for i in range(d):
        row = []
        for j in range(l):
            v = K.zero
            for (c, t, x) in M[i][j]:
                term = K(QQ(c.numerator, c.denominator)) * (T ** t)
                if x is not None: term = term * xv[x]
                v = v + term
            row.append(v)
        rows.append(row)
    return DomainMatrix(rows, (d, l), K).rank(), "DomainMatrix rank over Q(T,x)"

def graded_weights(o, M):
    """Return (a,b) with every term of M[i][j] having T-exponent a_i+b_j, or None. Uses o['a'],o['b'] if given."""
    if "a" in o and "b" in o:
        a, b = o["a"], o["b"]
        for i, row in enumerate(M):
            for j, e in enumerate(row):
                for k in norm_entry(e):
                    if k[0] != a[i] + b[j]: return None
        return a, b
    return None

# ---------- V1 ----------
def v1(o, M, r):
    """x-free, graded. Returns ('fail',None) if (star) has no violation (Cor. 1 fails for M),
       or ('holds', witness) with an explicit zero block violating (star)."""
    d, l = o["d"], o["l"]
    a, b = graded_weights(o, M)
    C = [[sum((c for c, _, _ in M[i][j]), Fr(0)) for j in range(l)] for i in range(d)]
    # rank factorisation C = X Yt using a row basis
    Rb, _ = rref(C, l)
    assert len(Rb) == r, "rank mismatch"
    if r == 0: raise ValueError("zero matrix")
    Yt = Rb  # r x l ; rows of C are combinations of rows of Yt
    # solve X: C_i = X_i Yt ; rref columns are pivots
    _, piv = rref(C, l)
    X = [[C[i][p] for p in piv] for i in range(d)]
    Y = [[Yt[k][j] for k in range(r)] for j in range(l)]
    for i in range(d):
        for j in range(l):
            assert sum(X[i][k] * Y[j][k] for k in range(r)) == C[i][j]
    rw = sorted(set(a)); cw = sorted(set(b))
    Pc = {w: [X[i] for i in range(d) if a[i] == w] for w in rw}
    Qc = {w: [Y[j] for j in range(l) if b[j] == w] for w in cw}
    rowsidx = {w: [i for i in range(d) if a[i] == w] for w in rw}
    colsidx = {w: [j for j in range(l) if b[j] == w] for w in cw}
    # freeness inside classes (a dependent class gives a zero row or column combination)
    named = {}
    for w in rw:
        key = span_key(Pc[w], r); named[key] = [list(v) for v in key]
    for w in cw:
        B = nullspace(Qc[w], r); key = span_key(B, r); named[key] = [list(v) for v in key]
    flats = [v for v in named.values() if 0 < len(v) < r]
    Ws = {}
    def addW(B):
        k = span_key(B, r)
        Ws[k] = [list(v) for v in k]
    rnd = random.Random(12345)
    def rv(B):
        # random combination of basis B
        out = [Fr(0)] * r
        for v in B:
            c = Fr(rnd.randint(1, 10**6))
            out = [p + c * q for p, q in zip(out, v)]
        return out
    Id = [[Fr(int(i == j)) for j in range(r)] for i in range(r)]
    addW(Id)
    addW([])   # W = 0: blocks made of a dependency among rows; it only matters for non-free classes
    pts = [f for f in flats if len(f) == 1]
    lns = [f for f in flats if len(f) == 2]
    # points: named points, meets of named lines, generic on named lines, generic in the space
    for f in pts: addW(f)
    for f, g in combinations(lns, 2):
        m = inter(f, g, r)
        if len(m) == 1: addW(m)
    for f in lns: addW([rv(f)])
    addW([rv(Id)])
    # lines: named, joins of named points, generic through named points, generic
    if r == 3:
        for f in lns: addW(f)
        for f, g in combinations(pts, 2):
            addW(f + g)
        for f in pts: addW(f + [rv(Id)])
        addW([rv(Id), rv(Id)])
    verdict = ("fail", None)
    nW = len(Ws)
    for W in Ws.values():
        dp = sum(dim_inter(Pc[w], W, r) for w in rw)
        Wp = nullspace(W, r)
        cW = sum(dim_inter(Qc[w], Wp, r) for w in cw)
        if dp >= 1 and not ((d - r) * (l - cW) > r * dp):
            # explicit block: rows combos with X-combination in W; columns combos with Y-combination in W^perp
            Rv, Cv = [], []
            for w in rw:
                idx = rowsidx[w]
                sols = combos_into(Pc[w], W, r)
                for s in sols:
                    v = [Fr(0)] * d
                    for ii, c in zip(idx, s): v[ii] = c
                    Rv.append(v)
            for w in cw:
                idx = colsidx[w]
                sols = combos_into(Qc[w], Wp, r) if Wp else nullspace_left(Qc[w], r)
                for s in sols:
                    v = [Fr(0)] * l
                    for jj, c in zip(idx, s): v[jj] = c
                    Cv.append(v)
            ok = check_block(M, Rv, Cv)
            dr, dc = rank_q(Rv, d), rank_q(Cv, l) if Cv else 0
            assert ok, "witness is not a zero block"
            assert dr >= 1 and not ((d - r) * (l - dc) > r * dr), "witness does not violate (star)"
            verdict = ("holds", {"dimR": dr, "dimC": dc, "R": [[str(x) for x in v] for v in Rv], "C": [[str(x) for x in v] for v in Cv]})
            break
    return verdict[0], verdict[1], nW

def nullspace_left(B, r):
    # coefficient vectors s with sum s_k B_k = 0
    t = [[B[k][c] for k in range(len(B))] for c in range(r)]
    return nullspace(t, len(B))

def combos_into(B, W, r):
    """coefficient vectors s with sum s_k B_k in span W"""
    if not B: return []
    perp = nullspace(W, r)
    t = [[sum(B[k][c] * p[c] for c in range(r)) for k in range(len(B))] for p in perp]
    return nullspace(t, len(B)) if t else [[Fr(int(i == k)) for i in range(len(B))] for k in range(len(B))]

def check_block(M, Rv, Cv):
    """Zero-block test on the matrix itself: coefficient of every monomial vanishes."""
    for r in Rv:
        for c in Cv:
            acc = {}
            for i, ri in enumerate(r):
                if ri == 0: continue
                for j, cj in enumerate(c):
                    if cj == 0: continue
                    for k, v in norm_entry(M[i][j]).items():
                        acc[k] = acc.get(k, Fr(0)) + ri * cj * v
            if any(v != 0 for v in acc.values()): return False
    return True

# ---------- V2 ----------
def rank_mod(A, nrows, ncols):
    rows = [dict() for _ in range(nrows)]
    for (i, j), v in A.items():
        if v % P: rows[i][j] = v % P
    r = 0; pivots = {}
    for row in rows:
        cur = row
        while cur:
            j = min(cur)
            if j in pivots:
                piv = pivots[j]; f = cur[j]
                for k, v in piv.items():
                    nv = (cur.get(k, 0) - f * v) % P
                    if nv: cur[k] = nv
                    else: cur.pop(k, None)
            else:
                inv = pow(cur[j], P - 2, P)
                pivots[j] = {k: v * inv % P for k, v in cur.items()}
                r += 1
                break
    return r

def v2(o, M, r, tries=3, q2max=8, seed=2026):
    d, l = o["d"], o["l"]
    if d <= r: return None
    mons = monomials(M)
    # clear denominators per monomial
    import math
    iA = {}
    for k, ent in mons.items():
        den = 1
        for v in ent.values(): den = den * v.denominator // math.gcd(den, v.denominator)
        iA[k] = {ij: int(v * den) for ij, v in ent.items()}
    rnd = random.Random(seed)
    for q2 in range(1, q2max + 1):
        q1 = (l * q2) // d
        if q1 < 1 or q1 * (d - r) <= r * q2: continue
        # try the largest q1, then smaller ones still above the threshold
        for q in range(q1, 0, -1):
            if q * (d - r) <= r * q2: break
            for _ in range(tries):
                W = {k: [[rnd.randrange(1, P) for _ in range(q2)] for _ in range(q)] for k in iA}
                A = {}
                for k, ent in iA.items():
                    Wk = W[k]
                    for (i, j), v in ent.items():
                        for s in range(q):
                            for t in range(q2):
                                key = (i * q + s, j * q2 + t)
                                A[key] = (A.get(key, 0) + v * Wk[s][t]) % P
                if rank_mod(A, d * q, l * q2) == d * q:
                    return {"q1": q, "q2": q2}
    return None

def verify(path_or_obj, n=None):
    o, M = parse(path_or_obj)
    res = {"membership": check_membership(o, M)}
    d, l = o["d"], o["l"]
    # no zero rows/cols needed here: a zero row is caught as a violated block by V1
    r, how = rank_field(o, M)
    res["rank"] = r; res["rank_method"] = how
    res["bound_rhs"] = f"{d}*theta/(1+theta)"
    has_x = any(x is not None for row in M for e in row for (_, _, x) in e)
    gw = graded_weights(o, M)
    if not has_x and gw is not None and r <= 3 and r >= 1:
        v, wit, nW = v1(o, M, r)
        res["v1"] = v; res["v1_nW"] = nW
        if wit: res["v1_witness"] = {"dimR": wit["dimR"], "dimC": wit["dimC"]}
    cert = v2(o, M, r) if r >= 1 else None
    res["v2_certificate"] = cert
    if "v1" in res and res["v1"] == "holds" and cert: res["inconsistent"] = True
    # final verdict: a genuine failure needs membership and a positive proof of (star)
    proven = res["membership"] and (cert is not None or res.get("v1") == "fail")
    res["genuine_failure"] = bool(proven) and not res.get("inconsistent", False)
    return res

if __name__ == "__main__":
    for p in sys.argv[1:]:
        print(p, json.dumps(verify(p)))
