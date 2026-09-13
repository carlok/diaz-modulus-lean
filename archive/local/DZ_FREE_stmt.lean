/-
The statement proposed for publication, proved from `Solutions.DZ_FREE_core`.
Kept local: per the run's hold rule the node is published Open and **not** submitted today.
-/
import Mathlib
import Definitions.Def_DiazModulus
import Solutions.DZ_FREE_core

open Complex ComplexConjugate

namespace DiazModulus

theorem aligned_norm_free_no_rational_log_matrix :
    ∀ (u : ℂ) (r : ℚ),
      Transcendental ℚ ((Real.pi : ℝ) : ℂ) →
      u.re ≠ 0 →
      Real.pi * (u.im + (r : ℝ) * Real.pi) ≠ 0 →
      IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ) →
      IsAlgebraic ℚ ((((‖u‖ : ℝ)) ^ 2 : ℝ) : ℂ) →
      (¬ ∃ c : ℚ, (‖u‖ : ℝ) ^ 2 = (c : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi))) →
      ∀ l : Fin 2 → Fin 2 → ℂ,
        (∀ i j, ∃ a b c : ℚ, l i j = (a : ℂ) * u + (b : ℂ) * (starRingEnd ℂ) u
          + (c : ℂ) * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I)) →
        l 0 0 * l 1 1 - l 0 1 * l 1 0 = 0 →
        (∃ a b : ℚ, (a ≠ 0 ∨ b ≠ 0) ∧
            (a : ℂ) * l 0 0 + (b : ℂ) * l 1 0 = 0 ∧
            (a : ℂ) * l 0 1 + (b : ℂ) * l 1 1 = 0)
      ∨ (∃ a b : ℚ, (a ≠ 0 ∨ b ≠ 0) ∧
            (a : ℂ) * l 0 0 + (b : ℂ) * l 0 1 = 0 ∧
            (a : ℂ) * l 1 0 + (b : ℂ) * l 1 1 = 0) := by
  intro u r hpi hre hβ0 hβalg hAalg hfree l hl hdet
  exact DiazFree.no_admissible_matrix hpi u r hre hβ0 hβalg hAalg hfree
    (hl 0 0) (hl 0 1) (hl 1 0) (hl 1 1) hdet

end DiazModulus

#print axioms DiazModulus.aligned_norm_free_no_rational_log_matrix
