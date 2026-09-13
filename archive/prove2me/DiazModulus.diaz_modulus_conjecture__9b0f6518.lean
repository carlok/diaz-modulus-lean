import Theorems.Thm_DiazModulus_diaz_of_exp_real
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real

open Complex ComplexConjugate

open DiazModulus in
theorem solution : DiazModulusConjecture := by
  intro u hu hmod
  by_cases h : (Complex.exp u).im = 0
  · exact diaz_of_exp_real u hu hmod h
  · exact diaz_of_exp_not_real u hu hmod h
