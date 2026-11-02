#!/usr/bin/env python3
"""Cross-validate the abstract test of attack.py against exact linear algebra of exact.py:
realise a random row configuration (points + optional line L) with rational coordinates, build the maximal column
set from the annihilators, run the exact test, and compare the fail verdict and l with the abstract structure."""
import random, sys, itertools
from fractions import Fraction as Fr
from exact import analyse, rref, perp, add, dim, rank
from attack import scan, evaluate, closure, pop
rnd=random.Random(5)
def realise(k,lines):
    """rational points with exactly the prescribed collinear sets (lines = masks), by rejection"""
    for attempt in range(400):
        pts=[None]*k
        order=[]
        # place: a point on an existing determined line is chosen on it
        ok=True
        for i in range(k):
            on=[m for m in lines if m>>i&1]
            det=[m for m in on if pop(m & sum(1<<j for j in range(k) if pts[j] is not None))>=2]
            if len(det)>=2:
                # intersection of two determined lines
                ls=[]
                for m in det[:2]:
                    ids=[j for j in range(k) if m>>j&1 and pts[j] is not None][:2]
                    ls.append(cross(pts[ids[0]],pts[ids[1]]))
                v=cross(ls[0],ls[1])
                if all(x==0 for x in v): ok=False;break
                pts[i]=v
            elif len(det)==1:
                ids=[j for j in range(k) if det[0]>>j&1 and pts[j] is not None][:2]
                s,t=rnd.randint(1,50),rnd.randint(1,50)
                pts[i]=tuple(s*a+t*b for a,b in zip(pts[ids[0]],pts[ids[1]]))
            else:
                pts[i]=tuple(Fr(rnd.randint(-60,60)) for _ in range(3))
        if not ok: continue
        # verify exact matroid
        good=True
        for tri in itertools.combinations(range(k),3):
            m=sum(1<<j for j in tri)
            coll=any(m&ln==m for ln in lines)
            if (rank([pts[j] for j in tri],3)<3)!=coll: good=False;break
        if good and all(rank([pts[i],pts[j]],3)==2 for i,j in itertools.combinations(range(k),2)):
            return pts
    return None
def cross(p,q): return (p[1]*q[2]-p[2]*q[1],p[2]*q[0]-p[0]*q[2],p[0]*q[1]-p[1]*q[0])

def build(S,weights,Lidx,pts):
    eta=Lidx is not None
    pw=[w for i,w in enumerate(weights) if i!=Lidx]
    xs=list(pts);a=list(pw)
    Lspan=None
    if eta:
        while True:
            u=tuple(Fr(rnd.randint(-60,60)) for _ in range(3));v=tuple(Fr(rnd.randint(-60,60)) for _ in range(3))
            if rank([u,v],3)==2 and all(rank([u,v,p],3)==3 for p in pts): break
        xs+=[u,v];a+=[weights[Lidx]]*2; Lspan=[u,v]
    ys=[];b=[]
    for bb in sorted({s-w for s in S for w in weights}):
        Z=[x for x,w in zip(xs,a) if w+bb not in S]
        ann=perp(Z,3) if Z else perp([],3)
        for y in ann: ys.append(y);b.append(bb)
    return xs,a,ys,b

def abstract(S,weights,Lidx,st):
    # reuse scan's column logic through a local copy
    eta=1 if Lidx is not None else 0
    pts=[w for i,w in enumerate(weights) if i!=Lidx]; k=len(pts); aL=weights[Lidx] if eta else None
    cols=[]
    for b in sorted({x-w for x in S for w in weights}):
        inL=eta and (aL+b not in S)
        Z=0
        for i,w in enumerate(pts):
            if w+b not in S: Z|=1<<i
        if eta and inL:
            if Z==0: cols.append((3,0))
            continue
        if Z==0: cols.append((0,0))
        elif pop(Z)==1: cols.append((1,Z.bit_length()-1))
        else: cols.append((2,Z))
    d=k+2*eta
    return evaluate(st,cols,k,eta,d)

def trial(S,rho,G,eta):
    w=[0]
    for _ in range(rho-1): w.append(w[-1]+rnd.randint(1,G))
    Lidx=rnd.randrange(rho) if eta else None
    k=rho-(1 if eta else 0)
    # random structure from forced sets
    pts_w=[x for i,x in enumerate(w) if i!=Lidx]
    force=[]
    for b in sorted({s-x for s in S for x in w}):
        Z=0
        for i,x in enumerate(pts_w):
            if x+b not in S: Z|=1<<i
        if pop(Z)>=3: force.append(Z)
    st=frozenset()
    rnd.shuffle(force)
    for Z in force[:rnd.randint(0,2)]:
        ns=closure(st,Z)
        if (1<<k)-1 in ns: continue
        st=ns
    pts=realise(k,list(st))
    if pts is None: return None
    xs,a,ys,b=build(S,w,Lidx,pts)
    d=len(xs); l=len(ys)
    if l==0: return None
    ex=analyse(xs,a,ys,b,S)
    if ex['rank']<3: return ('lowrank',)
    ex_fail=(d-3)*ex['theta']>3
    ab=abstract(S,w,Lidx,st)
    return (w,Lidx,st,l,ab[0],ex_fail,ab[1])

if __name__=="__main__":
    agree=dis=skip=0; pos=0; bad=[]
    tests=[({-2,-1,0,1,2},5,4,0),({-2,-1,0,1,2},4,4,1),({-3,-2,-1,0,1,2,3},6,6,0),({-3,-2,-1,0,1,2,3},5,6,1),
           ({-4,-1,0,1,4},5,8,0),({-4,-1,0,1,3},5,6,0),({-4,-1,0,1,3},4,6,1),({-4,-3,-1,0,1,3,4},5,6,0),({-4,-3,-1,0,1,3,4},4,5,1)]
    N=int(sys.argv[1])
    for S,rho,G,eta in tests:
        for _ in range(N):
            r=trial(S,rho,G,eta)
            if r is None or r[0]=='lowrank': skip+=1; continue
            w,L,st,l,la,e,af=r
            if l!=la or e!=af:
                dis+=1; bad.append((sorted(S),w,L,sorted(st),l,la,e,af))
            else:
                agree+=1; pos+=e
    print("agree",agree,"of which failures",pos,"disagree",dis,"skipped",skip)
    print(bad[:6])
