/-
Mirrored from Prove2Me: `DiazModulus.recip_pi_log_of_pi_im_algebraic`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.recip_pi_log_of_pi_im_algebraic__f254bbbf.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

namespace DZRoute

theorem recip_pi_log_of_pi_im_algebraic_alg_iff_mem {z : ℂ} : IsAlgebraic ℚ z ↔ z ∈ Qbar := mem_Qbar_iff.symm

noncomputable def recip_pi_log_of_pi_im_algebraic_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

theorem recip_pi_log_of_pi_im_algebraic_alg_conj {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hp⟩ := h
  refine ⟨p, hp0, ?_⟩
  have : Polynomial.aeval (recip_pi_log_of_pi_im_algebraic_cjQ z) p = recip_pi_log_of_pi_im_algebraic_cjQ (Polynomial.aeval z p) :=
    Polynomial.aeval_algHom_apply recip_pi_log_of_pi_im_algebraic_cjQ z p
  rw [show (conj z : ℂ) = recip_pi_log_of_pi_im_algebraic_cjQ z from rfl, this, hp, map_zero]

theorem recip_pi_log_of_pi_im_algebraic_alg_div {z w : ℂ} (hz : IsAlgebraic ℚ z) (hw : IsAlgebraic ℚ w) :
    IsAlgebraic ℚ (z / w) := by
  rw [recip_pi_log_of_pi_im_algebraic_alg_iff_mem] at *; exact Subfield.div_mem _ hz hw

theorem recip_pi_log_of_pi_im_algebraic_alg_neg {z : ℂ} (hz : IsAlgebraic ℚ z) : IsAlgebraic ℚ (-z) := by
  rw [recip_pi_log_of_pi_im_algebraic_alg_iff_mem] at *; exact Subfield.neg_mem _ hz

theorem recip_pi_log_of_pi_im_algebraic_alg_pow {z : ℂ} (hz : IsAlgebraic ℚ z) (n : ℕ) : IsAlgebraic ℚ (z ^ n) := by
  rw [recip_pi_log_of_pi_im_algebraic_alg_iff_mem] at *; exact Subfield.pow_mem _ hz n

end DZRoute

open DZRoute in
theorem recip_pi_log_of_pi_im_algebraic :
    ∀ u : ℂ, (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
      IsAlgebraic ℚ ((Real.pi * u.im : ℝ) : ℂ) →
      IsAlgebraic ℚ (Complex.exp u) →
      ∃ γ : ℂ, IsAlgebraic ℚ γ ∧ γ ≠ 0 ∧
        IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) := by
  intro u hirr halg hexp
  have hpi0 : (Real.pi : ℝ) ≠ 0 := Real.pi_ne_zero
  have hs0 : u.im ≠ 0 := by
    intro h
    refine hirr ⟨0, ?_⟩
    rw [h]
    simp
  have hsC : ((u.im : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hs0
  have hmul : (2 : ℂ) * (Complex.I * ((u.im : ℝ) : ℂ)) = u - conj u := by
    rw [Complex.sub_conj]; push_cast; ring
  have hkey : Complex.exp (Complex.I * ((u.im : ℝ) : ℂ)) ^ (2 : ℕ)
      = Complex.exp u / conj (Complex.exp u) := by
    rw [← Complex.exp_nat_mul]
    push_cast
    rw [hmul, Complex.exp_sub, Complex.exp_conj]
  have hexpv : IsAlgebraic ℚ (Complex.exp (Complex.I * ((u.im : ℝ) : ℂ))) := by
    refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
    rw [hkey]
    exact recip_pi_log_of_pi_im_algebraic_alg_div hexp (recip_pi_log_of_pi_im_algebraic_alg_conj hexp)
  refine ⟨-(((Real.pi * u.im : ℝ)) : ℂ), recip_pi_log_of_pi_im_algebraic_alg_neg halg, ?_, ?_⟩
  · simp only [neg_ne_zero, Complex.ofReal_ne_zero]
    exact mul_ne_zero hpi0 hs0
  · have hid : -(((Real.pi * u.im : ℝ)) : ℂ) / (((Real.pi : ℝ) : ℂ) * Complex.I)
        = Complex.I * ((u.im : ℝ) : ℂ) := by
      push_cast
      field_simp
      ring_nf
      rw [Complex.I_sq]
    rw [hid]
    exact hexpv

end Diaz
