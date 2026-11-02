#!/usr/bin/env python3
"""Referee C: own exhaustive scan.  Usage: c2_scan.py d [tuple-limit]
For each sorted row-weight tuple (consecutive gaps <= 7, at most one repeated weight),
each abstract simple rank-3 matroid (linear space) on d labelled rows:
  N^max: Q_b = Ann(Z_b), Z_b = rows with a_i+b not in S.  l = sum (3 - r(Z_b)).
Necessary for a failing stable N of rank 3 with d<=l:
  N^max has l >= l_min(d), and (d-3)*theta_up > 3 where theta_up = min over row subsets R
  of (l - c(R))/|R|, c(R) = sum_b (3 - r(Z_b u R)).
Sound for 'no hit': theta_up >= theta(N^max) >= theta(N).
A separate count ignores repeated-weight tuples to expose how many of them survive the l test.
"""
import sys, itertools as it, time
from fractions import Fraction as Fr
import numpy as np

def linear_spaces(n):
    """All sets of long lines (size>=3 subsets, pairwise meeting in <=1 point), rank 3."""
    pts = range(n)
    cand = [frozenset(c) for s in range(3, n) for c in it.combinations(pts, s)]
    res = []
    def rec(i, cur):
        res.append(list(cur))
        for k in range(i, len(cand)):
            c = cand[k]
            if all(len(c & x) <= 1 for x in cur):
                cur.append(c)
                rec(k + 1, cur)
                cur.pop()
    rec(0, [])
    return res

def rank_table(n, lines):
    """rank of every subset mask of the linear space (all pairs not on a long line are 2-point lines)."""
    N = 1 << n
    r = np.zeros(N, dtype=np.int8)
    masks = [sum(1 << i for i in l) for l in lines]
    pc = [bin(m).count("1") for m in range(N)]
    # a subset has rank <=2 iff it is contained in a line
    for m in range(N):
        if pc[m] <= 2:
            r[m] = pc[m]
        else:
            r[m] = 2 if any((m & ~L) == 0 for L in masks) else 3
    return r

def main():
    d = int(sys.argv[1])
    S = sys.argv[2] if len(sys.argv) > 2 else "in0"
    sets = {"in0": [-4, -1, 0, 1, 3], "inf": [-3, -1, 0, 1, 4], "S": [-4, -1, 0, 1, 4]}
    Sset = set(sets[S])
    lmin = 3
    while (d - 3) * (lmin - 3) <= 9 or lmin < d:
        lmin += 1
    t0 = time.time()
    LS = linear_spaces(d)
    print(f"d={d} S={S} l_min={lmin}, labelled linear spaces {len(LS)}", flush=True)
    Rtab = np.stack([rank_table(d, l) for l in LS])  # shape (nLS, 2^d)
    spread = max(Sset) - min(Sset)
    pass
    gaps_iter = it.product(range(0, spread + 1), repeat=d - 1)
    ntup = 0
    nsurv = {0: 0, 1: 0}
    hits = []
    kills_dagger = [0]
    allsub = list(range(1, 1 << d))
    pc = np.array([bin(m).count("1") for m in range(1 << d)])
    tups = {0: 0, 1: 0}
    for gaps in gaps_iter:
        rep = sum(1 for g in gaps if g == 0)
        if rep > 1:
            continue
        ntup += 1
        tups[rep] += 1
        a = [0]
        for g in gaps:
            a.append(a[-1] + g)
        bvals = sorted({s - x for s in Sset for x in a})
        Zm = []
        for b in bvals:
            m = 0
            for i, x in enumerate(a):
                if x + b not in Sset:
                    m |= 1 << i
            Zm.append(m)
        Zm = np.array(Zm)
        dims = 3 - Rtab[:, Zm].astype(int)  # (nLS, nb)
        ls = dims.sum(axis=1)
        good = np.nonzero(ls >= lmin)[0]
        nsurv[rep] += len(good)
        for g in good:
            r = Rtab[g]
            l = int(ls[g])
            # theta_up over all row subsets
            ok = True
            if rep == 1:
                # (dagger) test at a row k lying on the line L of the repeated pair: non-coordinate row subset
                i0 = gaps.index(0)
                pair = (1 << i0) | (1 << (i0 + 1))
                for k in range(d):
                    if not (pair >> k) & 1 and r[pair | (1 << k)] == 2:
                        c = int((3 - r[Zm | (1 << k)]).sum())
                        if (d - 3) * Fr(l - c, 2) <= 3:
                            ok = False
                            kills_dagger[0] += 1
                            break
                if ok:
                    # the rows of the class may be taken generic on L, then they lie on no other long line
                    pass
            for R in allsub:
                if not ok:
                    break
                c = int((3 - r[Zm | R]).sum())
                if c == 0 and pc[R] < d:
                    # still a valid bound
                    pass
                ratio = Fr(l - c, int(pc[R]))
                if (d - 3) * ratio <= 3:
                    ok = False
                    break
            if ok:
                hits.append((a, [sorted(x) for x in LS[g]], l, [(int(b), int(dd)) for b, dd in zip(bvals, dims[g]) if dd]))
    print("tuples", ntup, tups, "matroid/tuple pairs surviving l>=l_min, by #repeats:", nsurv)
    print("killed by dagger test at a row on L:", kills_dagger[0])
    print("hits", len(hits))
    for h in hits[:40]:
        print(h)
    print("time", round(time.time() - t0, 1))

main()
