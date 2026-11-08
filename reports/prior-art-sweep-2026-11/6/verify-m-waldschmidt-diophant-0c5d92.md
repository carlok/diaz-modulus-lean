# Entry 6, verification: M. Waldschmidt, Diophant

- **Source read:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer 2000, §12.1 (p. 418) and §12.1.3 (p. 424). Local dalag.txt and dalag.pdf (PDF p. 444, checked by image). DOI not opened.
- **Accessible:** True
- **Statement present:** True
- **Relation:** special case
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "then E = k + E0 satisfies Property" (Waldschmidt, DALAG, Remark in §12.1.3, p. 424)

**Hypotheses.** Field: the Remark holds for any k ⊂ K, not only Q̄, so it is wider than the target's gloss "V₀=K=Q̄". In target notation it is K=F with V₀=F (Prop. 12.2 itself gives V₀=0), and those are the only F-subspaces of F. Target's K⊊F, with V₀ any K-subspace of F, is absent. Dimension: any matrix size, but the conclusion is the block form, not "configurations". Conjugation: none there; Theorem A's u, ū, and the p+q≤4 bound are not in the Remark. Genericity: matches (algebraic independence over k, E₀∩k=0).

**Explanation.** The Remark is there, but it is the named nearby result. Derivation: apply it with k=F, E₀=ΣFw_ℓ. M=(x_iy_j)≠0 has rank 1, so PMQ=[[a,b],[c,0]] with P,Q over F, and x′_iy′_j=0 for i,j≥2. Hence x or y has F-span of dimension 1. Say x_i=f_ix₁, f₁=1; K-independence gives f₂∉K. Write z_j=x₁y_j=v+Σc_ℓw_ℓ with v∈V₀, c_ℓ∈K. Then f₂z_j∈V₀+ΣKw_ℓ, and 1,w are F-independent, so f₂c_ℓ∈K, forcing c_ℓ=0. So z_j=v, and f_iv is the F-part of f_iz_j, hence in V₀. All products lie in V₀. The case y is symmetric. Theorem A then needs F=Q̄(u), V₀=H₀, plus Roy's m=0 case (Lemma 12.16, Exercise 12.10). So the extension is short, consistent with "routine", but the descent from F to K is not printed. The Remark's own proof is terse: passing from K(X) to K needs homogeneity of det A, which holds.
