# Entry 6, verification: D. Roy, Matrices dont le

- **Source read:** Read: Waldschmidt's review of D. Roy, Prog. Math. 81 (1990), 273-281, Zbl 0712.11042, via https://api.zbmath.org/v1/document/_search?search_string=an%3A0712.11042 (zbmath.org/0712.11042 gave 403); Wal00 pp. 418-424, local dalag.txt. Paper not opened: OpenAlex lists it closed access, DOI 10.1007/978-1-4612-5788-2_13.
- **Accessible:** False
- **Statement present:** False
- **Relation:** implies
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** each matrix with coefficients in \(L'\) (as above) is k-equivalent

**Hypotheses.** Roy's paper was not opened, so this compares the statement as reported in the review and as printed in Wal00 Prop. 12.2 (attributed there to Proposition 1 of [Roy 1990]).
Field: k ⊆ K is arbitrary, so general-field is correct. The fit requires k := F, not the target's K, and the result is F-equivalence. The target's V₀ is an arbitrary K-space, not spanned by independent elements, so it only fits inside F itself; the zero-block form needs the X-homogenisation.
Dimension: Roy's sizes are arbitrary and the target's p, q ≥ 2 are a rank-one special case.
Conjugation: absent from Roy. It enters Theorem A only through ū = ρ/u ∈ F = Q̄(u).
Genericity: w algebraically independent over F matches.
Theorem A also needs the bound p+q ≤ 4 in the hull, which this source does not give (m = 0 is Roy95 Th. 3.4, named nearby).

**Explanation.** Not verified: paper unread. The review states the zero-block form, unnumbered. Wal00 p. 419 supplies the numbering, and that statement is Prop. 12.2, already named nearby, so nothing new. Its k is already general; the target's "case V₀=K=Q̄" undersells it.

Derivation (mine). Put k=F, E=F+ΣFwⱼ. Wal00's Remark (homogenise with X) gives zero-block form on E; det A stays nonzero at X=1 because it is homogeneous. M=(xᵢyⱼ) has rank 1, M≠0, so A=(a), and rank 1 forces CB=0, so B=0 or C=0. Hence yⱼ/y₁∈F for all j, or xᵢ/x₁∈F for all i. Say xᵢ=fᵢx₁, fᵢ∈F. K-independence gives f₂∉K. Write x₁yⱼ=vⱼ+Σaⱼₖwₖ, aⱼₖ∈K, vⱼ∈V₀. Since 1,w are F-independent, f₂aⱼₖ∈K, so aⱼₖ=0. Then every xᵢyⱼ has no w-part, so lies in V₀. The other case is symmetric.

Theorem A: K=Q̄, F=Q̄(u), V₀=H₀, plus Roy95 Th. 3.4. Conclusion: routine, as classified; target not printed.
