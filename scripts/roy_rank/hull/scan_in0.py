#!/usr/bin/env python3
"""Independent exhaustive scan of graded rank-3 failures over Sigma (default in0), for fixed d.
Rows: k distinct-weight points, plus optionally one 2-dim class L (points off L), by Step 1 of Thm 3 (needs (P)).
Geometry: EVERY abstract linear space on the k labelled points (superset of the realisable ones).
For (weights, geometry) the maximal matrix N^max has Q_b = Ann(Z_b). ϑ(N^max)>=ϑ(N), so a failing N makes N^max fail.
Tests are genuine zero blocks (R,C): (d-3)(l-dim C) > 3 dim R. Passing all tests = candidate (superset of failures)."""
import sys, itertools, time, json
from functools import lru_cache
S0={-4,-1,0,1,3}
def linear_spaces(k):
    pts=range(k)
    subs=[frozenset(c) for s in range(3,k+1) for c in itertools.combinations(pts,s)]
    out=[]
    def rec(i,cur):
        if i==len(subs):
            out.append(tuple(cur)); return
        rec(i+1,cur)
        s=subs[i]
        if all(len(s&t)<=1 for t in cur):
            rec(i+1,cur+[s])
    rec(0,[])
    return out
def analyse(S,w,Lidx,space,k,eta,d,zs):
    # zs: list of (Z frozenset, inL) per candidate column weight b
    pts_on={}
    def closure2(Z):
        for ln in space:
            if Z<=ln: return ln
        return None
    full=0; pc=[0]*k; lc={}; cL=0; 
    for Z,inL in zs:
        if inL:
            if not Z: cL+=1
            continue
        if not Z: full+=1
        elif len(Z)==1: pc[next(iter(Z))]+=1
        elif len(Z)==2:
            ln=closure2(Z) or Z
            lc[ln]=lc.get(ln,0)+1
        else:
            ln=closure2(Z)
            if ln is not None: lc[ln]=lc.get(ln,0)+1
    l=3*full+2*sum(pc)+sum(lc.values())+cL
    D=d-3
    if D*l<=3*d: return None
    # all point sets that are lines: given lines, plus uncovered pairs
    lines=list(space)
    for i,j in itertools.combinations(range(k),2):
        p=frozenset((i,j))
        if not any(p<=ln for ln in space): lines.append(p)
    for ln in lines:
        c=full+sum(pc[i] for i in ln)+lc.get(ln,0)
        r=len(ln)+eta
        if D*(l-c)<=3*r: return None
    for i in range(k):
        if D*(l-full-pc[i])<=3*(1+eta): return None           # generic plane through p_i
        beta=2*full+2*pc[i]+sum(pc[j] for j in range(k) if j!=i)+sum(v for ln,v in lc.items() if i in ln)
        if D*(l-beta)<=3: return None                          # the point p_i
    if D*(l-full)<=3*eta: return None                          # generic plane
    if eta:
        if D*(l-full-cL)<=3*2: return None                     # plane L
        beta=2*full+sum(pc)+cL+(max(lc.values()) if lc else 0)  # a point q on L, on at most the fullest column line in the best case
        if D*(l-beta)<=3: return None
    return l
def scan(S,d,G=None,limit=1e9,minl=0):
    G=G or max(S)-min(S)
    t0=time.time(); hits=[]; ntup=0; nev=0
    for eta in (0,1):
        rho=d-eta; k=d-2*eta
        if k<0: continue
        spaces=linear_spaces(k)
        if not eta: spaces=[sp for sp in spaces if not any(len(ln)==k for ln in sp)]   # rows must span
        print(f"d={d} eta={eta} k={k} linear spaces {len(spaces)}",flush=True)
        for gaps in itertools.product(range(1,G+1),repeat=rho-1):
            w=[0]
            for g in gaps: w.append(w[-1]+g)
            for Lidx in ([None] if not eta else range(rho)):
                pts=[x for i,x in enumerate(w) if i!=Lidx]
                aL=w[Lidx] if eta else None
                zs=[]
                for b in sorted({s-x for s in S for x in w}):
                    Z=frozenset(i for i,x in enumerate(pts) if x+b not in S)
                    inL=bool(eta and aL+b not in S)
                    zs.append((Z,inL))
                # bound on l, all lines available
                ub=0
                for Z,inL in zs:
                    if inL: ub+= 1 if not Z else 0
                    else: ub+= 3 if not Z else 2 if len(Z)==1 else 1
                ntup+=1
                if (d-3)*ub<=3*d or ub<minl: continue
                for sp in spaces:
                    nev+=1
                    l=analyse(S,w,Lidx,sp,k,eta,d,zs)
                    if l is not None and l>=d:
                        hits.append(dict(w=w,Lidx=Lidx,space=[sorted(x) for x in sp],l=l))
            if time.time()-t0>limit:
                print("TIME LIMIT, incomplete",flush=True); return hits,ntup,nev,False
    return hits,ntup,nev,True
if __name__=="__main__":
    name=sys.argv[1]; d=int(sys.argv[2]); limit=float(sys.argv[3]) if len(sys.argv)>3 else 1e9
    S={'in0':S0,'S':{-4,-1,0,1,4},'inf':{-3,-1,0,1,4},'S1':{-1,0,1},'I2':set(range(-2,3)),'I3':set(range(-3,4))}[name]
    t=time.time(); h,nt,ne,comp=scan(S,d,limit=limit)
    print(json.dumps(dict(S=name,d=d,tuples=nt,evaluations=ne,complete=comp,hits=len(h),sample=h[:6],secs=round(time.time()-t,1))))
