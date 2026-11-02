#!/usr/bin/env python3
"""Referee A: own exhaustive search for graded failures at rank <=2, in the class model.
A graded matrix with free rows/cols and rank <=2 is: row classes (weight a, P_a a point or the whole plane),
column classes (weight b, Q_b a point or whole). A pair (a,b) with a+b not in Sigma forces P_a perp Q_b.
For fixed rows, adding columns never lowers theta, so take the maximal column set.
theta = min(l/d, min_p (l-beta_p)/x_p), p over points with x_p>=1 (R inside p; if R spans the plane then C=0 by freeness).
Usage: thm2_exhaust.py  -> tables.
"""
import itertools, sys
from fractions import Fraction as Fr

def has_P(S):
    from collections import Counter
    c=Counter(s-t for s in S for t in S if s!=t)
    return all(v<=2 for v in c.values())

def set_partitions(n):
    # restricted growth strings
    def rec(i,cur,m):
        if i==n:
            yield tuple(cur); return
        for v in range(m+1):
            cur.append(v)
            yield from rec(i+1,cur,max(m,v+1))
            cur.pop()
    yield from rec(0,[],0)

def eval_config(S, oneweights, labels, twoweights):
    """row classes: 1-dim at oneweights[i] with point labels[i], 2-dim at twoweights. returns (d,l,theta)"""
    d=len(oneweights)+2*len(twoweights)
    allw=list(oneweights)+list(twoweights)
    cand=set()
    for a in allw:
        for s in S: cand.add(s-a)
    npts=max(labels)+1 if labels else 0
    forced=[0]*npts   # count of forced columns at each row point
    nfree=0
    for b in cand:
        outs=[i for i,a in enumerate(oneweights) if a+b not in S]
        if any(a+b not in S for a in twoweights): continue
        pts={labels[i] for i in outs}
        if len(pts)>=2: continue
        if len(pts)==1: forced[next(iter(pts))]+=1
        else: nfree+=1
    # maximal: forced ->dim1, free->dim2
    l=sum(forced)+2*nfree
    if l==0: return d,0,Fr(0)
    eta=len(twoweights)
    th=Fr(l,d)
    x=[0]*npts
    for lb in labels: x[lb]+=1
    for p in range(npts):
        xp=x[p]+eta
        beta=forced[p]+nfree
        th=min(th,Fr(l-beta,xp))
    if eta>=1:  # generic point
        th=min(th,Fr(l-nfree,eta))
    return d,l,th

def search(S,dmax,W):
    """yield failing configs of rank exactly 2 with d<=dmax. min weight normalised 0, weights in [0,W]."""
    S=frozenset(S)
    fails=[];count=0
    for d in range(3,dmax+1):
      for eta in range(0,d//2+1):
        k=d-2*eta
        if k+eta==0: continue
        for wts in itertools.combinations(range(0,W+1),k+eta):
            if wts[0]!=0: continue
            for twos in itertools.combinations(wts,eta):
                ones=[w for w in wts if w not in twos]
                for lab in set_partitions(len(ones)):
                    if eta==0 and (max(lab)+1 if lab else 0)<2: continue # rank 1
                    count+=1
                    dd,l,th=eval_config(S,ones,lab,twos)
                    if (dd-2)*th>2:
                        fails.append((dd,l,th,tuple(ones),lab,twos))
    return count,fails

def main():
    Sets=[("S",[-4,-1,0,1,4]),("in0",[-4,-1,0,1,3]),("inf",[-3,-1,0,1,4]),("S1",[-1,0,1]),("S2",[-2,-1,0,1,2])]
    for name,S in Sets:
        c,f=search(S,6,14)
        print(name,S,"P=",has_P(S),"configs",c,"fails",len(f), f[:1])
    # all (P)/non-(P) subsets of [0..9] of size 3..6 containing 0: d<=5
    nP=0;bad=0;nonP=0;nonPfound=0;total=0
    for size in range(3,7):
        for rest in itertools.combinations(range(1,10),size-1):
            T=(0,)+rest
            P=has_P(T)
            c,f=search(T,5 if P else 4,12)
            total+=c
            if P:
                nP+=1
                if f: bad+=1; print("COUNTEREXAMPLE",T,f[:2])
            else:
                nonP+=1
                if f: nonPfound+=1
    print("subsets P",nP,"with failure",bad,"| nonP",nonP,"with rank-2 failure found (d<=4)",nonPfound,"| configs",total)
if __name__=="__main__": main()
