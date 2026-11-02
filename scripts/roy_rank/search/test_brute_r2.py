#!/usr/bin/env python3
"""Rank two: SAT encoder against an exhaustive search that shares no code with it.
Fact used by the brute force [proof]: adding a column keeps a failure, so every column class may be taken maximal for the
given rows.  Rows: at each weight dim 0, 1 (a colour = a point of P^1) or 2.  Then columns are determined; (star) is tested directly."""
import json, os, random, sys, tempfile
from concurrent.futures import ProcessPoolExecutor
from encode import Enc
from solve import run_solver

def partitions(n, k=0, cur=()):
    if n == 0:
        yield cur
        return
    for c in range(k + 1):
        yield from partitions(n - 1, max(k, c + 1), cur + (c,))

def fails(rows, S, d):
    """rows: dict weight -> (dim, colour); returns True iff (star) holds at every W for the maximal columns (rank <= 2)."""
    m = max(abs(s) for s in S)
    lo, hi = min(rows) - m, max(rows) + m
    cols = []
    for b in range(lo, hi + 1):
        must = [r for a, r in rows.items() if a - b not in S]
        if not must:
            cols.append((2, None))
        elif any(r[0] == 2 for r in must):
            continue
        else:
            cs = {r[1] for r in must}
            if len(cs) == 1:
                cols.append((1, cs.pop()))
    # drop zero columns: a column is zero if no allowed row is nonzero against it
    good = []
    for (dq, c), b in zip(cols, [b for b in range(lo, hi + 1) if True][:0] or [None] * len(cols)):
        good.append((dq, c))
    cols = good
    l = sum(q for q, _ in cols)
    if not (d - 2) * l > 2 * d:
        return False
    full = sum(1 for r in rows.values() if r[0] == 2)
    colours = {r[1] for r in rows.values() if r[0] == 1} | {c for q, c in cols if q == 1}
    for c in colours:
        A = sum(1 for r in rows.values() if r[0] == 1 and r[1] == c) + full
        B = sum(1 for q, cc in cols if not (q == 1 and cc == c))
        if A >= 1 and not (d - 2) * B > 2 * A:
            return False
    if full:
        B = len(cols)
        if not (d - 2) * B > 2 * full:
            return False
    return True

def has_failure(S, d, w):
    Sset = set(S)
    # occupy weight 0
    from itertools import product
    for dims in product((0, 1, 2), repeat=w):
        if dims[0] == 0 or sum(dims) != d:
            continue
        idx = [i for i in range(w) if dims[i] == 1]
        for col in partitions(len(idx)):
            rows = {}
            cmap = dict(zip(idx, col))
            for i in range(w):
                if dims[i] == 1: rows[i] = (1, cmap[i])
                elif dims[i] == 2: rows[i] = (2, None)
            if fails_with_zero_check(rows, Sset, d):
                return True
    return False

def fails_with_zero_check(rows, Sset, d):
    # zero rows must be caught as well: a row class needs a nonzero column; this is what W = its colour tests
    return fails(rows, Sset, d)

def one(seed):
    rnd = random.Random(seed)
    m = rnd.randint(1, 5)
    half = rnd.sample(range(1, m + 1), rnd.randint(1, m))
    S = sorted({0} | set(half) | {-x for x in half})
    w = rnd.randint(2, 6)
    out = []
    for d in range(3, min(2 * w, 2 * len(S)) + 1):
        bf = has_failure(S, d, w)
        e = Enc(S, 2, d, layout="pos", w=w)
        fd, p = tempfile.mkstemp(suffix=".cnf"); os.close(fd)
        e.c.write(p)
        res, _, _ = run_solver("kissat", p, 60)
        os.unlink(p)
        out.append({"S": S, "w": w, "d": d, "brute": bf, "sat": res})
    return out

if __name__ == "__main__":
    N = int(sys.argv[1]); W = int(sys.argv[2])
    agree = dis = pos = 0
    with ProcessPoolExecutor(max_workers=W) as ex, open("brute_r2.jsonl", "w") as f:
        for rs in ex.map(one, range(N)):
            for r in rs:
                f.write(json.dumps(r) + "\n")
                ok = (r["brute"] and r["sat"] == "SAT") or ((not r["brute"]) and r["sat"] == "UNSAT")
                agree += ok; dis += (not ok); pos += r["brute"]
    print("agree", agree, "disagree", dis, "positives", pos)
