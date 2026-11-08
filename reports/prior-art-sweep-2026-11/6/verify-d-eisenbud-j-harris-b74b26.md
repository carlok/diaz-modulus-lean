# Entry 6, verification: D. Eisenbud, J. Harris,

- **Source read:** D. Eisenbud, J. Harris, Vector spaces of matrices of low rank, Adv. Math. 70 (1988), 135-155; local PDF, n3-lit/eisenbud-harris-1988-vector-spaces-low-rank.pdf; p. 136 checked on page image
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "either a common kernel V' c V of codimension 1, or a common image"

**Hypotheses.** Field: EH works over an algebraically closed field; the target has K ⊆ F ⊆ ℂ, K arbitrary, so EH applies only over the closure of F, and K-rationality is my added step. Dimension: EH allows any dim V, dim W; matches p,q ≥ 2. Conjugation: absent from EH; the target uses it only to put ū = ρ/u in F. Genericity: EH has no algebraic independence (the words 'subfield' and 'algebraically independent' never occur). EH also has no configurations, no V₀, no K-independent factors. 'Implies' means only as an ingredient, with the supplied argument; it is not a statement of the target.

**Explanation.** Rank-1 lemma is on p. 136, called classical. Separation is not printed.
Derivation: write x_i y_j = A₀ + Σ w_k A_k, with A₀ over F, A_k over K. The 2×2 minors of t₀A₀ + ΣT_kA_k are homogeneous and vanish at (1,w), so by independence over F they vanish identically. The span is a rank-1 space over the closure of F.
EH case common image: all members are a·bᵀ with a fixed, and x ∝ a. If A_k ≠ 0, a₂/a₁ is a ratio of its entries, in K, so x₂/x₁ ∈ K, contradiction. Common kernel: same for y. So all A_k = 0 and the configuration lies in V₀.
Theorem A: take F = Q̄(u), V₀ = H₀, then Roy's m = 0 case. EH gives nothing for p+q ≤ 4.
The lemma is one short step; the independence and K-rationality steps are mine.
