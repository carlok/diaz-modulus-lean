#!/usr/bin/env python3
"""Independent check of the grade-3 obstruction for M0 (no factorisation, no gauge choice).
All positive-grade coefficients of M are indeterminates. Rank<=3 is imposed through the Schur complement on a pivot
block, as power series in T mod T^4. Solve grade 1, grade 2 (linear in the new variables), substitute, and read grade 3."""
import sympy as sp, itertools, sys
from liftlib import C0,A0,B0
a,b=sp.symbols('a b')
IN0={-4,-1,0,1,3}
vars_={}
def coef(i,j,k,store):
    s=A0[i]+B0[j]; E=s+k
    if k==0: return C0[i,j]
    if E in IN0:
        v=sp.Symbol(f"e{k}_{i}_{j}"); vars_.setdefault(k,[]).append(v); return v
    if E==-3: return b*store[k-1][(i,j)]
    if E==4: return a*store[k-1][(i,j)]
    return sp.Integer(0)
store={}
for k in range(0,4):
    store[k]={(i,j):coef(i,j,k,store) for i in range(5) for j in range(8)}
def run(pr,pc):
    rest_r=[i for i in range(5) if i not in pr]; rest_c=[j for j in range(8) if j not in pc]
    Cm=lambda k,I,J: sp.Matrix(len(I),len(J),lambda p,q: store[k][(I[p],J[q])])
    inv0=Cm(0,pr,pc).inv()
    # series inverse of C11
    inv={0:inv0}
    for k in range(1,4):
        s=sp.zeros(3,3)
        for m in range(1,k+1): s+=Cm(m,pr,pc)*inv[k-m]
        inv[k]=(-inv0*s).applyfunc(sp.expand)
    subs={}
    res={}
    leftovers=[]
    for k in range(1,4):
        S=Cm(k,rest_r,rest_c)
        for m1 in range(0,k+1):
            for m2 in range(0,k+1-m1):
                m3=k-m1-m2
                S-=Cm(m1,rest_r,pc)*inv[m2]*Cm(m3,pr,rest_c)
        eqs=[sp.expand(e) for e in S]
        eqs=[sp.expand(e.xreplace(subs)) for e in eqs]
        new=[v for v in vars_.get(k,[])]
        A,rh=sp.linear_eq_to_matrix(eqs,new)
        assert all(not (x.free_symbols) for x in A), "coefficients must be constants"
        Aug=A.row_join(rh)
        R_,pv=Aug.rref()
        rk=sum(1 for p in pv if p<len(new))
        print(f"grade {k}: eqs {len(eqs)} new vars {len(new)} rank {rk}",flush=True)
        sol={}
        for row,p in enumerate(pv):
            if p>=len(new): break
            ex=R_[row,len(new)]
            for q in range(p+1,len(new)):
                ex-=R_[row,q]*new[q]
            sol[new[p]]=sp.expand(ex)
        # leftover: left-kernel combinations of A applied to rh
        for w in A.T.nullspace():
            val=sp.expand((w.T*rh)[0])
            leftovers.append((k,val))
            print(f"  leftover at grade {k}:",sp.factor(val),flush=True)
        subs={u:sp.expand(v.xreplace(sol)) for u,v in subs.items()}
        subs.update(sol)
    return leftovers
import random
piv=[(pr,pc) for pr in itertools.combinations(range(5),3) for pc in itertools.combinations(range(8),3) if C0.extract(list(pr),list(pc)).det()!=0]
print(len(piv),"non-singular 3x3 pivots")
random.seed(7)
for pr,pc in random.sample(piv,3):
    print("pivot",pr,pc,flush=True)
    run(list(pr),list(pc))
