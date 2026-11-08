# Entry 17, verification: D. Roy, M. Waldschmidt,

- **Source read:** Roy, Waldschmidt, Ann. Sci. ENS (4) 30 (1997), 753-796; opened given link: https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/ASENS_1997_4_30_6_753_0.pdf. Th. 0.2 checked on page image p. 755; proof pp. 790-791 by text layer.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "le corps Q(λ1,...,λn) est de degré de transcendance ≥ 2"

**Hypotheses.** Field: the derivation uses only rational coefficients, so the scan's unclear Q versus Q̄ in Th. 0.2 (no overline visible on p. 755, though Conj. 0.3 has one) does not matter. I assumed the weaker Q̄-subspace reading. Dimension: n = 3. Coordinates: t, iπ and iγ/π are in ℒ, the last by the contrary hypothesis. Transcendence degree: all are algebraic over Q(π), so it is 1 and the alternative fails. Homogeneity: arranged by eliminating the constant. Conjugation and genericity: not used; there is no candidate u or hull here. Extra input: Gelfond-Schneider, which is classical.

**Explanation.** Th. 0.2 is there; its proof is at p. 791. The target is not printed. Nearest: the example after Cor. 7.4 (p. 792) on exp√((log 2)²+π²). Derivation. Lemma: P of rank 3 in 3 variables has isotropic subspaces of dimension ≤1, so the point lies on an algebraic line; then t/(iπ)=z is algebraic. Since e^{iπz}=e^t is algebraic, Gelfond-Schneider gives z∈Q; t real gives t=0.
Uniqueness: a=t0²+π², b=t1²+π² rational, positive. Point (t0,t1,iπ), P=bX1²−aX2²+(a−b)X3². If a≠b, rank is 3, so t0=t1=0, whence a=b: contradiction. So t1=±t0.
Log 2, log 3: immediate, as log 3≠±log 2.
Boundary: suppose s=iγ/π∈ℒ, γ≠0, t≠0, a=t²+π². Then s·iπ=−γ. Point (t,iπ,s), P=γX1²−γX2²+aX2X3, rank 3, forcing t=0: contradiction.
