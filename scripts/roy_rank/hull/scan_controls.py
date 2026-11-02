#!/usr/bin/env python3
"""Scan cross-checks: the 5 x 8 configuration of the note must pass; M0 must pass; a damaged version must not; the mirror set in_infinity must give the mirror hit."""
from scan_in0 import *
a=[1,17,289,4913,83521]; b=[10**6*3**i+7**i for i in range(8)]
Z=[{0,1,2},{0,1,2},{0,3,4},{0,3,4},{1,3},{1,4},{2,3},{2,4}]
Sig={a[i]+b[j] for j,L in enumerate(Z) for i in range(5) if i not in L}
zs=[(frozenset(i for i,x in enumerate(a) if x+bb not in Sig),False) for bb in sorted({s-x for s in Sig for x in a})]
sp=[frozenset({0,1,2}),frozenset({0,3,4})]
print("5x8 config:",analyse(Sig,a,None,sp,5,0,5,zs))
print("5x8 config, one line dropped from the geometry:",analyse(Sig,a,None,sp[:1],5,0,5,zs))
print("5x8 Sigma size",len(Sig))
S={-3,-1,0,1,4}
h,nt,ne,comp=scan(S,5); print("in_inf d=5: tuples",nt,"hits",len(h),h[:3])
h,nt,ne,comp=scan(S,6); print("in_inf d=6: tuples",nt,"hits",len(h),h[:3])
