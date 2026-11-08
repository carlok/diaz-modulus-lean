# Entry 18, verification: D. Roy and M. Waldschmid

- **Source read:** D. Roy, M. Waldschmidt, Ann. Sci. ENS (4) 30 (1997), 753-796, Th. 0.2, p. 755. Numdam PDF opened, page image read: http://www.numdam.org/item/10.1016/s0012-9593(97)89938-7.pdf (item ASENS_1997_4_30_6_753_0). Also local copy, same text.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "le corps Q(λ1,...,λn) est de degré de transcendance ≥ 2 sur Q"

**Hypotheses.** Th. 0.2 has a homogeneous P of degree ≤ 2 with rational coefficients (page image checked: plain Q, not Q̄), a point in ℒⁿ, any n, and no genericity condition. No conjugation is involved. The target's relation is inhomogeneous (c ≠ 0), so Th. 0.2 does not apply directly. It applies once the third logarithm iγ/π homogenises the relation. The target's hypotheses (t real, a ≠ 0, a, b, c, γ rational) all fit. t real is used only for Q-independence. Neither the dichotomy nor the general form is printed: 'covers = true' means by the derivation only. I read p. 755, pp. 790-792 (§7 to Cor. 7.5) and keyword-searched the OCR for π and log 2, not the whole paper. Nearest print: Cor. 7.4's example, a different conclusion (exp√((log 2)²+π²) transcendental if log 2, π are dependent). The DOI as given returns 404; the correct suffix on Numdam is 89938-7.

**Explanation.** Th. 0.2 is at the cited place, but the target is not printed; it follows by this argument. Suppose e^{iγ/π} is algebraic, γ ∈ Q, γ ≠ 0. Put λ = (t, iπ, iγ/π) ∈ ℒ³. Since λ₂λ₃ = −γ and λ₂² = −π², the relation gives P(λ) = 0 for P = aX² − bY² + (c/γ)YZ, homogeneous over Q, P ≠ 0 since a ≠ 0. Also λ₃ = −γ/λ₂ and t is algebraic over Q(π²), so Q(λ) has transcendence degree 1, and Th. 0.2 puts λ in a Q-rational subspace U ⊆ V(P). But t, iπ, iγ/π are Q-independent: real parts force the t coefficient to vanish, then imaginary parts give r₂π² + r₃γ = 0, so π² irrational kills both. Hence U = C³ and P = 0, a contradiction. The dichotomy is t = log 2, a = −1/2, b = 1/12, c = Li₂(1/2) via Euler. The same argument handles c = 0. Caveat: the target is also routine from Brownawell's Cor. 5, so this is a second short route, not a deep find.
