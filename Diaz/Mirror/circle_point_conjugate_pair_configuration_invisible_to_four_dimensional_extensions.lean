/-
Mirrored from Prove2Me: `DiazModulus.circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions__0b1f1bd0.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.circle_point_conjugate_pair_extension_carries_two_by_three_configuration
import Diaz.Mirror.circle_point_conjugate_pair_extension_excludes_squares_and_reciprocals
import Diaz.Mirror.circle_point_extension_two_by_three_configuration_iff

namespace Diaz

open Complex ComplexConjugate

/-!
# A configuration through a conjugate pair needs all five dimensions

Let `u ∉ Q̄` with `ρ = u ū` algebraic, `a ∈ Q̄` non-zero, and `z = u/(u² − a)` when `a ā ≠ ρ²`,
`z = u/(u² − a)²` when `a ā = ρ²`. Put `H₀ = Q̄ + Q̄u + Q̄ū` and `W = H₀ + Q̄z + Q̄z̄`.

* `W` carries a `2 × 3` configuration
  (`circle_point_conjugate_pair_extension_carries_two_by_three_configuration`).
* No `H₀ + Q̄w` with `w ∈ W`, `w ∉ H₀`, does. By Theorem B
  (`circle_point_extension_two_by_three_configuration_iff`, with `z := w`) a configuration there
  puts `w` in `H₀ + Q̄t` with `t = u²`, `t = ū²` or `t = 1/(u − b)`, `b ∈ Q̄ \ {0}`. As `w ∉ H₀`,
  circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions_exchange puts `t` in `H₀ + Q̄w`, which lies in `W`; and
  `circle_point_conjugate_pair_extension_excludes_squares_and_reciprocals` says no such `t` is
  in `W`.
-/

namespace R5_fiveDim

theorem circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions_set_eq_insert (u w : ℂ) : ({1, u, conj u, w} : Set ℂ) = insert w {1, u, conj u} := by
  ext t
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff]
  tauto

/-- Exchange: `w ∉ H₀` and `w ∈ H₀ + Q̄t` give `t ∈ H₀ + Q̄w`. -/
theorem circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions_exchange {u t w : ℂ} (hw : w ∉ Submodule.span Qbar ({1, u, conj u} : Set ℂ))
    (h : w ∈ Submodule.span Qbar ({1, u, conj u, t} : Set ℂ)) :
    t ∈ Submodule.span Qbar ({1, u, conj u, w} : Set ℂ) := by
  rw [circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions_set_eq_insert] at h ⊢
  exact mem_span_insert_exchange h hw

/-- `H₀ + Q̄w ≤ W` for every `w ∈ W`. -/
theorem span_four_le {u z w : ℂ}
    (hw : w ∈ Submodule.span Qbar ({1, u, conj u, z, conj z} : Set ℂ)) :
    Submodule.span Qbar ({1, u, conj u, w} : Set ℂ) ≤
      Submodule.span Qbar ({1, u, conj u, z, conj z} : Set ℂ) := by
  refine Submodule.span_le.2 (Set.insert_subset_iff.2 ⟨Submodule.subset_span (by simp),
    Set.insert_subset_iff.2 ⟨Submodule.subset_span (by simp),
      Set.insert_subset_iff.2 ⟨Submodule.subset_span (by simp),
        Set.singleton_subset_iff.2 hw⟩⟩⟩)

end R5_fiveDim

open R5_fiveDim in
theorem circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions (u a z : ℂ)
    (hu : u ∉ Qbar) (hρ : IsAlgebraic ℚ (u * conj u)) (ha : a ∈ Qbar) (ha0 : a ≠ 0)
    (hz : (a * conj a ≠ (u * conj u) ^ 2 ∧ z = u / (u ^ 2 - a)) ∨
      (a * conj a = (u * conj u) ^ 2 ∧ z = u / (u ^ 2 - a) ^ 2)) :
    (∃ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ), LinearIndependent (↥Qbar) x ∧ LinearIndependent (↥Qbar) y ∧
        ∀ i j, x i * y j ∈ Submodule.span Qbar ({1, u, conj u, z, conj z} : Set ℂ)) ∧
      ∀ w ∈ Submodule.span Qbar ({1, u, conj u, z, conj z} : Set ℂ),
        w ∉ Submodule.span Qbar ({1, u, conj u} : Set ℂ) →
        ¬ ∃ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ), LinearIndependent (↥Qbar) x ∧
          LinearIndependent (↥Qbar) y ∧
          ∀ i j, x i * y j ∈ Submodule.span Qbar ({1, u, conj u, w} : Set ℂ) := by
  refine ⟨circle_point_conjugate_pair_extension_carries_two_by_three_configuration
    u a z hu hρ ha ha0 hz, ?_⟩
  intro w hw hw0 hconf
  obtain ⟨hsq, hcsq, hinv⟩ :=
    circle_point_conjugate_pair_extension_excludes_squares_and_reciprocals u a z hu hρ ha ha0 hz
  have hle := span_four_le hw
  rcases (circle_point_extension_two_by_three_configuration_iff u w hu hρ hw0).1 hconf with
    h | h | ⟨b, hb, hb0, h⟩
  · exact hsq (hle (circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions_exchange hw0 h))
  · exact hcsq (hle (circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions_exchange hw0 h))
  · exact hinv b hb hb0 (hle (circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions_exchange hw0 h))

end Diaz
