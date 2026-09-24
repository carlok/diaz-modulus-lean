/-
Mirrored from Prove2Me: `DiazModulus.recip_pi_not_log_of_sharp_four_exponentials`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.recip_pi_not_log_of_sharp_four_exponentials__c431489f.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.HermiteLindemann

namespace Diaz

open Complex ComplexConjugate

namespace P16_recip_pi_not_log_of_sharp_four_exponentials

theorem recip_pi_not_log_of_sharp_four_exponentials_alg_iff_mem {z : ℂ} : IsAlgebraic ℚ z ↔ z ∈ Qbar :=
  mem_Qbar_iff.symm

theorem recip_pi_not_log_of_sharp_four_exponentials_isAlg_rat (r : ℚ) : IsAlgebraic ℚ (r : ℂ) :=
  isAlgebraic_algebraMap r

noncomputable def recip_pi_not_log_of_sharp_four_exponentials_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

theorem recip_pi_not_log_of_sharp_four_exponentials_alg_conj {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hp⟩ := h
  refine ⟨p, hp0, ?_⟩
  have : Polynomial.aeval (recip_pi_not_log_of_sharp_four_exponentials_cjQ z) p = recip_pi_not_log_of_sharp_four_exponentials_cjQ (Polynomial.aeval z p) :=
    Polynomial.aeval_algHom_apply recip_pi_not_log_of_sharp_four_exponentials_cjQ z p
  rw [show (conj z : ℂ) = recip_pi_not_log_of_sharp_four_exponentials_cjQ z from rfl, this, hp, map_zero]

/-- `ℒ` is stable under conjugation. -/
theorem recip_pi_not_log_of_sharp_four_exponentials_exp_conj_alg {w : ℂ} (hw : IsAlgebraic ℚ (Complex.exp w)) :
    IsAlgebraic ℚ (Complex.exp (conj w)) := by
  rw [Complex.exp_conj]; exact recip_pi_not_log_of_sharp_four_exponentials_alg_conj hw

/-- Hermite–Lindemann in the form used here: a non-zero logarithm of an algebraic number is
transcendental. -/
theorem recip_pi_not_log_of_sharp_four_exponentials_transc_of_exp {z : ℂ} (hz : z ≠ 0) (he : IsAlgebraic ℚ (Complex.exp z)) :
    Transcendental ℚ z := fun h => hermite_lindemann_holds z hz h he

theorem recip_pi_not_log_of_sharp_four_exponentials_rho_eq (u : ℂ) : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
  rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]; push_cast; ring

theorem recip_pi_not_log_of_sharp_four_exponentials_pI_ne_zero : ((Real.pi : ℝ) : ℂ) * Complex.I ≠ 0 :=
  mul_ne_zero (Complex.ofReal_ne_zero.2 Real.pi_ne_zero) Complex.I_ne_zero

theorem recip_pi_not_log_of_sharp_four_exponentials_exp_pI_alg : IsAlgebraic ℚ (Complex.exp (((Real.pi : ℝ) : ℂ) * Complex.I)) := by
  rw [Complex.exp_pi_mul_I]; simpa using recip_pi_not_log_of_sharp_four_exponentials_isAlg_rat (-1)

theorem recip_pi_not_log_of_sharp_four_exponentials_conj_pI :
    conj (((Real.pi : ℝ) : ℂ) * Complex.I) = -(((Real.pi : ℝ) : ℂ) * Complex.I) := by
  rw [map_mul, Complex.conj_ofReal, Complex.conj_I]; ring

/-- `iπ` is transcendental, by Hermite–Lindemann, since `exp (iπ) = -1`. -/
theorem recip_pi_not_log_of_sharp_four_exponentials_pI_transc : Transcendental ℚ (((Real.pi : ℝ) : ℂ) * Complex.I) :=
  recip_pi_not_log_of_sharp_four_exponentials_transc_of_exp recip_pi_not_log_of_sharp_four_exponentials_pI_ne_zero recip_pi_not_log_of_sharp_four_exponentials_exp_pI_alg

/-- `1` and a transcendental number are `ℚ`-linearly independent. -/
theorem recip_pi_not_log_of_sharp_four_exponentials_li_one {z : ℂ} (hz : Transcendental ℚ z) : LinearIndependent ℚ ![(1 : ℂ), z] := by
  rw [LinearIndependent.pair_iff]
  intro s t h
  rw [Rat.smul_def, Rat.smul_def, mul_one] at h
  by_cases ht : t = 0
  · subst ht
    simp only [Rat.cast_zero, zero_mul, add_zero] at h
    exact ⟨by exact_mod_cast h, rfl⟩
  · exfalso
    apply hz
    have htC : (t : ℂ) ≠ 0 := by exact_mod_cast ht
    have hz' : z = ((-s / t : ℚ) : ℂ) := by
      push_cast
      field_simp
      linear_combination h
    rw [hz']
    exact recip_pi_not_log_of_sharp_four_exponentials_isAlg_rat _

end P16_recip_pi_not_log_of_sharp_four_exponentials

open P16_recip_pi_not_log_of_sharp_four_exponentials in
theorem recip_pi_not_log_of_sharp_four_exponentials (hS4 : ∀ x₁ x₂ y₁ y₂ β₁₁ β₁₂ β₂₁ β₂₂ : ℂ,
      LinearIndependent ℚ ![x₁, x₂] → LinearIndependent ℚ ![y₁, y₂] →
      IsAlgebraic ℚ β₁₁ → IsAlgebraic ℚ β₁₂ → IsAlgebraic ℚ β₂₁ → IsAlgebraic ℚ β₂₂ →
      IsAlgebraic ℚ (Complex.exp (x₁ * y₁ - β₁₁)) → IsAlgebraic ℚ (Complex.exp (x₁ * y₂ - β₁₂)) →
      IsAlgebraic ℚ (Complex.exp (x₂ * y₁ - β₂₁)) → IsAlgebraic ℚ (Complex.exp (x₂ * y₂ - β₂₂)) →
      x₁ * y₁ = β₁₁ ∧ x₁ * y₂ = β₁₂ ∧ x₂ * y₁ = β₂₁ ∧ x₂ * y₂ = β₂₂) :
    ∀ γ : ℂ, IsAlgebraic ℚ γ → γ ≠ 0 →
      ¬ IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) := by
  intro γ hγ hγ0 he
  have hp0 := recip_pi_not_log_of_sharp_four_exponentials_pI_ne_zero
  have hl0 : γ / (((Real.pi : ℝ) : ℂ) * Complex.I) ≠ 0 := div_ne_zero hγ0 hp0
  have hlt : Transcendental ℚ (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)) := recip_pi_not_log_of_sharp_four_exponentials_transc_of_exp hl0 he
  have hprod : γ / (((Real.pi : ℝ) : ℂ) * Complex.I) * (((Real.pi : ℝ) : ℂ) * Complex.I) = γ :=
    div_mul_cancel₀ γ hp0
  obtain ⟨-, h12, -, -⟩ := hS4 1 (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)) 1
    (((Real.pi : ℝ) : ℂ) * Complex.I) 1 0 0 γ
    (recip_pi_not_log_of_sharp_four_exponentials_li_one hlt) (recip_pi_not_log_of_sharp_four_exponentials_li_one recip_pi_not_log_of_sharp_four_exponentials_pI_transc) isAlgebraic_one isAlgebraic_zero isAlgebraic_zero hγ
    (by simpa using (isAlgebraic_one : IsAlgebraic ℚ (1 : ℂ))) (by simpa using recip_pi_not_log_of_sharp_four_exponentials_exp_pI_alg) (by simpa using he) (by rw [hprod]; simpa using (isAlgebraic_one : IsAlgebraic ℚ (1 : ℂ)))
  exact hp0 (by simpa using h12)

end Diaz
