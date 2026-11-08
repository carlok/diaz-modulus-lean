# Entry 18, verification: D. Roy and M. Waldschmid

- **Source read:** D. Roy, M. Waldschmidt, Ann. Sci. ENS (4) 30 (1997), 753-796; Numdam PDF https://www.numdam.org/item/ASENS_1997_4_30_6_753_0.pdf. Abstract p. 753, Th. 0.2 p. 755 checked on page image; proof p. 791; Cor. 7.4 p. 792 checked on image.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "le corps Q(λ1,...,λn) est de degré de transcendance ≥ 2 sur Q" (Théorème 0.2, …

**Hypotheses.** Field: P rational, matching rational a, b, c, gamma; only Q-independence of the logs is needed. Dimension: n=3 with form aX^2 - bY^2 + (c/gamma)YZ, homogeneous degree 2. Genericity: Theorem 0.2 needs transcendence degree at most 1, which follows from the supposition and the relation. Conjugation: not involved; t real is used only for Q-independence. Difference: the target's relation is inhomogeneous and the theorem is homogeneous; the supposition e^{i gamma/pi} algebraic bridges this. Target's case c=0 and b=0 are also covered (hypothesis then void).

**Explanation.** Statement present as cited. The dichotomy is not printed; no text-layer or section 7 hit for it. Nearest: Cor. 7.4's example on exp(sqrt((log 2)^2+pi^2)), a different number. Derivation: suppose e^L algebraic, L = i*gamma/pi, gamma rational nonzero. Then t, i*pi, L are logarithms and (i*pi)L = -gamma. So at^2+b*pi^2=c becomes P(t, i*pi, L)=0, with P = aX^2 - bY^2 + (c/gamma)YZ, rational, homogeneous, nonzero since a is nonzero. L lies in Q(i*pi) and t^2 lies in Q(pi^2), so transcendence degree is at most 1. Th. 0.2 gives a Q-rational subspace U with the point in U, U inside V. The coordinates are Q-independent: t real nonzero, the others imaginary, and pi^2 is irrational. So U = C^3, forcing P=0, a contradiction. Dichotomy: if Li2(1/2)=pi^2/12-(log 2)^2/2=r is rational, take t=log 2, a=-1/2, b=1/12, c=r. Brownawell's Cor. 5 is not used. Euler's formula is only needed to name Li2(1/2), not for the stated pi^2/12-(log 2)^2/2 form.
