import Mathlib
import Theorems.Thm_DiazModulus_recip_pi_or_pi_cube

/-- The first disjunction of `DiazModulus.recip_pi_or_pi_cube` at `γ = 1`. -/
theorem solution :
    Transcendental ℚ (Complex.exp (Complex.I / ((Real.pi : ℝ) : ℂ))) ∨
      Transcendental ℚ (Complex.exp (Complex.I * ((Real.pi : ℝ) : ℂ) ^ 3)) := by
  have h := (DiazModulus.recip_pi_or_pi_cube 1 (isAlgebraic_one (R := ℚ) (A := ℂ))
    one_ne_zero).1
  simpa only [mul_one, div_one] using h

#print axioms solution
