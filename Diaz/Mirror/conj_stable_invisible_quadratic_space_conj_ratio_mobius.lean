/-
Mirrored from Prove2Me: `DiazModulus.conj_stable_invisible_quadratic_space_conj_ratio_mobius`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.conj_stable_invisible_quadratic_space_conj_ratio_mobius__0154ea56.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.invisible_two_orbit_space_u_multiplier_space_eq
import Diaz.Mirror.invisible_cyclic_space_u_multiplier_space_eq
import Diaz.Mirror.quadratic_two_orbit_space_carries_two_by_three_configuration
import Diaz.Mirror.quadratic_cyclic_space_carries_two_by_three_configuration
import Diaz.Mirror.invisible_two_orbit_space_configuration_ratio_mobius
import Diaz.Mirror.invisible_cyclic_space_configuration_ratio_mobius

namespace Diaz

open Complex ComplexConjugate

/-! # Q1.7: on a conjugation-stable invisible space, `conj(P/Q)` is a Möbius function of `P/Q`

`W` has dimension 5 (`invisible_two_orbit_space_u_multiplier_space_eq`, resp.
`invisible_cyclic_space_u_multiplier_space_eq`), so `quadratic_two_orbit_space_carries_two_by_three_configuration`
(resp. `quadratic_cyclic_space_carries_two_by_three_configuration`) gives the configuration
`x = (1, P(u)/Q(u))`, `y` in `W`. Conjugation maps `Q̄` to itself, so `(x̄, ȳ)` is again a
configuration, and it lies in `W` because `W` is conjugation-stable.
`invisible_two_orbit_space_configuration_ratio_mobius` (resp. `invisible_cyclic_space_configuration_ratio_mobius`)
gives `conj(P/Q)·(cP + dQ) = aP + bQ`; multiply by `conj Q(u) ≠ 0`. -/

namespace R21b_Q7

open Polynomial

/-- Complex conjugation as a `ℚ`-algebra map. -/
noncomputable def conj_stable_invisible_quadratic_space_conj_ratio_mobius_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

/-- Conjugation maps `Q̄` to itself. -/
theorem conj_stable_invisible_quadratic_space_conj_ratio_mobius_conj_mem_Qbar {a : ℂ} (ha : a ∈ Qbar) : conj a ∈ Qbar := by
  obtain ⟨p, hp0, hp⟩ := mem_Qbar_iff.1 ha
  refine mem_Qbar_iff.2 ⟨p, hp0, ?_⟩
  rw [show (conj a : ℂ) = conj_stable_invisible_quadratic_space_conj_ratio_mobius_cjQ a from rfl, Polynomial.aeval_algHom_apply, hp, map_zero]

/-- Conjugation keeps a family free over `Q̄`. -/
theorem conj_li {n : ℕ} {v : Fin n → ℂ} (hv : LinearIndependent (↥Qbar) v) :
    LinearIndependent (↥Qbar) (fun i => conj (v i)) := by
  rw [Fintype.linearIndependent_iff] at hv ⊢
  intro g hg i
  have hs : ∀ (c : ↥Qbar) (z : ℂ), c • z = (c : ℂ) * z := fun _ _ => rfl
  have h := hv (fun i => ⟨conj (g i : ℂ), conj_stable_invisible_quadratic_space_conj_ratio_mobius_conj_mem_Qbar (g i).2⟩) (by
    have := congrArg conj hg
    simp only [hs, map_sum, map_zero, map_mul, conj_conj] at this
    simpa only [hs] using this)
  have := congrArg (fun z : ↥Qbar => conj (z : ℂ)) (h i)
  simp only [conj_conj, ZeroMemClass.coe_zero, map_zero] at this
  exact Subtype.ext this

/-- From `conj(P/Q)·(cP + dQ) = aP + bQ` to the conclusion. -/
theorem finish {u : ℂ} {P Q : (↥Qbar)[X]} (hQ : aeval u Q ≠ 0) {a b c d : ℂ}
    (h : conj (![1, aeval u P / aeval u Q] 1) * (c * aeval u P + d * aeval u Q) =
      conj (![1, aeval u P / aeval u Q] 0) * (a * aeval u P + b * aeval u Q)) :
    conj (aeval u P) * (c * aeval u P + d * aeval u Q) = conj (aeval u Q) * (a * aeval u P + b * aeval u Q) := by
  have hQc : conj (aeval u Q) ≠ 0 := (_root_.map_ne_zero _).2 hQ
  simp only [Matrix.cons_val_one, Matrix.cons_val_zero, map_div₀, map_one, one_mul] at h
  rw [div_mul_eq_mul_div, div_eq_iff hQc] at h
  linear_combination h

end R21b_Q7

open R21b_Q7 in
open Polynomial in
theorem conj_stable_invisible_quadratic_space_conj_ratio_mobius (u : ℂ) (hu : u ∉ Qbar) (P Q S₁ S₂ : (↥Qbar)[X])
    (hcop : IsCoprime P Q) (hdeg : max P.natDegree Q.natDegree = 2) (hS₁ : S₁.natDegree ≤ 2) (hS₂ : S₂.natDegree ≤ 2)
    (W : Submodule (↥Qbar) ℂ)
    (hform : ((IsCoprime P S₁ ∧ IsCoprime Q S₂ ∧ (P.coeff 2 ≠ 0 ∨ S₁.coeff 2 ≠ 0) ∧
        (Q.coeff 2 ≠ 0 ∨ S₂.coeff 2 ≠ 0)) ∧ W = Submodule.span Qbar ({1, u, u⁻¹, aeval u Q * aeval u S₁ / (u * aeval u P),
        aeval u P * aeval u S₂ / (u * aeval u Q)} : Set ℂ)) ∨
      ((IsCoprime P S₁ ∧ (P.coeff 2 ≠ 0 ∨ S₁.coeff 2 ≠ 0)) ∧ W = Submodule.span Qbar ({1, u, u⁻¹, aeval u Q * aeval u S₁ / (u * aeval u P),
        aeval u Q * (aeval u Q * aeval u S₁ + aeval u P * aeval u S₂) / (u * aeval u P ^ 2)} : Set ℂ)))
    (hσ : ∀ w ∈ W, conj w ∈ W) :
    ∃ a b c d : ℂ, a ∈ Qbar ∧ b ∈ Qbar ∧ c ∈ Qbar ∧ d ∈ Qbar ∧ a * d - b * c ≠ 0 ∧
      conj (aeval u P) * (c * aeval u P + d * aeval u Q) = conj (aeval u Q) * (a * aeval u P + b * aeval u Q) := by
  have hQ : aeval u Q ≠ 0 := by
    have hQ0 : Q ≠ 0 := by
      rintro rfl
      have := natDegree_eq_zero_of_isUnit (isCoprime_zero_right.1 hcop)
      simp at hdeg
      omega
    have hAlg : Algebra.IsAlgebraic ℚ Qbar :=
      ⟨fun a => (isAlgebraic_algebraMap_iff Subtype.val_injective).mp (mem_Qbar_iff.mp a.2)⟩
    exact fun h => hQ0 (transcendental_iff.1 ((Algebra.IsAlgebraic.transcendental_iff ℚ Qbar).1
      fun h' => hu (mem_Qbar_iff.2 h')) Q h)
  rcases hform with ⟨⟨hPS, hQS, hP2, hQ2⟩, rfl⟩ | ⟨⟨hPS, hP2⟩, rfl⟩
  · obtain ⟨hx, hy, hxy⟩ := quadratic_two_orbit_space_carries_two_by_three_configuration u hu P Q S₁ S₂
      hdeg hS₁ hS₂ (invisible_two_orbit_space_u_multiplier_space_eq u hu P Q S₁ S₂ hcop hdeg hS₁ hS₂
        hPS hQS hP2 hQ2).1
    obtain ⟨a, b, c, d, ha, hb, hc, hd, hdet, h⟩ := invisible_two_orbit_space_configuration_ratio_mobius
      u hu P Q S₁ S₂ hcop hdeg hS₁ hS₂ hPS hQS hP2 hQ2 _ _ (conj_li hx) (conj_li hy)
      (fun i j => by simpa only [map_mul] using hσ _ (hxy i j))
    exact ⟨a, b, c, d, ha, hb, hc, hd, hdet, finish hQ h⟩
  · obtain ⟨hx, hy, hxy⟩ := quadratic_cyclic_space_carries_two_by_three_configuration u hu P Q S₁ S₂
      hdeg hS₁ hS₂ (invisible_cyclic_space_u_multiplier_space_eq u hu P Q S₁ S₂ hcop hdeg hS₁ hS₂
        hPS hP2).1
    obtain ⟨a, b, c, d, ha, hb, hc, hd, hdet, h⟩ := invisible_cyclic_space_configuration_ratio_mobius
      u hu P Q S₁ S₂ hcop hdeg hS₁ hS₂ hPS hP2 _ _ (conj_li hx) (conj_li hy)
      (fun i j => by simpa only [map_mul] using hσ _ (hxy i j))
    exact ⟨a, b, c, d, ha, hb, hc, hd, hdet, finish hQ h⟩

end Diaz
