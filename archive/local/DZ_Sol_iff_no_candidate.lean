import Definitions.Def_DiazModulus

open Complex ComplexConjugate

open DiazModulus in
theorem solution : DiazModulusConjecture ↔ ¬ ∃ u : ℂ, IsCandidate u := by
  constructor
  · rintro h ⟨u, hu0, hmod, hexp⟩
    exact h u hu0 hmod hexp
  · intro h u hu0 hmod hexp
    exact h ⟨u, hu0, hmod, hexp⟩
