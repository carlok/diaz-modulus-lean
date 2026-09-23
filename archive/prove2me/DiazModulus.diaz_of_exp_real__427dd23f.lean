import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_diaz_of_exp_real_self_real
import Theorems.Thm_DiazModulus_diaz_of_exp_real_self_not_real

open Complex ComplexConjugate



theorem _root_.solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      Transcendental ℚ (Complex.exp u) := by
  intro u hu hnorm hre
  by_cases h : u.im = 0
  · exact DiazModulus.diaz_of_exp_real_self_real u hu hnorm hre h
  · exact DiazModulus.diaz_of_exp_real_self_not_real u hu hnorm hre h

#print axioms solution
