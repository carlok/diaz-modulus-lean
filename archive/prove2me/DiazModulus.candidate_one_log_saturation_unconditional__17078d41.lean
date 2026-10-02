import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_candidate_one_log_saturation
import Theorems.Thm_DiazModulus_baker_two_logs
import Theorems.Thm_DiazModulus_hermite_lindemann_holds

/-- `candidate_one_log_saturation` with `hB := baker_two_logs` and `hHL := hermite_lindemann_holds`. -/
theorem solution {u : ℂ} (h : DiazModulus.IsCandidate u) :
    (∀ l : ℂ, l ∈ DiazModulus.LogAlg → ∀ a b : ℂ, a ∈ DiazModulus.Qbar → b ∈ DiazModulus.Qbar →
        u = a + b * l → ∃ r : ℚ, u = (r : ℂ) * l)
      ∧ (∀ a b : ℂ, a ∈ DiazModulus.Qbar → b ∈ DiazModulus.Qbar →
        u ≠ a + b * ((Real.pi : ℝ) : ℂ)) := by
  exact DiazModulus.candidate_one_log_saturation DiazModulus.baker_two_logs
    DiazModulus.hermite_lindemann_holds h

#print axioms solution
