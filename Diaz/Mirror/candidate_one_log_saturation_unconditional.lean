/-
Mirrored from Prove2Me: `DiazModulus.candidate_one_log_saturation_unconditional`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.candidate_one_log_saturation_unconditional__17078d41.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
Names and spellings that changed between the platform's Mathlib revision and the one
pinned here were updated to match, and proof steps that became no-ops there were
dropped; the mathematics is unchanged.
-/
import Mathlib
import Diaz.Platform
import Diaz.Multipliers
import Diaz.Mirror.baker_two_logs
import Diaz.HermiteLindemann
import Diaz.Mirror.pi_transcendental

namespace Diaz

/-- `candidate_one_log_saturation` with `hB := baker_two_logs` and `hHL := hermite_lindemann_holds`. -/
theorem candidate_one_log_saturation_unconditional {u : ℂ} (h : IsCandidate u) :
    (∀ l : ℂ, l ∈ LogAlg → ∀ a b : ℂ, a ∈ Qbar → b ∈ Qbar →
        u = a + b * l → ∃ r : ℚ, u = (r : ℂ) * l)
      ∧ (∀ a b : ℂ, a ∈ Qbar → b ∈ Qbar →
        u ≠ a + b * ((Real.pi : ℝ) : ℂ)) := by
  exact candidate_one_log_saturation baker_two_logs
    hermite_lindemann_holds pi_transcendental h

end Diaz
