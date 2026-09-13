import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_recip_pi_not_log
import Theorems.Thm_DiazModulus_recip_pi_log_of_period_aligned

open Complex ComplexConjugate

-- The period-aligned leaf is the composite of its own route lemma with (S), exactly as
-- its sibling `..._period_free_pi_im_algebraic` is the composite of the r = 0 route
-- lemma with the same (S).
-- Route: an irrational angle that is period-aligned, on a logarithm of an algebraic
-- number, produces an algebraic `γ ≠ 0` with `exp (γ / (πi))` algebraic.
-- (S): no such `γ` exists.  So `exp u` cannot be algebraic.
-- Neither `u ≠ 0`, nor `‖u‖ ∈ Q̄`, nor `(exp u).im ≠ 0`, nor the off-axes clause is used.

open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
      (∃ r : ℚ, r ≠ 0 ∧
        IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
      Transcendental ℚ (Complex.exp u) := by
  intro u _hu0 _hmod _him _hoff hirr hal hexp
  obtain ⟨γ, hγalg, hγ0, hγexp⟩ :=
    DiazModulus.recip_pi_log_of_period_aligned u hirr hal hexp
  exact DiazModulus.recip_pi_not_log γ hγalg hγ0 hγexp
