/-
Mirrored from Prove2Me: `DiazModulus.recip_pi_not_log_of_two_by_two_determinant_conjecture`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.recip_pi_not_log_of_two_by_two_determinant_conjecture__d4b2d63d.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.HermiteLindemann

namespace Diaz

open Complex ComplexConjugate

namespace P16_recip_pi_not_log_of_two_by_two_determinant_conjecture

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_iff_mem {z : ℂ} : IsAlgebraic ℚ z ↔ z ∈ Qbar :=
  mem_Qbar_iff.symm

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_isAlg_rat (r : ℚ) : IsAlgebraic ℚ (r : ℂ) :=
  isAlgebraic_algebraMap r

noncomputable def recip_pi_not_log_of_two_by_two_determinant_conjecture_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_conj {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hp⟩ := h
  refine ⟨p, hp0, ?_⟩
  have : Polynomial.aeval (recip_pi_not_log_of_two_by_two_determinant_conjecture_cjQ z) p = recip_pi_not_log_of_two_by_two_determinant_conjecture_cjQ (Polynomial.aeval z p) :=
    Polynomial.aeval_algHom_apply recip_pi_not_log_of_two_by_two_determinant_conjecture_cjQ z p
  rw [show (conj z : ℂ) = recip_pi_not_log_of_two_by_two_determinant_conjecture_cjQ z from rfl, this, hp, map_zero]

/-- `ℒ` is stable under conjugation. -/
theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_exp_conj_alg {w : ℂ} (hw : IsAlgebraic ℚ (Complex.exp w)) :
    IsAlgebraic ℚ (Complex.exp (conj w)) := by
  rw [Complex.exp_conj]; exact recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_conj hw

/-- Hermite–Lindemann in the form used here: a non-zero logarithm of an algebraic number is
transcendental. -/
theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_transc_of_exp {z : ℂ} (hz : z ≠ 0) (he : IsAlgebraic ℚ (Complex.exp z)) :
    Transcendental ℚ z := fun h => hermite_lindemann_holds z hz h he

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_rho_eq (u : ℂ) : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
  rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]; push_cast; ring

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_pI_ne_zero : ((Real.pi : ℝ) : ℂ) * Complex.I ≠ 0 :=
  mul_ne_zero (Complex.ofReal_ne_zero.2 Real.pi_ne_zero) Complex.I_ne_zero

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_exp_pI_alg : IsAlgebraic ℚ (Complex.exp (((Real.pi : ℝ) : ℂ) * Complex.I)) := by
  rw [Complex.exp_pi_mul_I]; simpa using recip_pi_not_log_of_two_by_two_determinant_conjecture_isAlg_rat (-1)

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_conj_pI :
    conj (((Real.pi : ℝ) : ℂ) * Complex.I) = -(((Real.pi : ℝ) : ℂ) * Complex.I) := by
  rw [map_mul, Complex.conj_ofReal, Complex.conj_I]; ring

/-- `iπ` is transcendental, by Hermite–Lindemann, since `exp (iπ) = -1`. -/
theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_pI_transc : Transcendental ℚ (((Real.pi : ℝ) : ℂ) * Complex.I) :=
  recip_pi_not_log_of_two_by_two_determinant_conjecture_transc_of_exp recip_pi_not_log_of_two_by_two_determinant_conjecture_pI_ne_zero recip_pi_not_log_of_two_by_two_determinant_conjecture_exp_pI_alg

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_mem_tilde_of_log {z : ℂ} (h : IsAlgebraic ℚ (Complex.exp z)) :
    z ∈ LogAlgTilde :=
  Submodule.subset_span (Set.mem_insert_of_mem _ h)

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_one_mem_tilde : (1 : ℂ) ∈ LogAlgTilde :=
  Submodule.subset_span (Set.mem_insert _ _)

theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_mem_tilde_of_alg {z : ℂ} (h : IsAlgebraic ℚ z) : z ∈ LogAlgTilde := by
  have hs := Submodule.smul_mem LogAlgTilde
    (⟨z, recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_iff_mem.1 h⟩ : ↥Qbar) recip_pi_not_log_of_two_by_two_determinant_conjecture_one_mem_tilde
  have he : (⟨z, recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_iff_mem.1 h⟩ : ↥Qbar) • (1 : ℂ) = z := by
    rw [Algebra.smul_def, mul_one]; rfl
  rwa [he] at hs

/-- From `s z ∈ Q̄` with `s ∈ Q̄`, `s ≠ 0`, the number `z` is algebraic. -/
theorem recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_of_mul {s z : ℂ} (hs : s ∈ Qbar) (hs0 : s ≠ 0)
    (h : s * z ∈ Qbar) : IsAlgebraic ℚ z := by
  rw [recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_iff_mem]
  have : z = s⁻¹ * (s * z) := by field_simp
  rw [this]
  exact mul_mem (inv_mem hs) h

end P16_recip_pi_not_log_of_two_by_two_determinant_conjecture

open P16_recip_pi_not_log_of_two_by_two_determinant_conjecture in
theorem recip_pi_not_log_of_two_by_two_determinant_conjecture (hW : ∀ a b c d : ℂ, a ∈ LogAlgTilde → b ∈ LogAlgTilde → c ∈ LogAlgTilde →
      d ∈ LogAlgTilde →
      (∀ s t : ℂ, s ∈ Qbar → t ∈ Qbar → s * a + t * c ∈ Qbar → s * b + t * d ∈ Qbar →
        s = 0 ∧ t = 0) →
      (∀ s t : ℂ, s ∈ Qbar → t ∈ Qbar → s * a + t * b ∈ Qbar → s * c + t * d ∈ Qbar →
        s = 0 ∧ t = 0) →
      a * d - b * c ∉ LogAlgTilde) :
    ∀ γ : ℂ, IsAlgebraic ℚ γ → γ ≠ 0 →
      ¬ IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) := by
  intro γ hγ hγ0 he
  have hp0 := recip_pi_not_log_of_two_by_two_determinant_conjecture_pI_ne_zero
  have hl0 : γ / (((Real.pi : ℝ) : ℂ) * Complex.I) ≠ 0 := div_ne_zero hγ0 hp0
  have hlt : Transcendental ℚ (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)) := recip_pi_not_log_of_two_by_two_determinant_conjecture_transc_of_exp hl0 he
  have hprod : γ / (((Real.pi : ℝ) : ℂ) * Complex.I) * (((Real.pi : ℝ) : ℂ) * Complex.I) = γ :=
    div_mul_cancel₀ γ hp0
  have hγQ : γ ∈ Qbar := recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_iff_mem.1 hγ
  have hoQ : (1 : ℂ) ∈ Qbar := one_mem _
  apply hW 1 (((Real.pi : ℝ) : ℂ) * Complex.I) (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)) γ
    recip_pi_not_log_of_two_by_two_determinant_conjecture_one_mem_tilde (recip_pi_not_log_of_two_by_two_determinant_conjecture_mem_tilde_of_log recip_pi_not_log_of_two_by_two_determinant_conjecture_exp_pI_alg) (recip_pi_not_log_of_two_by_two_determinant_conjecture_mem_tilde_of_log he) (recip_pi_not_log_of_two_by_two_determinant_conjecture_mem_tilde_of_alg hγ)
  · -- rows `(1, iπ)` and `(λ, γ)`: from `s iπ + t γ ∈ Q̄` get `s = 0`, then `t λ ∈ Q̄` gives `t = 0`
    intro s t hs ht h1 h2
    have hsp : s * (((Real.pi : ℝ) : ℂ) * Complex.I) ∈ Qbar := by
      have := sub_mem h2 (mul_mem ht hγQ)
      simpa using this
    have hs0 : s = 0 := by
      by_contra hs0
      exact recip_pi_not_log_of_two_by_two_determinant_conjecture_pI_transc (recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_of_mul hs hs0 hsp)
    subst hs0
    refine ⟨rfl, ?_⟩
    by_contra ht0
    exact hlt (recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_of_mul ht ht0 (by simpa using h1))
  · -- columns `(1, λ)` and `(iπ, γ)`: from `s + t iπ ∈ Q̄` get `t = 0`, then `s λ ∈ Q̄` gives `s = 0`
    intro s t hs ht h1 h2
    have htp : t * (((Real.pi : ℝ) : ℂ) * Complex.I) ∈ Qbar := by
      have := sub_mem h1 (mul_mem hs hoQ)
      simpa using this
    have ht0 : t = 0 := by
      by_contra ht0
      exact recip_pi_not_log_of_two_by_two_determinant_conjecture_pI_transc (recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_of_mul ht ht0 htp)
    subst ht0
    refine ⟨?_, rfl⟩
    by_contra hs0
    exact hlt (recip_pi_not_log_of_two_by_two_determinant_conjecture_alg_of_mul hs hs0 (by simpa using h2))
  have hdet : 1 * γ - (((Real.pi : ℝ) : ℂ) * Complex.I) *
      (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)) = 0 := by
    rw [mul_div_cancel₀ γ hp0]
    ring
  rw [hdet]
  exact zero_mem _

end Diaz
