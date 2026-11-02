#!/usr/bin/env python3
"""Control: M1=M0*diag(1+bT,1+bT,1,...,1) over V''=span(1,T,1/T,T^3,T^-4+bT^-3), b=1 and b=-3. Exact checks: entries in V'', rank, sub-pairs.
Exact sub-pair tests: all coordinate/random row subspaces (sampling), on the 5 coefficient matrices in the basis of V''."""
import sympy as sp, itertools, random
from fractions import Fraction as Fr
from liftlib import C0,A0,B0
T=sp.Symbol('T')
for b in (1,-3):
    M=sp.Matrix(5,8,lambda i,j:C0[i,j]*T**(A0[i]+B0[j])*((1+b*T) if j in (0,1) else 1))
    # coefficient in basis
    basis=[T**-4+b*T**-3,T**-1,sp.Integer(1),T,T**3]
    Co=[sp.zeros(5,8) for _ in basis]
    ok=True
    for i in range(5):
        for j in range(8):
            p=sp.expand(M[i,j])
            cf={e:p.coeff(T,e) for e in range(-6,7)}
            c4=cf[-4]; 
            if cf[-3]!=b*c4: ok=False
            Co[0][i,j]=c4;Co[1][i,j]=cf[-1];Co[2][i,j]=cf[0];Co[3][i,j]=cf[1];Co[4][i,j]=cf[3]
            if any(cf[e]!=0 for e in (-6,-5,-2,2,4,5,6)): ok=False
    print("b",b,"entries in V'':",ok,"rank (T=2,3,5,1/7):",[M.subs(T,t).rank() for t in (2,3,5,sp.Rational(1,7))])
    bad=sum(1 for I in itertools.combinations(range(5),4) for J in itertools.combinations(range(8),4) if sp.simplify(M.extract(list(I),list(J)).det(method='berkowitz'))!=0)
    print("   nonzero 4x4 minors:",bad)
    # sub-pair sampling mod p
    p=1000003
    Cm=[[[int(sp.Rational(x).p*pow(int(sp.Rational(x).q),-1,p))%p for x in c.row(i)] for i in range(5)] for c in Co]
    def rk(A):
        A=[r[:] for r in A];rr=0;n=len(A);m=len(A[0]) if A else 0
        for c in range(m):
            pi=next((i for i in range(rr,n) if A[i][c]%p),None)
            if pi is None: continue
            A[rr],A[pi]=A[pi],A[rr];iv=pow(A[rr][c],-1,p);A[rr]=[x*iv%p for x in A[rr]]
            for i in range(n):
                if i!=rr and A[i][c]:
                    f=A[i][c];A[i]=[(x-f*y)%p for x,y in zip(A[i],A[rr])]
            rr+=1
        return rr
    rng=random.Random(b+10); mn=None;tried=0
    # row subspace R of dim f: zero block size = 8 - rank(stack R*M_e). ratio (l-c)/f
    cands=[]
    for f in range(1,6):
        for I in itertools.combinations(range(5),f):
            cands.append([[1 if k==i else 0 for k in range(5)] for i in I])
    for _ in range(4000):
        f=rng.randint(1,4)
        cands.append([[rng.choice([0,0,1,-1,2,rng.randint(0,p-1)])%p for _ in range(5)] for _ in range(f)])
    for R in cands:
        if rk(R)<len(R): continue
        tried+=1
        st=[]
        for c in Cm:
            for r in R:
                st.append([sum(r[i]*c[i][j] for i in range(5))%p for j in range(8)])
        cdim=8-rk(st)
        ratio=Fr(8-cdim,len(R))
        if mn is None or ratio<mn: mn=ratio
    print("   sampled subspaces",tried,"min (l-c)/f =",mn,"(8/5 expected; the bound theta>=8/5 itself comes from semicontinuity at M0)")
