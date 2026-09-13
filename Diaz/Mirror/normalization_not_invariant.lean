/-
Mirrored from Prove2Me: `Diaz.normalization_not_invariant`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.normalization_not_invariant__3b963972.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

theorem normalization_not_invariant
    (HL : ∀ z : ℂ, z ≠ 0 → IsAlgebraic ℚ z → Transcendental ℚ (Complex.exp z)) :
    ∃ u : ℂ, u ≠ 0 ∧ IsAlgebraic ℚ (Complex.exp u) ∧
      Transcendental ℚ (Complex.exp ((((‖u‖ : ℝ) : ℂ))⁻¹ * u)) := by
  have hI : IsAlgebraic ℚ Complex.I := by
    refine ⟨Polynomial.X ^ 2 + 1, ?_, ?_⟩
    · intro h
      have := congrArg (Polynomial.coeff · 0) h
      simp at this
    · simp [Polynomial.aeval_def, Complex.I_sq]
  have hpi : (0 : ℝ) < 2 * Real.pi := by positivity
  refine ⟨2 * (Real.pi : ℂ) * Complex.I, ?_, ?_, ?_⟩
  · simp [Complex.I_ne_zero, Real.pi_ne_zero]
  · rw [Complex.exp_two_pi_mul_I]; exact isAlgebraic_one
  · have hnorm : ‖2 * (Real.pi : ℂ) * Complex.I‖ = 2 * Real.pi := by
      simp [abs_of_pos Real.pi_pos]
    rw [hnorm]
    have hne : ((2 * Real.pi : ℝ) : ℂ) ≠ 0 := by exact_mod_cast ne_of_gt hpi
    have e : (((2 * Real.pi : ℝ) : ℂ))⁻¹ * (2 * (Real.pi : ℂ) * Complex.I) = Complex.I := by
      push_cast
      field_simp
    rw [e]
    exact HL Complex.I Complex.I_ne_zero hI

end Diaz
