"""Referee A: Theorem 1 at rank 3: for non-graded M_Pi (Pi a 3-plane), search graded N with same size, rank<=3, theta(N)>=theta_lb(M).
Random class-model search: rows = random points in P^2 with planted incidences, weights from connected sets; columns = maximal allowed.
Failure to find is inconclusive; recorded for hand inspection."""
import sys,random,time,itertools
import numpy as np
from fractions import Fraction as Fr
from lib_a import *
from sample_nongraded_lib import pmul,padd,rand_poly
def section3(U,S):
    d=len(U);S=sorted(S);ns=len(S);nv=d*ns
    def det3(R):
        out={}
        for perm,sg in (((0,1,2),1),((1,2,0),1),((2,0,1),1),((0,2,1),-1),((2,1,0),-1),((1,0,2),-1)):
            t={0:sg}
            for r in range(3): t=pmul(t,U[R[r]][perm[r]])
            out=padd(out,t)
        return out
    cons={}
    for quad in itertools.combinations(range(d),4):
        row={}
        for pos,r in enumerate(quad):
            mm=det3([q for q in quad if q!=r]); sg=(-1)**pos
            for e,c in mm.items():
                for si,s in enumerate(S):
                    row.setdefault(e+s,{}); key=r*ns+si
                    row[e+s][key]=row[e+s].get(key,0)+sg*c
        for ex,dct in row.items(): cons[(quad,ex)]=dct
    rows=[];seen=set()
    for dct in cons.values():
        r=[0]*nv
        for a,b in dct.items(): r[a]=b
        t=tuple(r)
        if any(t) and t not in seen: seen.add(t);rows.append(r)
    B=nullspace(rows,nv) if rows else [[Fr(int(a==b)) for a in range(nv)] for b in range(nv)]
    return B,S,ns
def tomat(B,S,ns,d):
    from math import lcm
    l=len(B);M={s:np.zeros((d,l),dtype=np.int64) for s in S}
    for j,v in enumerate(B):
        den=1
        for x in v: den=lcm(den,x.denominator)
        for i in range(d):
            for si,s in enumerate(S): M[s][i,j]=int(v[i*ns+si]*den)
    return M
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def graded_try(S,d,l,rng,npr,target):
    """one random graded config; returns theta_lb or 0"""
    D=[x for x in {s-t for s in S for t in S} if x!=0]
    a=[0]
    while len(a)<d:
        x=rng.choice(a)+rng.choice(D+[0]) 
        if a.count(x)<3: a.append(x)
    # row points: planted incidence
    base=[(rng.randint(-3,3),rng.randint(-3,3),rng.randint(-3,3)) for _ in range(3)]
    pts=[]
    for i in range(d):
        if rng.random()<0.5 and len(base)>=2:
            u,v=rng.sample(base,2); s,t=rng.randint(-2,2),rng.randint(-2,2)
            pts.append(tuple(s*p+t*q for p,q in zip(u,v)))
        else:
            pts.append((rng.randint(-3,3),rng.randint(-3,3),rng.randint(-3,3)))
    if any(p==(0,0,0) for p in pts): return Fr(0),None
    cand=set()
    for x in a:
        for s in S: cand.add(s-x)
    cols=[]
    for b in cand:
        out=[pts[i] for i in range(d) if a[i]+b not in S]
        r=rat_rank(out) if out else 0
        if r==3: continue
        if out:
            K=nullspace(out,3)
        else:
            K=[[Fr(int(i==j)) for j in range(3)] for i in range(3)]
        # class dimension random, vectors random in K
        dim=rng.randint(1,len(K))
        for _ in range(dim):
            co=[rng.randint(-3,3) for _ in K]
            y=[sum(c*k[i] for c,k in zip(co,K)) for i in range(3)]
            cols.append((b,y))
    if len(cols)<l: return Fr(0),None
    rng.shuffle(cols); cols=cols[:l]
    M={}
    for s in S: M[s]=np.zeros((d,l),dtype=np.int64)
    for j,(b,y) in enumerate(cols):
        den=1
        from math import lcm
        for x in y: den=lcm(den,Fr(x).denominator)
        for i in range(d):
            c=sum(Fr(pts[i][k])*y[k] for k in range(3))*den
            if c!=0:
                if a[i]+b not in S: return Fr(0),None
                M[a[i]+b][i,j]+=int(c)
    if blowup_full(M,target.numerator,target.denominator,npr) or blowup_full(M,2*target.numerator,2*target.denominator,npr):
        return target,(a,pts,cols)
    return Fr(0),None
def main(seed,budget):
    rng=random.Random(seed);npr=np.random.default_rng(seed)
    Sets=[[0,1,2],[0,1,3],[0,1,2,3],[0,1,2,4],[-1,0,1],[-4,-1,0,1,4],[0,1,2,3,4]]
    t0=time.time();res={};unfound=[]
    while time.time()-t0<budget:
        S=rng.choice(Sets);d=rng.choice([4,4,5])
        D=sorted({s-t for s in S for t in S})
        pool=sorted(set(S)|set(D))
        U=[tuple(rand_poly(rng,pool,rng.choice([1,1,2])) for _ in range(3)) for _ in range(d)]
        if any(not any(r) for r in U): continue
        B,SS,ns=section3(U,S);l=len(B)
        if l<3 or l>7: continue
        M=tomat(B,SS,ns,d); n=rank_F(M,rng)
        if n!=3: continue
        lb=theta_lb(M,npr,maxrows=60)
        if lb==0: continue
        found=False
        tt=time.time()
        for _ in range(4000):
            r,w=graded_try(S,d,l,rng,npr,lb)
            if r>=lb: found=True;break
            if time.time()-tt>12: break
        key=(tuple(S),d,l,str(lb)); s=res.setdefault(key,[0,0]); s[0]+=1
        if found: s[1]+=1
        else: unfound.append((S,d,l,str(lb),U))
    for k,v in sorted(res.items(),key=str): print(k,v)
    print("not found:",len(unfound))
    for u in unfound[:8]: print(u)
main(int(sys.argv[1]),float(sys.argv[2]))
