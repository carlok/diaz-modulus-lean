import Theorems.Thm_DiazModulus_diaz_of_exp_real_self_real
import Theorems.Thm_DiazModulus_diaz_of_exp_real_self_not_real

open Complex ComplexConjugate

open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod hexpim
  by_cases h : u.im = 0
  · exact diaz_of_exp_real_self_real u hu hmod hexpim h
  · exact diaz_of_exp_real_self_not_real u hu hmod hexpim h
