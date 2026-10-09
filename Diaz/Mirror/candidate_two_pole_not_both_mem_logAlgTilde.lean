/-
Mirrored from Prove2Me: `DiazModulus.candidate_two_pole_not_both_mem_logAlgTilde`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.candidate_two_pole_not_both_mem_logAlgTilde__e1f6d784.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.circle_point_two_pole_extension_carries_two_by_three_configuration
import Diaz.HermiteLindemann
import Diaz.Mirror.logAlg_conj_stable

namespace Diaz

open Complex ComplexConjugate

/-!
# `u/(u² − a₁)` and `u/(u² − a₂)` are not both in `ℒ̃` at a candidate

Under Roy's strong six exponentials theorem, let `u` be a candidate and `a₁ ≠ a₂` non-zero
algebraic numbers. Then `z₁ = u/(u² − a₁)` and `z₂ = u/(u² − a₂)` do not both lie in `ℒ̃`.

At a candidate `ρ = u ū = |u|²` is algebraic, and `u ∉ Q̄` by Hermite–Lindemann. Both `u` and
`ū` lie in `ℒ` (`logAlg_conj_stable`), and `1 ∈ ℒ̃`. So if `z₁, z₂ ∈ ℒ̃` then
`W = Q̄ + Q̄u + Q̄ū + Q̄z₁ + Q̄z₂ ≤ ℒ̃`, and the `2 × 3` configuration that
`circle_point_two_pole_extension_carries_two_by_three_configuration` puts in `W` lies in `ℒ̃`,
against the strong six exponentials hypothesis.
-/

namespace R7_twoPoleCandidate

/-- If `u ∈ ℒ` and `z₁, z₂ ∈ ℒ̃`, then `Q̄ + Q̄u + Q̄ū + Q̄z₁ + Q̄z₂ ≤ ℒ̃`. -/
theorem span_le {u z₁ z₂ : ℂ} (huL : u ∈ LogAlg) (h₁ : z₁ ∈ LogAlgTilde)
    (h₂ : z₂ ∈ LogAlgTilde) :
    Submodule.span Qbar ({1, u, conj u, z₁, z₂} : Set ℂ) ≤ LogAlgTilde :=
  Submodule.span_le.2 (Set.insert_subset_iff.2 ⟨Submodule.subset_span (Set.mem_insert _ _),
    Set.insert_subset_iff.2 ⟨Submodule.subset_span (Set.mem_insert_of_mem _ huL),
      Set.insert_subset_iff.2
        ⟨Submodule.subset_span (Set.mem_insert_of_mem _ (logAlg_conj_stable u huL)),
        Set.insert_subset_iff.2 ⟨h₁, Set.singleton_subset_iff.2 h₂⟩⟩⟩⟩)

end R7_twoPoleCandidate

open R7_twoPoleCandidate in
theorem candidate_two_pole_not_both_mem_logAlgTilde
    (hSSE : ∀ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ),
      LinearIndependent (↥Qbar) x → LinearIndependent (↥Qbar) y →
      ¬ (∀ i j, x i * y j ∈ LogAlgTilde))
    {u : ℂ} (h : IsCandidate u) {a₁ a₂ : ℂ} (ha₁ : a₁ ∈ Qbar) (ha₂ : a₂ ∈ Qbar)
    (ha₁0 : a₁ ≠ 0) (ha₂0 : a₂ ≠ 0) (ha : a₁ ≠ a₂) :
    ¬ (u / (u ^ 2 - a₁) ∈ LogAlgTilde ∧ u / (u ^ 2 - a₂) ∈ LogAlgTilde) := by
  rintro ⟨h₁, h₂⟩
  have huQ : u ∉ Qbar := fun hq => hermite_lindemann_holds u h.1 (mem_Qbar_iff.1 hq) h.2.2
  have hρ : IsAlgebraic ℚ (u * conj u) := by
    rw [Complex.mul_conj']
    exact mem_Qbar_iff.1 (Qbar.pow_mem (mem_Qbar_iff.2 h.2.1) 2)
  obtain ⟨x, y, hx, hy, hxy⟩ := circle_point_two_pole_extension_carries_two_by_three_configuration
    u a₁ a₂ huQ hρ ha₁ ha₂ ha₁0 ha₂0 ha
  exact hSSE x y hx hy fun i j => span_le h.2.2 h₁ h₂ (hxy i j)

end Diaz
