# Entry 1, verification: E. Arbarello, J. Harris,

- **Source read:** E. Arbarello, J. Harris, Canonical curves and quadrics of rank 4, Compositio Math. 43 (1981), no. 2, 145-179. https://www.numdam.org/item/CM_1981__43_2_145_0.pdf (pp. 152-158 read; 157-158 checked as page images)
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "cuts out on X a pencil of divisors ... such that |2D + F| = |L|"

**Hypotheses.** Field: the paper's setting is complex (Riemann surfaces in §1); §2 names no field. The target has K = Q̄ inside ℂ, with h transcendental, so it needs base change of the cubic and quadric from Q̄ to ℂ; deg of u is unchanged. Dimension: k=1, n=3 is covered (§2 includes curves; p.158 names X3), and all quadrics through X3 lie in the principal locus (Gr(2,3) = P²). Conjugation: absent from the source; it enters the target only through ρ = uū and the relabelling 1/u² ~ ū². Genericity: no hypothesis on either side. Not in the source: subspaces of ℂ, u, 2×3 products, the three-way shape. The progression step still comes from BSZ17 Lemma 4 (AH 2.14 is only the converse, minors of a matrix). So AH gives the Möbius step in geometric dress, not the classification.

**Explanation.** Both locations check out. The target is not printed; the Möbius step is, as geometry, and only that.

Derivation. K=Q̄. BSZ gives V=b⟨1,h,h²,h³⟩, h transcendental. Write 1=bp₀(h), u=bp₁(h), ρ/u=bp₂(h), deg≤3, independent. Then p₁p₂=ρp₀², so y₁y₂=ρy₀² is a rank-3 quadric through the twisted cubic.

Its ruling pencil is the fibres of u=p₁/p₀. AH: 2D+F~L, deg L=3, so deg D=1, F a point ((2.19) says directly D=|E|). Hence u is Möbius in h.

Direct check, no AH: G=gcd(pᵢ), pᵢ=Gsᵢ; s₁,s₂ coprime with product ρs₀², so squares up to scalars; even positive degree forces deg G=1.

Take coordinate u: V=(u(lu+m))⁻¹⟨1,u,u²,u³⟩. F=pole (l=0): H₀+Ku². F=zero (m=0): H₀+Kū². F=a: H₀+K/(u−a), by partial fractions.

Caveat: AH's step is the short gcd argument above, so this shows the step is classical, not that the classification is published.
