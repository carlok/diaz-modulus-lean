#!/usr/bin/env python3
"""Soundness test of the encoder against failures it did not produce.
Random graded configurations over Q are built by hand (no solver), classified by verify_exact.V1,
then their exact type and geometry are fixed by unit clauses.
 - a genuine failure must give SAT (otherwise the encoding over-constrains: UNSAT answers would be unsound);
 - a non-failure should give UNSAT (otherwise the relaxation misses a W; it is only a spurious-SAT risk)."""
import json, os, random, subprocess, sys, tempfile
from fractions import Fraction as Fr
from concurrent.futures import ProcessPoolExecutor
from encode import Enc, TRUE, FALSE
from verify_exact import verify, nullspace, rank_q, span_key
from solve import run_solver

def rv(rnd): return [Fr(rnd.randint(-5, 5)) for _ in range(3)]

def gen(rnd, S, wr):
    """rows: random flats at weights 0..wr-1; columns at every weight, maximal for the forced orthogonality."""
    Sset = set(S); m = max(S)
    pts = [rv(rnd) for _ in range(rnd.randint(2, 5))]
    pts = [p for p in pts if any(p)]
    pool = [[p] for p in pts]
    for _ in range(rnd.randint(1, 4)):
        a, b = rnd.choice(pts), rnd.choice(pts)
        if rank_q([a, b], 3) == 2: pool.append([a, b])
    pool.append([rv(rnd), rv(rnd), rv(rnd)])
    rows = {}
    for a in range(wr):
        if a == 0 or rnd.random() < 0.7:
            f = rnd.choice(pool)
            k = span_key(f, 3)
            if len(k) >= 1: rows[a] = [list(v) for v in k]
    if 0 not in rows: rows[0] = [[Fr(1), Fr(0), Fr(0)]]
    cols = {}
    for bp in range(-m, wr + m):
        must = []
        for a, f in rows.items():
            if a - bp not in Sset: must += f
        Q = nullspace(must, 3) if must else [[Fr(int(i == j)) for j in range(3)] for i in range(3)]
        if not Q: continue
        if rnd.random() < 0.15:
            Q = Q[:max(1, len(Q) - 1)]
        # the column must not be zero
        if all(sum(u * v for u, v in zip(f_, q)) == 0 for a, f in rows.items() for f_ in f for q in Q):
            continue
        cols[bp] = Q
    return rows, cols

def as_matrix(S, rows, cols):
    a, b, X, Y = [], [], [], []
    for w, f in sorted(rows.items()):
        for v in f: a.append(w); X.append(v)
    for w, f in sorted(cols.items()):
        for v in f: b.append(-w); Y.append(v)
    M = []
    for i in range(len(a)):
        row = []
        for j in range(len(b)):
            c = sum(u * v for u, v in zip(X[i], Y[j]))
            row.append([{"c": str(c), "t": a[i] + b[j], "x": None}] if c else [])
        M.append(row)
    return {"S": S, "d": len(a), "l": len(b), "a": a, "b": b, "M": M}

def geom_units(e, rows, cols, S):
    """unit clauses fixing kinds and relations to the true geometry"""
    n = 3
    flat = {}
    for r in e.rows:
        flat[r["G"].idx] = rows.get(r["w"], [])
    for q in e.cols:
        Q = cols.get(q["w"], [])
        flat[q["F"].idx] = nullspace(Q, 3) if Q else [[Fr(int(i == j)) for j in range(3)] for i in range(3)]
    keys = {i: span_key(f, 3) for i, f in flat.items()}
    units = []
    for o in e.objs:
        d_ = len(keys[o.idx])
        units.append([o.dim[d_]])
    def sub(a, b):
        return rank_q([list(v) for v in keys[a]] + [list(v) for v in keys[b]], 3) == len(keys[b])
    for (a, b), v in e.EP.items():
        units.append([v if keys[a] == keys[b] and len(keys[a]) == 1 else -v])
    for (a, b), v in e.EL.items():
        units.append([v if keys[a] == keys[b] and len(keys[a]) == 2 else -v])
    for (p, l), v in e.I.items():
        units.append([v if len(keys[p]) == 1 and len(keys[l]) == 2 and sub(p, l) else -v])
    return units

def one(seed):
    rnd = random.Random(seed)
    S = rnd.choice([[-2, -1, 0, 1, 2], [-2, -1, 0, 1, 2], [-3, -2, -1, 0, 1, 2, 3], [-4, -1, 0, 1, 4]])
    wr = rnd.randint(2, 5)
    rows, cols = gen(rnd, S, wr)
    m = as_matrix(S, rows, cols)
    if m["d"] < 4 or m["l"] < 4 or m["l"] > 7 * 3: return None
    # free classes only (the model's mass = dim)
    v = verify(m)
    if v["rank"] != 3: return None
    e = Enc(S, 3, m["d"], layout="pos", w=wr, reflect=False, Lmax=len(S) * 3 + 6)
    for u in geom_units(e, rows, cols, S): e.c.add(*u)
    fd, path = tempfile.mkstemp(suffix=".cnf"); os.close(fd)
    e.c.write(path)
    res, dt, _ = run_solver("kissat", path, 60)
    os.unlink(path)
    return {"seed": seed, "S": S, "d": m["d"], "l": m["l"], "v1": v["v1"], "v2": bool(v["v2_certificate"]), "enc": res}

if __name__ == "__main__":
    N = int(sys.argv[1]) if len(sys.argv) > 1 else 400
    w = int(sys.argv[2]) if len(sys.argv) > 2 else 2
    tally = {}
    with ProcessPoolExecutor(max_workers=w) as ex:
        out = open("inject.jsonl", "w")
        for r in ex.map(one, range(N)):
            if r is None: continue
            k = (r["v1"], r["enc"])
            tally[k] = tally.get(k, 0) + 1
            out.write(json.dumps(r) + "\n")
    print(tally)
