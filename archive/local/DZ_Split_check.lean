import Definitions.Def_DiazModulus

open Complex ComplexConjugate

namespace DiazModulus

/-- Child 1, exactly as it would be published. -/
theorem diaz_of_exp_real :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      Transcendental ℚ (Complex.exp u) := by
  sorry

/-- Child 2. -/
theorem diaz_of_exp_not_real :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      Transcendental ℚ (Complex.exp u) := by
  sorry

end DiazModulus

-- The reduction: the two children jointly give the conjecture.
open DiazModulus in
theorem reduction : DiazModulusConjecture := by
  intro u hu hmod
  by_cases h : (Complex.exp u).im = 0
  · exact diaz_of_exp_real u hu hmod h
  · exact diaz_of_exp_not_real u hu hmod h
