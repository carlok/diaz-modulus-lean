"""Referee A: gmax(Sigma,d,l) = best theta over graded matrices of exact size d x l, rank <=2, free rows, over V_Sigma.
Enumerates connected class configurations plus direct sums of two rank-one pieces."""
import itertools
from fractions import Fraction as Fr
from functools import lru_cache
from thm2_exhaust import set_partitions

def rank1_sizes(S):
    """all (d,l) with A+B in S, |A|=d,|B|=l; A normalised to contain 0"""
    S=frozenset(S); D=sorted({s-t for s in S for t in S if s>t})
    out={}
    # enumerate A subsets of 0+D-closure, B = intersection (S-a)
    best={}
    def rec(A,last):
        B=None
        for a in A:
            T={s-a for s in S}
            B=T if B is None else B&T
        if B:
            best[len(A)]=max(best.get(len(A),0),len(B))
            for x in D:
                if x>last:
                    rec(A+[x],x)
    rec([0],0)
    return best   # d -> max l

def conn_row_sets(S,k,W):
    """subsets of size k containing 0 as min, row-graph connected through D"""
    D={s-t for s in S for t in S if s!=t}
    res=set()
    def rec(cur):
        if len(cur)==k:
            res.add(tuple(sorted(cur))); return
        nxt=set()
        for c in cur:
            for x in D:
                y=c+x
                if y not in cur and y>=0: nxt.add(y)
        for y in nxt:
            if y<=W: rec(cur|{y})
    rec(frozenset([0]))
    return res

def best_config(S,ones,lab,twos,d,l,floor):
    """best theta>floor for this config at exact size, else floor"""
    cand=set()
    for a in list(ones)+list(twos):
        for s in S: cand.add(s-a)
    npts=max(lab)+1 if lab else 0
    f=[0]*npts; F=0
    for b in cand:
        if any(a+b not in S for a in twos): continue
        pts={lab[i] for i,a in enumerate(ones) if a+b not in S}
        if len(pts)>=2: continue
        if len(pts)==1: f[next(iter(pts))]+=1
        else: F+=1
    if sum(f)+2*F<l: return floor
    eta=len(twos); x=[eta]*npts
    for lb in lab: x[lb]+=1
    cands=sorted({Fr(a,b) for b in range(1,d+1) for a in range(1,l+1) if Fr(a,b)<=Fr(l,d) and Fr(a,b)>floor},reverse=True)
    for r in cands:
        for m in range(0,F+1):
            caps=[(Fr(l)-r*x[p]) for p in range(npts)]
            if any(c-m<0 for c in caps): break
            dims=F+m+sum(min(f[p],int(caps[p]-m)) for p in range(npts))
            if dims<l: continue
            # columns used: if dims>l drop some; generic-point constraints
            if eta>=1:
                need=m+(1 if F-m>0 else 0)
                if l-need< r*eta:
                    # try dropping free-1 columns
                    if F-m>0 and dims-(F-m)>=l and l-m>=r*eta: return r
                    continue
            return r
    return floor

def gmax(S,d,l,cache={}):
    key=(tuple(sorted(S)),d,l)
    if key in cache: return cache[key]
    S=frozenset(S); best=Fr(0); wit=None
    diam=max(S)-min(S)
    r1=rank1_sizes(S)
    # single rank one (needs all entries nonzero)
    if r1.get(d,0)>=l:
        best=Fr(l,d); wit=("rank1",d,l)
    # sum of two rank one pieces
    for d1 in range(1,d):
        d2=d-d1
        for l1 in range(1,l):
            l2=l-l1
            if r1.get(d1,0)>=l1 and r1.get(d2,0)>=l2:
                r=min(Fr(l1,d1),Fr(l2,d2))
                if r>best: best=r;wit=("sum",d1,l1,d2,l2)
    W=(d-1)*diam
    for eta in range(0,d//2+1):
        k=d-2*eta
        if k+eta==0: continue
        for wts in conn_row_sets(S,k+eta,W):
            for twos in itertools.combinations(wts,eta):
                ones=[w for w in wts if w not in twos]
                for lab in set_partitions(len(ones)):
                    if eta==0 and (max(lab)+1 if lab else 0)<2: continue
                    r=best_config(S,ones,lab,twos,d,l,best)
                    if r>best:
                        best=r;wit=("conn",tuple(ones),lab,twos)
    cache[key]=(best,wit)
    return best,wit
if __name__=="__main__":
    for S in ([0,1],[0,1,2],[0,1,3],[-1,0,1],[0,1,2,3],[-4,-1,0,1,4]):
        print(S,{(d,l):str(gmax(S,d,l)[0]) for d in (2,3,4) for l in (2,3,4,5,6)})
