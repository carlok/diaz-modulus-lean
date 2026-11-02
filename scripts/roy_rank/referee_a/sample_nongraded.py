"""Referee A: random NON-graded rank-<=2 matrices M_Pi = basis of (2-plane Pi in F^d) ∩ V_Sigma^d (universal: every rank-2 matrix
is a column subset of some M_Pi, and theta only grows with columns). Certified lower bound for theta(M_Pi) vs gmax(Sigma,d,l)."""
import sys, random, time, itertools
import numpy as np
from fractions import Fraction as Fr
from lib_a import *
from gmax import gmax

def pmul(f,g):
    h={}
    for a,x in f.items():
        for b,y in g.items():
            h[a+b]=h.get(a+b,0)+x*y
    return {k:v for k,v in h.items() if v}
def padd(f,g,s=1):
    h=dict(f)
    for k,v in g.items():
        h[k]=h.get(k,0)+s*v
    return {k:v for k,v in h.items() if v}

def plane_section(U,S):
    """U: list of d rows, each (f,g) Laurent polys. Return basis (list of columns as dict sigma->vector) of {v in V_S^d : v in F-span of U}."""
    d=len(U); S=sorted(S); ns=len(S); nv=d*ns
    idx=lambda i,s:i*ns+S.index(s)
    cons={}
    # 3x3 minors of (U|v) are linear in v
    for (i,j,k) in itertools.combinations(range(d),3):
        def m(p,q): return padd(pmul(U[p][0],U[q][1]),pmul(U[p][1],U[q][0]),-1)
        mjk,mik,mij=m(j,k),m(i,k),m(i,j)
        row={}
        for (r,mm,sg) in ((i,mjk,1),(j,mik,-1),(k,mij,1)):
            for e,c in mm.items():
                for s in S:
                    row.setdefault(e+s,{})
                    row[e+s][idx(r,s)]=row[e+s].get(idx(r,s),0)+sg*c
        for key,dct in row.items():
            v=tuple(sorted(dct.items()))
            cons[((i,j,k),key)]=dct
    rows=[]
    seen=set()
    for dct in cons.values():
        r=[0]*nv
        for a,b in dct.items(): r[a]=b
        t=tuple(r)
        if any(t) and t not in seen:
            seen.add(t); rows.append(r)
    if d==2 or not rows:
        basis=[[Fr(int(a==b)) for a in range(nv)] for b in range(nv)]
    else:
        basis=nullspace(rows,nv)
    return basis,S,ns
def to_matrix(basis,S,ns,d):
    from math import lcm
    l=len(basis)
    M={s:np.zeros((d,l),dtype=np.int64) for s in S}
    for j,v in enumerate(basis):
        den=1
        for x in v: den=lcm(den,x.denominator)
        for i in range(d):
            for si,s in enumerate(S):
                M[s][i,j]=int(v[i*ns+si]*den)
    return M
def rand_poly(rng,supp,nterm):
    ts=rng.sample(supp,min(nterm,len(supp)))
    return {t:rng.choice([-3,-2,-1,1,1,2,3]) for t in ts}
def gen_U(rng,S,d):
    """row i = T^{a_i}*(f_i,g_i), f,g sparse with small supports, a_i so that many products land in S"""
    D=sorted({s-t for s in S for t in S})
    mode=rng.random()
    U=[]
    if mode<0.5:
        # two global vectors x,y of sparse polys: row i=(x_i,y_i)
        pool=sorted(set(S)|set(D))
        for i in range(d):
            U.append((rand_poly(rng,pool,rng.choice([1,1,2])),rand_poly(rng,pool,rng.choice([1,1,2]))))
    elif mode<0.8:
        # graded plane deformed: rows T^{a_i}(p_i + c T^e q_i)
        e=rng.choice([x for x in D if x!=0] or [1])
        for i in range(d):
            a=rng.choice(D)
            p=(rng.randint(-2,2),rng.randint(-2,2))
            q=(rng.randint(-1,1),rng.randint(-1,1))
            f={a:p[0]}; g={a:p[1]}
            f=padd(f,{a+e:q[0]}); g=padd(g,{a+e:q[1]})
            U.append(({k:v for k,v in f.items() if v},{k:v for k,v in g.items() if v}))
    else:
        # powers of (T+c): Mobius-like
        c=rng.choice([-2,-1,1,2]); base={0:c,1:1}
        pw=[{0:1}]
        for _ in range(4): pw.append(pmul(pw[-1],base))
        for i in range(d):
            U.append((pw[rng.randint(0,4)],pmul(pw[rng.randint(0,2)],{rng.choice(D):1})))
    if any(not f and not g for f,g in U): return None
    return U
def naive_form(M):
    """entrywise lowest term"""
    d,l=next(iter(M.values())).shape
    N={s:np.zeros((d,l),dtype=np.int64) for s in M}
    for i in range(d):
        for j in range(l):
            for s in sorted(M):
                if M[s][i,j]:
                    N[s][i,j]=M[s][i,j]; break
    return N
def is_mono(M):
    d,l=next(iter(M.values())).shape
    return all(sum(1 for s in M if M[s][i,j])<=1 for i in range(d) for j in range(l))
def main(seed,budget):
    rng=random.Random(seed); npr=np.random.default_rng(seed)
    Sets=[[0,1,2],[0,1,3],[-1,0,1],[0,1,2,3],[0,1,2,4],[0,1,3,4],[-4,-1,0,1,4],[-4,-1,0,1,3],[0,1,2,3,4]]
    t0=time.time(); stats={}; viol=[]; ex=[]
    while time.time()-t0<budget:
        S=rng.choice(Sets); d=rng.choice([3,3,4,4,5])
        U=gen_U(rng,S,d)
        if U is None: continue
        basis,SS,ns=plane_section(U,S)
        l=len(basis)
        if l<2 or l>8: 
            stats['skip_l']=stats.get('skip_l',0)+1; continue
        M=to_matrix(basis,SS,ns,d)
        n=rank_F(M,rng)
        if n==0 or n>2: 
            stats['rank_bad']=stats.get('rank_bad',0)+1; continue
        lb=theta_lb(M,npr,maxrows=60)
        if lb==0:
            stats['theta0']=stats.get('theta0',0)+1; continue
        if d>=5 and l>=7: 
            pass
        g,wit=gmax(S,d,l)
        key=(tuple(S),d,l)
        st=stats.setdefault(key,[0,0,0,0])
        st[0]+=1
        if lb==g: st[1]+=1
        nm=not is_mono(M)
        if nm: st[2]+=1
        nf=naive_form(M); lbn=theta_lb(nf,npr,maxrows=40)
        if lbn<lb: st[3]+=1
        if nm and lb==g and lbn<lb and len(ex)<6:
            ex.append((S,d,l,str(lb),str(lbn),{s:M[s].tolist() for s in M},wit))
        if lb>g:
            viol.append((S,d,l,str(lb),str(g),n,{s:M[s].tolist() for s in M},U))
            print("VIOLATION",viol[-1],flush=True)
    print("key: (Sigma,d,l): samples, theta_lb==gmax, nonmono basis, naive form lost theta")
    for k,v in sorted(stats.items(),key=str): print(k,v)
    print("violations",len(viol))
    print("examples:")
    for e in ex: print(e)
main(int(sys.argv[1]),float(sys.argv[2]))
