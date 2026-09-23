import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_diaz_of_exp_eq_one
import Theorems.Thm_DiazModulus_diaz_of_exp_ne_one

open Complex ComplexConjugate



theorem _root_.solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      u.im ≠ 0 → Transcendental ℚ (Complex.exp u) := by
  intro u hu hnorm hre him
  by_cases h : Complex.exp u = 1
  · exact DiazModulus.diaz_of_exp_eq_one u hu hnorm hre him h
  · exact DiazModulus.diaz_of_exp_ne_one u hu hnorm hre him h

#print axioms solution
