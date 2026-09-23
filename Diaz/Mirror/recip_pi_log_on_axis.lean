/-
Mirrored from Prove2Me: `DiazModulus.recip_pi_log_on_axis`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.recip_pi_log_on_axis__1cc56f4b.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.recip_pi_log_rational_line

namespace Diaz

open Complex ComplexConjugate

namespace OnAxis

noncomputable def recip_pi_log_on_axis_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

theorem recip_pi_log_on_axis_alg_conj {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hp⟩ := h
  refine ⟨p, hp0, ?_⟩
  have : Polynomial.aeval (recip_pi_log_on_axis_cjQ z) p = recip_pi_log_on_axis_cjQ (Polynomial.aeval z p) :=
    Polynomial.aeval_algHom_apply recip_pi_log_on_axis_cjQ z p
  rw [show (conj z : ℂ) = recip_pi_log_on_axis_cjQ z from rfl, this, hp, map_zero]

end OnAxis

open OnAxis in
/-- An exception `γ` to `(S)` lies on an axis. Its conjugate is an exception too, because
`γ̄/(πi) = -conj (γ/(πi))`; by the rational-line theorem `γ̄ = qγ` with `q` rational, and
comparing real and imaginary parts forces `q = 1` with `Im γ = 0`, or `Re γ = 0`. -/
theorem recip_pi_log_on_axis :
    ∀ γ : ℂ, IsAlgebraic ℚ γ →
      IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) →
      γ.re = 0 ∨ γ.im = 0 := by
  intro γ hγ he
  by_cases h0 : γ = 0
  · left; rw [h0]; rfl
  have hconj : conj γ / (((Real.pi : ℝ) : ℂ) * Complex.I)
      = -conj (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)) := by
    rw [map_div₀, map_mul, Complex.conj_ofReal, Complex.conj_I]
    ring
  have hce : IsAlgebraic ℚ (Complex.exp (conj γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) := by
    rw [hconj, Complex.exp_neg, Complex.exp_conj]
    exact (recip_pi_log_on_axis_alg_conj he).inv
  obtain ⟨q, hq⟩ :=
    recip_pi_log_rational_line (conj γ) γ (recip_pi_log_on_axis_alg_conj hγ) hγ h0 hce he
  have hre := congrArg Complex.re hq
  have him := congrArg Complex.im hq
  simp only [Complex.conj_re, Complex.conj_im, Complex.mul_re, Complex.mul_im,
    Complex.ratCast_re, Complex.ratCast_im, zero_mul, sub_zero, add_zero] at hre him
  by_cases hr : γ.re = 0
  · exact Or.inl hr
  · right
    have hq1 : (q : ℝ) = 1 := by
      have : ((q : ℝ) - 1) * γ.re = 0 := by linarith
      have := (mul_eq_zero.1 this).resolve_right hr
      linarith
    rw [hq1] at him
    linarith

end Diaz
