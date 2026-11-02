"""Referee A: exact-ish linear algebra: rank mod p (rigorous lower bound for char-0 rank), blow-up test for theta.
Matrix over V_Sigma = dict sigma -> numpy int matrix (d x l)."""
import numpy as np, random, itertools
from fractions import Fraction as Fr
P=2147483629
def rank_mod(A):
    A=A.copy()%P; m,n=A.shape; r=0
    for c in range(n):
        if r==m: break
        piv=np.nonzero(A[r:,c])[0]
        if piv.size==0: continue
        i=r+piv[0]
        if i!=r: A[[r,i]]=A[[i,r]]
        inv=pow(int(A[r,c]),P-2,P)
        A[r]=(A[r]*inv)%P
        rows=np.nonzero(A[:,c])[0]
        rows=rows[rows!=r]
        if rows.size:
            A[rows]=(A[rows]-(A[rows,c][:,None]*A[r])%P)%P
        r+=1
    return r
def rank_F(M,rng,tries=3):
    best=0
    for _ in range(tries):
        d,l=next(iter(M.values())).shape
        A=np.zeros((d,l),dtype=np.int64)
        t=rng.randrange(2,P-1)
        for s,X in M.items():
            A=(A+ (pow(t,s%(P-1),P)*(X%P))%P)%P
        best=max(best,rank_mod(A))
    return best
def blowup_full(M,p,q,npr):
    d,l=next(iter(M.values())).shape
    A=np.zeros((p*d,q*l),dtype=np.int64)
    for s,X in M.items():
        R=npr.integers(0,P,size=(p,q),dtype=np.int64)
        # kron mod P
        for i in range(d):
            for j in range(l):
                v=int(X[i,j])%P
                if v:
                    A[i*p:(i+1)*p,j*q:(j+1)*q]=(A[i*p:(i+1)*p,j*q:(j+1)*q]+(R*v)%P)%P
    return rank_mod(A)==p*d
def theta_lb(M,npr,maxrows=90):
    """largest ratio a/b<=l/d (a<=l,1<=b<=d) certified by a full-rank blow-up. Rigorous lower bound."""
    d,l=next(iter(M.values())).shape
    cands=sorted({Fr(a,b) for b in range(1,d+1) for a in range(0,l+1) if Fr(a,b)<=Fr(l,d)},reverse=True)
    for r in cands:
        if r==0: return Fr(0)
        p,q=r.numerator,r.denominator
        k=1;ok=False
        while True:
            if p*k*d>maxrows and k>1: break
            if blowup_full(M,p*k,q*k,npr): ok=True;break
            k+=1
        if ok: return r
    return Fr(0)
def rat_rank(rows):
    rows=[list(map(Fr,r)) for r in rows]; r=0
    if not rows: return 0
    n=len(rows[0])
    for c in range(n):
        piv=None
        for i in range(r,len(rows)):
            if rows[i][c]!=0: piv=i;break
        if piv is None: continue
        rows[r],rows[piv]=rows[piv],rows[r]
        for i in range(len(rows)):
            if i!=r and rows[i][c]!=0:
                f=rows[i][c]/rows[r][c]
                rows[i]=[a-f*b for a,b in zip(rows[i],rows[r])]
        r+=1
        if r==len(rows): break
    return r
def nullspace(rows,n):
    rows=[list(map(Fr,r)) for r in rows]; piv=[];r=0
    for c in range(n):
        p=None
        for i in range(r,len(rows)):
            if rows[i][c]!=0: p=i;break
        if p is None: continue
        rows[r],rows[p]=rows[p],rows[r]
        inv=rows[r][c]; rows[r]=[x/inv for x in rows[r]]
        for i in range(len(rows)):
            if i!=r and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[a-f*b for a,b in zip(rows[i],rows[r])]
        piv.append(c);r+=1
        if r==len(rows): break
    free=[c for c in range(n) if c not in piv]
    out=[]
    for f in free:
        v=[Fr(0)]*n; v[f]=Fr(1)
        for i,c in enumerate(piv): v[c]=-rows[i][f]
        out.append(v)
    return out
def theta_ub_box(M,box=(-2,-1,0,1,2),maxdim=None):
    """upper bound from explicit sub-pairs: C spanned by box vectors (dim 1 and 2, and kernels), E=span M_sigma C."""
    Ms=list(M.values()); d,l=Ms[0].shape
    best=Fr(l,d); wit=(0,0)
    vecs=[]
    for v in itertools.product(box,repeat=l):
        nz=[x for x in v if x]
        if nz and nz[0]>0: vecs.append(np.array(v,dtype=object))
    def E_of(C):
        rows=[]
        for X in Ms:
            for c in C:
                rows.append([sum(int(X[i,j])*int(c[j]) for j in range(l)) for i in range(d)])
        return rat_rank(rows)
    for c in vecs:
        e=E_of([c])
        if e<d:
            r=Fr(l-1,d-e)
            if r<best: best=r;wit=(1,e)
    if l>=3 and len(vecs)<=400:
        for c1,c2 in itertools.combinations(vecs,2):
            e=E_of([c1,c2])
            if rat_rank([list(c1),list(c2)])==2 and e<d:
                r=Fr(l-2,d-e)
                if r<best: best=r;wit=(2,e)
    return best,wit

def theta_ub_rows(M,box=(-2,-1,0,1,2)):
    """upper bound from zero blocks with R spanned by 1 or 2 box row-vectors, C maximal; ratio (l-dim C)/dim R."""
    Ms=list(M.values()); d,l=Ms[0].shape; best=Fr(l,d)
    vecs=[]
    for v in itertools.product(box,repeat=d):
        nz=[x for x in v if x]
        if nz and nz[0]>0: vecs.append(v)
    def ratio(Rs):
        rows=[]
        for X in Ms:
            for r in Rs:
                rows.append([sum(r[i]*int(X[i,j]) for i in range(d)) for j in range(l)])
        return rat_rank(rows)
    for r in vecs:
        best=min(best,Fr(ratio([r]),1))
    if d>=3 and len(vecs)<=200:
        for r1,r2 in itertools.combinations(vecs,2):
            if rat_rank([list(r1),list(r2)])==2:
                best=min(best,Fr(ratio([r1,r2]),2))
    return best
