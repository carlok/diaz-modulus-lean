/-
Mirrored from Prove2Me: `Diaz.orbit_of_candidate`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.orbit_of_candidate__bf6a6436.lean`. Statement and proof are the platform's; only
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

private theorem orbit_of_candidate_HL_aux {u : ℂ} (hu : u ≠ 0) (hexp : IsAlgebraic ℚ (Complex.exp u)) :
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

private theorem orbit_of_candidate_hmem (z : ℂ) : IsAlgebraic ℚ z ↔ z ∈ Qbar := by
  rw [Qbar, IntermediateField.mem_toSubfield, mem_algebraicClosure_iff]

private theorem orbit_of_candidate_conjalg {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) :=
  h.algHom (((starRingEnd ℂ) : ℂ →+* ℂ).toRatAlgHom)

private theorem orbit_of_candidate_offaxes {u : ℂ} (hu0 : u ≠ 0) (hexp : IsAlgebraic ℚ (Complex.exp u))
    (hρ : IsAlgebraic ℚ (u * conj u)) : conj u ≠ u ∧ conj u ≠ -u := by
  constructor
  · intro h
    refine orbit_of_candidate_HL_aux hu0 hexp (IsAlgebraic.of_pow (n := 2) (by norm_num) ?_)
    have e : u ^ 2 = u * conj u := by rw [h]; ring
    rw [e]; exact hρ
  · intro h
    refine orbit_of_candidate_HL_aux hu0 hexp (IsAlgebraic.of_pow (n := 2) (by norm_num) ?_)
    have e : (u : ℂ) ^ 2 = -(u * conj u) := by rw [h]; ring
    rw [e]; exact (orbit_of_candidate_hmem _).mpr (Qbar.neg_mem ((orbit_of_candidate_hmem _).mp hρ))

theorem orbit_of_candidate {u : ℂ} (hu0 : u ≠ 0) (hexp : IsAlgebraic ℚ (Complex.exp u))
    (hρ : IsAlgebraic ℚ (u * conj u)) :
    (∀ v ∈ ({u, -u, conj u, -conj u} : Set ℂ),
        v ≠ 0 ∧ IsAlgebraic ℚ (Complex.exp v) ∧ v * conj v = u * conj u)
      ∧ u ≠ -u ∧ u ≠ conj u ∧ u ≠ -conj u
      ∧ -u ≠ conj u ∧ -u ≠ -conj u ∧ conj u ≠ -conj u := by
  obtain ⟨hax1, hax2⟩ := orbit_of_candidate_offaxes hu0 hexp hρ
  have hcu0 : conj u ≠ 0 := by simpa using hu0
  have hexpc : IsAlgebraic ℚ (Complex.exp (conj u)) := by
    rw [Complex.exp_conj]; exact orbit_of_candidate_conjalg hexp
  have hexpn : IsAlgebraic ℚ (Complex.exp (-u)) := by
    rw [Complex.exp_neg]; exact hexp.inv
  have hexpnc : IsAlgebraic ℚ (Complex.exp (-conj u)) := by
    rw [Complex.exp_neg]; exact hexpc.inv
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rintro v (rfl | rfl | rfl | rfl)
    · exact ⟨hu0, hexp, rfl⟩
    · exact ⟨neg_ne_zero.mpr hu0, hexpn, by rw [map_neg]; ring⟩
    · exact ⟨hcu0, hexpc, by rw [Complex.conj_conj]; ring⟩
    · exact ⟨neg_ne_zero.mpr hcu0, hexpnc, by rw [map_neg, Complex.conj_conj]; ring⟩
  · intro h; exact hu0 (by linear_combination h / 2)
  · exact fun h => hax1 h.symm
  · intro h; exact hax2 (by linear_combination h)
  · intro h; exact hax2 h.symm
  · intro h; exact hax1 (by linear_combination h)
  · intro h; exact hcu0 (by linear_combination h / 2)

end Diaz
