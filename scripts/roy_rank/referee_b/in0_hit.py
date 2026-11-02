#!/usr/bin/env python3
"""The hit of attack.py over In0 = {-4,-1,0,1,3}: exact verification."""
from fractions import Fraction as Fr
from exact import analyse, perp, rank, brute_random_subpairs
S={-4,-1,0,1,3}
a=[0,1,2,3,4]
# lines {0,2,3},{1,3,4} meet in row 3
P=[None]*5
P[3]=(0,0,1); P[0]=(1,0,1); P[2]=(2,0,1); P[1]=(0,1,1); P[4]=(0,2,1)
xs=[tuple(map(Fr,p)) for p in P]
ys=[];b=[]
for bb in sorted({s-w for s in S for w in a}):
    Z=[x for x,w in zip(xs,a) if w+bb not in S]
    ann=perp(Z,3)
    for y in ann: ys.append(y);b.append(bb)
r=analyse(xs,a,ys,b,S)
print("d,l",r['d'],r['l'],"rank",r['rank'],"free",r['free_rows'],r['free_cols'],"theta",r['theta'],"fails",r['fails'],"(d-n)theta",(r['d']-r['rank'])*r['theta'])
print("col weights",b)
print("col lines",[tuple(str(c) for c in y) for y in ys])
for i,row in enumerate(r['C']):
    print(" row weight",a[i],[ (f"{c}*T^{a[i]+b[j]}" if c!=0 else "0") for j,c in enumerate(row)])
print("min over U of 2(l-c)-3r:",min(2*(r['l']-c)-3*rr for _,rr,c in r['table']))
print("stable:",all(r['d']*(r['l']-c)>r['l']*rr or (rr==r['d'] and c==0) for _,rr,c in r['table']))
print("random non-homog subpairs below theta:",brute_random_subpairs(xs,a,ys,b,r['theta'],2000))
# rank over F directly: substitute T=2,3,5 as a check of rank <=3 and rank>=3
import random
for T in (2,3,7):
    M=[[c*Fr(T)**(a[i]+b[j]) for j,c in enumerate(row)] for i,row in enumerate(r['C'])]
    print(" rank at T=%d:"%T,rank(M,r['l']))
# S comparison: same incidence pattern with the weight tuple forced by the pairs
