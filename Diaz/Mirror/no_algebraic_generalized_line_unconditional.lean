/-
Mirrored from Prove2Me: `DiazModulus.no_algebraic_generalized_line_unconditional`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.no_algebraic_generalized_line_unconditional__b090c529.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.no_algebraic_generalized_line
import Diaz.Mirror.baker_two_logs

namespace Diaz

/-- `no_algebraic_generalized_line` with its Baker antecedent discharged by `baker_two_logs`, whose
statement is exactly that antecedent. -/
theorem no_algebraic_generalized_line_unconditional :
    ∀ l : ℂ, IsAlgebraic ℚ (Complex.exp l) → l.re ≠ 0 → l.im ≠ 0 →
      ∀ B C : ℂ, IsAlgebraic ℚ B → B ≠ 0 → IsAlgebraic ℚ C →
        B * l + (starRingEnd ℂ) B * (starRingEnd ℂ) l + C ≠ 0 := by
  exact no_algebraic_generalized_line baker_two_logs

end Diaz
