"""Referee A §2.5: V = span(1,u,1/u,u^4+c u^3,u^-4+c u^-3). theta_lb(M) of rank<=2 M over V versus gmax over in_0 and in_infty."""
import sys,random,time,itertools
import numpy as np
from fractions import Fraction as Fr
from lib_a import *
from gmax import gmax
from sample_nongraded_lib import pmul,padd,rand_poly
def section(U,Vb):
    d=len(U); ne=len(Vb); nv=d*ne; cons={}
    def m(p,q): return padd(pmul(U[p][0],U[q][1]),pmul(U[p][1],U[q][0]),-1)
    for (i,j,k) in itertools.combinations(range(d),3):
        row={}
        for (r,mm,sg) in ((i,m(j,k),1),(j,m(i,k),-1),(k,m(i,j),1)):
            for e_idx,vb in enumerate(Vb):
                pr=pmul(mm,vb)
                for ex,c in pr.items():
                    row.setdefault(ex,{}); key=r*ne+e_idx
                    row[ex][key]=row[ex].get(key,0)+sg*c
        for ex,dct in row.items(): cons[((i,j,k),ex)]=dct
    rows=[];seen=set()
    for dct in cons.values():
        r=[0]*nv
        for a,b in dct.items(): r[a]=b
        t=tuple(r)
        if any(t) and t not in seen: seen.add(t);rows.append(r)
    return nullspace(rows,nv) if rows else [[Fr(int(a==b)) for a in range(nv)] for b in range(nv)]
def main(seed,budget):
    rng=random.Random(seed);npr=np.random.default_rng(seed)
    in0=[-4,-1,0,1,3]; inf=[-3,-1,0,1,4]
    t0=time.time();st={};viol=0;fails=0
    while time.time()-t0<budget:
        c=rng.choice([1,2,-1,3])
        Vb=[{0:1},{1:1},{-1:1},{4:1,3:c},{-4:1,-3:c}]
        d=rng.choice([3,3,4])
        pool=[-4,-3,-1,0,1,3,4,2,-2]
        U=[]
        for i in range(d):
            if rng.random()<0.5:
                # rows taken from V itself
                f=rng.choice(Vb);g=rng.choice(Vb)
            else:
                f=rand_poly(rng,pool,rng.choice([1,2]));g=rand_poly(rng,pool,rng.choice([1,2]))
            U.append((f,g))
        B=section(U,Vb); l=len(B)
        if l<2 or l>7: continue
        from math import lcm
        M={e:np.zeros((d,l),dtype=np.int64) for e in range(5)}
        for j,v in enumerate(B):
            den=1
            for x in v: den=lcm(den,x.denominator)
            for i in range(d):
                for e in range(5): M[e][i,j]=int(v[i*5+e]*den)
        lb=theta_lb(M,npr,maxrows=60)
        if lb==0: st['theta0']=st.get('theta0',0)+1;continue
        # sanity rank: evaluate
        g0,_=gmax(in0,d,l); g1,_=gmax(inf,d,l)
        key=(d,l); s=st.setdefault(key,[0,0,0]); s[0]+=1
        if lb==g0: s[1]+=1
        if lb==g1: s[2]+=1
        if lb>g0 or lb>g1:
            viol+=1; print("VIOL",d,l,lb,g0,g1,U,flush=True)
        if (d-2)*lb>2: fails+=1; print("FAIL",d,l,lb,U,flush=True)
    print({str(k):v for k,v in st.items()},"violations",viol,"failures",fails)
main(int(sys.argv[1]),float(sys.argv[2]))
