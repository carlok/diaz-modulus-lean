#!/usr/bin/env python3
"""The finite facts quoted in Sections 5 and 6 of the note tex/diaz-roy-rank-three.tex. 1 core, seconds. Exact integers.

For a finite S in Z, c(delta) = |S cap (S+delta)|, Bud(A) = sum over pairs of A of c(a-a').
  B_k     = max Bud(A) over k-element sets of integers (one sheet, no free entries).
  Bfree_k = max over partitions of k rows into sheets of
            sum of B over the parts + number of pairs in different parts,
            because two rows in different sheets share at most one column (Lemma 6.1).
  Then the weight check for the (5,8) configuration, and the numerical inequalities of
  Theorem 3 for each case, recomputed rather than quoted.
"""
import itertools
import sys
from math import comb


def analyse(S, label):
    SS = set(S)
    span = max(S) - min(S)

    def c(delta):
        return sum(1 for s in S if s - delta in SS) if delta else 0

    print(f"\n=== {label}: S = {sorted(S)}")
    print("c(1..span+1) =", [c(x) for x in range(1, span + 2)])
    D = {x for x in range(1, span + 1) if c(x) == 2}
    print("D =", sorted(D), " (P) =", all(c(x) <= 2 for x in range(1, span + 1)))

    # B_k by exhaustive enumeration of sorted gaps 1..span (larger gap: no pair across, a split).
    B = {1: 0}
    for k in range(2, 8):
        m = -1
        for gaps in itertools.product(range(1, span + 1), repeat=k - 1):
            A = [0]
            for g in gaps:
                A.append(A[-1] + g)
            m = max(m, sum(c(x - y) for x, y in itertools.combinations(A, 2)))
        for i in range(1, k):
            m = max(m, B[i] + B[k - i])
        B[k] = m

    # Bfree_k by DP on the partition into sheets.
    def partitions(n, maxp=None):
        maxp = maxp or n
        if n == 0:
            yield ()
            return
        for p in range(min(n, maxp), 0, -1):
            for rest in partitions(n - p, p):
                yield (p,) + rest

    Bf = {}
    for k in range(1, 8):
        best, arg = -1, None
        for part in partitions(k):
            v = sum(B[p] for p in part) + (comb(k, 2) - sum(comb(p, 2) for p in part))
            if v > best:
                best, arg = v, part
        Bf[k] = best
        print(f"B_{k} = {B[k]}   Bfree_{k} = {Bf[k]}  (best sheet sizes {arg})")

    # The inequalities of Theorem 3, with Bud replaced by Bfree. All must print True.
    def alpha(d):
        return min(comb(d - r, 2) + comb(r, 2) for r in range(d + 1))

    checks = {
        "d=5, eta=0: 3l-2c3 at l=9, c3=4 exceeds budget": 3 * 9 - 8 > Bf[5],
        "d=5, eta=0: l=8 forces c3>=3": 3 * 8 - 2 * 2 > Bf[5],
        "d=5, eta=0: c3=3 leaves exact equality at most": 3 * 8 - 2 * 3 >= Bf[5],
        "d=6 pure, l=7": alpha(6) * 7 > Bf[6] + comb(6, 2),
        "d=7 pure, l=7": alpha(7) * 7 > Bf[7] + comb(7, 2),
        "d=6 eta=0 eps=1, l=7": alpha(6) * 5 > Bf[6],
        "d=7 eta=0 eps=1, l=7": alpha(7) * 5 > Bf[7],
        "d=6 eta=1 eps=0 L col": alpha(5) * 6 > Bf[5],
        "d=6 eta=1 eps=0 no L": alpha(5) * 7 - comb(4, 2) > Bf[5],
        "d=7 eta=1 eps=0 L col": alpha(6) * 6 > Bf[6],
        "d=7 eta=1 eps=0 no L": alpha(6) * 7 - comb(5, 2) > Bf[6],
        "d=8 eta=1 eps=0 L col": alpha(7) * 7 > Bf[7],
        "d=8 eta=1 eps=0 no L": alpha(7) * 8 - comb(6, 2) > Bf[7],
        "d=6 eta=1 eps=1 L col": alpha(5) * 4 + comb(4, 2) > Bf[5],
        "d=6 eta=1 eps=1 no L": alpha(5) * 5 > Bf[5],
        "d=7 eta=1 eps=1 L col": alpha(6) * 4 + comb(5, 2) > Bf[6],
        "d=7 eta=1 eps=1 no L": alpha(6) * 5 > Bf[6],
        "d=8 eta=1 eps=1 L col": alpha(7) * 5 + comb(6, 2) > Bf[7],
        "d=8 eta=1 eps=1 no L": alpha(7) * 6 > Bf[7],
    }
    for name, val in checks.items():
        print(f"  {val}  {name}")
    print("  all hold:", all(checks.values()))
    print("  alpha(5..8) =", [alpha(x) for x in range(5, 9)])

    # (5,8) configuration: rows a0..a4, columns b1..b8, all distinct, one sheet.
    def col_choices(rows):
        res = set(s - rows[0] for s in S)
        for a in rows[1:]:
            res &= set(s - a for s in S)
        return res

    sols, tested = [], 0
    R = range(-span, span + 1)
    for a1, a2, a3, a4 in itertools.product(R, repeat=4):
        if len({0, a1, a2, a3, a4}) < 5:
            continue
        if not all(abs(x) in D for x in (a1, a2, a3, a4, a1 - a2, a3 - a4)):
            continue
        tested += 1
        b12, b34 = col_choices([a3, a4]), col_choices([a1, a2])
        b5, b6 = col_choices([0, a2, a4]), col_choices([0, a2, a3])
        b7, b8 = col_choices([0, a1, a4]), col_choices([0, a1, a3])
        if len(b12) < 2 or len(b34) < 2 or not (b5 and b6 and b7 and b8):
            continue
        for t in itertools.product(b5, b6, b7, b8):
            if len(set(t)) < 4:
                continue
            for u in itertools.combinations(sorted(b12), 2):
                for v in itertools.combinations(sorted(b34), 2):
                    if len(set(t) | set(u) | set(v)) == 8:
                        sols.append(((0, a1, a2, a3, a4), t, u, v))
    print(f"(5,8) configuration: row tuples tested = {tested}, weight assignments = {len(sols)}")
    if tested:
        print("  D-cliques of size 4 (first element 0):",
              [A for A in ([0, x, x + y, x + y + z] for x, y, z in itertools.product(sorted(D), repeat=3))
               if all(abs(p - q) in D for p, q in itertools.combinations(A, 2))])


analyse((-4, -1, 0, 1, 4), "S4, the hull of u^4")
analyse((-1, 0, 1), "S1, the certificate space (generic model)")
analyse((-4, -1, 0, 1, 3), "initial form of the hull of u^4 + c u^3")
sys.stdout.flush()
