import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_on_axes
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real_off_axes

open Complex ComplexConjugate



theorem _root_.solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      Transcendental ℚ (Complex.exp u) := by
  intro u hu hnorm hre
  by_cases h : u.im = 0 ∨ u.re = 0
  · exact DiazModulus.diaz_of_exp_not_real_on_axes u hu hnorm hre h
  · exact DiazModulus.diaz_of_exp_not_real_off_axes u hu hnorm hre h

#print axioms solution
