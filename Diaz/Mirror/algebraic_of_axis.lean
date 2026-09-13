/-
Mirrored from Prove2Me: `Diaz.algebraic_of_axis`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.algebraic_of_axis__74807965.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

private theorem algebraic_of_axis_p21_alg_ofReal_iff {x : ℝ} : IsAlgebraic ℚ ((x : ℂ)) ↔ IsAlgebraic ℚ x :=
  isAlgebraic_algebraMap_iff (A := ℂ) (S := ℝ) (R := ℚ) Complex.ofReal_injective

private theorem algebraic_of_axis_p21_mul_conj_eq (u : ℂ) : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
  rw [Complex.mul_conj]; norm_cast; rw [Complex.normSq_eq_norm_sq]

theorem algebraic_of_axis {u : ℂ} (hax : conj u = u ∨ conj u = -u)
    (h : IsAlgebraic ℚ ‖u‖) : IsAlgebraic ℚ u := by
  have hc : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) := algebraic_of_axis_p21_alg_ofReal_iff.mpr h
  have key : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := algebraic_of_axis_p21_mul_conj_eq u
  have h2 : IsAlgebraic ℚ (u ^ 2) := by
    rcases hax with hx | hx
    · have e : u ^ 2 = ((‖u‖ : ℝ) : ℂ) ^ 2 := by rw [← key, hx]; ring
      rw [e]; exact hc.pow 2
    · have e : u ^ 2 = -(((‖u‖ : ℝ) : ℂ) ^ 2) := by rw [← key, hx]; ring
      rw [e]; exact (hc.pow 2).neg
  exact h2.of_pow two_pos

end Diaz
