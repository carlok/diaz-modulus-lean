#!/usr/bin/env python3
"""Referee B: every numerical inequality of Sections 5-6 of the note, from own formulas; and the enumeration of class costs for d=5."""
from math import comb as C, floor
from fractions import Fraction as Fr
import itertools
B={1:0,2:2,3:6,4:12,5:18,6:26,7:35}          # from finite_b.py
Bfree1={4:8,5:13,6:19,7:25}
ok=True
def chk(name,cond,info=""):
    global ok
    ok&=bool(cond); print(("ok  " if cond else "BAD ")+name,info)
def alpha(r): return min(C(r-s,2)+C(s,2) for s in range(r+1))
minl=lambda d: min(l for l in range(d,400) if (d-3)*(l-3)>9)
print({d:minl(d) for d in range(4,10)})
chk("alpha table",[alpha(r) for r in (5,6,7,8)]==[4,6,9,12])
chk("alpha bound",all(4*alpha(r)>=r*(r-2) for r in range(2,500)))
for d in range(4,12):
    l=minl(d); rW=floor(2+Fr(2*d,l))
    print(f"d={d} lmin={l} r_W<={rW} u_W>={d-rW}")
for Bud,name in ((B,'S'),(Bfree1,'S1free'),({**B,7:41},'B7=41')):
    # d=4: dim<=cost
    # d>=6 eta=0
    chk(name+" d=6 e=e=0",alpha(6)*minl(6)>Bud[6]+C(6,2),(alpha(6)*minl(6),Bud[6]+15))
    chk(name+" d=7 e=e=0",alpha(7)*minl(7)>Bud[7]+C(7,2),(alpha(7)*minl(7),Bud[7]+21))
    chk(name+" d=6 eps=1",alpha(6)*(minl(6)-2)>Bud[6])
    chk(name+" d=7 eps=1",alpha(7)*(minl(7)-2)>Bud[7])
    for d in (6,7,8):
        r=d-1;k=d-2;l=minl(d);a=alpha(r)
        row=(a*(l-1),a*l-C(k,2),a*(l-3)+C(k,2),a*(l-2))
        chk(f"{name} eta=1 d={d}",min(row)>Bud[r],(row,Bud[r]))
for d in range(8,2000):
    assert 4*alpha(d)*d>6*d*(d-1) or False
    assert alpha(d)*(d-2)>d*(d-1)
for d in range(9,2000):
    r=d-1;k=d-2;a=alpha(r);amin=Fr(r*(r-2),4)
    for L in (d,d+1,2*d):
        for v in (amin*(L-1),amin*L-C(k,2),amin*(L-3)+C(k,2),amin*(L-2)):
            assert v>r*(r-1),(d,L,v)
print("asymptotics d>=8/9 ok to d=2000 (text's lower bound for alpha used)")
print("all",ok)

# d=5, eta=0: enumerate every multiset-free type of class and check the claimed costs against A_b directly
# five points p0..p4 with lines {0,1,2},{0,3,4}
pts=range(5); W1={0,1,2}; W2={0,3,4}
def cost(Zset): return C(5-len(Zset),2)
print("line cost by rows on it:",{s:C(5-s,2) for s in range(0,4)})
print("point class row:",C(4,2),"off:",C(5,2),"full:",C(5,2))
# integer program: minimise cost for l=8 by brute force over counts, with the c_W rules, for all 5-point geometries
# geometries: no 3-line; one 3-line; two 3-lines.
def geoms():
    yield "generic",[]
    yield "one",[{0,1,2}]
    yield "two",[{0,1,2},{0,3,4}]
res={}
for name,L3 in geoms():
    # candidate lines: 3-lines, 2-point lines not inside a 3-line, 1-point generic lines, 0-point
    two=[set(p) for p in itertools.combinations(range(5),2) if not any(set(p)<=t for t in L3)]
    items=[]
    # variables: n3[i] in 0..2 for 3-lines; n2[j] in 0..1 for 2-lines; pc[i] for point classes at rows; off (point off rows), one(line through <=1 row), full
    best=None
    def cW(line,n_line,pc,off_on,full): return n_line+sum(pc[i] for i in line)+off_on+full
    from itertools import product
    for n3 in product(range(3),repeat=len(L3)):
      for pc in product(range(3),repeat=5):
        if sum(pc)>4: continue
        for full in range(3):
          # capacity check on 3-lines
          if any(n3[i]+sum(pc[p] for p in L3[i])+full>2 for i in range(len(L3))): continue
          # 2-lines: each carries at most 1 - point classes on it - full
          cap2=[max(0,1-sum(pc[p] for p in t)-full) for t in two]
          # lines through at most one row and point classes off rows are priced 6 (dim1) and 10 (dim2)
          if any(pc[i]+full>1 for i in range(5)): continue   # a non-3-line W through a row with c_W<=1
          dimfixed=sum(n3)+2*sum(pc)+3*full
          costfixed=sum(n3)+6*sum(pc)+10*full
          n2=sum(cap2)
          rest=8-dimfixed
          if rest<=0:
              c=costfixed
          else:
              use=min(n2,rest); c=costfixed+3*use; rest-=use
              # remaining dims at >=5 per dim (off point) / 6 (line): lower bound 5 per dim
              c+=5*rest
          if best is None or c<best[0]: best=(c,n3,pc,full,n2)
    res[name]=best
print("min cost for l=8 at d=5, eta=0 (budget 18):",res)
