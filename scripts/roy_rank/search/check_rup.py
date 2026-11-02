#!/usr/bin/env python3
"""A small forward RUP checker written here (no DRAT-only RAT steps; CaDiCaL emits RUP lemmas for this kind of run unless
it uses extension steps, which are reported).  usage: check_rup.py file.cnf file.drat [seconds]"""
import sys, time

def parse_cnf(p):
    cls = []
    with open(p) as f:
        for line in f:
            if line[0] in "cp": continue
            lits = list(map(int, line.split()))
            cls.append(lits[:-1])
    return cls

def parse_bin(p):
    data = open(p, "rb").read()
    i, n = 0, len(data)
    while i < n:
        tag = data[i]; i += 1
        lits = []
        while True:
            x = 0; sh = 0
            while True:
                b = data[i]; i += 1
                x |= (b & 127) << sh; sh += 7
                if b < 128: break
            if x == 0: break
            lits.append(x >> 1 if not (x & 1) else -(x >> 1))
        yield tag, lits

def check(cnf, drat, tmax=600):
    t0 = time.time()
    clauses = parse_cnf(cnf)
    nv = max((abs(l) for c in clauses for l in c), default=0)
    proof = list(parse_bin(drat))
    nv = max([nv] + [abs(l) for _, ls in proof for l in ls])
    val = [0] * (2 * nv + 2)  # index lit+nv
    off = nv
    watches = [[] for _ in range(2 * nv + 2)]
    db = {}
    idx = {}
    trail = []
    units = []
    empty = False
    def key(c): return tuple(sorted(c))
    def add_clause(c):
        cid = len(db) + add_clause.count
        add_clause.count += 1
        lits = list(dict.fromkeys(c))
        db[cid] = lits
        idx.setdefault(key(lits), []).append(cid)
        if len(lits) >= 2:
            # put two non-false literals first when possible
            lits.sort(key=lambda l: val[l + off] < 0)
            watches[lits[0] + off].append(cid)
            watches[lits[1] + off].append(cid)
        return cid, lits
    add_clause.count = 0
    def propagate(q):
        i = 0
        while i < len(q):
            l = q[i]; i += 1
            nl = -l
            w = watches[nl + off]
            j = 0; k = 0
            n = len(w)
            while j < n:
                cid = w[j]; j += 1
                c = db.get(cid)
                if c is None: continue
                if c[0] == nl: c[0], c[1] = c[1], c[0]
                if c[1] != nl:
                    continue
                if val[c[0] + off] > 0:
                    w[k] = cid; k += 1; continue
                found = False
                for t in range(2, len(c)):
                    if val[c[t] + off] >= 0:
                        c[1], c[t] = c[t], c[1]
                        watches[c[1] + off].append(cid)
                        found = True
                        break
                if found: continue
                w[k] = cid; k += 1
                if val[c[0] + off] < 0:
                    while j < n:
                        w[k] = w[j]; k += 1; j += 1
                    del w[k:]
                    return False
                val[c[0] + off] = 1; val[-c[0] + off] = -1
                q.append(c[0])
            del w[k:]
        return True
    root = []
    def set_root(lits):
        for l in lits:
            if val[l + off] > 0: continue
            if val[l + off] < 0: return False
            val[l + off] = 1; val[-l + off] = -1
            root.append(l)
        return True
    ok = True
    for c in clauses:
        cid, lits = add_clause(c)
        if len(lits) == 1:
            if not set_root(lits): empty = True
        elif not lits:
            empty = True
    if not empty and not propagate(root): empty = True
    done = 0
    for tag, lits in proof:
        if time.time() - t0 > tmax: return f"time limit after {done} of {len(proof)} steps, no error so far"
        if tag == ord('d'):
            continue  # deletions ignored: RUP checking against a larger database stays sound for UNSAT only through 'a' steps
        done += 1
        if empty: break
        q = []
        for l in lits:
            if val[l + off] > 0:
                q = None; break
            if val[l + off] == 0:
                val[-l + off] = 1; val[l + off] = -1
                q.append(-l)
        # a lemma satisfied at root is trivially implied
        if q is not None:
            mark = list(q)
            conflict = not propagate(q)
            # undo
            for x in q:
                val[x + off] = 0; val[-x + off] = 0
            if not conflict:
                return f"lemma {done} of {len(proof)} is not RUP"
        cid, ls = add_clause(lits)
        if len(ls) == 0: empty = True
        else:
            # a lemma may be unit or empty under the root assignment
            if not any(val[l + off] > 0 for l in ls):
                free = [l for l in ls if val[l + off] == 0]
                if not free: empty = True
                elif len(free) == 1:
                    r0 = len(root)
                    set_root(free)
                    if not propagate(root[r0:]): empty = True
    return f"verified: empty clause derived after {done} of {len(proof)} additions" if empty else "no empty clause reached"

if __name__ == "__main__":
    print(check(sys.argv[1], sys.argv[2], float(sys.argv[3]) if len(sys.argv) > 3 else 600))
