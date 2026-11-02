#!/usr/bin/env python3
"""M0: obstruction with a,b symbolic; robustness under random gauge choices and permuted factorisations; a=0 case; b=0 case; sparse certificate."""
import sympy as sp
from liftlib import *
a,b=sp.symbols('a b')
basis=lambda A,B:{-4:{-3:B},-1:{},0:{},1:{},3:{4:A}}
print("== symbolic a,b")
r=lift(C0,A0,B0,basis(a,b),10)
print("k",r['k'],"obs",r['obs'] if r['k'] else None)
print("== a=0, b symbolic"); r0=lift(C0,A0,B0,basis(0,b),12)
print("k",r0['k'],"obs",r0.get('obs'))
print("== b=0, a=1"); r1=lift(C0,A0,B0,basis(1,0),10); print(r1['k'],r1.get('obs'))
for seed in (1,2,3):
    print("== a=1,b=1 random gauge seed",seed); rs=lift(C0,A0,B0,basis(1,1),6,verbose=False,perturb=seed); print(rs['k'],rs.get('obs'))
# row/col permuted matrix: the answer must not depend on it
import random
for seed in (5,6):
    rng=random.Random(seed); pr=list(range(5)); pc=list(range(8)); rng.shuffle(pr); rng.shuffle(pc)
    C=C0.extract(pr,pc); rs=lift(C,[A0[i] for i in pr],[B0[j] for j in pc],basis(a,b),6,verbose=False); print("perm",seed,rs['k'],rs.get('obs'))
