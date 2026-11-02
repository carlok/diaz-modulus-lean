#!/usr/bin/env python3
"""Step 1. Exact first-order analysis of M0 over V_eps.
Grade k of an entry (i,j): exponent s' = a_i+b_j+k.
Checks: M0 data, rank, left/right kernels; the full tangent condition (all grades), and the grade-1 system with eps-dot."""
import sympy as sp
from sympy import Rational as R, Matrix
T=sp.symbols('T')
aw=[0,1,2,3,4]; bw=[-5,-4,-3,-2,-1,-1,0,1]
Mz=Matrix([
 [0,-T**-4,0,0,T**-1,0,-1,T],
 [T**-4,0,0,-R(1,2)*T**-1,0,1,-T,0],
 [0,0,T**-1,1,2*T,0,0,2*T**3],
 [0,-2*T**-1,-1,-T,0,0,-2*T**3,0],
 [2*T**-1,2,T,0,0,2*T**3,0,0]])
C=Matrix(5,8,lambda i,j: sp.simplify(Mz[i,j]/T**(aw[i]+bw[j])))
assert all(c.is_number for c in C), C
IN0=[-4,-1,0,1,3]
for i in range(5):
  for j in range(8):
    if C[i,j]!=0: assert aw[i]+bw[j] in IN0
print("C=",C.tolist()); print("rank C",C.rank())
L=C.T.nullspace(); Rk=C.nullspace()
print("left kernel dim",len(L),"right kernel dim",len(Rk))
print("L=",[list(v) for v in L])
# tangent space in each grade k, including grade 1 with eps-dot (a,b)
def eqs(k):
    """unknown x_ij for entries with a_i+b_j+k in IN0. Equations lambda e rho=0. Returns (A, rhs_a, rhs_b, varlist)."""
    var=[(i,j) for i in range(5) for j in range(8) if aw[i]+bw[j]+k in IN0]
    A=sp.zeros(len(L)*len(Rk),len(var)); ra=sp.zeros(len(L)*len(Rk),1); rb=sp.zeros(len(L)*len(Rk),1)
    r=0
    for l in L:
      for q in Rk:
        for n,(i,j) in enumerate(var): A[r,n]=l[i]*q[j]
        if k==1:
          for i in range(5):
            for j in range(8):
              s=aw[i]+bw[j]
              if s==3: ra[r]+=l[i]*C[i,j]*q[j]
              if s==-4: rb[r]+=l[i]*C[i,j]*q[j]
        r+=1
    return A,ra,rb,var
tot=0
for k in range(-10,11):
    A,ra,rb,var=eqs(k)
    if not var: 
        print("k",k,"vars 0"); 
        if k!=1: continue
    rk=A.rank() if var else 0
    print("grade",k,"vars",len(var),"rank",rk,"dim tangent (Rep part)",len(var)-rk)
    tot+=len(var)-rk
    if k==1:
        Aug=A.row_join(ra).row_join(rb)
        print("  rank [A|ra|rb]",Aug.rank(),"rank[A|ra]",A.row_join(ra).rank(),"rank[A|rb]",A.row_join(rb).rank())
        cok=A.T.nullspace()
        print("  cokernel dim",len(cok))
        for w in cok:
            print("  pairing: a*",(w.T*ra)[0]," + b*",(w.T*rb)[0])
print("dim T_{M0} X_0 (all grades)=",tot," (Rep dim 200)")
