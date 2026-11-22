/-
Mirrored from Prove2Me: `DiazModulus.rational_proper_annihilator`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.rational_proper_annihilator__4ba53eaa.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.rational_common_kernel

namespace Diaz

open Complex ComplexConjugate

/-! # A proper rational subspace is killed by a non-zero algebraic linear form

Let `T ⊊ ℂᵈ` be spanned by its algebraic vectors. Such a subspace is the common kernel of `d` linear forms
`ψ₁, …, ψ_d` with algebraic coefficients: `v ∈ T` exactly when `ψᵢ · v = 0` for every `i`. If every `ψᵢ` were
the zero form, every vector of `ℂᵈ` would satisfy these equations, so `T` would be all of `ℂᵈ`, against the
hypothesis. Hence some `ψᵢ` is non-zero; it has algebraic coefficients and vanishes on `T`, so `φ = ψᵢ` is the
required form. -/

theorem rational_proper_annihilator {d : ℕ} (T : Submodule ℂ (Fin d → ℂ))
    (hT : Submodule.span ℂ {v : Fin d → ℂ | v ∈ T ∧ ∀ i, v i ∈ Qbar} = T) (hTop : T ≠ ⊤) :
    ∃ φ : Fin d → ℂ, (∀ i, φ i ∈ Qbar) ∧ φ ≠ 0 ∧ ∀ v ∈ T, φ ⬝ᵥ v = 0 := by
  obtain ⟨ψ, hψQ, hψT⟩ := rational_common_kernel T hT
  have hne : ∃ i, ψ i ≠ 0 := by
    by_contra h
    simp only [not_exists, not_not] at h
    apply hTop
    rw [eq_top_iff]
    intro v _
    rw [hψT v]
    intro i
    simp [h i]
  obtain ⟨i, hi⟩ := hne
  exact ⟨ψ i, hψQ i, hi, fun v hv => (hψT v).1 hv i⟩

end Diaz
