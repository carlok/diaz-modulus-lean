/-
Mirrored from Prove2Me: `DiazModulus.diaz_of_sharp_four_exponentials`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_of_sharp_four_exponentials__d51804c3.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.HermiteLindemann

namespace Diaz

open Complex ComplexConjugate

namespace P16_diaz_of_sharp_four_exponentials

theorem diaz_of_sharp_four_exponentials_alg_iff_mem {z : ℂ} : IsAlgebraic ℚ z ↔ z ∈ Qbar :=
  mem_Qbar_iff.symm

theorem diaz_of_sharp_four_exponentials_isAlg_rat (r : ℚ) : IsAlgebraic ℚ (r : ℂ) :=
  isAlgebraic_algebraMap r

noncomputable def diaz_of_sharp_four_exponentials_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

theorem diaz_of_sharp_four_exponentials_alg_conj {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hp⟩ := h
  refine ⟨p, hp0, ?_⟩
  have : Polynomial.aeval (diaz_of_sharp_four_exponentials_cjQ z) p = diaz_of_sharp_four_exponentials_cjQ (Polynomial.aeval z p) :=
    Polynomial.aeval_algHom_apply diaz_of_sharp_four_exponentials_cjQ z p
  rw [show (conj z : ℂ) = diaz_of_sharp_four_exponentials_cjQ z from rfl, this, hp, map_zero]

/-- `ℒ` is stable under conjugation. -/
theorem diaz_of_sharp_four_exponentials_exp_conj_alg {w : ℂ} (hw : IsAlgebraic ℚ (Complex.exp w)) :
    IsAlgebraic ℚ (Complex.exp (conj w)) := by
  rw [Complex.exp_conj]; exact diaz_of_sharp_four_exponentials_alg_conj hw

/-- Hermite–Lindemann in the form used here: a non-zero logarithm of an algebraic number is
transcendental. -/
theorem diaz_of_sharp_four_exponentials_transc_of_exp {z : ℂ} (hz : z ≠ 0) (he : IsAlgebraic ℚ (Complex.exp z)) :
    Transcendental ℚ z := fun h => hermite_lindemann_holds z hz h he

theorem diaz_of_sharp_four_exponentials_rho_eq (u : ℂ) : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
  rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]; push_cast; ring

theorem diaz_of_sharp_four_exponentials_pI_ne_zero : ((Real.pi : ℝ) : ℂ) * Complex.I ≠ 0 :=
  mul_ne_zero (Complex.ofReal_ne_zero.2 Real.pi_ne_zero) Complex.I_ne_zero

theorem diaz_of_sharp_four_exponentials_exp_pI_alg : IsAlgebraic ℚ (Complex.exp (((Real.pi : ℝ) : ℂ) * Complex.I)) := by
  rw [Complex.exp_pi_mul_I]; simpa using diaz_of_sharp_four_exponentials_isAlg_rat (-1)

theorem diaz_of_sharp_four_exponentials_conj_pI :
    conj (((Real.pi : ℝ) : ℂ) * Complex.I) = -(((Real.pi : ℝ) : ℂ) * Complex.I) := by
  rw [map_mul, Complex.conj_ofReal, Complex.conj_I]; ring

/-- `iπ` is transcendental, by Hermite–Lindemann, since `exp (iπ) = -1`. -/
theorem diaz_of_sharp_four_exponentials_pI_transc : Transcendental ℚ (((Real.pi : ℝ) : ℂ) * Complex.I) :=
  diaz_of_sharp_four_exponentials_transc_of_exp diaz_of_sharp_four_exponentials_pI_ne_zero diaz_of_sharp_four_exponentials_exp_pI_alg

/-- `1` and a transcendental number are `ℚ`-linearly independent. -/
theorem li_one {z : ℂ} (hz : Transcendental ℚ z) : LinearIndependent ℚ ![(1 : ℂ), z] := by
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
    exact diaz_of_sharp_four_exponentials_isAlg_rat _

end P16_diaz_of_sharp_four_exponentials

open P16_diaz_of_sharp_four_exponentials in
theorem diaz_of_sharp_four_exponentials (hS4 : ∀ x₁ x₂ y₁ y₂ β₁₁ β₁₂ β₂₁ β₂₂ : ℂ,
      LinearIndependent ℚ ![x₁, x₂] → LinearIndependent ℚ ![y₁, y₂] →
      IsAlgebraic ℚ β₁₁ → IsAlgebraic ℚ β₁₂ → IsAlgebraic ℚ β₂₁ → IsAlgebraic ℚ β₂₂ →
      IsAlgebraic ℚ (Complex.exp (x₁ * y₁ - β₁₁)) → IsAlgebraic ℚ (Complex.exp (x₁ * y₂ - β₁₂)) →
      IsAlgebraic ℚ (Complex.exp (x₂ * y₁ - β₂₁)) → IsAlgebraic ℚ (Complex.exp (x₂ * y₂ - β₂₂)) →
      x₁ * y₁ = β₁₁ ∧ x₁ * y₂ = β₁₂ ∧ x₂ * y₁ = β₂₁ ∧ x₂ * y₂ = β₂₂) :
    DiazModulusConjecture := by
  intro u hu0 hnorm he
  have hρ : IsAlgebraic ℚ (u * conj u) := by rw [diaz_of_sharp_four_exponentials_rho_eq]; exact hnorm.pow 2
  have hut : Transcendental ℚ u := diaz_of_sharp_four_exponentials_transc_of_exp hu0 he
  have hcut : Transcendental ℚ (conj u) := fun h => hut (by simpa using diaz_of_sharp_four_exponentials_alg_conj h)
  obtain ⟨-, h12, -, -⟩ := hS4 1 u 1 (conj u) 1 0 0 (u * conj u)
    (li_one hut) (li_one hcut) isAlgebraic_one isAlgebraic_zero isAlgebraic_zero hρ
    (by simpa using (isAlgebraic_one : IsAlgebraic ℚ (1 : ℂ))) (by simpa using diaz_of_sharp_four_exponentials_exp_conj_alg he) (by simpa using he) (by simpa using (isAlgebraic_one : IsAlgebraic ℚ (1 : ℂ)))
  exact hu0 (by simpa using h12)

end Diaz
