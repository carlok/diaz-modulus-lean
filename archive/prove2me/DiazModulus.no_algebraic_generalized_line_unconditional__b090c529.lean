import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_no_algebraic_generalized_line
import Theorems.Thm_DiazModulus_baker_two_logs

/-- `no_algebraic_generalized_line` with its Baker antecedent discharged by `baker_two_logs`, whose
statement is exactly that antecedent. -/
theorem solution :
    ∀ l : ℂ, IsAlgebraic ℚ (Complex.exp l) → l.re ≠ 0 → l.im ≠ 0 →
      ∀ B C : ℂ, IsAlgebraic ℚ B → B ≠ 0 → IsAlgebraic ℚ C →
        B * l + (starRingEnd ℂ) B * (starRingEnd ℂ) l + C ≠ 0 := by
  exact DiazModulus.no_algebraic_generalized_line DiazModulus.baker_two_logs

#print axioms solution
