/-
Mirrored from Prove2Me: `DiazModulus.candidate_product_relation_trivial`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.candidate_product_relation_trivial__b2b6d8b7.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.candidate_quotient_rigid

namespace Diaz

open Complex ComplexConjugate

/-- `candidate_quotient_rigid` at `(u, v, w) = (u₁, u₃, u₂)`: here `u₁u₂/u₃ = u₄` is a candidate,
so `e^{u₁u₂/u₃}` is algebraic. -/
theorem candidate_product_relation_trivial (u₁ u₂ u₃ u₄ : ℂ) (h₁ : IsCandidate u₁)
    (h₂ : IsCandidate u₂) (h₃ : IsCandidate u₃)
    (h₄ : IsCandidate u₄)
    (hmod : u₁ * conj u₁ = u₃ * conj u₃) (hrel : u₁ * u₂ = u₃ * u₄) :
    (∃ r : ℚ, u₃ = (r : ℂ) * u₁) ∨ (∃ r : ℚ, u₂ = (r : ℂ) * u₃) ∨
      (∃ r : ℚ, u₂ = (r : ℂ) * conj u₁) := by
  have h30 : u₃ ≠ 0 := h₃.1
  have hq : u₁ * u₂ / u₃ = u₄ := by
    rw [hrel]; field_simp
  have hz : IsAlgebraic ℚ (Complex.exp (u₁ * u₂ / u₃)) := by
    rw [hq]; exact h₄.2.2
  exact candidate_quotient_rigid u₁ u₃ u₂ h₁ h₃ h₂ 1 (by simpa using hmod) hz

end Diaz
