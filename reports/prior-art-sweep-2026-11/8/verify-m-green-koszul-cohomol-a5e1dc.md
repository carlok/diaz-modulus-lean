# Entry 8, verification: M. Green, Koszul cohomol

- **Source read:** Y. Kim, H. Moon, E. Park, Some remarks on the K_{p,1} theorem, arXiv:2404.03293v1, Theorem 1.1(2), attributing it to Green. PDF opened: https://arxiv.org/pdf/2404.03293
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** βe,1(X) > 0 if and only if d = e + 1

**Hypotheses.** Field: K algebraically closed, characteristic 0, so Q̄ qualifies. Dimension: apply it to an irreducible non-degenerate curve in P³ (n=1, e=2); e≥2 holds. Conjugation: absent from the source; it enters only through ū=ρ/u. Genericity: u must be transcendental. Statement 2 assumes u∉Q̄, but the hypotheses of the first theorem's parent Proposition are not in target.md, so I assume the same there. Existence half: not from Green, elementary. With z=u/(u²−a), a≠b:=ρ²/ā, or z=u/(u²−a)², a=b, put D=u(u²−a)(u²−b). Then u, ū, z, z̄ span {1,u²,u⁴,u⁶}/D, so x=(1,u²), y=(1,u²,u⁴)/D is a configuration. For squared z with a≠b I found none; the corollary suggests that case is excluded. The non-existence half covers every case. Green's original paper was not opened; the statement was read in Kim-Moon-Park, as the citation says. The source has no number theory and cites nothing excluded.

**Explanation.** Statement present; the target is not printed. Only the non-existence half follows, by my derivation. Let w∈W∖H₀; subtracting H₀, w is odd in t=u, nonzero, vanishing at 0 and ∞. Let C be the closure of t↦(1:t:ρ/t:w) in P³; it is birational, non-degenerate. w has a finite pole c≠0, hence also −c, so deg C≥4. Suppose a configuration: x_iy_j=L_ij(1,u,ū,w), L_ij linear over Q̄. Since ℂ is a field, λᵀLμ≠0 for nonzero λ,μ (1-generic). Transcendence of u puts the 2×2 minors in I(C). A rank-≤1 linear matrix has a scalar row or column dependency, so 1-genericity makes the three minors independent. Laplace expansion gives a nontrivial linear syzygy, so β₂,₁(C)>0. With e=2, Green forces d=3, a contradiction. Thus no H₀+Q̄w carries a configuration, conjugation-stable case included. Hilbert-Burch alone would also suffice, so Green is not essential.
