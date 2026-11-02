#!/usr/bin/env python3
"""Referee B: c(delta), B_k, B^free_k, the (5,8) weight check. Written independently of ../math."""
import itertools, sys, time
S  = (-4,-1,0,1,4)
S1 = (-1,0,1)
I0 = (-4,-1,0,1,3)
Iinf=(-3,-1,0,1,4)

def cfun(S):
    s=set(S); D=max(S)-min(S)
    return {d: len(s & {x+d for x in s}) for d in range(-D-1,D+2)}

def Bk(S,k,maxgap=None):
    """max Bud over k-sets. A gap > span(S) means no cross pair contributes, so shrinking
    such a gap to span+1 keeps Bud: a maximiser exists with all gaps <= span+1."""
    c=cfun(S); span=max(S)-min(S)
    G=maxgap if maxgap else span+1
    get=lambda d:c.get(d,0)
    best=-1;arg=None
    A=[0]
    def rec(A,v):
        nonlocal best,arg
        if len(A)==k:
            if v>best: best=v;arg=tuple(A)
            return
        last=A[-1]
        for g in range(1,G+1):
            x=last+g
            w=v+sum(get(x-a) for a in A)
            A.append(x); rec(A,w); A.pop()
    rec(A,0)
    return best,arg

def free(Bs,kmax):
    """max over partitions of k into sheets of sum B_part + cross pairs"""
    out={}
    def parts(n,m=None):
        m=m or n
        if n==0: yield []; return
        for x in range(min(n,m),0,-1):
            for r in parts(n-x,x): yield [x]+r
    for k in range(1,kmax+1):
        best=-1;barg=None
        for p in parts(k):
            cross=(k*k-sum(x*x for x in p))//2
            v=sum(Bs[x] for x in p)+cross
            if v>best: best=v;barg=p
        out[k]=(best,barg)
    return out

if __name__=="__main__":
    t=time.time()
    for name,T,kmax in (("S",S,8),("S1",S1,8),("In0",I0,7),("Inf",Iinf,7)):
        c=cfun(T)
        print(name,T,"c=",{d:v for d,v in sorted(c.items()) if d>0 and v})
        Bs={1:0}
        for k in range(2,kmax+1):
            b,a=Bk(T,k); Bs[k]=b
            print(f"  B_{k}={b} arg={a} [{time.time()-t:.1f}s]",flush=True)
        # robustness: larger gap bound for small k
        for k in range(2,min(kmax,5)+1):
            b,_=Bk(T,k,maxgap=25 if k<=4 else 16)
            assert b==Bs[k],(k,b)
        print("  free",free(Bs,kmax))
    # (5,8) weight check, written from the incidence table, not from the text's list:
    # rows 0..4, lines: W1={0,1,2} x2, W2={0,3,4} x2, 13,14,23,24.
    lines=[{0,1,2},{0,1,2},{0,3,4},{0,3,4},{1,3},{1,4},{2,3},{2,4}]
    s=set(S)
    def col_options(a,Zset):
        A=[i for i in range(5) if i not in Zset]
        bs=[]
        for b in range(min(S)-max(a),max(S)-min(a)+1):
            if all(a[i]+b in s for i in A): bs.append(b)
        return bs
    cnt=0; sat=0; sat_nodistinct=0; tested=0
    near=[]
    W=16
    for a in itertools.product(range(-W,W+1),repeat=4):
        a=(0,)+a
        if len(set(a))<5: continue
        # quick filters only via c>0 needs; do the real test
        # W1 twice: two distinct b with a3+b,a4+b in S
        o=[col_options(a,L) for L in lines]
        if len(o[0])<2 or len(o[2])<2: continue
        if not all(o[4:]): continue
        tested+=1
        # distinct assignment (bipartite matching: 8 slots to distinct integers)
        # backtrack
        order=sorted(range(8),key=lambda i:len(o[i]))
        used=set()
        def go(j):
            if j==8: return True
            for b in o[order[j]]:
                if b in used: continue
                used.add(b)
                if go(j+1): used.discard(b); return True
                used.discard(b)
            return False
        if go(0): sat+=1; near.append(a)
    print("(5,8) window |a_i|<=%d: tuples passing the per-column filter:%d, with 8 distinct column weights:%d"%(W,tested,sat),near[:5])
    print("time",time.time()-t)
