import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_irrational_angle_period_aligned_norm_rat_mult
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_irrational_angle_period_aligned_norm_free

open Complex ComplexConjugate

open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
      (∃ r : ℚ, r ≠ 0 ∧
        IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
      Transcendental ℚ (Complex.exp u) := by
  intro u h0 hmod hnr hax hirr hal
  by_cases h : ∃ r : ℚ, r ≠ 0 ∧
      IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ) ∧
      ∃ c : ℚ, (‖u‖ : ℝ) ^ 2 = (c : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi))
  · exact DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_rat_mult
      u h0 hmod hnr hax hirr hal h
  · exact DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_free
      u h0 hmod hnr hax hirr hal h
