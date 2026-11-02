#!/usr/bin/env python3
"""The 4x4 certificate, all coefficients free. Rows of weight 0,2,3,4; columns of weight -1,-1,0,1 (indices 4,5,6,7 of M0).
Positive-grade form over V=span(1,T,1/T,w=T^3+aT^4,T^-4+bT^-3), grade-0 part = C.
Entries are written directly (only exponents >= a_i+b_j, and the two linked pairs). Then: identity  a*E4 - E5 - a^2*E3 = -2*a^3 (up to a factor)."""
import sympy as sp
T,a=sp.symbols('T a')
w=T**3+a*T**4
p,q,r,p2,q2,r2,q3,r3,rho,r5,r6,g,al,al2=sp.symbols('p q r p2 q2 r2 q3 r3 rho r5 r6 g al al2')
A=1/T+p+q*T+r*w          # (0,c1) s=-1, C=1
A2=p2+q2*T+r2*w          # (0,c2) s=-1, C=0
Gm=-1+q3*T+r3*w          # (0,c3) s=0,  C=-1
E=T+rho*w                # (0,c4) s=1,  C=1
M=sp.Matrix([
 [A,A2,Gm,E],
 [2*T+r5*w, r6*w, g*w, 2*w],   # weight 2: s=1,1,2,3; C=2,0,0,2
 [al*w, al2*w, -2*w, 0],       # weight 3: s=2,2,3,4; C=0,0,-2,0
 [0, 2*w, 0, 0]])              # weight 4: s=3,3,4,5; C=0,2,0,0
det=sp.expand(M.det(method='berkowitz'))
quot=sp.cancel(det/(4*w**2))   # rank<=3 means det=0 ; det = 4 w^2 * F up to sign
F=sp.expand(quot)
print("det/(4w^2) as polynomial in T; lowest powers:")
P=sp.Poly(sp.expand(F*T**0),T) if F.is_polynomial(T) else None
co={}
for t in sp.Add.make_args(F):
    c,rest=t.as_independent(T)
    e=sp.degree(rest,T) if rest!=1 else 0
    co[int(e)]=co.get(int(e),0)+c
for e in sorted(co)[:5]: print(" T^%d:"%e,sp.factor(co[e]))
lo=min(co)
E3,E4,E5=[co.get(lo+i,0) for i in range(3)]
print(" a*(T^%d) - (T^%d) - a^2*(T^%d) ="%(lo+1,lo+2,lo),sp.factor(sp.expand(a*E4-E5-a**2*E3)))
print("  (no free coefficient survives, so vanishing of the minor forces a^3=0)")
# confirm the block's C is C0 restricted
from liftlib import C0
print(" C block:",C0.extract([0,2,3,4],[4,5,6,7]).tolist())
b=sp.Symbol('b')
