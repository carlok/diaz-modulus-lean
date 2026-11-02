#!/usr/bin/env python3
"""Elementary rank-one count over V(c,c'). A 2x2 rank-one block over V is a relation v1 v4 = v2 v3, an element of rank<=4 in I_2(V)=ker(Sym^2 V -> K).
2x3 rank-one blocks are excluded by (P) via Thm 2. Here dim I_2 for V(c,c'), in0, S, plus (c,c') special values."""
import sympy as sp, itertools
T,c,cp=sp.symbols('T c cp')
def Vc(c,cp): return [sp.Integer(1),T,1/T,T**4+c*T**3,T**-4+cp*T**-3]
def I2(V,sub=None):
    prods=[(i,j) for i in range(5) for j in range(i,5)]
    exps=range(-8,9)
    M=sp.zeros(len(exps),len(prods))
    for n,(i,j) in enumerate(prods):
        p=sp.expand(V[i]*V[j])
        for m,e in enumerate(exps):
            M[m,n]=p.coeff(T,e)
    return prods,M
for name,V in [("generic c,c'",Vc(c,cp)),("in0",[1,T,1/T,T**3,T**-4]),("S",[1,T,1/T,T**4,T**-4]),("c=2,c'=3",Vc(2,3)),("c=1,c'=-1",Vc(1,-1)),("c=-1,c'=-1",Vc(-1,-1))]:
    prods,M=I2(V)
    ns=M.nullspace()
    print(name,"dim V.V =",M.rank(),"dim I_2 =",len(ns))
    for v in ns[:6]:
        print("   ",[(prods[i],sp.simplify(v[i])) for i in range(len(prods)) if sp.simplify(v[i])!=0])
