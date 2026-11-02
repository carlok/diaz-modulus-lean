#!/usr/bin/env python3
"""Referee C: gauge-free, grade-free arc test.  N(t) = M0 + sum_{n>=1} t^n N_n, ALL 200 coordinates unknown
(negative grades included), V_t = span(1,T,1/T,T^3+a t T^4,T^-4+b t T^-3).  Order by order, mod p, sampled at many T:
Schur complement on a pivot block must vanish.  At each order a RANDOM solution is taken (so random gauge, including
random negative-grade parts).  Records the first order at which the linear system is inconsistent."""
import random, sys
import numpy as np
p = 2147483647
IN0 = [-4, -1, 0, 1, 3]
rows_a = [0, 1, 2, 3, 4]
bs = [-5, -4, -3, -2, -1, -1, 0, 1]
C = [[0, 1, 0, 0, -1, 0, -1, -1], [1, 0, 0, 1, 0, 1, 1, 0], [0, 0, 1, -1, 1, 0, 0, 1], [0, 1, 1, -1, 0, 0, -1, 0], [1, 1, 1, 0, 0, 1, 0, 0]]
d, l = 5, 8
NE = 5

def inv(x):
    return pow(int(x) % p, p - 2, p)

def matinv(A):
    n = len(A)
    M = [list(map(int, A[i])) + [1 if i == j else 0 for j in range(n)] for i in range(n)]
    for c in range(n):
        pv = next(i for i in range(c, n) if M[i][c] % p)
        M[c], M[pv] = M[pv], M[c]
        iv = inv(M[c][c])
        M[c] = [x * iv % p for x in M[c]]
        for i in range(n):
            if i != c and M[i][c]:
                f = M[i][c]
                M[i] = [(x - f * y) % p for x, y in zip(M[i], M[c])]
    return [r[n:] for r in M]

def mm(A, B):
    return [[sum(a * b for a, b in zip(r, col)) % p for col in zip(*B)] for r in A]

def run(a, b, order, seed, nT=70):
    rnd = random.Random(seed)
    # pivot: rows 0,1,2 and columns chosen at random so that block is invertible generically
    while True:
        I = [0, 1, 2]
        I = rnd.sample(range(5), 3)
        J = rnd.sample(range(8), 3)
        Cb = np.array(C)[np.ix_(I, J)]
        if round(np.linalg.det(Cb)) != 0:
            break
    Ic = [i for i in range(5) if i not in I]
    Jc = [j for j in range(8) if j not in J]
    Ts = [rnd.randrange(2, p - 1) for _ in range(nT)]
    # N[n][e][i][j]: n=0..order
    N = [[[[0] * l for _ in range(d)] for _ in range(NE)] for _ in range(order + 1)]
    for e, o in enumerate(IN0):
        for i in range(d):
            for j in range(l):
                if rows_a[i] + bs[j] == o:
                    N[0][e][i][j] = C[i][j]
    # sample values of v_e^{(t)}(T) as polys in t: v_e = v0 + t v1
    vals = []
    for T in Ts:
        Ti = inv(T)
        v0 = [pow(Ti, 4, p), Ti, 1, T, pow(T, 3, p)]
        v1 = [b * pow(Ti, 3, p) % p, 0, 0, 0, a * pow(T, 4, p) % p]
        vals.append((v0, v1))

    def Mseries(T_idx, upto):
        v0, v1 = vals[T_idx]
        out = [[[0] * l for _ in range(d)] for _ in range(upto + 1)]
        for n in range(upto + 1):
            for e in range(NE):
                Nn = N[n][e]
                for i in range(d):
                    for j in range(l):
                        x = Nn[i][j]
                        if x:
                            out[n][i][j] = (out[n][i][j] + x * v0[e]) % p
                            if n + 1 <= upto:
                                out[n + 1][i][j] = (out[n + 1][i][j] + x * v1[e]) % p
        return out

    results = []
    for n in range(1, order + 1):
        # build linear system: L0 (sum v0_e dN_e) R0 = -rho_n, plus the known t-expansion including N_{<n}
        eqs = []
        rhs = []
        for ti in range(nT):
            ser = Mseries(ti, n)  # N_n currently zero
            # Series Schur complement  S = D - C A^-1 B  truncated at t^n
            A = [[[ser[k][i][j] for j in J] for i in I] for k in range(n + 1)]
            B = [[[ser[k][i][j] for j in Jc] for i in I] for k in range(n + 1)]
            Cc = [[[ser[k][i][j] for j in J] for i in Ic] for k in range(n + 1)]
            D = [[[ser[k][i][j] for j in Jc] for i in Ic] for k in range(n + 1)]
            A0i = matinv(A[0])
            # Ainv series
            Ainv = [A0i]
            for k in range(1, n + 1):
                acc = [[0] * 3 for _ in range(3)]
                for m in range(1, k + 1):
                    pr = mm(A[m], Ainv[k - m])
                    acc = [[(x + y) % p for x, y in zip(r1, r2)] for r1, r2 in zip(acc, pr)]
                Ainv.append([[(-x) % p for x in r] for r in mm(A0i, acc)])
            # S_n
            Sn = [row[:] for row in D[n]]
            for k1 in range(n + 1):
                for k2 in range(n + 1 - k1):
                    k3 = n - k1 - k2
                    pr = mm(mm(Cc[k1], Ainv[k2]), B[k3])
                    Sn = [[(x - y) % p for x, y in zip(r1, r2)] for r1, r2 in zip(Sn, pr)]
            # L0, R0
            L0 = mm(Cc[0], A0i)  # rows Ic: -L0 on I, identity on Ic
            R0 = mm(A0i, B[0])  # cols Jc: -R0 on J, identity on Jc
            v0 = vals[ti][0]
            for ii, ic in enumerate(Ic):
                for jj, jc in enumerate(Jc):
                    Lvec = [0] * d
                    Lvec[ic] = 1
                    for q, iq in enumerate(I):
                        Lvec[iq] = (-L0[ii][q]) % p
                    Rvec = [0] * l
                    Rvec[jc] = 1
                    for q, jq in enumerate(J):
                        Rvec[jq] = (-R0[q][jj]) % p
                    eq = np.zeros(200, dtype=np.int64)
                    for e in range(NE):
                        for i in range(d):
                            if Lvec[i]:
                                for j in range(l):
                                    if Rvec[j]:
                                        eq[e * 40 + i * 8 + j] = Lvec[i] * Rvec[j] % p * v0[e] % p
                    eqs.append(eq)
                    rhs.append((-Sn[ii][jj]) % p)
        Mx = np.array(eqs, dtype=object)
        Rh = list(rhs)
        # elimination mod p on augmented
        Aug = [list(map(int, r)) + [int(x)] for r, x in zip(eqs, Rh)]
        piv_cols = []
        rk = 0
        for c in range(200):
            pv = None
            for i in range(rk, len(Aug)):
                if Aug[i][c] % p:
                    pv = i
                    break
            if pv is None:
                continue
            Aug[rk], Aug[pv] = Aug[pv], Aug[rk]
            iv = inv(Aug[rk][c])
            Aug[rk] = [x * iv % p for x in Aug[rk]]
            arr = np.array(Aug[rk], dtype=np.int64)
            for i in range(len(Aug)):
                if i != rk and Aug[i][c]:
                    f = Aug[i][c]
                    Aug[i] = list(map(int, (np.array(Aug[i], dtype=np.int64) - f * arr % p) % p))
            piv_cols.append(c)
            rk += 1
        consistent = all(Aug[i][200] % p == 0 for i in range(rk, len(Aug)))
        results.append((n, rk, consistent))
        if not consistent:
            break
        # random solution
        free = [c for c in range(200) if c not in piv_cols]
        sol = [0] * 200
        for c in free:
            sol[c] = rnd.randrange(p)
        for r_i, c in enumerate(piv_cols):
            s = Aug[r_i][200]
            row = Aug[r_i]
            for f in free:
                if row[f]:
                    s = (s - row[f] * sol[f]) % p
            sol[c] = s
        for e in range(NE):
            for i in range(d):
                for j in range(l):
                    N[n][e][i][j] = sol[e * 40 + i * 8 + j]
    return results

if __name__ == "__main__":
    for (a, b, seed) in [(0, 0, 1), (0, 7, 2), (0, 123456, 3), (1, 0, 4), (5, 0, 5), (3, 11, 6), (987654, 321, 7), (1, 1, 8)]:
        print("a,b,seed", a, b, seed, run(a, b, 4 if a == 0 else 4, seed), flush=True)
