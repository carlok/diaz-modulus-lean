#!/usr/bin/env python3
"""Soundness test of the full pipeline options: genuine failures (found by random construction and classified by V1, no solver),
normalised by hand (gap compression of 3.5, reflection), scaled by k, then injected in both layouts with gap rule and reflection ON.
Every genuine failure must give SAT."""
import json, os, random, sys, tempfile
from fractions import Fraction as Fr
from concurrent.futures import ProcessPoolExecutor
from encode import Enc
from verify_exact import verify, nullspace, rank_q, span_key
from solve import run_solver
from test_inject import gen, as_matrix

def normalise(rows, cols, m, S):
    # compress union gaps above m (the gap rule, note Section 8.1)
    keys = sorted(set(rows) | set(cols))
    mp = {}; cur = 0
    for i, k in enumerate(keys):
        if i: cur += min(k - keys[i - 1], m)
        mp[k] = cur
    rows = {mp[k]: v for k, v in rows.items()}
    cols = {mp[k]: v for k, v in cols.items()}
    # translate so that the first row is at 0
    a0 = min(rows)
    rows = {k - a0: v for k, v in rows.items()}
    cols = {k - a0: v for k, v in cols.items()}
    # reflection: first row class dim <= last row class dim
    top = max(rows)
    if len(rows[0]) > len(rows[top]):
        rows = {top - k: v for k, v in rows.items()}
        cols = {top - k: v for k, v in cols.items()}
    return rows, cols

def units(e, rows, cols, slot):
    flat = {}
    rr = sorted(rows); cc = sorted(cols)
    if slot:
        for i, r in enumerate(e.rows):
            flat[r["G"].idx] = rows[rr[i]] if i < len(rr) else []
        for j, q in enumerate(e.cols):
            Q = cols[cc[j]] if j < len(cc) else []
            flat[q["F"].idx] = nullspace(Q, 3) if Q else [[Fr(int(a == b)) for b in range(3)] for a in range(3)]
    else:
        for r in e.rows:
            flat[r["G"].idx] = rows.get(r["w"], [])
        for q in e.cols:
            Q = cols.get(q["w"], [])
            flat[q["F"].idx] = nullspace(Q, 3) if Q else [[Fr(int(a == b)) for b in range(3)] for a in range(3)]
    keys = {i: span_key(f, 3) for i, f in flat.items()}
    U = []
    for o in e.objs:
        U.append([o.dim[len(keys[o.idx])]])
    def sub(a, b):
        return rank_q([list(v) for v in keys[a]] + [list(v) for v in keys[b]], 3) == len(keys[b])
    for (a, b), v in e.EP.items(): U.append([v if keys[a] == keys[b] and len(keys[a]) == 1 else -v])
    for (a, b), v in e.EL.items(): U.append([v if keys[a] == keys[b] and len(keys[a]) == 2 else -v])
    for (p, l), v in e.I.items(): U.append([v if len(keys[p]) == 1 and len(keys[l]) == 2 and sub(p, l) else -v])
    if slot:
        for i, r in enumerate(e.rows):
            if i < len(rr):
                for x, lit in r["ord"].items(): U.append([lit if rr[i] >= x else -lit])
        for j, q in enumerate(e.cols):
            if j < len(cc):
                for x, lit in q["ord"].items(): U.append([lit if cc[j] >= x else -lit])
    return U

def one(seed):
    rnd = random.Random(seed)
    base = rnd.choice([[-2, -1, 0, 1, 2], [-2, -1, 0, 1, 2], [-3, -2, -1, 0, 1, 2, 3]])
    k = rnd.choice([1, 1, 2, 3, 5])
    wr = rnd.randint(2, 5)
    rows, cols = gen(rnd, base, wr)
    if not cols: return None
    # keep the rank-3 failures
    m0 = as_matrix(base, rows, cols)
    if m0["d"] < 4 or m0["l"] < 4: return None
    v = verify(m0)
    if v["rank"] != 3 or v["v1"] != "fail": return None
    if m0["l"] > 3 * len(base) or m0["d"] > 3 * len(base): return None
    rows, cols = normalise(rows, cols, max(base), base)
    # scale
    S = [k * s for s in base]
    rows = {k * a: x for a, x in rows.items()}
    cols = {k * a: x for a, x in cols.items()}
    m1 = as_matrix(S, rows, cols)
    v1 = verify(m1)
    assert v1["v1"] == "fail" and v1["membership"]
    w = max(rows) + 1 + rnd.choice([0, 1, 7])
    out = {"seed": seed, "k": k, "base": max(base), "d": m1["d"], "l": m1["l"], "w": w}
    for lay in ("pos", "slot"):
        if lay == "pos":
            if k > 2 or w > 14: continue
            e = Enc(S, 3, m1["d"], layout="pos", w=w)
        else:
            e = Enc(S, 3, m1["d"], layout="slot", w=w, Nr=min(m1["d"], w), Nc=3 * len(base))
        for u in units(e, rows, cols, lay == "slot"): e.c.add(*u)
        fd, path = tempfile.mkstemp(suffix=".cnf"); os.close(fd)
        e.c.write(path)
        res, dt, _ = run_solver("kissat", path, 120)
        os.unlink(path)
        out[lay] = res
    return out

if __name__ == "__main__":
    N = int(sys.argv[1]); W = int(sys.argv[2])
    tally = {}
    with ProcessPoolExecutor(max_workers=W) as ex, open("inject2.jsonl", "w") as f:
        for r in ex.map(one, range(1000, 1000 + N)):
            if r is None: continue
            f.write(json.dumps(r) + "\n")
            for lay in ("pos", "slot"):
                if lay in r:
                    tally[(lay, r[lay])] = tally.get((lay, r[lay]), 0) + 1
    print(tally)
