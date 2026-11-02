#!/usr/bin/env python3
"""Step 3. Controls for the lift machine. Exact."""
import sympy as sp, itertools, time
from liftlib import *
T,al,U=sp.symbols('T alpha U')
def reduced_basis(polys,var):
    """Laurent polys -> reduced echelon basis by lowest exponent: {lead:{E:c}}"""
    rows=[]
    for p in polys:
        p=sp.expand(p)
        d={}
        for term in sp.Add.make_args(p):
            c,rest=term.as_independent(var)
            E=sp.degree(rest,var) if rest!=1 and rest.is_polynomial(var) else (0 if rest==1 else -sp.degree(1/rest,var))
            d[int(E)]=d.get(int(E),0)+c
        rows.append(d)
    out={}
    rows=[dict(r) for r in rows]
    for n in range(len(rows)):
        # pick pivot: lowest exponent among rows n.. after elimination
        rows[n:]=sorted(rows[n:],key=lambda r:min(k for k,v in r.items() if sp.simplify(v)!=0))
        r=rows[n]
        o=min(k for k,v in r.items() if sp.simplify(v)!=0)
        c=r[o]; r={k:sp.simplify(v/c) for k,v in r.items()}; rows[n]=r
        for m in range(len(rows)):
            if m!=n and rows[m].get(o,0)!=0:
                f=rows[m][o]
                keys=set(rows[m])|set(r)
                rows[m]={k:sp.simplify(rows[m].get(k,0)-f*r.get(k,0)) for k in keys}
    for r in rows:
        r={k:v for k,v in r.items() if v!=0}
        o=min(r); out[o]={k:v for k,v in r.items() if k!=o}
    return out
def rank_exact(res,aw,bw,var,Kmax,r_expected=3):
    """assemble M from res['e'], check all (r+1)-minors vanish and entries are in V is by construction"""
    e=res['e']; d=len(aw); l=len(bw)
    M=sp.Matrix(d,l,lambda i,j: sum(e[k][i,j]*var**(aw[i]+bw[j]+k) for k in e))
    n=r_expected+1; bad=0
    for I in itertools.combinations(range(d),n):
        for J in itertools.combinations(range(l),n):
            if sp.simplify(M.extract(list(I),list(J)).det(method='berkowitz'))!=0: bad+=1
    return M,bad
print("== A1 (must lift): Moebius image of M0*T^4: span T^s(1+alpha T)^(7-s), s in {0,3,4,5,7}, at T->0")
exps=[0,3,4,5,7]
A1=reduced_basis([T**s*(1+al*T)**(7-s) for s in exps],T)
print(" leads",sorted(A1),"tails",{o:sorted(t) for o,t in A1.items()})
r=lift(C0,[x+4 for x in A0],B0,A1,14,verbose=False); print(" obstruction grade:",r['k'],r.get('obs'))
print("== A2 (must lift): translation span (T+alpha)^s at T->infinity, U=1/T")
A2=reduced_basis([U**(-s)*(1+al*U)**s for s in exps],U)
print(" leads",sorted(A2),"tails",{o:sorted(t) for o,t in A2.items()})
r2=lift(C0,[-x-4 for x in A0],[-x for x in B0],A2,14,verbose=False); print(" obstruction grade:",r2['k'],r2.get('obs'))
print("== B1 family (rank one): V(k)=span(1+k0 T^4,T+k1 T^4,T^2+k2 T^4,T^3+k3 T^4), N=(1,T)^t(1,T,T^2)")
k0,k1,k2,k3=sp.symbols('k0 k1 k2 k3')
basis={0:{4:k0},1:{4:k1},2:{4:k2},3:{4:k3}}
C=sp.Matrix([[1,1,1],[1,1,1]])
r3=lift(C,[0,1],[0,1,2],basis,8); print(" obstruction grade:",r3['k'],r3.get('obs'))
print("  expected: must lift exactly when V(k) is f*Poly_3, f linear (k_i geometric).")
print("== B1 k=(a,0,0,0), must not lift (no base point, Hopf)")
a=sp.Symbol('a')
r4=lift(C,[0,1],[0,1,2],{0:{4:a},1:{},2:{},3:{}},8,verbose=False); print(" obstruction grade:",r4['k'],r4.get('obs'))
print("== B2 V=(1+al T)Poly_3 at rank one (must lift)")
B2=reduced_basis([(1+al*T)*T**s for s in range(4)],T); print(" ",B2)
r5=lift(C,[0,1],[0,1,2],B2,8,verbose=False); print(" obstruction grade:",r5['k'],r5.get('obs'))
print("== A3 lift over V''=span(1,T,1/T,T^3,T^-4+T^-3) (a=0,b=1); exact M")
r6=lift(C0,A0,B0,{-4:{-3:sp.Integer(1)},-1:{},0:{},1:{},3:{}},12,verbose=False); print(" obstruction grade:",r6['k'])
t=time.time(); M,bad=rank_exact(r6,A0,B0,T,12); print(" 4x4 minors nonzero:",bad," secs",round(time.time()-t,1))
print(" M=",M.tolist())
print("== Same with a=1,b=1 truncated at grade 2 (the matrix cannot be completed)")
r7=lift(C0,A0,B0,{-4:{-3:sp.Integer(1)},-1:{},0:{},1:{},3:{4:sp.Integer(1)}},12,verbose=False); print(" obstruction grade:",r7['k'],r7.get('obs'))
