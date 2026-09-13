/-
Mirrored from Prove2Me: `DiazModulus.diaz_locus_dictionary`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_locus_dictionary__8338c3f3.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Instantiation
import Diaz.Mirror.normal_form

namespace Diaz

open Complex ComplexConjugate

/-- Algebraicity over `ℚ` is unchanged by the embedding `ℝ ↪ ℂ`. -/
private theorem dzb_alg_ofReal {x : ℝ} : IsAlgebraic ℚ ((x : ℂ)) ↔ IsAlgebraic ℚ x :=
  isAlgebraic_algebraMap_iff (A := ℂ) (S := ℝ) (R := ℚ) Complex.ofReal_injective

theorem diaz_locus_dictionary :
    Qbar = Diaz.Qbar ∧
      ∀ u : ℂ, IsCandidate u ↔
        (u ≠ 0 ∧ IsAlgebraic ℚ (Complex.exp u) ∧ IsAlgebraic ℚ (u * conj u)) := by
  refine ⟨rfl, fun u => ⟨?_, ?_⟩⟩
  · rintro ⟨hu0, hmod, hexp⟩
    exact ⟨hu0, hexp, (Diaz.normal_form hu0).1.mp (dzb_alg_ofReal.mp hmod)⟩
  · rintro ⟨hu0, hexp, hrho⟩
    exact ⟨hu0, dzb_alg_ofReal.mpr ((Diaz.normal_form hu0).1.mpr hrho), hexp⟩

end Diaz
