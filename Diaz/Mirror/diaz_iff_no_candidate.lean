/-
Mirrored from Prove2Me: `DiazModulus.diaz_iff_no_candidate`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_iff_no_candidate__dc7491db.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

theorem diaz_iff_no_candidate : DiazModulusConjecture ↔ ¬ ∃ u : ℂ, IsCandidate u := by
  constructor
  · rintro h ⟨u, hu0, hmod, hexp⟩
    exact h u hu0 hmod hexp
  · intro h u hu0 hmod hexp
    exact h ⟨u, hu0, hmod, hexp⟩

end Diaz
