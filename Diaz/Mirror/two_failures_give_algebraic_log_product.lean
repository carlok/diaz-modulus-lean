/-
Mirrored from Prove2Me: `Diaz.two_failures_give_algebraic_log_product`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.two_failures_give_algebraic_log_product__cf34d064.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

open ComplexConjugate

theorem two_failures_give_algebraic_log_product {t₁ t₂ : ℝ}
    (e₁ : IsAlgebraic ℚ ((Real.exp t₁ : ℝ) : ℂ)) (e₂ : IsAlgebraic ℚ ((Real.exp t₂ : ℝ) : ℂ))
    (h₁ : IsAlgebraic ℚ ((t₁ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ))
    (h₂ : IsAlgebraic ℚ ((t₂ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ)) :
    IsAlgebraic ℚ ((Real.exp (t₁ + t₂) : ℝ) : ℂ)
      ∧ IsAlgebraic ℚ ((Real.exp (t₁ - t₂) : ℝ) : ℂ)
      ∧ IsAlgebraic ℚ (((t₁ + t₂) * (t₁ - t₂) : ℝ) : ℂ)
      ∧ (t₁ ^ 2 ≠ t₂ ^ 2 → ((t₁ + t₂) * (t₁ - t₂) : ℝ) ≠ 0) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · rw [Real.exp_add, Complex.ofReal_mul]
    exact e₁.mul e₂
  · rw [Real.exp_sub, Complex.ofReal_div, div_eq_mul_inv]
    exact e₁.mul e₂.inv
  · have hrw : (((t₁ + t₂) * (t₁ - t₂) : ℝ) : ℂ)
        = ((t₁ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ) - ((t₂ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ) := by
      rw [← Complex.ofReal_sub]
      congr 1
      ring
    rw [hrw]
    exact h₁.sub h₂
  · intro hne hzero
    apply hne
    nlinarith [hzero]

end Diaz
