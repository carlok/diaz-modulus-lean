# Entry 17, verification: D. Roy, M. Waldschmidt,

- **Source read:** D. Roy, M. Waldschmidt, Ann. Sci. ENS (4) 30 (1997), no. 6, 753-796, Th. 0.2 p. 755 (page image read), proof p. 791, Cor. 7.4 p. 792. PDF opened: https://www.numdam.org/item/10.1016/s0012-9593(97)89938-7.pdf
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** ou bien le corps Q(λ1,…,λn) est de degré de transcendance ≥ 2 sur Q

**Hypotheses.** Field: P has rational coefficients (page image shows Q in Th. 0.2, against Q-bar in Conj. 0.3); ours are rational. Coordinates lie in the set of logarithms: log 2, log 3, iπ, t, and iγ/π if assumed algebraic exponential. Homogeneity is required, and the target's relations are inhomogeneous; eliminating the constant r, s fixes this. Dimension: n=3, no constraint. Conjugation and genericity: not used by the theorem. The target's trdeg ≤ 1 is automatic from its relations. Abstract p. 753 gives only the Q-independent case, weaker than p. 755 but enough for the log 2 / log 3 pair.

**Explanation.** Not printed; follows from Th. 0.2. Nearest print, Cor. 7.4's log 2 example, gives nothing here.

Put z=iπ, r=t0²+π², s=t1²+π²; r,s>0 rational; t0,t1≠0 (π² irrational). P=sX²−rY²+(r−s)Z² is nonzero and vanishes at (t0,t1,z). Since t²=r+z², trdeg ≤1. So Th. 0.2 gives a rational subspace T with point ∈ T ⊂ V.

Real and imaginary parts: any Q-relation has no z term. If t0,t1 are Q-independent, T=C³, forcing P=0: contradiction. So t1=qt0, T⊇{(a,qa,c)}, and P vanishing there gives r=s, hence q²=1, t1=±t0. This is torsion_rational_modulus_unique.

log 2, log 3 are Q-independent: the pair statement.

Third: if w=iγ/π∈ℒ, γ≠0, r=t²+π²: P=γ(X²−Z²)+rWZ vanishes at (t,z,w), as zw=−γ. Trdeg ≤1. The point is Q-independent (π² irrational), so T=C³, P=0, contradicting γ≠0.

Independent of this work; the deduction takes a few lines.
