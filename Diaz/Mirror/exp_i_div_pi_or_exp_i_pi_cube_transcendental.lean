/-
Mirrored from Prove2Me: `DiazModulus.exp_i_div_pi_or_exp_i_pi_cube_transcendental`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.exp_i_div_pi_or_exp_i_pi_cube_transcendental__a9337528.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.recip_pi_or_pi_cube

namespace Diaz

/-- The first disjunction of `recip_pi_or_pi_cube` at `γ = 1`. -/
theorem exp_i_div_pi_or_exp_i_pi_cube_transcendental :
    Transcendental ℚ (Complex.exp (Complex.I / ((Real.pi : ℝ) : ℂ))) ∨
      Transcendental ℚ (Complex.exp (Complex.I * ((Real.pi : ℝ) : ℂ) ^ 3)) := by
  have h := (recip_pi_or_pi_cube 1 (isAlgebraic_one (R := ℚ) (A := ℂ))
    one_ne_zero).1
  simpa only [mul_one, div_one] using h

end Diaz
