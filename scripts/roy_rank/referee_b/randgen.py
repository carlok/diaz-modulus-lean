#!/usr/bin/env python3
"""Random exact attack with NO structural assumption: repeated weights allowed, rows drawn from a small point set
(so parallel rows and collinearities occur), then maximal columns, then the exact test over the U-lattice."""
import random, sys, time
from fractions import Fraction as Fr
from exact import analyse, perp, rank
S={-4,-1,0,1,4}
rnd=random.Random(int(sys.argv[2]) if len(sys.argv)>2 else 11)
limit=float(sys.argv[1])
t0=time.time(); N=0; hits=[]; maxr=None; by={}
pool=[(1,0,0),(0,1,0),(0,0,1),(1,1,1),(1,1,0),(1,0,1),(0,1,1),(1,2,0),(2,1,0),(1,-1,0),(0,1,-1),(1,0,-1),(1,2,3),(1,3,2),(2,1,3),(1,1,2),(1,2,1),(2,1,1)]
pool=[tuple(map(Fr,p)) for p in pool]
while time.time()-t0<limit:
    d=rnd.randint(4,8)
    G=rnd.choice([3,5,8])
    w=[0]
    for _ in range(d-1): w.append(w[-1]+rnd.randint(0,G))
    rnd.shuffle(w)
    xs=[rnd.choice(pool) for _ in range(d)]
    if rank(xs,3)<3: continue
    # rows must be free inside a weight class
    ok=True
    for v in set(w):
        cl=[x for x,t in zip(xs,w) if t==v]
        if rank(cl,3)<len(cl): ok=False
    if not ok: continue
    ys=[];b=[]
    for bb in sorted({s-t for s in S for t in w}):
        Z=[x for x,t in zip(xs,w) if t+bb not in S]
        for y in perp(Z,3): ys.append(y);b.append(bb)
    if len(ys)<3: continue
    r=analyse(xs,w,ys,b,S)
    N+=1
    if r['rank']!=3: continue
    margin=(d-3)*r['theta']-3
    k=(d,)
    by[k]=max(by.get(k,Fr(-99)),margin)
    if r['fails']: hits.append((w,[tuple(map(str,x)) for x in xs])); print("HIT",hits[-1],flush=True)
print("random exact trials",N,"hits",len(hits),"best margin (d-3)theta-3 by d:",{k[0]:str(v) for k,v in sorted(by.items())})
