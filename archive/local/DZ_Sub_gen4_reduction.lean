import Theorems.Thm_DiazModulus_diaz_of_exp_real_pure_imaginary
import Theorems.Thm_DiazModulus_diaz_of_exp_real_generic

open Complex ComplexConjugate

open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      u.im ≠ 0 → Complex.exp u ≠ 1 → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod hre him h1
  by_cases h : u.re = 0
  · exact diaz_of_exp_real_pure_imaginary u hu hmod hre him h1 h
  · exact diaz_of_exp_real_generic u hu hmod hre him h1 h
