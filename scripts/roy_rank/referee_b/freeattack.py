#!/usr/bin/env python3
"""Attack on Theorem 4 by sampling: S plus lacunary exponents standing for x_k; row weights (a0,h)."""
import random, sys, time, itertools
from attack import scan
limit=float(sys.argv[1]); name=sys.argv[2]
S0={'S':{-4,-1,0,1,4},'S1':{-1,0,1},'S2':{-2,-1,0,1,2}}[name]
M=3; s=[10**4,10**7,10**10]
Sl=set(S0)|set(s)
H=[(0,0,0),(1,0,0),(0,1,0),(0,0,1),(1,1,0),(1,0,1),(0,1,1),(1,1,1)]
rnd=random.Random(3)
t0=time.time();N=0;hits=[]
# check (P) of Sigma_free and Lemma 6.1 on this model
from collections import Counter
rep=Counter(x-y for x in Sl for y in Sl if x!=y)
print("max reps in S+lacunary",max(rep.values()))
stat=Counter()
while time.time()-t0<limit:
    d=rnd.choice([4,5,5,6,6,7])
    eta=rnd.random()<.25
    rho=d-(1 if eta else 0)
    nsheets=rnd.choice([2,2,3,4])
    sheets=rnd.sample(H,nsheets)
    W=rnd.choice([3,5,8])
    seen=set();ws=[]
    for _ in range(rho):
        h=rnd.choice(sheets); a0=rnd.randint(-W,W)
        w=a0+sum(x*y for x,y in zip(h,s))
        if w in seen: break
        seen.add(w);ws.append(w)
    if len(ws)<rho: continue
    Lidx=rnd.randrange(rho) if eta else None
    h,ns=scan(Sl,ws,Lidx)
    N+=1; stat[d]+=1
    if h: hits.append((ws,Lidx,h[:1]))
print(name,"samples",N,dict(stat),"hits",len(hits),hits[:4])
