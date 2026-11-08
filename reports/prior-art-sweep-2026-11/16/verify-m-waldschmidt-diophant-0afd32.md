# Entry 16, verification: M. Waldschmidt, Diophant

- **Source read:** Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Springer 2000, §15.3.4, p. 593 (PDF p. 613; page image checked), §12.5. Author's PDF, local copy waldschmidt/dalag.pdf, from https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf. The given link opens only a contents page.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "nonzero homogeneous polynomial Q ∈ ℚ[X1,…,Xn] of degree 2, we have Q(λ1,…,λn) ≠ 0"

**Hypotheses.** Field: both use rational coefficients and a Q-basis, so they match. Dimension: the remark allows any n. Transcendence degree: the remark needs exactly 1; the target's ≤1 becomes =1 because nonzero logs are transcendental (Hermite–Lindemann). Conjugation: the book never mentions it. It enters only because the conjugate of a log is a log, so the target's four numbers all lie in L. Genericity: neither side assumes any. Target's non-real, non-imaginary hypothesis is used only to exclude conj(l0) in Q l0. Caveat: Theorem 15.30 prints k = Q(λ) yet takes structural rank with respect to k, a notation clash; §12.5 and Theorem 14.23 indicate rank over Q. The remark itself is unambiguous.

**Explanation.** The remark is at the cited place, but neither (Qr2) nor pair rigidity is printed there. Both follow in a few lines.

Setup: conjugates of logs are logs. Take a Q-basis t of the span of the four numbers and write each number as a rational linear form L in t. The remark says a rational quadratic polynomial vanishing at t is identically zero.

Pair rigidity: uū = c v v̄ with c rational and nonzero. So L_u L_ū ≡ c L_v L_v̄ in Q[t]. By unique factorisation, L_u is proportional to L_v or L_v̄. Hence v ∈ Qu, or v̄ ∈ Qu, which conjugates to v ∈ Qū.

(Qr2): r = l1/l0 satisfies r̄ = εr, ε = ±1, so l0 l̄1 = ε l1 l̄0, giving an identity of forms. So L_l0 divides L_l1, whence r ∈ Q, or L_l0 divides L_l̄0. Then l̄0 = q l0, and equal moduli force q = ±1, making l0 real or purely imaginary, which is excluded.

Independent of this work: published 2000, before [Dia07].
