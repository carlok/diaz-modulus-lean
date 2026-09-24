/-
Mirrored from Prove2Me: `DiazModulus.diaz_of_two_by_two_determinant_conjecture`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_of_two_by_two_determinant_conjecture__bfc75273.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.HermiteLindemann

namespace Diaz

open Complex ComplexConjugate

namespace P16_diaz_of_two_by_two_determinant_conjecture

theorem diaz_of_two_by_two_determinant_conjecture_alg_iff_mem {z : ℂ} : IsAlgebraic ℚ z ↔ z ∈ Qbar :=
  mem_Qbar_iff.symm

theorem diaz_of_two_by_two_determinant_conjecture_isAlg_rat (r : ℚ) : IsAlgebraic ℚ (r : ℂ) :=
  isAlgebraic_algebraMap r

noncomputable def diaz_of_two_by_two_determinant_conjecture_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

theorem diaz_of_two_by_two_determinant_conjecture_alg_conj {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hp⟩ := h
  refine ⟨p, hp0, ?_⟩
  have : Polynomial.aeval (diaz_of_two_by_two_determinant_conjecture_cjQ z) p = diaz_of_two_by_two_determinant_conjecture_cjQ (Polynomial.aeval z p) :=
    Polynomial.aeval_algHom_apply diaz_of_two_by_two_determinant_conjecture_cjQ z p
  rw [show (conj z : ℂ) = diaz_of_two_by_two_determinant_conjecture_cjQ z from rfl, this, hp, map_zero]

/-- `ℒ` is stable under conjugation. -/
theorem diaz_of_two_by_two_determinant_conjecture_exp_conj_alg {w : ℂ} (hw : IsAlgebraic ℚ (Complex.exp w)) :
    IsAlgebraic ℚ (Complex.exp (conj w)) := by
  rw [Complex.exp_conj]; exact diaz_of_two_by_two_determinant_conjecture_alg_conj hw

/-- Hermite–Lindemann in the form used here: a non-zero logarithm of an algebraic number is
transcendental. -/
theorem diaz_of_two_by_two_determinant_conjecture_transc_of_exp {z : ℂ} (hz : z ≠ 0) (he : IsAlgebraic ℚ (Complex.exp z)) :
    Transcendental ℚ z := fun h => hermite_lindemann_holds z hz h he

theorem diaz_of_two_by_two_determinant_conjecture_rho_eq (u : ℂ) : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
  rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]; push_cast; ring

theorem diaz_of_two_by_two_determinant_conjecture_pI_ne_zero : ((Real.pi : ℝ) : ℂ) * Complex.I ≠ 0 :=
  mul_ne_zero (Complex.ofReal_ne_zero.2 Real.pi_ne_zero) Complex.I_ne_zero

theorem diaz_of_two_by_two_determinant_conjecture_exp_pI_alg : IsAlgebraic ℚ (Complex.exp (((Real.pi : ℝ) : ℂ) * Complex.I)) := by
  rw [Complex.exp_pi_mul_I]; simpa using diaz_of_two_by_two_determinant_conjecture_isAlg_rat (-1)

theorem diaz_of_two_by_two_determinant_conjecture_conj_pI :
    conj (((Real.pi : ℝ) : ℂ) * Complex.I) = -(((Real.pi : ℝ) : ℂ) * Complex.I) := by
  rw [map_mul, Complex.conj_ofReal, Complex.conj_I]; ring

/-- `iπ` is transcendental, by Hermite–Lindemann, since `exp (iπ) = -1`. -/
theorem diaz_of_two_by_two_determinant_conjecture_pI_transc : Transcendental ℚ (((Real.pi : ℝ) : ℂ) * Complex.I) :=
  diaz_of_two_by_two_determinant_conjecture_transc_of_exp diaz_of_two_by_two_determinant_conjecture_pI_ne_zero diaz_of_two_by_two_determinant_conjecture_exp_pI_alg

theorem mem_tilde_of_log {z : ℂ} (h : IsAlgebraic ℚ (Complex.exp z)) :
    z ∈ LogAlgTilde :=
  Submodule.subset_span (Set.mem_insert_of_mem _ h)

theorem one_mem_tilde : (1 : ℂ) ∈ LogAlgTilde :=
  Submodule.subset_span (Set.mem_insert _ _)

theorem mem_tilde_of_alg {z : ℂ} (h : IsAlgebraic ℚ z) : z ∈ LogAlgTilde := by
  have hs := Submodule.smul_mem LogAlgTilde
    (⟨z, diaz_of_two_by_two_determinant_conjecture_alg_iff_mem.1 h⟩ : ↥Qbar) one_mem_tilde
  have he : (⟨z, diaz_of_two_by_two_determinant_conjecture_alg_iff_mem.1 h⟩ : ↥Qbar) • (1 : ℂ) = z := by
    rw [Algebra.smul_def, mul_one]; rfl
  rwa [he] at hs

/-- From `s z ∈ Q̄` with `s ∈ Q̄`, `s ≠ 0`, the number `z` is algebraic. -/
theorem alg_of_mul {s z : ℂ} (hs : s ∈ Qbar) (hs0 : s ≠ 0)
    (h : s * z ∈ Qbar) : IsAlgebraic ℚ z := by
  rw [diaz_of_two_by_two_determinant_conjecture_alg_iff_mem]
  have : z = s⁻¹ * (s * z) := by field_simp
  rw [this]
  exact mul_mem (inv_mem hs) h

end P16_diaz_of_two_by_two_determinant_conjecture

open P16_diaz_of_two_by_two_determinant_conjecture in
theorem diaz_of_two_by_two_determinant_conjecture (hW : ∀ a b c d : ℂ, a ∈ LogAlgTilde → b ∈ LogAlgTilde → c ∈ LogAlgTilde →
      d ∈ LogAlgTilde →
      (∀ s t : ℂ, s ∈ Qbar → t ∈ Qbar → s * a + t * c ∈ Qbar → s * b + t * d ∈ Qbar →
        s = 0 ∧ t = 0) →
      (∀ s t : ℂ, s ∈ Qbar → t ∈ Qbar → s * a + t * b ∈ Qbar → s * c + t * d ∈ Qbar →
        s = 0 ∧ t = 0) →
      a * d - b * c ∉ LogAlgTilde) :
    DiazModulusConjecture := by
  intro u hu0 hnorm he
  have hρ : IsAlgebraic ℚ (u * conj u) := by rw [diaz_of_two_by_two_determinant_conjecture_rho_eq]; exact hnorm.pow 2
  have hut : Transcendental ℚ u := diaz_of_two_by_two_determinant_conjecture_transc_of_exp hu0 he
  have hcut : Transcendental ℚ (conj u) := fun h => hut (by simpa using diaz_of_two_by_two_determinant_conjecture_alg_conj h)
  have hrQ : ((‖u‖ : ℝ) : ℂ) ∈ Qbar := diaz_of_two_by_two_determinant_conjecture_alg_iff_mem.1 hnorm
  -- the rows of `(H; I₂)` and the columns of `(I₂, H)` are `Q̄`-independent, `H` being symmetric
  have hind : ∀ s t : ℂ, s ∈ Qbar → t ∈ Qbar →
      s * u + t * ((‖u‖ : ℝ) : ℂ) ∈ Qbar →
      s * ((‖u‖ : ℝ) : ℂ) + t * conj u ∈ Qbar → s = 0 ∧ t = 0 := by
    intro s t hs ht h1 h2
    have hsu : s * u ∈ Qbar := by
      have := sub_mem h1 (mul_mem ht hrQ)
      simpa using this
    have htu : t * conj u ∈ Qbar := by
      have := sub_mem h2 (mul_mem hs hrQ)
      simpa using this
    constructor
    · by_contra hs0
      exact hut (alg_of_mul hs hs0 hsu)
    · by_contra ht0
      exact hcut (alg_of_mul ht ht0 htu)
  apply hW u ((‖u‖ : ℝ) : ℂ) ((‖u‖ : ℝ) : ℂ) (conj u) (mem_tilde_of_log he)
    (mem_tilde_of_alg hnorm) (mem_tilde_of_alg hnorm) (mem_tilde_of_log (diaz_of_two_by_two_determinant_conjecture_exp_conj_alg he))
    hind hind
  have hdet : u * conj u - ((‖u‖ : ℝ) : ℂ) * ((‖u‖ : ℝ) : ℂ) = 0 := by
    rw [diaz_of_two_by_two_determinant_conjecture_rho_eq]
    ring
  rw [hdet]
  exact zero_mem _

end Diaz
