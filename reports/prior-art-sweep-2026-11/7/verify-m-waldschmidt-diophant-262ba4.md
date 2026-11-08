# Entry 7, verification: M. Waldschmidt, Diophant

- **Source read:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer 2000, section 12.1.6, p. 431, and Exercises 12.9-12.10; local copy sources/waldschmidt/dalag.txt, lines 23405-23464 and 24041-24056 (DOI 10.1007/978-3-662-11569-5)
- **Accessible:** True
- **Statement present:** True
- **Relation:** special case
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "Here is a motivation for Lemma 12.16 (cf. Proposition 2 of [Roy 1989])."

**Hypotheses.** Field: the book takes any k in K; the target takes K in C with u transcendental, so the book is more general here. Dimension: both use a 3-dimensional E, but the book's x need not be transcendental, it only needs u, ux, ux^2 independent. Conjugation: absent from the book. The match needs the substitution x = u, book's u = conjugate of u, with rho in K. Genericity: the book assumes only linear independence; the target's quadratic-relation clause assumes u and i*pi algebraically independent. Candidates, Baker and logarithms play no role in the passage, which gives an abstract example. Local text-layer copy only, page header checked (p. 431, section 12.1.6). Roy 1989 itself was not opened, and neither was the DOI version.

**Explanation.** The passage is there, but prints one example: the rank-one points (v, vx), (vx, vx^2) in E = kv+kvx+kvx^2. With x=u, v=ū, this is (1,u)⊗(ū,ρ), one orbit member. No uniqueness, constants, candidates, quadratic relations or pencils appear.

The rest needs my own argument, independent of the passage. Ratios x2/x1, y2/y1 lie in K(u), so x_i=μf_i, y_j=νg_j with f, g coprime pairs in K[u]. Since uH₀ is polynomials of degree ≤2, λ=μνu satisfies λf_ig_j∈K[u] of degree ≤2. gcd(f_ig_j)=1 makes λ polynomial. Independence gives max deg f, max deg g ≥1, so λ=c∈K and all degrees ≤1. Then 1/u=ū/ρ gives the normal form; the converse is direct.

Constants: c=P diag(1,ρ) Qᵀ is invertible. At a candidate with no w's, u, ū∈Q̄ℒ and Baker make Q̄+Q̄ℒ direct, so rows and columns with nonzero constants leave Q̄ℒ.

Not checked: w_m, norm and pencil clauses; none is printed there.
