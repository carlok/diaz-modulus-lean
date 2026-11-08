# Entry 2, verification: N. D. Elkies, Shimura cu

- **Source read:** N. D. Elkies, Shimura curve computations, arXiv:math/0005160v1, Section 6 (Appendix), pp. 43-45, Prop. A, Cor. B. https://arxiv.org/pdf/math/0005160v1 (PDF text layer; LNCS version not opened)
- **Accessible:** True
- **Statement present:** True
- **Relation:** analogue only
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "unique involution of P1 switching the roots of Q1 and also of Q2"

**Hypotheses.** Field: Elkies works on P1 over a field of characteristic not 2, algebraically closed where existence is claimed; Q̄ fits. Pairs of binary quadratics without a common zero match the target's coprime q1,q2 of degree at most 2 with one of degree exactly 2 (homogenised, so infinity is not a common zero). Double roots are handled as fixed points. Dimension, conjugation, genericity: absent. There is no u in C, no circle condition, no conjugation, no spaces W, no progression, no configurations. The appendix concerns only the geometry of P1.

**Explanation.** Present on p. 44: Prop. A (formulas 88, 89), continuing to Cor. B on p. 45. The appendix bears only on (c), and only partly. It never says "pencil", and neither "progression" nor Lüroth occurs in the paper. (a), (b), (d) are absent.

Printed: two quadratics without a common zero determine a unique involution switching the roots of each. Cor. B: three such admit a common involution iff their determinant vanishes. So the target's parenthetical gloss follows at once.

The normal form needs my derivation. For t↦(at+b)/(ct−a), orbits {t1,t2} satisfy c·t1t2−a(t1+t2)−b=0. Hence members X²−sXY+pY² obey cp−as−b=0. For c≠0 the pencil is ⟨cX²+bY², cXY−aY²⟩; for c=0 it is ⟨aX²+bXY, Y²⟩. Applying (89) to the first pair returns the involution (exact rational check, 1848 random cases, c≠0).

I saw only target.md, so whether this is exactly the target's "normal form", which may mean the form of W with denominator u·l1·l2, cannot be confirmed; Elkies has nothing on that. Elkies calls the two-pairs fact well known. Credit for the gloss, not a find for the entry.
