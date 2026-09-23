import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_diaz_of_exp_real
import Theorems.Thm_DiazModulus_diaz_of_exp_not_real

open Complex ComplexConjugate



theorem _root_.solution : DiazModulus.DiazModulusConjecture := by
  intro u hu hnorm
  by_cases h : (Complex.exp u).im = 0
  · exact DiazModulus.diaz_of_exp_real u hu hnorm h
  · exact DiazModulus.diaz_of_exp_not_real u hu hnorm h

#print axioms solution
