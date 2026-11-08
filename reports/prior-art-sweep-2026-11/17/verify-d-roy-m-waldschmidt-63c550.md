# Entry 17, verification: D. Roy, M. Waldschmidt,

- **Source read:** Roy, Waldschmidt, Ann. Sci. ENS (4) 30 (1997), 753-796, Th. 0.2 p. 755 (page image read), proof p. 791 via Th. 7.1 p. 790. PDF opened: https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/ASENS_1997_4_30_6_753_0.pdf. EuDML page not opened.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** ou bien le corps Q(λ1,...,λn) est de degré de transcendance ≥ 2 sur Q

**Hypotheses.** Field: P has rational coefficients (page image p. 755), and every P used below is rational, using r, s, γ in Q. Dimension: n = 3, with P a non-zero quadratic form. Conjugation and genericity play no part; the only inputs are coordinates in ℒ (t, iπ, and iγ/π under the contrary assumption) and trdeg 1. No mismatch. The target's phrase about 'open boundary statements' is a gloss I could only check through the corollary as stated.

**Explanation.** Not printed; nearest is Cor. 7.4's log 2, π example (different claim). All three follow in one step. If trdeg<2, the point lies in a rational subspace inside V.

Assume r=t0²+π², s=t1²+π² rational. Then t0,t1≠0 (π² irrational), r,s>0. P=sX²−rY²+(r−s)Z² vanishes at (t0,t1,iπ), P≠0, trdeg 1.

If t0,t1 are Q-independent, the coordinates are independent, so the subspace is C³: contradiction. Otherwise t1=qt0, and the subspace contains {(a,qa,c)}. The c² coefficient forces r=s, so t1=±t0. Since log 3≠±log 2, the pair is not both rational.

Third: t≠0, r=t²+π² rational, γ≠0; suppose e^{iγ/π} algebraic. P=γX²−γY²+rYW vanishes at (t,iπ,iγ/π): γr−rγ=0. Trdeg 1. Independence: at+biπ+ciγ/π=0 gives a=0 (real part), then bπ²=−cγ gives b=c=0. So C³: contradiction, P≠0.
