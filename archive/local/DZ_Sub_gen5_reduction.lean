import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_on_axes
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_off_axes

open Complex ComplexConjugate

open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod hne
  by_cases h : (u.im = 0 ∨ u.re = 0)
  · exact diaz_of_exp_not_real_on_axes u hu hmod hne h
  · exact diaz_of_exp_not_real_off_axes u hu hmod hne h
