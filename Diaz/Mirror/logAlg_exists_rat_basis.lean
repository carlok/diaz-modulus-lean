/-
Mirrored from Prove2Me: `DiazModulus.logAlg_exists_rat_basis`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.logAlg_exists_rat_basis__8741cc27.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

/-! # A rational basis of finitely many logarithms, chosen among them

Let `λ₁, …, λ_m` be logarithms of algebraic numbers. The finite set `{λ₁, …, λ_m}` contains a
`ℚ`-linearly independent subset `B` spanning the same `ℚ`-subspace (a maximal free subset).
`B` is finite, so we list it as `μ₁, …, μ_s`. Each `μ_t` is one of the `λ_k`, hence lies in `ℒ`;
the family `μ` is `ℚ`-free; and each `λ_k` lies in the `ℚ`-span of the `μ_t`, which gives rational
coefficients `c_{kt}` with `λ_k = Σ_t c_{kt} μ_t`. -/

namespace RC4_LRB
end RC4_LRB

open RC4_LRB in
theorem logAlg_exists_rat_basis {m : ℕ} (lam : Fin m → ℂ) (hlam : ∀ k, lam k ∈ LogAlg) :
    ∃ (s : ℕ) (μ : Fin s → ℂ) (c : Fin m → Fin s → ℚ), LinearIndependent ℚ μ ∧
      (∀ t, μ t ∈ LogAlg) ∧ ∀ k, lam k = ∑ t, (c k t : ℂ) * μ t := by
  classical
  obtain ⟨B, hBE, hBspan, hBind⟩ := exists_linearIndependent ℚ (Set.range lam)
  have hBfin : B.Finite := (Set.finite_range _).subset hBE
  let F := hBfin.toFinset
  let e : Fin F.card ≃ B :=
    F.equivFin.symm.trans (Equiv.subtypeEquivRight (fun x => hBfin.mem_toFinset))
  let μ : Fin F.card → ℂ := fun t => ((e t : B) : ℂ)
  have hμL : ∀ t, μ t ∈ LogAlg := by
    intro t
    obtain ⟨k, hk⟩ := hBE (e t).2
    simp only [μ, ← hk]
    exact hlam k
  have hrange : Set.range μ = B := by
    ext x
    constructor
    · rintro ⟨t, rfl⟩; exact (e t).2
    · intro hx; exact ⟨e.symm ⟨x, hx⟩, by simp [μ]⟩
  have hmem : ∀ k, lam k ∈ Submodule.span ℚ (Set.range μ) := by
    intro k
    rw [hrange, hBspan]
    exact Submodule.subset_span ⟨k, rfl⟩
  choose c hc using fun k => (Submodule.mem_span_range_iff_exists_fun ℚ).mp (hmem k)
  refine ⟨F.card, μ, c, hBind.comp e e.injective, hμL, fun k => ?_⟩
  rw [← hc k]
  exact Finset.sum_congr rfl fun t _ => by rw [Rat.smul_def]

end Diaz
