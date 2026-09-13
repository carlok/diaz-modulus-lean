import Theorems.Thm_DiazModulus_four_exponentials_trdeg_one
import Solutions.DZ_TRDEG_core

open Complex ComplexConjugate

open DiazModulus in
-- The period-aligned, norm-rational-multiple half of the Diaz leaf, reduced to the
-- transcendence-degree-one case of the four exponentials statement.
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
      (∃ r : ℚ, r ≠ 0 ∧
        IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
      (∃ r : ℚ, r ≠ 0 ∧
        IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ) ∧
        ∃ c : ℚ, (‖u‖ : ℝ) ^ 2 = (c : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi))) →
      Transcendental ℚ (Complex.exp u) :=
  DiazTrdeg.alignedRatMult_of_trdegOne DiazModulus.four_exponentials_trdeg_one
