import Theorems.Thm_DiazModulus_diaz_of_exp_eq_one
import Theorems.Thm_DiazModulus_diaz_of_exp_ne_one

open Complex ComplexConjugate

open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      u.im ≠ 0 → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod hre him
  by_cases h : Complex.exp u = 1
  · exact diaz_of_exp_eq_one u hu hmod hre him h
  · exact diaz_of_exp_ne_one u hu hmod hre him h
