#!/usr/bin/env python3
"""General exact order-by-order lift. Space V given by reduced basis {o: {E: coef}} (leading exponent o, tail terms E>o, tail
exponents not leading). N=D_a C D_b with C=X Y^t over Q. coefficients may contain sympy symbols.
Solves grade k=1..Kmax; returns the first nonzero obstruction, or the truncated lift."""
import sympy as sp, random
from sympy import Rational as R, Matrix
def factor_C(C):
    rrefC,piv=C.rref()
    r=len(piv)
    X=C[:,list(piv)]
    Y=rrefC[:r,:].T
    assert X*Y.T==C
    return X,Y,r
def gauge_dim(aw,bw,k):
    return sum(1 for p in aw for q in aw if p-q==k)+sum(1 for p in bw for q in bw if p-q==k)
def lift(C,aw,bw,basis,Kmax,verbose=True,perturb=None):
    """perturb: None, or random seed to add a random kernel vector at each grade (changes the gauge choice)."""
    d,l=C.shape
    X,Y,r=factor_C(C)
    N=r*(d+l)
    lead=set(basis)
    tails={}
    for o,t in basis.items():
        for E,c in t.items():
            assert E>o and E not in lead
            tails.setdefault(E,[]).append((o,c))
    x={0:X};y={0:Y};e={0:C}
    rng=random.Random(perturb) if perturb is not None else None
    for k in range(1,Kmax+1):
        cons=[(i,j) for i in range(d) for j in range(l) if aw[i]+bw[j]+k not in lead]
        A=sp.zeros(len(cons),N); rhs=sp.zeros(len(cons),1)
        for n,(i,j) in enumerate(cons):
            for t in range(r):
                A[n,i*r+t]=Y[j,t]
                A[n,d*r+j*r+t]=X[i,t]
            s=aw[i]+bw[j]; E=s+k
            q=0
            for o,c in tails.get(E,[]):
                km=o-s
                if km>=0: q+=c*e[km][i,j]
            for m in range(1,k):
                q-=(x[m][i,:]*y[k-m][j,:].T)[0]
            rhs[n]=sp.expand(q)
        rk=A.rank()
        cok=A.T.nullspace()
        obs=[sp.factor(sp.expand((w.T*rhs)[0])) for w in cok]
        nz=[o for o in obs if o!=0]
        if verbose:
            print(f"grade {k}: constraints {len(cons)} rank {rk} cokernel {len(cok)} tangent-mod-GL_r {N-rk-r*r} gauge {gauge_dim(aw,bw,k)}"
                  +(f" obstructions {[str(o) for o in nz][:8]}" if nz else ""),flush=True)
        if nz:
            return {'k':k,'obs':nz,'cons':cons,'cok':cok,'rhs':rhs,'x':x,'y':y,'e':e,'X':X,'Y':Y}
        # particular solution
        R_,pv=A.row_join(rhs).rref()
        pv=[p for p in pv]
        sol=sp.zeros(N,1)
        for row,p in enumerate(pv): sol[p]=R_[row,N]
        if rng is not None:
            ker=A.nullspace()
            for v in ker: sol+=R(rng.randint(-3,3))*v
        xk=sp.zeros(d,r); yk=sp.zeros(l,r)
        for i in range(d):
            for t in range(r): xk[i,t]=sol[i*r+t]
        for j in range(l):
            for t in range(r): yk[j,t]=sol[d*r+j*r+t]
        x[k]=xk;y[k]=yk
        ek=sp.zeros(d,l)
        for i in range(d):
            for j in range(l):
                val=(xk[i,:]*Y[j,:].T)[0]+(X[i,:]*yk[j,:].T)[0]
                for m in range(1,k):
                    val+=(x[m][i,:]*y[k-m][j,:].T)[0]
                ek[i,j]=sp.expand(val)
        e[k]=ek
    return {'k':None,'x':x,'y':y,'e':e,'X':X,'Y':Y}
C0=Matrix([[0,-1,0,0,1,0,-1,1],[1,0,0,-R(1,2),0,1,-1,0],[0,0,1,1,2,0,0,2],[0,-2,-1,-1,0,0,-2,0],[2,2,1,0,0,2,0,0]])
A0=[0,1,2,3,4]; B0=[-5,-4,-3,-2,-1,-1,0,1]
