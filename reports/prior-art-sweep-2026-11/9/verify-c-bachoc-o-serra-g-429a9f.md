# Entry 9, verification: C. Bachoc, O. Serra, G.

- **Source read:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, arXiv:1501.00602v2 (14 Jan 2017), PDF read: https://arxiv.org/pdf/1501.00602. Section 7, Theorem 33, pp. 25-26; Theorem 2, in the introduction.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "Let F be an algebraically closed field and let L/F be a non-trivial extension"

**Hypotheses.** Field: F = Q̄ is algebraically closed and L = ℂ, so Theorem 33 applies; Theorem 2 applies because Q̄ is algebraically closed in ℂ. Dimension: dim S=2 and dim T=3 are allowed, and dim ST=4 follows from ST ⊆ V and Theorem 2. Conjugation: the source has none; the target uses only ū=ρ/u, so it stays inside Q̄(u). Genericity: u is transcendental because u∉Q̄; the source needs no such condition. The source has no circle points, no poles and no invisibility notion. Only the arXiv v2 text was read, so the numbering in the published journal version is unchecked.

**Explanation.** Theorems 33 and 2 are present as cited, but the target is not printed; this derivation is mine.

Existence: with t=u², D=(t−a₁)(t−a₂), u, 1/u, z₁, z₂ span {cubics in t}/(uD). Take x={1,t}, y={1,t,t²}/(uD).

Invisibility: let V=H₀+Q̄w, dim 4, with AB⊆V, dims 2 and 3. Theorem 2 gives AB=V. Theorem 33 gives V=h·span(1,a,a²,a³).
Since 1∈V, h=1/p(a), deg p≤3, so V⊆Q̄(a).
Since u∈V, u∈Q̄(a). Also a=ha/h∈Q̄(u). So a is Möbius in u, and every element of V has degree ≤3 in u.
Modulo H₀, w=αz₁+βz₂≠0. Partial fractions give poles at nonzero points ±√aᵢ, at least two. So u+1/u+w∈V has degree ≥4. Contradiction.

Only one pole-carrying element is needed; conjugation enters only through ū=ρ/u.
