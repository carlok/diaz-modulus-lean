/-
Mirrored from Prove2Me: `Diaz.indep_of_not_axis`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.indep_of_not_axis__39195b0f.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

theorem indep_of_not_axis {u : ℂ} (h1 : conj u ≠ u) (h2 : conj u ≠ -u)
    {a b : ℚ} (h : (a : ℂ) * u + (b : ℂ) * conj u = 0) : a = 0 ∧ b = 0 := by
  have hu : u ≠ 0 := by rintro rfl; exact h1 (map_zero _)
  have h' : (a : ℂ) * conj u + (b : ℂ) * u = 0 := by
    have := congrArg (starRingEnd ℂ) h
    simpa using this
  have hab : ((a : ℂ) ^ 2 - (b : ℂ) ^ 2) * u = 0 := by
    linear_combination (a : ℂ) * h - (b : ℂ) * h'
  have hsq : (a : ℚ) ^ 2 = (b : ℚ) ^ 2 := by
    rcases mul_eq_zero.mp hab with h0 | h0
    · have : ((a : ℂ)) ^ 2 = ((b : ℂ)) ^ 2 := by linear_combination h0
      exact_mod_cast this
    · exact absurd h0 hu
  have hq : (a - b) * (a + b) = 0 := by linear_combination hsq
  rcases mul_eq_zero.mp hq with hd | hd
  · have hab' : a = b := by linarith
    by_cases ha : a = 0
    · exact ⟨ha, by rw [← hab']; exact ha⟩
    · exfalso
      rw [← hab'] at h
      have hz : (a : ℂ) * (u + conj u) = 0 := by linear_combination h
      have hac : (a : ℂ) ≠ 0 := by exact_mod_cast ha
      rcases mul_eq_zero.mp hz with h0 | h0
      · exact hac h0
      · exact h2 (by linear_combination h0)
  · have hab' : b = -a := by linarith
    by_cases ha : a = 0
    · exact ⟨ha, by rw [hab', ha]; ring⟩
    · exfalso
      rw [hab'] at h
      push_cast at h
      have hz : (a : ℂ) * (u - conj u) = 0 := by linear_combination h
      have hac : (a : ℂ) ≠ 0 := by exact_mod_cast ha
      rcases mul_eq_zero.mp hz with h0 | h0
      · exact hac h0
      · exact h1 (by linear_combination -h0)

end Diaz
