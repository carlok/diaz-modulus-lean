import Definitions.Def_DiazModulus

open Complex ComplexConjugate

/-! Verbatim copy of the published `formal_statement` of every `DiazModulus.*` node. -/

namespace DiazModulus
theorem pi_sq_transcendental : Transcendental ℚ ((Real.pi ^ 2 : ℝ) : ℂ) := by sorry
end DiazModulus

namespace DiazModulus
theorem leaf_iff_one :
    (∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
        u.im ≠ 0 → Complex.exp u ≠ 1 → u.re ≠ 0 → Transcendental ℚ (Complex.exp u))
      ↔ (∀ t : ℝ, t ≠ 0 → IsAlgebraic ℚ ((Real.exp t : ℝ) : ℂ) →
          Transcendental ℚ ((t ^ 2 + Real.pi ^ 2 : ℝ) : ℂ)) := by sorry
end DiazModulus
