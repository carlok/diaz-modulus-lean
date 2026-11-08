# Entry 7, verification: J. Sidman, G. G. Smith,

- **Source read:** J. Sidman, G. G. Smith, Linear determinantal equations for all projective schemes, arXiv:0910.2424v4 (full PDF read, Sections 1 and 3), https://arxiv.org/abs/0910.2424. Eisenbud, Geometry of Syzygies, Prop. 6.10, NOT opened: Springer paywalled, home page timed out, web search budget exhausted. Known only through Sidman-Smith's description.
- **Accessible:** True
- **Statement present:** True
- **Relation:** analogue only
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "The matrix Ω is 1-generic and its ideal I2 (Ω) of 2-minors vanishes on X"

**Hypotheses.** Field: Sidman-Smith work over an algebraically closed k of characteristic zero; the target has an arbitrary subfield K of C, or Q-bar with u transcendental, and K-rationality matters. Dimension: their matrix is s x t on a projective scheme; the 2 x 2 case with X a conic, E = E' = O(1), is an instance. Conjugation: absent. The target's ū = ρ/u is only a coordinate on the conic. Genericity: they assume nothing about a point. The target needs u transcendental, except no_vanishing_coeff, which needs only u not in K. Candidates and logarithms: absent.

**Explanation.** The citation is accurate, but only forward: a multiplication matrix is 1-generic with vanishing 2-minors. The target's core is the converse, that every 2 x 2 configuration is such a matrix, and one orbit. That is not printed.

Derivation (mine): x2/x1 and y2/y1 lie in K(u), as ratios of elements of V. Scale so that x_i y_j ∈ u^{-1}K[u]_{≤2} = H⁰(P¹,O(2)). Independence makes both pencils nonconstant, of degrees d, e ≥ 1 with d+e ≤ 2. So d = e = 1, and x spans μK⟨1,u⟩, y spans μ^{-1}K⟨1,ū⟩.

Only no_vanishing_coeff for u transcendental follows from 1-genericity: H has rank one, and a nonzero form over K̄ cannot vanish at a generic point. For u algebraic, u not in K, forms do vanish at that point; one needs (w·y)(z·v) ≠ 0 from K-independence, using K-rationality. Pencil and quadratic-relation parts are the ideal of a generic conic point, nowhere stated for this data. Constant-term and candidate parts are absent. Entry 7 is not found here.
