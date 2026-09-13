/-
Mirrored from Prove2Me: `Diaz.axis_triple_indep`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.axis_triple_indep__b1a54c1d.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation
import Diaz.HermiteLindemann

namespace Diaz

open ComplexConjugate
open Diaz
open Finset
open scoped Polynomial
open MvPolynomial.symmetricSubalgebra
open scoped AddMonoidAlgebra
open Finset
open Complex
open Polynomial
open scoped Nat
open Complex Finset Polynomial

private theorem axis_triple_indep_HL_aux {u : ℂ} (hu : u ≠ 0) (hexp : IsAlgebraic ℚ (Complex.exp u)) :
    Transcendental ℚ u := by
  intro hualg
  have h1 : IsIntegral ℚ u := isAlgebraic_iff_isIntegral.mp hualg
  have h2 : IsIntegral ℚ (Complex.exp u) := isAlgebraic_iff_isIntegral.mp hexp
  refine by
    simpa [Fin.forall_fin_succ] using
      linearIndependent_exp' ![u, 0] ?_ ?_ ![1, -Complex.exp u] ?_ ?_
  · intro i; fin_cases i
    exacts [h1, isIntegral_zero]
  · intro i j; fin_cases i, j <;> simp [hu.symm, *]
  · intro i; fin_cases i; exacts [isIntegral_one, h2.neg]
  · simp

private theorem hmem (z : ℂ) : IsAlgebraic ℚ z ↔ z ∈ Qbar := by
  rw [Qbar, IntermediateField.mem_toSubfield, mem_algebraicClosure_iff]

private theorem conjalg {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) :=
  h.algHom (((starRingEnd ℂ) : ℂ →+* ℂ).toRatAlgHom)

private theorem offaxes {u : ℂ} (hu0 : u ≠ 0) (hexp : IsAlgebraic ℚ (Complex.exp u))
    (hρ : IsAlgebraic ℚ (u * conj u)) : conj u ≠ u ∧ conj u ≠ -u := by
  constructor
  · intro h
    refine axis_triple_indep_HL_aux hu0 hexp (IsAlgebraic.of_pow (n := 2) (by norm_num) ?_)
    have e : u ^ 2 = u * conj u := by rw [h]; ring
    rw [e]; exact hρ
  · intro h
    refine axis_triple_indep_HL_aux hu0 hexp (IsAlgebraic.of_pow (n := 2) (by norm_num) ?_)
    have e : (u : ℂ) ^ 2 = -(u * conj u) := by rw [h]; ring
    rw [e]; exact (hmem _).mpr (Qbar.neg_mem ((hmem _).mp hρ))

theorem axis_triple_indep {u τ : ℂ}
    (hu0 : u ≠ 0) (hexpu : IsAlgebraic ℚ (Complex.exp u))
    (hρ : IsAlgebraic ℚ (u * conj u))
    (hax : conj τ = τ ∨ conj τ = -τ)
    (hq : IsAlgebraic ℚ ((u + τ) * conj (u + τ)))
    (hne : (u + τ) * conj (u + τ) ≠ u * conj u)
    {a b c : ℚ} (hrel : (a : ℂ) * u + (b : ℂ) * conj u + (c : ℂ) * τ = 0) :
    a = 0 ∧ b = 0 ∧ c = 0 := by
  obtain ⟨hax1, hax2⟩ := offaxes hu0 hexpu hρ
  have hcu0 : conj u ≠ 0 := by simpa using hu0
  have hexpc : IsAlgebraic ℚ (Complex.exp (conj u)) := by
    rw [Complex.exp_conj]; exact conjalg hexpu
  have hTne : u - conj u ≠ 0 := sub_ne_zero.mpr (fun h => hax1 h.symm)
  have hSne : u + conj u ≠ 0 := fun h => hax2 (by linear_combination h)
  have hexpS : IsAlgebraic ℚ (Complex.exp (u + conj u)) := by
    rw [Complex.exp_add]
    exact (hmem _).mpr (Qbar.mul_mem ((hmem _).mp hexpu) ((hmem _).mp hexpc))
  have hexpT : IsAlgebraic ℚ (Complex.exp (u - conj u)) := by
    rw [Complex.exp_sub]
    exact (hmem _).mpr (Qbar.div_mem ((hmem _).mp hexpu) ((hmem _).mp hexpc))
  have hcq : ∀ q : ℚ, conj ((q : ℂ)) = (q : ℂ) := fun q => by simp
  have hconj : (a : ℂ) * conj u + (b : ℂ) * u + (c : ℂ) * conj τ = 0 := by
    have h := congrArg conj hrel
    rw [map_add, map_add, map_mul, map_mul, map_mul, hcq, hcq, hcq, Complex.conj_conj,
      map_zero] at h
    exact h
  have hratmem : ∀ q : ℚ, ((q : ℂ)) ∈ Qbar := fun q => by
    simpa using Qbar.ratCast_mem q
  rcases hax with hA | hB
  · -- τ real
    have hab : (a : ℂ) = (b : ℂ) := by
      have hz : ((a : ℂ) - (b : ℂ)) * (u - conj u) = 0 := by
        rw [hA] at hconj; linear_combination hrel - hconj
      rcases mul_eq_zero.mp hz with h | h
      · linear_combination h
      · exact absurd h hTne
    have habq : a = b := by exact_mod_cast hab
    have hrel2 : (a : ℂ) * (u + conj u) + (c : ℂ) * τ = 0 := by
      linear_combination hrel + (conj u) * hab
    by_cases hc0 : c = 0
    · have hz : (a : ℂ) * (u + conj u) = 0 := by
        rw [hc0] at hrel2; simpa using hrel2
      have ha0 : (a : ℂ) = 0 := by
        rcases mul_eq_zero.mp hz with h | h
        · exact h
        · exact absurd h hSne
      have haq : a = 0 := by exact_mod_cast ha0
      exact ⟨haq, habq.symm.trans haq, hc0⟩
    · exfalso
      have hcC : (c : ℂ) ≠ 0 := by exact_mod_cast hc0
      set r : ℚ := -a / c with hrdef
      have hrC : (r : ℂ) = -(a : ℂ) / (c : ℂ) := by rw [hrdef]; push_cast; ring
      have hτeq : τ = (r : ℂ) * (u + conj u) := by
        rw [hrC, div_mul_eq_mul_div, eq_div_iff hcC]
        linear_combination hrel2
      have hqq : (u + τ) * conj (u + τ) - u * conj u
          = ((r : ℂ) * (1 + (r : ℂ))) * (u + conj u) ^ 2 := by
        rw [map_add, hA, hτeq]; ring
      by_cases hrm : (r : ℂ) * (1 + (r : ℂ)) = 0
      · exact hne (by rw [hrm] at hqq; linear_combination hqq)
      · refine axis_triple_indep_HL_aux hSne hexpS (IsAlgebraic.of_pow (n := 2) (by norm_num) ?_)
        have e : (u + conj u) ^ 2
            = ((u + τ) * conj (u + τ) - u * conj u) / ((r : ℂ) * (1 + (r : ℂ))) := by
          rw [eq_div_iff hrm, hqq]; ring
        rw [e]
        exact (hmem _).mpr (Qbar.div_mem
          (Qbar.sub_mem ((hmem _).mp hq) ((hmem _).mp hρ))
          (Qbar.mul_mem (hratmem r) (Qbar.add_mem Qbar.one_mem (hratmem r))))
  · -- τ purely imaginary
    have hab : (a : ℂ) + (b : ℂ) = 0 := by
      have hz : ((a : ℂ) + (b : ℂ)) * (u + conj u) = 0 := by
        rw [hB] at hconj; linear_combination hrel + hconj
      rcases mul_eq_zero.mp hz with h | h
      · exact h
      · exact absurd h hSne
    have habq : b = -a := by
      have : (b : ℂ) = -(a : ℂ) := by linear_combination hab
      exact_mod_cast this
    have hrel2 : (a : ℂ) * (u - conj u) + (c : ℂ) * τ = 0 := by
      linear_combination hrel - (conj u) * hab
    by_cases hc0 : c = 0
    · have hz : (a : ℂ) * (u - conj u) = 0 := by
        rw [hc0] at hrel2; simpa using hrel2
      have ha0 : (a : ℂ) = 0 := by
        rcases mul_eq_zero.mp hz with h | h
        · exact h
        · exact absurd h hTne
      have haq : a = 0 := by exact_mod_cast ha0
      exact ⟨haq, by rw [habq, haq]; ring, hc0⟩
    · exfalso
      have hcC : (c : ℂ) ≠ 0 := by exact_mod_cast hc0
      set r : ℚ := -a / c with hrdef
      have hrC : (r : ℂ) = -(a : ℂ) / (c : ℂ) := by rw [hrdef]; push_cast; ring
      have hτeq : τ = (r : ℂ) * (u - conj u) := by
        rw [hrC, div_mul_eq_mul_div, eq_div_iff hcC]
        linear_combination hrel2
      have hqq : (u + τ) * conj (u + τ) - u * conj u
          = (-((r : ℂ) * (1 + (r : ℂ)))) * (u - conj u) ^ 2 := by
        rw [map_add, hB, hτeq]; ring
      by_cases hrm : (r : ℂ) * (1 + (r : ℂ)) = 0
      · exact hne (by rw [hrm] at hqq; linear_combination hqq)
      · refine axis_triple_indep_HL_aux hTne hexpT (IsAlgebraic.of_pow (n := 2) (by norm_num) ?_)
        have hrm' : (-((r : ℂ) * (1 + (r : ℂ)))) ≠ 0 := neg_ne_zero.mpr hrm
        have e : (u - conj u) ^ 2
            = ((u + τ) * conj (u + τ) - u * conj u) / (-((r : ℂ) * (1 + (r : ℂ)))) := by
          rw [eq_div_iff hrm', hqq]; ring
        rw [e]
        exact (hmem _).mpr (Qbar.div_mem
          (Qbar.sub_mem ((hmem _).mp hq) ((hmem _).mp hρ))
          (Qbar.neg_mem (Qbar.mul_mem (hratmem r) (Qbar.add_mem Qbar.one_mem (hratmem r)))))

end Diaz
