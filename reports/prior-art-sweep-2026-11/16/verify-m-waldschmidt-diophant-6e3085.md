# Entry 16, verification: M. Waldschmidt, Diophant

- **Source read:** Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer 2000, §15.3.4, p. 593 (PDF p. 613), read in full text and page image. The given link holds only the 4-page contents. Full text: webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf (local copy read; live size identical).
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** any nonzero homogeneous polynomial Q ∈ Q[X1,…,Xn] of degree 2, we have Q(λ1,…,λn) ≠ 0

**Hypotheses.** Field: the book's Q is rational, not Q̄; I checked the page image. Dimension: any n, with Q-independent logarithms and trdeg exactly 1. The target's ≤1 equals 1 by Hermite-Lindemann, since a nonzero logarithm is transcendental. Conjugation: the source never mentions it. I supply it: ū lies in L because exp(ū) is the conjugate of exp(u), so the conjugates can simply be included among the λ's, and the target's trdeg hypothesis already covers them. Genericity: none is needed beyond the target's own exclusions. Dependent families need a passage to a basis, done in the derivation. Theorem 15.30 says rstr 'with respect to k', which is odd wording, so I rely only on the explicit Q[X] paragraph after it.

**Explanation.** Neither statement is printed; p. 593 has no conjugation or (Qr2). Both follow from the paragraph after Theorem 15.30.

Take a Q-basis λ of the span of the logarithms and their conjugates, chosen from them. All lie in L, and trdeg = 1. Write each generator g as a rational linear form g̃, so g̃(λ) = g.

Pair rigidity: with c = |u|²/|v|² ≠ 0, F = ũ·(ū)~ − c·ṽ·(v̄)~ vanishes at λ. The printed statement forces F = 0 in Q[X]. By unique factorisation, ṽ is a rational multiple of ũ or of (ū)~, so v ∈ Qu or v ∈ Qū.

(Qr2): all ℓ's are nonzero. A real or imaginary ratio gives ℓ₁ℓ̄₀ = ±ℓ̄₁ℓ₀, so the forms satisfy the same identity in Q[X]. Hence ℓ₁ ∈ Qℓ₀, as wanted, or ℓ₁ ∈ Qℓ̄₁. In the second case ℓ₁ = qℓ̄₁ with |q| = 1, so q = ±1 and ℓ₁ is real or imaginary, which is excluded.

Verdict: an independent, earlier source implies the target by a short argument. It does not print it.
