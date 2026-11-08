# Entry 7, verification: Y. Ishitsuka, A positive

- **Source read:** Y. Ishitsuka, A positive proportion of cubic curves over Q admit linear determinantal representations, arXiv:1512.05167v3 (PDF opened, https://arxiv.org/pdf/1512.05167): Def. 5.1, Thm 5.2 p. 11, Prop. 6.1 pp. 12-13, Ex. 6.3 p. 13. Published version not read.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "the conic C has a unique equivalence class of linear determinantal representations over k"

**Hypotheses.** Applies to the first clause only. Field: any k, so a subfield K of C is allowed. Size: Definition 5.1 uses d x d matrices, here 2 x 2, with equivalence M' = AMB, A,B in GL_d(k), which matches GL2 x GL2. Smoothness and a rational point hold: yz = rho x^2 has rho != 0, char 0, and K-point [0:1:0]. Conjugation: absent from the source; bar-u enters only as rho/u, and K need not be conjugation-stable. Genericity: absent from the source. Transcendence of u is needed in my step 1, supplied by the target's own hypothesis. The source's conic is K-rational data; (1:u:bar-u) is a non-K point of it. The source knows nothing of candidates, logarithms, H0 + Qbar w, or the extra variables w_1..w_m. Source is a preprint v3 on arXiv; journal details were not confirmed (arXiv API returned 429, zbMATH failed on SSL), and Theorem 5.2's proof is labelled a sketch.

**Explanation.** Citation is accurate, but gives only the one-orbit clause, by my argument. Not covered: candidate/logarithm clause, iπ relation, no_vanishing_coeff (assumes only u∉K), w_i variants.

Derivation. Write (x_i y_j) = A+uB+ūC, with A,B,C over K. Rank ≤1 gives F=det(xA+yB+zC) vanishing at (1,u,ρ/u).
1. Transcendence: expanding in u, F = c(yz−ρx²), c∈K (the norm-form lemma, not in the source).
2. c≠0: otherwise the pencil has rank ≤1, so a common left or right kernel w∈K²; then Σw_i x_i=0 or Σw_j y_j=0, contradicting independence.
3. Prop. 6.1: xA+yB+zC = P·[[y,ρx],[x,z]]·Q, P,Q∈GL₂(K).
4. At (1,u,ū) the middle matrix is (u,1)ᵀ(1,ū); rank-one factorisation is unique up to μ, giving the normal form. Converse is direct.
Constant terms: then P·[[0,ρ],[1,0]]·Q, invertible. Singular-pencil clause is step 1, an input, not output.

Elementary, so the source adds little beyond steps 1-2. Entry stays not found as a whole; add as attribution for uniqueness.
