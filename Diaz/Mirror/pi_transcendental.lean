/-
Mirrored from Prove2Me: `DiazModulus.pi_transcendental`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.pi_transcendental__8da195d8.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.HermiteLindemann

namespace Diaz

open Complex ComplexConjugate


private theorem pi_transcendental_I_alg : IsAlgebraic ℚ Complex.I := by
  refine ⟨Polynomial.X ^ 2 + 1, ?_, ?_⟩
  · intro h
    have := congrArg (Polynomial.coeff · 0) h
    simp at this
  · simp [Polynomial.aeval_def, Complex.I_sq]

theorem pi_transcendental : Transcendental ℚ ((Real.pi : ℝ) : ℂ) := by
  intro halg
  have hIpi : IsAlgebraic ℚ (Complex.I * ((Real.pi : ℝ) : ℂ)) := pi_transcendental_I_alg.mul halg
  have hne : Complex.I * ((Real.pi : ℝ) : ℂ) ≠ 0 := by
    simp [Complex.I_ne_zero, Real.pi_ne_zero]
  have hT := hermite_lindemann_holds _ hne hIpi
  apply hT
  rw [show Complex.I * ((Real.pi : ℝ) : ℂ) = ((Real.pi : ℝ) : ℂ) * Complex.I by ring,
    Complex.exp_mul_I]
  simp [Real.cos_pi, Real.sin_pi]
  exact (isAlgebraic_one).neg

end Diaz
