import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_irrational_angle_period_free_pi_im_algebraic
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_irrational_angle_period_free_pi_im_transcendental

open Complex ComplexConjugate

-- The two children's extra hypotheses are literally complementary (`Transcendental ℚ x` is
-- by definition `¬ IsAlgebraic ℚ x`), so the reduction is a `by_cases` on the new split
-- predicate `π · Im u ∈ Q̄` and carries no mathematical content.
open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
      (¬ ∃ r : ℚ, r ≠ 0 ∧
        IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
      Transcendental ℚ (Complex.exp u) := by
  intro u hu0 hmod hnr hax hirr hfree
  by_cases h : IsAlgebraic ℚ ((Real.pi * u.im : ℝ) : ℂ)
  · exact DiazModulus.diaz_of_exp_not_real_irrational_angle_period_free_pi_im_algebraic
      u hu0 hmod hnr hax hirr hfree h
  · exact DiazModulus.diaz_of_exp_not_real_irrational_angle_period_free_pi_im_transcendental
      u hu0 hmod hnr hax hirr hfree h
