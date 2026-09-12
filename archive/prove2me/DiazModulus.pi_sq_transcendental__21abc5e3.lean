import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_pi_transcendental

open Complex ComplexConjugate

theorem solution : Transcendental ℚ ((Real.pi ^ 2 : ℝ) : ℂ) := by
  intro h
  refine DiazModulus.pi_transcendental ?_
  refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
  simpa using h
