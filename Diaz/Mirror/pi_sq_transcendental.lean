/-
Mirrored from Prove2Me: `DiazModulus.pi_sq_transcendental`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.pi_sq_transcendental__21abc5e3.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.pi_transcendental

namespace Diaz

open Complex ComplexConjugate

theorem pi_sq_transcendental : Transcendental ℚ ((Real.pi ^ 2 : ℝ) : ℂ) := by
  intro h
  refine pi_transcendental ?_
  refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
  simpa using h

end Diaz
