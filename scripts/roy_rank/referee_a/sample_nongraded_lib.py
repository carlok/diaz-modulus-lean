import random
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

def rand_poly(rng,supp,nterm):
    ts=rng.sample(supp,min(nterm,len(supp)))
    return {t:rng.choice([-3,-2,-1,1,1,2,3]) for t in ts}
