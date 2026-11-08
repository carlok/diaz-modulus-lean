# Entry 13, verification: M. Waldschmidt, Diophant

- **Source read:** Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Springer 2000, §12.1.2, printed p. 422 (PDF p. 442): local dalag.pdf, listed from webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf. zbMATH link and Roy 1989 not opened; WebSearch budget exhausted.
- **Accessible:** True
- **Statement present:** True
- **Relation:** analogue only
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "yields a more general result where the xi are not assumed to be algebraically …

**Hypotheses.** Field: arbitrary k in K, more general than Q̄ in ℂ. Dimension: any d×ℓ matrix over a finite flag E_1 in ... in E_n, no 2×3 or rank-one statement. Conjugation: none; no circle point, no inverse, no ū. Genericity: none, the x_i need not be algebraically independent, so no transcendence hypothesis on u, whereas target (c) requires u transcendental over the field of ℒ̃. No hull, no degree of P, no real polynomials, no Roy theorem.

**Explanation.** Prop. 12.4 is a triangular normal form only. (a), (b) are not touched. (c) needs this supplied argument, using just its first step. Write (x_i y_j) = uA + u⁻¹B + C, with A, B over K and C in V₀. Rank one: the u² coefficient of the minors gives rank A ≤ 1. If A ≠ 0, K-equivalence gives A = E₁₁. For j = 2, 3, the u¹ coefficient of minor (1,2;1,j) gives c₂ⱼ = 0. So x₂y₂, x₂y₃ lie in Ku⁻¹, making y₂, y₃ K-dependent: contradiction. So A = 0; by u ↦ u⁻¹, B = 0. Products lie in V₀. This is rank_one_config_inverse_adjoin. Taking K = Q̄, V₀ = ℒ̃, ū = ρ/u, Roy's theorem gives (c). The decisive step, comparing u-degrees under transcendence, resembles the proof of Prop. 12.2 but is not in 12.4's statement. Not independently printed; a tool at most.
