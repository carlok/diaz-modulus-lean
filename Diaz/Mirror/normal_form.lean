/-
Mirrored from Prove2Me: `Diaz.normal_form`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.normal_form__0faa3a3f.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

private theorem p21_alg_ofReal_iff {x : ℝ} : IsAlgebraic ℚ ((x : ℂ)) ↔ IsAlgebraic ℚ x :=
  isAlgebraic_algebraMap_iff (A := ℂ) (S := ℝ) (R := ℚ) Complex.ofReal_injective

private theorem p21_mul_conj_eq (u : ℂ) : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
  rw [Complex.mul_conj]; norm_cast; rw [Complex.normSq_eq_norm_sq]

theorem normal_form {u : ℂ} (hu : u ≠ 0) :
    (IsAlgebraic ℚ ‖u‖ ↔ IsAlgebraic ℚ (u * conj u)) ∧
      (IsAlgebraic ℚ (u * conj u) ↔
        ∃ ρ : ℝ, 0 < ρ ∧ IsAlgebraic ℚ ρ ∧ u * conj u = (ρ : ℂ)) := by
  have key : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := p21_mul_conj_eq u
  have hpos : (0 : ℝ) < ‖u‖ ^ 2 := pow_pos (norm_pos_iff.mpr hu) 2
  constructor
  · rw [key]
    exact ⟨fun h => (p21_alg_ofReal_iff.mpr h).pow 2,
      fun h => p21_alg_ofReal_iff.mp (h.of_pow two_pos)⟩
  · constructor
    · intro h
      refine ⟨‖u‖ ^ 2, hpos, ?_, ?_⟩
      · refine p21_alg_ofReal_iff.mp ?_
        push_cast
        rw [← key]; exact h
      · rw [key]; push_cast; ring
    · rintro ⟨ρ, -, hρ, heq⟩
      rw [heq]; exact p21_alg_ofReal_iff.mpr hρ

end Diaz
