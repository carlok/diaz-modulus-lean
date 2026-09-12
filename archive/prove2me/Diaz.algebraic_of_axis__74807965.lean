import Mathlib
import Definitions.Def_Diaz_Closure
import Definitions.Def_Diaz_Instantiation

open ComplexConjugate
open Diaz

private theorem p21_alg_ofReal_iff {x : ℝ} : IsAlgebraic ℚ ((x : ℂ)) ↔ IsAlgebraic ℚ x :=
  isAlgebraic_algebraMap_iff (A := ℂ) (S := ℝ) (R := ℚ) Complex.ofReal_injective

private theorem p21_mul_conj_eq (u : ℂ) : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
  rw [Complex.mul_conj]; norm_cast; rw [Complex.normSq_eq_norm_sq]

open Diaz in
theorem solution {u : ℂ} (hax : conj u = u ∨ conj u = -u)
    (h : IsAlgebraic ℚ ‖u‖) : IsAlgebraic ℚ u := by
  have hc : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) := p21_alg_ofReal_iff.mpr h
  have key : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := p21_mul_conj_eq u
  have h2 : IsAlgebraic ℚ (u ^ 2) := by
    rcases hax with hx | hx
    · have e : u ^ 2 = ((‖u‖ : ℝ) : ℂ) ^ 2 := by rw [← key, hx]; ring
      rw [e]; exact hc.pow 2
    · have e : u ^ 2 = -(((‖u‖ : ℝ) : ℂ) ^ 2) := by rw [← key, hx]; ring
      rw [e]; exact (hc.pow 2).neg
  exact h2.of_pow two_pos
