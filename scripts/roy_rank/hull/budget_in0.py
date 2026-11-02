#!/usr/bin/env python3
"""c(delta), B_k and every numerical inequality of the budget part of Thm 3 of the text, redone for in0."""
import itertools, math
S={-4,-1,0,1,3}
def c(x): return sum(1 for s in S if s+x in S)
print("c:",{x:c(x) for x in range(1,9)})
print("(P):",all(c(x)<=2 for x in range(1,20)))
G=max(S)-min(S)+1
def B(k):
    best=0;arg=None
    for g in itertools.product(range(1,G+1),repeat=k-1):
        A=[0]
        for x in g:A.append(A[-1]+x)
        v=sum(c(y-x) for x,y in itertools.combinations(A,2))
        if v>best:best=v;arg=A
    return best,arg
Bk={}
for k in range(2,8):
    r=B(k); Bk[k]=r[0]; print("B",k,r)
for k in range(8,40): Bk[k]=k*(k-1)   # upper bound from (P), used for k>=8
C=lambda n,k:math.comb(n,k)
alpha=lambda r:min(C(r-s,2)+C(s,2) for s in range(0,r+1))
print("alpha",{r:alpha(r) for r in range(4,10)})
ok=True
def chk(name,lhs,rhs):
    global ok
    v=lhs>rhs; ok&=v
    print(f"  {name}: cost {lhs} > budget {rhs}: {v}")
print("d=4: l<=B4",Bk[4],"against l>=13:",Bk[4]<13)
for d in range(6,31):
    lmin=max(d, 3+9//(d-3)+1)   # (d-3)(l-3)>9, l>=d
    rho=d-1;k=d-2
    if d<=9 or d==30: print("d",d,"lmin",lmin)
    if d>=7 or d==6:
        res=[]
        res.append(("eta0 eps0",alpha(d)*lmin,Bk[d]+C(d,2)))
        res.append(("eta0 eps1",alpha(d)*(lmin-2),Bk[d]))
        res.append(("eta1 eps0 Lcol",alpha(rho)*(lmin-1),Bk[rho]))
        res.append(("eta1 eps0 Lnot",alpha(rho)*lmin-C(k,2),Bk[rho]))
        res.append(("eta1 eps1 Lcol",alpha(rho)*(lmin-3)+C(k,2),Bk[rho]))
        res.append(("eta1 eps1 Lnot",alpha(rho)*(lmin-2),Bk[rho]))
        for n,a,b in res:
            if d<=9 or a<=b: 
                print(f"   {n}: cost {a} budget {b} excluded {a>b}")
            if d>=7: ok&= a>b
print("all excluded for 7<=d<=30:",ok)
