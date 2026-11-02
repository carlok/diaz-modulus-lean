#!/usr/bin/env python3
"""Soundness of the x-part of the encoder: random matrices with x-terms, built by hand from flats (no solver), certified by V2
and by exact rank; their exact data are fixed by unit clauses in the x-encoder, which must then answer SAT.
Run under uv with sympy."""
import json, os, random, sys, tempfile
from fractions import Fraction as Fr
from concurrent.futures import ProcessPoolExecutor
from encode import Enc
from verify_exact import verify, nullspace, rank_q, span_key
from solve import run_solver

def rv(rnd, n=3): return [Fr(rnd.randint(-5, 5)) for _ in range(n)]
def idm(n=3): return [[Fr(int(i == j)) for j in range(n)] for i in range(n)]
def key(B): return span_key(B, 3)
def B_(k): return [list(v) for v in k]
def join(*fs):
    acc = []
    for f in fs: acc += f
    return B_(key(acc)) if acc else []
def combo(rnd, basis):
    out = [Fr(0)] * 3
    for b in basis:
        c = Fr(rnd.randint(-7, 7))
        out = [x + c * y for x, y in zip(out, b)]
    return out

def gen(rnd, S, Sx, wr):
    Sset, Sxs = set(S), set(Sx)
    m = max(S)
    pts = [rv(rnd) for _ in range(rnd.randint(2, 4))]
    pts = [p for p in pts if any(p)] or [[Fr(1), Fr(0), Fr(0)]]
    pool = [[p] for p in pts]
    for _ in range(3):
        a, b = rnd.choice(pts), rnd.choice(pts)
        if rank_q([a, b], 3) == 2: pool.append([a, b])
    pool.append(idm())
    rows = {}
    for a in range(wr):
        if a and rnd.random() > 0.8: continue
        G = join(rnd.choice(pool))
        if rnd.random() < 0.5:
            E = []
        else:
            # E inside G
            E = join(rnd.choice([G, [combo(rnd, G)]]))
            if not any(any(v) for v in E): E = []
        if E:
            need = max(1, len(G) - len(E))
            mass = rnd.randint(need, need + 3)
        else:
            mass = len(G)
        rows[a] = dict(G=G, E=E, mass=mass)
    cols = {}
    for bp in range(-m, wr + m):
        reqF, reqH = [], []
        for a, r in rows.items():
            s = a - bp
            if s not in Sset:
                reqF += r["G"]
            elif s in Sxs:
                reqH += r["E"]
            else:
                reqF += r["E"]; reqH += r["G"]
        F = join(reqF)
        if len(F) == 3: continue
        H = join(F, reqH)
        gp = 3 - len(F); ep = 3 - len(H)
        if ep == 0 or rnd.random() < 0.4:
            H = idm() if ep == 0 or True else H
            mass = gp
        else:
            mass = rnd.randint(max(1, gp - ep), max(1, gp - ep) + 2)
        cols[bp] = dict(F=F, H=H, mass=mass)
    return rows, cols

def matrix(rows, cols, S, Sx, rnd):
    a, X, bp, Y = [], [], [], []
    mx = 6
    for w, r in sorted(rows.items()):
        if not r["E"]:
            for v in r["G"]:
                a.append(w); X.append({None: v})
        else:
            for t in range(r["mass"]):
                row = {None: combo(rnd, r["G"])}
                if t < len(r["G"]): row[None] = [p + 11 * q for p, q in zip(row[None], r["G"][t])]
                for k in range(mx): row[k] = combo(rnd, r["E"])
                a.append(w); X.append(row)
    for w, q in sorted(cols.items()):
        Gp = nullspace(q["F"], 3) if q["F"] else idm()
        Ep = nullspace(q["H"], 3) if len(q["H"]) < 3 else []
        if q["H"] and len(q["H"]) == 3 or not Ep:
            for v in Gp:
                bp.append(w); Y.append({None: v})
        else:
            for t in range(q["mass"]):
                col = {None: combo(rnd, Gp)}
                if t < len(Gp): col[None] = [p + 11 * u for p, u in zip(col[None], Gp[t])]
                for k in range(mx): col[k] = combo(rnd, Ep)
                bp.append(w); Y.append(col)
    M = []
    for i in range(len(a)):
        row = []
        for j in range(len(bp)):
            t = a[i] - bp[j]
            terms = {}
            for k1, u in X[i].items():
                for k2, v in Y[j].items():
                    c = sum(p * q for p, q in zip(u, v))
                    if c == 0: continue
                    if k1 is not None and k2 is not None: return None
                    k = k1 if k1 is not None else k2
                    terms[k] = terms.get(k, Fr(0)) + c
            row.append([{"c": str(c), "t": t, "x": k} for k, c in terms.items() if c != 0])
        M.append(row)
    return {"S": S, "Sx": Sx, "d": len(a), "l": len(bp), "a": a, "b": [-x for x in bp], "M": M}

def units(e, rows, cols):
    flat, mass = {}, []
    for r in e.rows:
        R = rows.get(r["w"], dict(G=[], E=[], mass=0))
        flat[r["G"].idx] = R["G"]; flat[r["E"].idx] = R["E"]
        mass.append((r["ge"], R["mass"]))
    for q in e.cols:
        Q = cols.get(q["w"])
        if Q is None:
            flat[q["F"].idx] = idm(); flat[q["H"].idx] = idm(); mass.append((q["ge"], 0))
        else:
            flat[q["F"].idx] = Q["F"]; flat[q["H"].idx] = Q["H"]; mass.append((q["ge"], Q["mass"]))
    keys = {i: key(f) if f else () for i, f in flat.items()}
    U = []
    for o in e.objs: U.append([o.dim[len(keys[o.idx])]])
    def sub(a, b): return rank_q(B_(keys[a]) + B_(keys[b]), 3) == len(keys[b])
    for (a, b), v in e.EP.items(): U.append([v if keys[a] == keys[b] and len(keys[a]) == 1 else -v])
    for (a, b), v in e.EL.items(): U.append([v if keys[a] == keys[b] and len(keys[a]) == 2 else -v])
    for (p, l), v in e.I.items(): U.append([v if len(keys[p]) == 1 and len(keys[l]) == 2 and sub(p, l) else -v])
    for ge, m in mass:
        for k in range(1, len(ge)):
            U.append([ge[k] if m >= k else -ge[k]])
    return U

def one(seed):
    rnd = random.Random(seed)
    S = rnd.choice([[-1, 0, 1], [-2, -1, 0, 1, 2]])
    Sx = rnd.choice([[0], [-1, 0, 1], [0, 1, -1]])
    wr = rnd.randint(1, 4)
    rows, cols = gen(rnd, S, Sx, wr)
    if not rows or not cols: return None
    m = matrix(rows, cols, S, Sx, rnd)
    if m is None or m["d"] < 4 or m["l"] < 4 or m["l"] > 40: return None
    v = verify(m)
    if not v["genuine_failure"] or v["rank"] != 3: return {"seed": seed, "cls": "not_failure"}
    d = m["d"]
    dcap = max([r["mass"] for r in rows.values()] + [3]); lcap = max([q["mass"] for q in cols.values()] + [3])
    e = Enc(S, 3, d, layout="pos", w=wr, xmode="rc", Sx=Sx, dcap=dcap, lcap=lcap, Lmax=60, reflect=False)
    for u in units(e, rows, cols): e.c.add(*u)
    fd, p = tempfile.mkstemp(suffix=".cnf"); os.close(fd)
    e.c.write(p)
    res, dt, _ = run_solver("kissat", p, 120)
    os.unlink(p)
    return {"seed": seed, "S": S, "Sx": Sx, "d": d, "l": m["l"], "cls": "failure", "enc": res}

if __name__ == "__main__":
    N, W = int(sys.argv[1]), int(sys.argv[2])
    tally = {}
    with ProcessPoolExecutor(max_workers=W) as ex, open("inject_x.jsonl", "w") as f:
        for r in ex.map(one, range(N)):
            if r is None: continue
            f.write(json.dumps(r) + "\n")
            k = (r["cls"], r.get("enc"))
            tally[k] = tally.get(k, 0) + 1
    print(tally)
