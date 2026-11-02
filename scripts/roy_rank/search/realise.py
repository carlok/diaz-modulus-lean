#!/usr/bin/env python3
"""Turns a decoded abstract model into an explicit matrix for verify_exact.py. Uses no encoder or verifier code."""
import random
from fractions import Fraction as Fr


def cross(u, v):
    return [u[1]*v[2]-u[2]*v[1], u[2]*v[0]-u[0]*v[2], u[0]*v[1]-u[1]*v[0]]

def dot(u, v):
    return sum(a*b for a, b in zip(u, v))

def rvec(rnd, n, B=9):
    return [Fr(rnd.randint(-B, B)) for _ in range(n)]

def nz(v):
    return any(x != 0 for x in v)

class UF:
    def __init__(self): self.p = {}
    def find(self, x):
        self.p.setdefault(x, x)
        while self.p[x] != x:
            self.p[x] = self.p[self.p[x]]
            x = self.p[x]
        return x
    def union(self, a, b):
        self.p[self.find(a)] = self.find(b)

def coords(model, rnd):
    """rational coordinates for the point and line objects (lines: normal vector). None if an attempt fails."""
    n = model["n"]
    kinds = {int(k): v for k, v in model["objs"].items()}
    pu, lu = UF(), UF()
    pts = [o for o, k in kinds.items() if k == 1]
    lns = [o for o, k in kinds.items() if k == 2] if n == 3 else []
    for a, b in model["EP"]: pu.union(a, b)
    for a, b in model["EL"]: lu.union(a, b)
    if n == 2:
        pos = {}
        for o in pts:
            r = pu.find(o)
            while r not in pos:
                v = rvec(rnd, 2)
                if nz(v): pos[r] = v
            pos[o] = pos[r]
        return pos
    pclasses = {pu.find(o) for o in pts}
    lclasses = {lu.find(o) for o in lns}
    inc = set()
    for p, l in model["I"]:
        inc.add((pu.find(p), lu.find(l)))
    nbr = {("p", c): [] for c in pclasses}
    nbr.update({("l", c): [] for c in lclasses})
    for p, l in inc:
        nbr[("p", p)].append(("l", l))
        nbr[("l", l)].append(("p", p))
    val = {}
    todo = list(nbr)
    rnd.shuffle(todo)
    while todo:
        best, bs = None, None
        for t in todo:
            cnt = sum(1 for u in nbr[t] if u in val)
            score = (0 if cnt <= 2 else 1, -cnt)
            if bs is None or score < bs:
                best, bs = t, score
        t = best
        todo.remove(t)
        known = [val[u] for u in nbr[t] if u in val]
        if len(known) >= 2:
            v = None
            for i in range(len(known)):
                for j in range(i+1, len(known)):
                    w = cross(known[i], known[j])
                    if nz(w):
                        v = w
                        break
                if v: break
            if v is None:
                v = cross(known[0], rvec(rnd, 3))
        elif len(known) == 1:
            v = cross(known[0], rvec(rnd, 3))
        else:
            v = rvec(rnd, 3)
        if not nz(v): return None
        val[t] = v
    for p, l in inc:
        if dot(val[("p", p)], val[("l", l)]) != 0:
            return None
    out = {}
    for o in pts: out[o] = val[("p", pu.find(o))]
    for o in lns: out[o] = val[("l", lu.find(o))]
    return out

def perp_basis(vs, n):
    """basis of the orthogonal complement of the given vectors in Q^n, by elimination"""
    rows = [list(v) for v in vs]
    piv = []
    r = 0
    for c in range(n):
        p = next((i for i in range(r, len(rows)) if rows[i][c] != 0), None)
        if p is None: continue
        rows[r], rows[p] = rows[p], rows[r]
        inv = 1 / rows[r][c]
        rows[r] = [x*inv for x in rows[r]]
        for i in range(len(rows)):
            if i != r and rows[i][c] != 0:
                f = rows[i][c]
                rows[i] = [a-f*b for a, b in zip(rows[i], rows[r])]
        piv.append(c); r += 1
    out = []
    for f in [c for c in range(n) if c not in piv]:
        v = [Fr(0)]*n; v[f] = Fr(1)
        for ri, p in zip(rows[:r], piv): v[p] = -ri[f]
        out.append(v)
    return out

def flat_basis(idx, dimv, n, xy):
    """basis of the linear subspace of Q^n carrying flat idx of vector-dimension dimv"""
    if dimv == 0: return []
    if dimv == n: return [[Fr(int(i == j)) for j in range(n)] for i in range(n)]
    if dimv == 1: return [list(xy[idx])]
    if dimv == 2: return perp_basis([xy[idx]], n)  # a line of P^2, given by its normal
    raise ValueError

def combo(rnd, basis, n, B=7):
    out = [Fr(0)]*n
    for b in basis:
        c = Fr(rnd.randint(-B, B))
        out = [x+c*y for x, y in zip(out, b)]
    return out

def to_matrix(model, rnd, m_x=None):
    n = model["n"]
    if m_x is None:
        m_x = max([r["mass"] for r in model["rows"]] + [q["mass"] for q in model["cols"]] + [1])
    xy = coords(model, rnd)
    if xy is None: return None
    a, X = [], []     # X[i]: dict monomial(None|k) -> vector
    for r in model["rows"]:
        G = flat_basis(r["G"], r["gdim"], n, xy)
        if r["gdim"] == 0: continue
        if r.get("edim", 0) == 0:
            for v in G:
                a.append(r["w"]); X.append({None: v})
        else:
            E = flat_basis(r["E"], r["edim"], n, xy)
            for t in range(r["mass"]):
                row = {None: combo(rnd, G, n)}
                # the first rows make the constants span G
                if t < len(G): row[None] = [x + 11*y for x, y in zip(row[None], G[t])]
                for k in range(m_x):
                    row[k] = combo(rnd, E, n)
                a.append(r["w"]); X.append(row)
    bp, Y = [], []
    for q in model["cols"]:
        if q["fdim"] == n: continue
        Gp = perp_basis(flat_basis(q["F"], q["fdim"], n, xy), n) if q["fdim"] else [[Fr(int(i == j)) for j in range(n)] for i in range(n)]
        if q.get("hdim", n) == n:
            for v in Gp:
                bp.append(q["w"]); Y.append({None: v})
        else:
            Ep = perp_basis(flat_basis(q["H"], q["hdim"], n, xy), n) if q["hdim"] else [[Fr(int(i == j)) for j in range(n)] for i in range(n)]
            for t in range(q["mass"]):
                col = {None: combo(rnd, Gp, n)}
                if t < len(Gp): col[None] = [x + 11*y for x, y in zip(col[None], Gp[t])]
                for k in range(m_x):
                    col[k] = combo(rnd, Ep, n)
                bp.append(q["w"]); Y.append(col)
    M = []
    quad = False
    S = set(model["S"])
    for i, ai in enumerate(a):
        row = []
        for j, bj in enumerate(bp):
            t = ai - bj
            terms = {}
            for k1, u in X[i].items():
                for k2, v in Y[j].items():
                    c = dot(u, v)
                    if c == 0: continue
                    if k1 is not None and k2 is not None:
                        quad = True
                        continue
                    k = k1 if k1 is not None else k2
                    terms[k] = terms.get(k, Fr(0)) + c
            row.append([{"c": str(c), "t": t, "x": k} for k, c in terms.items() if c != 0])
        M.append(row)
    if quad: return None
    return {"S": model["S"], "Sx": model.get("Sx", []), "d": len(a), "l": len(bp), "a": a, "b": [-x for x in bp], "M": M}
