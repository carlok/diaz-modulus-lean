# Entry 9, verification: C. Bachoc, O. Serra, G.

- **Source read:** Bachoc, Serra, Zémor, Math. Proc. Cambridge Philos. Soc. 163 (2017), 423-452 (Crossref). Read arXiv:1501.00602v2 PDF, https://arxiv.org/pdf/1501.00602v2: Theorem 2 p. 2, Theorem 33 pp. 25-26, §7.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "Let F be an algebraically closed field and let L/F be a non-trivial extension"

**Hypotheses.** Field: F = Q̄ is algebraically closed, L = ℂ, so Theorems 2 and 33 apply. Dimension: dim S = 2 and dim T = 3 are allowed; dim ST = 4 follows from Theorem 2. Conjugation: the source has none, and ū = ρ/u must be supplied. Genericity: the source knows nothing of u, a_i or poles; u ∉ Q̄, a_i ≠ 0, a_1 ≠ a_2 enter only in my argument. "Implies" is generous: Theorem 33 is a lemma for the non-existence half only, and the existence half does not use it.

**Explanation.** Citation accurate; target not printed. Write t = u²; u is transcendental.

Existence (no source input): G = 1/(u(t−a₁)(t−a₂)). Partial fractions (a₁ ≠ a₂, both non-zero) give G·tᵏ ∈ span(u, 1/u, z₁, z₂), k ≤ 3. So x = (1, t), y = (G, Gt, Gt²) is a 2×3 configuration.

Non-existence: V = H₀ + Q̄w has dimension 4, with w = h + c₁z₁ + c₂z₂, h ∈ H₀, some c_i ≠ 0. A configuration has span S·T ⊆ V; Theorem 2 forces dim ST = 4 = V. Theorem 33 gives V = g·⟨1, a, a², a³⟩, with a a ratio of elements of S, hence in Q̄(u). Since 1 ∈ V, 1/g = P(a); so u = Q(a)/P(a), Q̄(a) = Q̄(u), and a is Möbius in u. Thus V's total pole divisor has degree ≤ 3. But V has poles at 0, ∞ and ±√a_i for c_i ≠ 0: at least 4 points. Contradiction.

Pole-count and identities checked by hand; sympy was unavailable. Source supplies a lemma only.
