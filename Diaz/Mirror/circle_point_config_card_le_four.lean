/-
Mirrored from Prove2Me: `DiazModulus.circle_point_config_card_le_four`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.circle_point_config_card_le_four__6ea62572.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.rank_one_config_card_le_finrank_add_one

namespace Diaz

open Complex ComplexConjugate

/-!
# A configuration in `K + Ku + Kū` has `p + q ≤ 4`

Let `u` be transcendental over `K` with `ρ = u ū ∈ K`, and put `H₀ = K + Ku + Kū`.
Since `u ≠ 0` we have `ū = ρ / u ∈ K(u)`, so `H₀` is a finite-dimensional `K`-subspace of the
field `K(u)`. Being spanned by three vectors, it has dimension at most `3`. The rank-one
configuration bound `rank_one_config_card_le_finrank_add_one` (a `p × q` configuration in a
finite-dimensional subspace `V₀` of `K(u)` has `p + q ≤ dim V₀ + 1`) then gives `p + q ≤ 4`.
-/

namespace R6_circleFour

/-- `K + Ku + Kū` lies in `K(u)` when `u ū ∈ K` and `u ≠ 0`. -/
theorem span_le_adjoin (K : Subfield ℂ) (u : ℂ) (hu : u ≠ 0) (hρ : u * conj u ∈ K) :
    ∀ v ∈ Submodule.span K ({1, u, conj u} : Set ℂ),
      v ∈ IntermediateField.adjoin K ({u} : Set ℂ) := by
  intro v hv
  have hle : Submodule.span K ({1, u, conj u} : Set ℂ) ≤
      (IntermediateField.adjoin K ({u} : Set ℂ)).toSubalgebra.toSubmodule := by
    rw [Submodule.span_le]
    have hU : u ∈ IntermediateField.adjoin K ({u} : Set ℂ) :=
      IntermediateField.subset_adjoin K _ (Set.mem_singleton u)
    have hR : u * conj u ∈ IntermediateField.adjoin K ({u} : Set ℂ) :=
      IntermediateField.algebraMap_mem _ (⟨u * conj u, hρ⟩ : K)
    intro z hz
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hz
    rcases hz with rfl | rfl | rfl
    · exact (IntermediateField.adjoin K ({u} : Set ℂ)).one_mem
    · exact hU
    · have : conj u = (u * conj u) / u := by field_simp
      show conj u ∈ IntermediateField.adjoin K ({u} : Set ℂ)
      rw [this]
      exact IntermediateField.div_mem _ hR hU
  exact hle hv

/-- `K + Ku + Kū` has dimension at most `3`. -/
theorem finrank_span_le_three (K : Subfield ℂ) (u : ℂ) :
    Module.finrank K (Submodule.span K ({1, u, conj u} : Set ℂ)) ≤ 3 := by
  classical
  have h := finrank_span_finset_le_card (R := K) ({1, u, conj u} : Finset ℂ)
  have hc : ({1, u, conj u} : Finset ℂ).card ≤ 3 := by
    refine (Finset.card_insert_le _ _).trans ?_
    exact Nat.succ_le_succ ((Finset.card_insert_le _ _).trans (by simp))
  simp only [Finset.coe_insert, Finset.coe_singleton] at h
  exact h.trans hc

end R6_circleFour

open R6_circleFour in
theorem circle_point_config_card_le_four (K : Subfield ℂ) (u : ℂ)
    (hT : Transcendental K u) (hρ : u * conj u ∈ K)
    (p q : ℕ) (hp : 1 ≤ p) (hq : 1 ≤ q) (x : Fin p → ℂ) (y : Fin q → ℂ)
    (hx : LinearIndependent K x) (hy : LinearIndependent K y)
    (hxy : ∀ i j, x i * y j ∈ Submodule.span K ({1, u, conj u} : Set ℂ)) :
    p + q ≤ 4 := by
  have hu : u ≠ 0 := by
    rintro rfl
    exact hT isAlgebraic_zero
  have : FiniteDimensional K (Submodule.span K ({1, u, conj u} : Set ℂ)) :=
    FiniteDimensional.span_of_finite K (Set.toFinite _)
  have := rank_one_config_card_le_finrank_add_one K u hT
    (Submodule.span K ({1, u, conj u} : Set ℂ)) (span_le_adjoin K u hu hρ) p q hp hq x y hx hy hxy
  have h3 := finrank_span_le_three K u
  omega

end Diaz
