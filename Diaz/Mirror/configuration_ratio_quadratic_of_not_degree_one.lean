/-
Mirrored from Prove2Me: `DiazModulus.configuration_ratio_quadratic_of_not_degree_one`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.configuration_ratio_quadratic_of_not_degree_one__22b31611.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.rational_space_configuration_coprime_ratio
import Diaz.Mirror.two_by_three_configuration_ratio_degree_le_two
import Diaz.Mirror.mobius_ratio_configuration_u_multiplier_triple

namespace Diaz

open Complex ComplexConjugate

/-! # Without a degree-one configuration, every configuration ratio has degree two

`rational_space_configuration_coprime_ratio` writes `x₁/x₀ = p(u)/q(u)` with `p, q`
coprime of degree at least one; `two_by_three_configuration_ratio_degree_le_two` bounds
the degree by two; and degree one is excluded by
`mobius_ratio_configuration_u_multiplier_triple`, which would produce the free triple
`t ⊆ W ∩ u⁻¹W` forbidden by `hD1`. -/

open Polynomial in
theorem configuration_ratio_quadratic_of_not_degree_one (u : ℂ) (hu : u ∉ Qbar) (W : Submodule (↥Qbar) ℂ) [FiniteDimensional (↥Qbar) W]
    (hW : Module.finrank (↥Qbar) W ≤ 5) (h1 : (1 : ℂ) ∈ W) (hu1 : u ∈ W) (hui : u⁻¹ ∈ W)
    (hrat : ∀ w ∈ W, w ∈ IntermediateField.adjoin Qbar ({u} : Set ℂ))
    (hD1 : ¬ (∃ t : Fin 3 → ℂ, LinearIndependent (↥Qbar) t ∧ ∀ j, t j ∈ W ∧ u * t j ∈ W))
    (x : Fin 2 → ℂ) (y : Fin 3 → ℂ) (hx : LinearIndependent (↥Qbar) x)
    (hy : LinearIndependent (↥Qbar) y) (hxy : ∀ i j, x i * y j ∈ W) :
    ∃ p q : (↥Qbar)[X], IsCoprime p q ∧ max p.natDegree q.natDegree = 2 ∧ x 1 * aeval u q = x 0 * aeval u p := by
  obtain ⟨p, q, hcop, h1d, hpq⟩ :=
    rational_space_configuration_coprime_ratio u hu W hrat x y hx hy hxy
  have h2 := two_by_three_configuration_ratio_degree_le_two u hu W hW h1 hu1 hui x y hx hy hxy
    p q hcop h1d hpq
  refine ⟨p, q, hcop, ?_, hpq⟩
  by_contra hne
  exact hD1 (mobius_ratio_configuration_u_multiplier_triple u hu W x y hx hy hxy p q hcop
    (by omega) hpq)

end Diaz
