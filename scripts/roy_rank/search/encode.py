#!/usr/bin/env python3
"""CNF encoder for the graded model and the graded structural model (the note, Section 8).

Modes:  layout='pos'  : one row class per weight 0..w-1, one column class per weight -m..w-1+m (m = max S)
        layout='slot' : Nr row and Nc column slots, each with an integer weight, increasing, in a window.
Column weights are b' = -b, so that a pair is allowed iff a - b' in S.
Flats: row class -> G (dim = row mass in the x-free case); column class -> F = perp(Q_b) (dim f = n - l_b, x-free).
With x's (xmode): row class also has E subset G (x-support); column class has H superset F, H = perp(x-support);
class masses become separate unary counters.
The encoding is a relaxation: every true configuration in scope satisfies it (the note, Section 8).
"""
import json, sys

TRUE = 10**9
FALSE = -TRUE


class CNF:
    def __init__(self):
        self.nv = 0
        self.cl = []

    def new(self):
        self.nv += 1
        return self.nv

    def add(self, *lits):
        out = []
        for x in lits:
            if x == TRUE:
                return
            if x == FALSE:
                continue
            out.append(x)
        self.cl.append(out)

    def write(self, path):
        with open(path, "w") as f:
            f.write(f"p cnf {self.nv} {len(self.cl)}\n")
            for c in self.cl:
                f.write(" ".join(map(str, c)) + " 0\n")


def neg(x):
    return -x


# ------------------------------------------------------------------ counters (tested in test_counters.py)
def counter_lb(c, inputs, cap):
    """Returns outs[1..k], k=min(len,cap): if at least j inputs are true then outs[j] is true.  outs[0] unused."""
    inputs = [x for x in inputs if x != FALSE]
    forced = sum(1 for x in inputs if x == TRUE)
    inputs = [x for x in inputs if x != TRUE]
    if forced:
        # keep it simple: constants are shifted by padding outs
        outs = counter_lb(c, inputs, cap)
        res = [None] + [TRUE] * min(forced, cap)
        for j in range(1, len(outs)):
            if len(res) <= cap:
                res.append(outs[j])
        return res
    if not inputs:
        return [None]
    if len(inputs) == 1:
        return [None, inputs[0]]
    mid = len(inputs) // 2
    L = counter_lb(c, inputs[:mid], cap)
    R = counter_lb(c, inputs[mid:], cap)
    k = min(len(L) - 1 + len(R) - 1, cap)
    O = [None] + [c.new() for _ in range(k)]
    for i in range(0, len(L)):
        for j in range(0, len(R)):
            t = min(i + j, k)
            if t == 0:
                continue
            cl = [O[t]]
            if i:
                cl.append(-L[i] if L[i] != TRUE else FALSE)
            if j:
                cl.append(-R[j] if R[j] != TRUE else FALSE)
            c.add(*cl)
    return O


def counter_ub(c, inputs, cap):
    """Returns outs[1..k]: if outs[j] is true then at least j inputs are true."""
    inputs = [x for x in inputs if x != FALSE]
    forced = sum(1 for x in inputs if x == TRUE)
    inputs = [x for x in inputs if x != TRUE]
    if forced:
        outs = counter_ub(c, inputs, cap)
        res = [None] + [TRUE] * min(forced, cap)
        for j in range(1, len(outs)):
            if len(res) <= cap:
                res.append(outs[j])
        return res
    if not inputs:
        return [None]
    if len(inputs) == 1:
        return [None, inputs[0]]
    mid = len(inputs) // 2
    L = counter_ub(c, inputs[:mid], cap)
    R = counter_ub(c, inputs[mid:], cap)
    k = min(len(L) - 1 + len(R) - 1, cap)
    O = [None] + [c.new() for _ in range(k)]
    # O[t] -> for all i+j = t-1 : L[i+1] or R[j+1]
    for t in range(1, k + 1):
        for i in range(0, t):
            j = t - 1 - i
            li = L[i + 1] if i + 1 < len(L) else FALSE
            rj = R[j + 1] if j + 1 < len(R) else FALSE
            c.add(-O[t], li, rj)
    return O


def out(O, j):
    if j <= 0:
        return TRUE
    return O[j] if j < len(O) else FALSE


# ------------------------------------------------------------------ flats and relations
class Flat:
    def __init__(self, enc, name, dimlits):
        self.enc = enc
        self.name = name
        self.dim = dimlits  # dimlits[k]: literal "dim == k", k=0..n, constants allowed
        self.idx = len(enc.objs)
        enc.objs.append(self)

    @property
    def pt(self):
        return self.dim[1]

    @property
    def ln(self):
        return self.dim[2] if self.enc.n == 3 else FALSE

    @property
    def full(self):
        return self.dim[self.enc.n]

    @property
    def empty(self):
        return self.dim[0]


class Enc:
    def __init__(self, S, n, d, layout="pos", w=6, Nr=None, Nc=None, xmode=None, Sx=None, dcap=1, lcap=1,
                 Lmax=None, meets="all", reflect=True, gaprule=True, row0=True, families=None, linear_space=True):
        self.S = sorted(S)
        self.Sset = set(S)
        self.Sx = set(Sx or [])
        self.n = n
        self.d = d
        self.layout = layout
        self.w = w
        self.c = CNF()
        self.objs = []
        self.m = max(abs(s) for s in S)
        self.xmode = xmode  # None or 'r','c','rc'
        self.dcap = dcap
        self.lcap = lcap
        self.Lmax = Lmax if Lmax is not None else n * len(S)
        self.meets = meets
        self.reflect = reflect
        self.gaprule = gaprule
        self.EP, self.EL, self.I = {}, {}, {}
        self.Wcount = 0
        self.linear_space = linear_space  # False drops the linear-space axiom (experiment only)
        self.families = families  # None = all; else subset of named W families (experiment only)
        if layout == "pos":
            self.Nr = w
            self.Nc = w + 2 * self.m
        else:
            self.Nr = Nr
            self.Nc = Nc
        self.build()

    # -------------- literal helpers
    def bool_and(self, lits):
        """fresh literal z with z <-> and(lits), constants folded."""
        lits = [x for x in lits if x != TRUE]
        if any(x == FALSE for x in lits):
            return FALSE
        if not lits:
            return TRUE
        if len(lits) == 1:
            return lits[0]
        z = self.c.new()
        for x in lits:
            self.c.add(-z, x)
        self.c.add(z, *[-x for x in lits])
        return z

    def kind_vars(self, name, allowed=None):
        c = self.c
        allowed = allowed if allowed is not None else list(range(self.n + 1))
        lits = {k: (c.new() if k in allowed else FALSE) for k in range(self.n + 1)}
        c.add(*[lits[k] for k in allowed])
        for k1 in allowed:
            for k2 in allowed:
                if k1 < k2:
                    c.add(-lits[k1], -lits[k2])
        return Flat(self, name, lits)

    # -------------- relations
    def ep(self, o, p):
        if o is p:
            return o.pt
        a, b = (o, p) if o.idx < p.idx else (p, o)
        if a.pt == FALSE or b.pt == FALSE:
            return FALSE
        return self.EP[(a.idx, b.idx)]

    def el(self, o, p):
        if self.n < 3:
            return FALSE
        if o is p:
            return o.ln
        a, b = (o, p) if o.idx < p.idx else (p, o)
        if a.ln == FALSE or b.ln == FALSE:
            return FALSE
        return self.EL[(a.idx, b.idx)]

    def inc(self, p, l):
        if self.n < 3 or p is l:
            return FALSE
        if p.pt == FALSE or l.ln == FALSE:
            return FALSE
        return self.I[(p.idx, l.idx)]

    def build_relations(self):
        c = self.c
        objs = self.objs
        N = len(objs)
        ptobjs = [o for o in objs if o.pt != FALSE]
        lnobjs = [o for o in objs if o.ln != FALSE] if self.n == 3 else []
        for x in range(len(ptobjs)):
            for y in range(x + 1, len(ptobjs)):
                a, b = ptobjs[x], ptobjs[y]
                v = c.new()
                self.EP[(a.idx, b.idx)] = v
                c.add(-v, a.pt)
                c.add(-v, b.pt)
        for x in range(len(lnobjs)):
            for y in range(x + 1, len(lnobjs)):
                a, b = lnobjs[x], lnobjs[y]
                v = c.new()
                self.EL[(a.idx, b.idx)] = v
                c.add(-v, a.ln)
                c.add(-v, b.ln)
        for p in ptobjs:
            for l in lnobjs:
                if p is l:
                    continue
                v = c.new()
                self.I[(p.idx, l.idx)] = v
                c.add(-v, p.pt)
                c.add(-v, l.ln)
        # transitivity
        for rel, lst in ((self.ep, ptobjs), (self.el, lnobjs)):
            for x in range(len(lst)):
                for y in range(x + 1, len(lst)):
                    for z in range(y + 1, len(lst)):
                        a, b, e = lst[x], lst[y], lst[z]
                        c.add(-rel(a, b), -rel(b, e), rel(a, e))
                        c.add(-rel(a, b), -rel(a, e), rel(b, e))
                        c.add(-rel(a, e), -rel(b, e), rel(a, b))
        # congruence
        for l in lnobjs:
            for x in range(len(ptobjs)):
                for y in range(x + 1, len(ptobjs)):
                    p, q = ptobjs[x], ptobjs[y]
                    if p is l or q is l:
                        continue
                    c.add(-self.ep(p, q), -self.inc(p, l), self.inc(q, l))
                    c.add(-self.ep(p, q), -self.inc(q, l), self.inc(p, l))
        for p in ptobjs:
            for x in range(len(lnobjs)):
                for y in range(x + 1, len(lnobjs)):
                    l, m = lnobjs[x], lnobjs[y]
                    if p is l or p is m:
                        continue
                    c.add(-self.el(l, m), -self.inc(p, l), self.inc(p, m))
                    c.add(-self.el(l, m), -self.inc(p, m), self.inc(p, l))
        # linear space axiom: two distinct points lie on at most one line
        for x in range(len(ptobjs) if self.linear_space else 0):
            for y in range(x + 1, len(ptobjs)):
                p, q = ptobjs[x], ptobjs[y]
                for u in range(len(lnobjs)):
                    for v in range(u + 1, len(lnobjs)):
                        l, m = lnobjs[u], lnobjs[v]
                        if p is l or p is m or q is l or q is m:
                            continue
                        c.add(-self.inc(p, l), -self.inc(q, l), -self.inc(p, m), -self.inc(q, m),
                              self.ep(p, q), self.el(l, m))

    def require_sub(self, o1, o2, guards):
        """guards -> flat o1 is contained in flat o2 (all literals in guards are antecedents)."""
        c = self.c
        n = self.n
        ng = [-g if g not in (TRUE, FALSE) else (FALSE if g == TRUE else TRUE) for g in guards]
        for k1 in range(1, n + 1):
            if o1.dim[k1] == FALSE:
                continue
            for k2 in range(0, n):
                if o2.dim[k2] == FALSE:
                    continue
                head = [-o1.dim[k1] if o1.dim[k1] != TRUE else FALSE, -o2.dim[k2] if o2.dim[k2] != TRUE else FALSE]
                if k1 > k2:
                    c.add(*ng, *head)
                elif k1 == 1 and k2 == 1:
                    c.add(*ng, *head, self.ep(o1, o2))
                elif k1 == 1 and k2 == 2:
                    c.add(*ng, *head, self.inc(o1, o2))
                elif k1 == 2 and k2 == 2:
                    c.add(*ng, *head, self.el(o1, o2))

    # -------------- classes
    def build_classes(self):
        n = self.n
        self.rows, self.cols = [], []
        for i in range(self.Nr):
            G = self.kind_vars(f"G{i}")
            E = None
            if self.xmode and "r" in self.xmode:
                E = self.kind_vars(f"E{i}")
            self.rows.append({"G": G, "E": E, "i": i})
        for j in range(self.Nc):
            F = self.kind_vars(f"F{j}")
            H = None
            if self.xmode and "c" in self.xmode:
                H = self.kind_vars(f"H{j}")
            self.cols.append({"F": F, "H": H, "j": j})
        self.build_relations()
        c = self.c
        # masses
        for r in self.rows:
            G, E = r["G"], r["E"]
            if E is None:
                r["ge"] = [TRUE] + [self.or_dim(G, k) for k in range(1, n + 1)]
            else:
                # unary mass d_a in 0..dcap; g=0 iff d=0; e=0 => d=g; e>=1 => d>=1 and g-e<=d<=dcap
                g = [TRUE] + [c.new() for _ in range(self.dcap)]
                for k in range(2, self.dcap + 1):
                    c.add(-g[k], g[k - 1])
                r["ge"] = g
                c.add(-g[1], -G.empty)
                c.add(g[1], G.empty)
                self.require_sub(E, G, [])
                for gv in range(0, n + 1):
                    for ev in range(0, gv + 1):
                        if ev == 0:
                            # e = 0: d == g
                            for k in range(1, self.dcap + 1):
                                if k <= gv:
                                    c.add(-G.dim[gv], -E.dim[0], g[k])
                                else:
                                    c.add(-G.dim[gv], -E.dim[0], -g[k])
                            if gv > self.dcap:
                                c.add(-G.dim[gv], -E.dim[0])
                        else:
                            need = max(1, gv - ev)
                            if need > self.dcap:
                                c.add(-G.dim[gv], -E.dim[ev])
                            else:
                                c.add(-G.dim[gv], -E.dim[ev], g[need])
        for q in self.cols:
            F, H = q["F"], q["H"]
            if H is None:
                q["ge"] = [TRUE] + [self.or_dim_le(F, n - k) for k in range(1, n + 1)]
            else:
                g = [TRUE] + [c.new() for _ in range(self.lcap)]
                for k in range(2, self.lcap + 1):
                    c.add(-g[k], g[k - 1])
                q["ge"] = g
                c.add(-g[1], -F.full)
                c.add(g[1], F.full)
                self.require_sub(F, H, [])
                for fv in range(0, n + 1):
                    gp = n - fv
                    for hv in range(fv, n + 1):
                        ep = n - hv
                        if ep == 0:
                            for k in range(1, self.lcap + 1):
                                if k <= gp:
                                    c.add(-F.dim[fv], -H.dim[hv], g[k])
                                else:
                                    c.add(-F.dim[fv], -H.dim[hv], -g[k])
                            if gp > self.lcap:
                                c.add(-F.dim[fv], -H.dim[hv])
                        else:
                            need = max(1, gp - ep)
                            if need > self.lcap:
                                c.add(-F.dim[fv], -H.dim[hv])
                            else:
                                c.add(-F.dim[fv], -H.dim[hv], g[need])

    def or_dim(self, G, k):
        """literal: dim G >= k"""
        z = self.c.new()
        lits = [G.dim[v] for v in range(k, self.n + 1)]
        for x in lits:
            self.c.add(-x, z)
        self.c.add(-z, *lits)
        return z

    def or_dim_le(self, F, k):
        z = self.c.new()
        lits = [F.dim[v] for v in range(0, k + 1)]
        for x in lits:
            self.c.add(-x, z)
        self.c.add(-z, *lits)
        return z

    # -------------- positions
    def build_positions(self):
        c = self.c
        Sv = self.S
        self.allowed = {}
        if self.layout == "pos":
            for r in self.rows:
                r["w"] = r["i"]
            for q in self.cols:
                q["w"] = q["j"] - self.m
            for r in self.rows:
                for q in self.cols:
                    self.allowed[(r["i"], q["j"])] = (r["w"] - q["w"])
            return
        # slots: order encoding ge[i][x] = "a_i >= x", x over the range [lo, hi]
        w = self.w
        self.rlo, self.rhi = 0, w - 1
        self.clo, self.chi = -self.m, w - 1 + self.m
        for r in self.rows:
            r["ord"] = {x: c.new() for x in range(self.rlo + 1, self.rhi + 1)}
            for x in range(self.rlo + 2, self.rhi + 1):
                c.add(-r["ord"][x], r["ord"][x - 1])
        for q in self.cols:
            q["ord"] = {x: c.new() for x in range(self.clo + 1, self.chi + 1)}
            for x in range(self.clo + 2, self.chi + 1):
                c.add(-q["ord"][x], q["ord"][x - 1])
        # slots used in a prefix, weights strictly increasing, first row at weight 0
        for r in self.rows:
            r["ne"] = -r["G"].empty
        for q in self.cols:
            q["ne"] = -q["F"].full
        for i in range(self.Nr - 1):
            r, s = self.rows[i], self.rows[i + 1]
            c.add(-s["ne"], r["ne"])
            for x in range(self.rlo, self.rhi + 1):
                gx = self.ordv(r, x, self.rlo, self.rhi)
                gx1 = self.ordv(s, x + 1, self.rlo, self.rhi)
                c.add(-s["ne"], -gx, gx1)
        for j in range(self.Nc - 1):
            r, s = self.cols[j], self.cols[j + 1]
            c.add(-s["ne"], r["ne"])
            for x in range(self.clo, self.chi + 1):
                gx = self.ordv(r, x, self.clo, self.chi)
                gx1 = self.ordv(s, x + 1, self.clo, self.chi)
                c.add(-s["ne"], -gx, gx1)
        for x in range(self.rlo + 1, self.rhi + 1):
            c.add(-self.rows[0]["ord"][x])
        c.add(self.rows[0]["ne"])
        # an empty slot takes the top weight (removes free junk)
        for r in self.rows:
            for x in range(self.rlo + 1, self.rhi + 1):
                c.add(r["ne"], r["ord"][x])
        for q in self.cols:
            for x in range(self.clo + 1, self.chi + 1):
                c.add(q["ne"], q["ord"][x])
        # difference literals: D[i,j,s] -> a_i - b'_j == s
        self.D = {}
        for r in self.rows:
            for q in self.cols:
                for s in sorted(set(self.S)):
                    v = c.new()
                    self.D[(r["i"], q["j"], s)] = v
                    for x in range(self.rlo, self.rhi + 2):
                        gr = self.ordv(r, x, self.rlo, self.rhi)
                        gc = self.ordv(q, x - s, self.clo, self.chi)
                        c.add(-v, -gr, gc)
                        c.add(-v, gr, -gc)
        if self.gaprule:
            self.build_gap_rule()

    def ordv(self, obj, x, lo, hi):
        if x <= lo:
            return TRUE
        if x > hi:
            return FALSE
        return obj["ord"][x]

    def build_gap_rule(self):
        """Union of row weights and column weights b': consecutive occupied weights differ by at most m (the gap rule, note Section 8.1)."""
        c = self.c
        lo, hi = self.clo, self.chi
        occ = {}
        for x in range(lo, hi + 1):
            zs = []
            for r in self.rows:
                if self.rlo <= x <= self.rhi:
                    zs.append(self.bool_and([r["ne"], self.ordv(r, x, self.rlo, self.rhi), -self.ordv(r, x + 1, self.rlo, self.rhi) if self.ordv(r, x + 1, self.rlo, self.rhi) != FALSE else TRUE]))
            for q in self.cols:
                zs.append(self.bool_and([q["ne"], self.ordv(q, x, self.clo, self.chi), -self.ordv(q, x + 1, self.clo, self.chi) if self.ordv(q, x + 1, self.clo, self.chi) != FALSE else TRUE]))
            zs = [z for z in zs if z != FALSE]
            v = c.new()
            occ[x] = v
            for z in zs:
                c.add(-z, v)
            c.add(-v, *zs)
        low, high = {}, {}
        prev = FALSE
        for x in range(lo, hi + 1):
            v = c.new()
            c.add(-occ[x], v)
            if prev != FALSE:
                c.add(-prev, v)
            prev = v
            low[x] = v
        prev = FALSE
        for x in range(hi, lo - 1, -1):
            v = c.new()
            c.add(-occ[x], v)
            if prev != FALSE:
                c.add(-prev, v)
            prev = v
            high[x] = v
        g = self.m
        for x in range(lo, hi - g):
            c.add(-low[x], -high[x + g + 1], *[occ[y] for y in range(x + 1, x + g + 1)])

    def pair_status(self, r, q):
        """Returns dict: difference s -> literal, or for pos layout the constant difference."""
        return

    def forced(self):
        """Forced orthogonality, x-rule of the structural model."""
        c = self.c
        for r in self.rows:
            for q in self.cols:
                G, F = r["G"], q["F"]
                E, H = r["E"], q["H"]
                i, j = r["i"], q["j"]
                if self.layout == "pos":
                    s = r["w"] - q["w"]
                    self.pair_rule(s, G, F, E, H, [])
                else:
                    # a pair is unrestricted only if one of the difference literals holds
                    alw = c.new()
                    r_alw = [self.D[(i, j, t)] for t in self.S]
                    c.add(-alw, *r_alw)
                    self.allowed[(i, j)] = alw
                    self.require_sub(G, F, [-alw])

    def pair_rule(self, s, G, F, E, H, guards):
        inS = s in self.Sset
        inX = s in self.Sx
        if not inS:
            self.require_sub(G, F, guards)
            return
        if E is None and H is None:
            return
        # s in S
        if inX:
            # x-terms allowed at this weight: only the quadratic term must vanish
            if E is not None and H is not None:
                self.require_sub(E, H, guards)
        else:
            # no x-term allowed: x-support of one side kills the other side
            if E is not None:
                self.require_sub(E, F, guards)
            if H is not None:
                self.require_sub(G, H, guards)

    # -------------- W constraints
    def conj_lit(self, conj):
        return [x for x in conj if x != TRUE]

    def flat_sub_W(self, o, W):
        out = [[o.empty]]
        if W["dim"] == 1:
            for c in W["same_pt"](o):
                out.append([o.pt] + c)
        else:
            for c in W["pt_on"](o):
                out.append([o.pt] + c)
            for c in W["same_ln"](o):
                out.append([o.ln] + c)
        return out

    def flat_ge(self, o, j, W):
        if j <= 0:
            return [[]]
        if W["dim"] == 1:
            if j > 1:
                return []
            out = [[o.full]]
            for c in W["same_pt"](o):
                out.append([o.pt] + c)
            if self.n == 3:
                for c in W["on_line"](o):
                    out.append([o.ln] + c)
            return out
        if j == 1:
            out = [[o.ln], [o.full]]
            for c in W["pt_on"](o):
                out.append([o.pt] + c)
            return out
        if j == 2:
            out = [[o.full]]
            for c in W["same_ln"](o):
                out.append([o.ln] + c)
            return out
        return []

    def Wnamed_pt(self, o):
        return {"dim": 1, "guard": [o.pt],
                "same_pt": lambda p: [[self.ep(p, o)]] if p is not o else [[]],
                "on_line": lambda l: [[self.inc(o, l)]]}

    def Wgen_on_line(self, l0):
        return {"dim": 1, "guard": [l0.ln],
                "same_pt": lambda p: [],
                "on_line": lambda l: [[self.el(l, l0)]] if l is not l0 else [[]]}

    def Wmeet(self, l1, l2):
        return {"dim": 1, "guard": [l1.ln, l2.ln, -self.el(l1, l2)],
                "same_pt": lambda p: [[self.inc(p, l1), self.inc(p, l2)]],
                "on_line": lambda l: [([self.el(l, l1)] if l is not l1 else []), ([self.el(l, l2)] if l is not l2 else [])]}

    def Wgen_pt(self):
        return {"dim": 1, "guard": [], "same_pt": lambda p: [], "on_line": lambda l: []}

    def Wnamed_ln(self, o):
        return {"dim": 2, "guard": [o.ln],
                "pt_on": lambda p: [[self.inc(p, o)]],
                "same_ln": lambda l: [[self.el(l, o)]] if l is not o else [[]]}

    def Wjoin(self, p1, p2):
        return {"dim": 2, "guard": [p1.pt, p2.pt, -self.ep(p1, p2)],
                "pt_on": lambda p: [([self.ep(p, p1)] if p is not p1 else []), ([self.ep(p, p2)] if p is not p2 else [])],
                "same_ln": lambda l: [[self.inc(p1, l), self.inc(p2, l)]]}

    def Wgen_through(self, p0):
        return {"dim": 2, "guard": [p0.pt],
                "pt_on": lambda p: [[self.ep(p, p0)]] if p is not p0 else [[]],
                "same_ln": lambda l: []}

    def Wgen_ln(self):
        return {"dim": 2, "guard": [], "pt_on": lambda p: [], "same_ln": lambda l: []}

    def star(self, W):
        """(d-n)(l-c(W)) > n d'(W) whenever d'(W) >= 1, on counters."""
        c = self.c
        n, d = self.n, self.d
        dimW = W["dim"]
        ainputs, binputs = [], []
        for r in self.rows:
            G, E = r["G"], r["E"]
            if E is None:
                for k in range(1, dimW + 1):
                    conj = self.flat_ge(G, k, W)
                    if not conj:
                        continue
                    u = c.new()
                    for cc in conj:
                        c.add(*[-x if x not in (TRUE, FALSE) else (FALSE if x == TRUE else TRUE) for x in cc], u)
                    ainputs.append(u)
            else:
                subE = self.flat_sub_W(E, W)
                for k in range(1, self.dcap + 1):
                    u = c.new()
                    used = False
                    for gv in range(0, n + 1):
                        for j in range(0, min(gv, dimW) + 1):
                            need = k + gv - j
                            if need > self.dcap:
                                continue
                            for gj in self.flat_ge(G, j, W):
                                for se in subE:
                                    cl = [G.dim[gv], r["ge"][need]] + gj + se
                                    c.add(*[-x if x not in (TRUE, FALSE) else (FALSE if x == TRUE else TRUE) for x in cl], u)
                                    used = True
                    if used:
                        ainputs.append(u)
        for q in self.cols:
            F, H = q["F"], q["H"]
            if H is None:
                for k in range(1, dimW + 1):
                    y = c.new()
                    c.add(-y, q["ge"][1])
                    for cc in self.flat_ge(F, dimW - k + 1, W):
                        c.add(-y, *[-x if x not in (TRUE, FALSE) else (FALSE if x == TRUE else TRUE) for x in cc])
                    binputs.append(y)
            else:
                subH = self.flat_ge(H, dimW, W)
                for k in range(1, self.lcap + 1):
                    y = c.new()
                    c.add(-y, q["ge"][k])
                    for sh in subH:
                        tail = [-x if x not in (TRUE, FALSE) else (FALSE if x == TRUE else TRUE) for x in sh]
                        if k > dimW:
                            c.add(-y, *tail)
                        else:
                            for cc in self.flat_ge(F, dimW - k + 1, W):
                                c.add(-y, *tail, *[-x if x not in (TRUE, FALSE) else (FALSE if x == TRUE else TRUE) for x in cc])
                    binputs.append(y)
        Amax = min(d, len(ainputs))
        if Amax < 1:
            return
        A = counter_lb(c, ainputs, Amax)
        capB = (n * Amax) // (d - n) + 1
        B = counter_ub(c, binputs, capB)
        guard = [(-g if g not in (TRUE, FALSE) else (FALSE if g == TRUE else TRUE)) for g in W["guard"]]
        seen = {}
        for k in range(1, Amax + 1):
            t = (n * k) // (d - n) + 1
            seen[t] = k  # the smallest k for each t suffices, handled below
        for t in sorted(seen):
            k = min(k2 for k2 in range(1, Amax + 1) if (n * k2) // (d - n) + 1 == t)
            ak = out(A, k)
            c.add(*guard, -ak if ak not in (TRUE, FALSE) else (FALSE if ak == TRUE else TRUE), out(B, t))
        self.Wcount += 1

    def build_star(self):
        objs = self.objs
        n = self.n
        F = self.families
        use = lambda name: F is None or name in F
        ptobjs = [o for o in objs if o.pt != FALSE]
        if use("P"):
            for o in ptobjs:
                self.star(self.Wnamed_pt(o))
        if use("GP"):
            self.star(self.Wgen_pt())
        if n == 3:
            lnobjs = [o for o in objs if o.ln != FALSE]
            for o in lnobjs:
                if use("L"):
                    self.star(self.Wnamed_ln(o))
                if use("GL"):
                    self.star(self.Wgen_on_line(o))
            for o in ptobjs:
                if use("TP"):
                    self.star(self.Wgen_through(o))
            if use("GN"):
                self.star(self.Wgen_ln())
            if self.meets == "all":
                if use("M"):
                    for x in range(len(lnobjs)):
                        for y in range(x + 1, len(lnobjs)):
                            self.star(self.Wmeet(lnobjs[x], lnobjs[y]))
                if use("J"):
                    for x in range(len(ptobjs)):
                        for y in range(x + 1, len(ptobjs)):
                            self.star(self.Wjoin(ptobjs[x], ptobjs[y]))

    def build_mass(self):
        c = self.c
        n, d = self.n, self.d
        rbits = [r["ge"][k] for r in self.rows for k in range(1, len(r["ge"]))]
        cbits = [q["ge"][k] for q in self.cols for k in range(1, len(q["ge"]))]
        A = counter_lb(c, rbits, d + 1)
        c.add(-out(A, d + 1) if out(A, d + 1) not in (TRUE, FALSE) else (FALSE if out(A, d + 1) == TRUE else TRUE))
        B = counter_ub(c, rbits, d)
        c.add(out(B, d))
        # W = whole space: (d-n) l > n d
        need = (n * d) // (d - n) + 1
        L = counter_ub(c, cbits, need)
        c.add(out(L, need))
        # l <= Lmax
        LL = counter_lb(c, cbits, self.Lmax + 1)
        x = out(LL, self.Lmax + 1)
        if x != FALSE:
            c.add(-x if x != TRUE else FALSE)

    def build_wlog(self):
        """no zero column class (WLOG: dependent columns can be removed)."""
        c = self.c
        if self.layout == "pos":
            for q in self.cols:
                allowed_rows = [r for r in self.rows if (r["w"] - q["w"]) in self.Sset]
                c.add(q["F"].full, *[-r["G"].empty for r in allowed_rows])
            c.add(-self.rows[0]["G"].empty)
        else:
            for q in self.cols:
                c.add(q["F"].full, *[self.allowed[(r["i"], q["j"])] for r in self.rows])
                for r in self.rows:
                    c.add(-self.allowed[(r["i"], q["j"])], r["ne"])

    def build_reflection(self):
        """(dim of the first row class) <= (dim of the last row class); reflection a -> top - a, b' -> top - b'."""
        c = self.c
        if not self.reflect:
            return
        mass0 = self.rows[0]["ge"]
        if self.layout == "pos":
            rows = self.rows
            ne = [-r["G"].empty for r in rows]
            above = [None] * len(rows)
            prev = FALSE
            for t in range(len(rows) - 1, -1, -1):
                above[t] = prev
                if t > 0:
                    v = c.new()
                    c.add(-ne[t], v)
                    if prev != FALSE:
                        c.add(-prev, v)
                    if prev != FALSE:
                        c.add(-v, ne[t], prev)
                    else:
                        c.add(-v, ne[t])
                    prev = v
            for t in range(1, len(rows)):
                for k in range(1, len(mass0)):
                    c.add(-ne[t], above[t], -mass0[k], rows[t]["ge"][k])
        else:
            for i in range(1, self.Nr):
                nxt = self.rows[i + 1]["ne"] if i + 1 < self.Nr else FALSE
                for k in range(1, len(mass0)):
                    c.add(-self.rows[i]["ne"], nxt, -mass0[k], self.rows[i]["ge"][k])

    def build(self):
        self.build_classes()
        self.build_positions()
        self.forced()
        self.build_mass()
        self.build_wlog()
        self.build_reflection()
        self.build_star()

    # -------------- decoding
    def decode(self, assign):
        def v(x):
            if x == TRUE:
                return True
            if x == FALSE:
                return False
            return assign[x] if x > 0 else not assign[-x]
        def dimof(o):
            return next(k for k in range(self.n + 1) if v(o.dim[k]))
        res = {"S": self.S, "Sx": sorted(self.Sx), "n": self.n, "d": self.d, "rows": [], "cols": []}
        for r in self.rows:
            if self.layout == "pos":
                wt = r["w"]
            else:
                wt = self.rlo + sum(1 for x, l in r["ord"].items() if v(l))
            rec = {"w": wt, "G": r["G"].idx, "gdim": dimof(r["G"])}
            if r["E"] is not None:
                rec["E"] = r["E"].idx
                rec["edim"] = dimof(r["E"])
                rec["mass"] = sum(1 for k in range(1, len(r["ge"])) if v(r["ge"][k]))
            else:
                rec["mass"] = rec["gdim"]
            res["rows"].append(rec)
        for q in self.cols:
            if self.layout == "pos":
                wt = q["w"]
            else:
                wt = self.clo + sum(1 for x, l in q["ord"].items() if v(l))
            rec = {"w": wt, "F": q["F"].idx, "fdim": dimof(q["F"])}
            if q["H"] is not None:
                rec["H"] = q["H"].idx
                rec["hdim"] = dimof(q["H"])
                rec["mass"] = sum(1 for k in range(1, len(q["ge"])) if v(q["ge"][k]))
            else:
                rec["mass"] = self.n - rec["fdim"]
            res["cols"].append(rec)
        kinds = {o.idx: dimof(o) for o in self.objs}
        res["objs"] = {str(k): d for k, d in kinds.items()}
        res["EP"] = [list(k) for k, x in self.EP.items() if v(x)]
        res["EL"] = [list(k) for k, x in self.EL.items() if v(x)]
        res["I"] = [list(k) for k, x in self.I.items() if v(x)]
        return res
