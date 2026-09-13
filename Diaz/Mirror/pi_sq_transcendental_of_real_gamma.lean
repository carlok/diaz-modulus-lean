/-
Mirrored from Prove2Me: `DiazModulus.pi_sq_transcendental_of_real_gamma`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.pi_sq_transcendental_of_real_gamma__5d673930.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

-- Exact submission bytes for the planned `/verify` call (top-level
-- `theorem pi_sq_transcendental_of_real_gamma`, no namespace wrapper, helpers inlined). This file is
-- the local verification gate; the submitted file must be byte-identical
-- apart from this comment header.
theorem pi_sq_transcendental_of_real_gamma
    (hS : ∀ γ : ℂ, IsAlgebraic ℚ γ → γ ≠ 0 → γ.im = 0 →
      ¬ IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)))) :
    Transcendental ℚ ((((Real.pi : ℝ) : ℂ)) ^ 2) := by
  have XX_alg_neg : ∀ {z : ℂ}, IsAlgebraic ℚ z → IsAlgebraic ℚ (-z) := by
    intro z hz
    rw [← mem_Qbar_iff] at *
    exact Subfield.neg_mem _ hz
  intro hpi2
  have hpi0 : ((Real.pi : ℝ) : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  have hγ : IsAlgebraic ℚ ((((Real.pi ^ 2 : ℝ))) : ℂ) := by
    have hcast : ((((Real.pi ^ 2) : ℝ)) : ℂ) = (((Real.pi : ℝ) : ℂ)) ^ 2 := by
      push_cast
      ring
    rw [hcast]
    exact hpi2
  have hγ0 : ((((Real.pi ^ 2 : ℝ))) : ℂ) ≠ 0 := by
    have hne : Real.pi ^ 2 ≠ 0 := pow_ne_zero 2 Real.pi_ne_zero
    exact_mod_cast hne
  have him : ((((Real.pi ^ 2 : ℝ))) : ℂ).im = 0 := Complex.ofReal_im _
  have hcon := hS _ hγ hγ0 him
  have hlam : ((((Real.pi ^ 2 : ℝ))) : ℂ) / (((Real.pi : ℝ) : ℂ) * Complex.I) =
      -(((Real.pi : ℝ) : ℂ) * Complex.I) := by
    have hI2 : Complex.I ^ 2 = (-1 : ℂ) := by rw [sq, Complex.I_mul_I]
    rw [div_eq_iff (mul_ne_zero hpi0 Complex.I_ne_zero)]
    push_cast
    ring_nf
    rw [hI2]
    ring
  rw [hlam, Complex.exp_neg_pi_mul_I] at hcon
  exact hcon (XX_alg_neg isAlgebraic_one)

end Diaz
