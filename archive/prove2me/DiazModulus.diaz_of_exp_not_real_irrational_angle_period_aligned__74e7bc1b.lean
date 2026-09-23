import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_irrational_angle_period_aligned_norm_rat_mult
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_irrational_angle_period_aligned_norm_free

open Complex ComplexConjugate

theorem _root_.solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
      (∃ r : ℚ, r ≠ 0 ∧
        IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
      Transcendental ℚ (Complex.exp u) := by
  intro u hu hnorm hre hax hang hal
  by_cases h : ∃ r : ℚ, r ≠ 0 ∧
      IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ) ∧
      ∃ c : ℚ, (‖u‖ : ℝ) ^ 2 = (c : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi))
  · exact DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_rat_mult
      u hu hnorm hre hax hang hal h
  · exact DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_free
      u hu hnorm hre hax hang hal h

#print axioms solution
