/-
# The Hilbert side of the multiplicity estimate over `ℂ`, without the hypothesis `hU`

The mirrored node `Diaz.torus_hilbert_side` proves the Hilbert-function half of the elementary
multiplicity estimate `hME` (`Diaz/MultiplicityEstimate.lean`) on the boxes of `hME`, in
`K[X, Y, Z]` modulo the torus ideal of `𝔾ₐ^{A₀} × 𝔾ₘ^{A₁}`, under the explicit hypothesis
`hU : UnmixedHeight (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K)` (`Diaz/HilbertBox.lean`). The mirrored
node `Diaz.unmixedHeight_mvPolynomial` proves `UnmixedHeight (MvPolynomial σ K)` for every
algebraically closed field `K` and finite `σ`: the inequality half of Macaulay's unmixedness
theorem for polynomial rings (Macaulay 1916; Bruns–Herzog, *Cohen–Macaulay rings*, Th. 2.1.6),
which is classical. This file only passes the second to the first, for `K = ℂ`.

The multiplicity side of `hME`, and the assembly of `hME` from its two sides, are not proved
here, so `hME` remains a hypothesis.
-/
import Mathlib
import Diaz.HilbertBox
import Diaz.Mirror.torus_hilbert_side
import Diaz.Mirror.unmixedHeight_mvPolynomial

namespace Diaz

/-- **The Hilbert side of the multiplicity estimate over `ℂ`, without `hU`.** The statement of
`torus_hilbert_side` for `K = ℂ`, without its hypothesis `hU : UnmixedHeight _`, which
`unmixedHeight_mvPolynomial` (Macaulay's unmixedness for polynomial rings over an algebraically
closed field, inequality half) supplies: on the boxes of `hME`, in `ℂ[X, Y, Z]` modulo the torus
ideal, `λ · 2^{r(r−1)/2} ≤ 2^{rd} D₀^{d₀} (2D₁)^{d₁}`. -/
theorem torus_hilbert_side_complex {A₀ A₁ : Type*} [Fintype A₀] [Fintype A₁]
    (D₀ D₁ : ℕ) (h0 : 1 ≤ D₀) (h1 : 1 ≤ D₁) (V : Submodule ℂ (MvPolynomial (A₀ ⊕ (A₁ × Bool)) ℂ))
    (hV : V ≤ torusBox ℂ A₀ A₁ (boxD A₀ A₁ D₀ D₁)) (r : ℕ)
    (hH : ∀ p : Ideal (MvPolynomial (A₀ ⊕ (A₁ × Bool)) ℂ), p.IsPrime →
      torusIdeal ℂ A₀ A₁ ⊔ Ideal.span (V : Set (MvPolynomial (A₀ ⊕ (A₁ × Bool)) ℂ)) ≤ p →
      ((Fintype.card A₁ + r : ℕ) : ℕ∞) ≤ p.height)
    (lam : ℕ) (C : A₀ ⊕ A₁ → ℕ)
    (hlow : ∀ u : ℕ, 1 ≤ u → lam * u ^ ((Fintype.card A₀ + Fintype.card A₁) - r) ≤
      boxHilb (torusBox ℂ A₀ A₁)
        (torusIdeal ℂ A₀ A₁ ⊔ Ideal.span (V : Set (MvPolynomial (A₀ ⊕ (A₁ × Bool)) ℂ)))
        (u • boxD A₀ A₁ D₀ D₁ + C)) :
    lam * 2 ^ (r * (r - 1) / 2)
      ≤ 2 ^ (r * (Fintype.card A₀ + Fintype.card A₁)) *
        (D₀ ^ Fintype.card A₀ * (2 * D₁) ^ Fintype.card A₁) :=
  torus_hilbert_side unmixedHeight_mvPolynomial D₀ D₁ h0 h1 V hV r hH lam C hlow

end Diaz
