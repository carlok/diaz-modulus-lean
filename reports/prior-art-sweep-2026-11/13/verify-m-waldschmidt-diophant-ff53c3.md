# Entry 13, verification: M. Waldschmidt, Diophant

- **Source read:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Springer 2000: read author's PDF (webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), local copy sources/waldschmidt/dalag.pdf, PDF p. 442 = printed p. 422, page image checked. DOI link not opened.
- **Accessible:** True
- **Statement present:** True
- **Relation:** unrelated
- **Covers the part not found:** False
- **Printed or translation:** not applicable
- **Passage:** "yields a more general result where the xi are not assumed to be algebraically …

**Hypotheses.** Field: arbitrary k ⊂ K, which covers K ⊆ Q̄ ⊂ ℂ, so there is no clash. Dimension: any d × ℓ matrix, so 2 × 3 is included, but nothing about rank or rank-one matrices is singled out. Conjugation: absent. There are no circle points, no ρ = uū, no ū = ρ/u; a grep of chapter 12 for conjugat, circle, Laurent and valuation found nothing. Genericity: none assumed, the x_i are only k-linearly independent. The target's Theorem and rank_one_config_inverse_adjoin need u transcendental over F, and the hull theorem needs u ∉ Q̄ with uū algebraic. Multiplicative structure (polynomials P(u), u⁻¹, products of x_i and y_j): absent from the statement.

**Explanation.** Proposition 12.4 is there, on printed p. 422, credited to Roy 1989: a block normal form under GL_d(k) × GL_ℓ(k) for matrices with entries in a flag E_1 ⊂ … ⊂ E_n. It says nothing about configurations, hulls, degrees or conjugation. None of (a), (b), (c) is printed, and they do not follow.

Why it cannot imply them: the normal form uses only the k-linear flag. Take u transcendental with uū algebraic, and W_P with deg P = 3 and with deg P = 4. Both are 5-dimensional, so a k-linear bijection matches their flags. It transports any normal form entrywise, with the same P and Q, while rank one is not preserved. Yet the target says degree 3 carries a configuration and degree 4 does not, so 12.4 cannot separate them. All the content lies in multiplicative degree counts that the source lacks.

Rank-one check: if the top term occurs, 12.4 gives an entry x_n + e, with the other entries lower in the flag. The vanishing minors must then be analysed by valuations in u, and 12.4 does not do that. Note [[u,1],[1,u⁻¹]] is rank one, so 2 × 3 matters.

At most a preparatory tool; not a find.
