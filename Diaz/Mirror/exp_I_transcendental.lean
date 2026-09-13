/-
Mirrored from Prove2Me: `DiazModulus.exp_I_transcendental`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.exp_I_transcendental__d191bb3f.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.HermiteLindemann

namespace Diaz

open Complex ComplexConjugate

private theorem I_alg : IsAlgebraic ℚ Complex.I := by
  refine ⟨Polynomial.X ^ 2 + 1, ?_, ?_⟩
  · intro h
    have := congrArg (Polynomial.coeff · 0) h
    simp at this
  · simp [Polynomial.aeval_def, Complex.I_sq]

theorem exp_I_transcendental : Transcendental ℚ (Complex.exp Complex.I) :=
  hermite_lindemann_holds Complex.I Complex.I_ne_zero I_alg

end Diaz
