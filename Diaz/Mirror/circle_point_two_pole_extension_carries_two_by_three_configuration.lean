/-
Mirrored from Prove2Me: `DiazModulus.circle_point_two_pole_extension_carries_two_by_three_configuration`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.circle_point_two_pole_extension_carries_two_by_three_configuration__8596d31d.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

/-!
# Two-by-three configurations in `Q̄ + Q̄u + Q̄ū + Q̄z₁ + Q̄z₂`

Let `u ∉ Q̄` with `ρ = u ū` algebraic, and let `a₁ ≠ a₂` be non-zero algebraic numbers. Put
`zᵢ = u / (u² - aᵢ)` and `W = Q̄ + Q̄u + Q̄ū + Q̄z₁ + Q̄z₂`. Then `W` contains all six products
`xᵢyⱼ` of `x = (1, u²)` and `y = (b, bu², bu⁴)` with `b = (u (u² - a₁)(u² - a₂))⁻¹`, and both
`x` and `y` are free over `Q̄`. The six products are `b, bu², bu⁴, bu², bu⁴, bu⁶`
(`circle_point_two_pole_extension_carries_two_by_three_configuration_config_of_mem`), and each lies in `W` by partial fractions, using `u⁻¹ = ρ⁻¹ū ∈ W`
(`circle_point_two_pole_extension_carries_two_by_three_configuration_span_inv_mem`):
`b = (a₁a₂)⁻¹u⁻¹ + (a₁(a₁ - a₂))⁻¹z₁ + (a₂(a₂ - a₁))⁻¹z₂`, `bu² = (z₁ - z₂) / (a₁ - a₂)`,
`bu⁴ = (a₁z₁ - a₂z₂) / (a₁ - a₂)`, `bu⁶ = u + (a₁²z₁ - a₂²z₂) / (a₁ - a₂)`.

Freeness: `u` is transcendental over `Q̄` (it is transcendental over `ℚ`, and `Q̄` is algebraic
over `ℚ`), so `1, u², u⁴` are free over `Q̄` (`circle_point_two_pole_extension_carries_two_by_three_configuration_three_terms`), and `b ≠ 0`.
-/

namespace R7_twoPoleConfig

open Polynomial

/-! ## Transcendence of `u` over `Q̄` -/

/-- Outside `Q̄`, no non-zero polynomial over `Q̄` vanishes. -/
theorem circle_point_two_pole_extension_carries_two_by_three_configuration_aeval_eq_zero {u : ℂ} (hu : u ∉ Qbar) {P : (↥Qbar)[X]} (h : aeval u P = 0) :
    P = 0 := by
  have : Algebra.IsAlgebraic ℚ Qbar :=
    ⟨fun a => (isAlgebraic_algebraMap_iff Subtype.val_injective).mp (mem_Qbar_iff.mp a.2)⟩
  exact transcendental_iff.1 ((Algebra.IsAlgebraic.transcendental_iff ℚ Qbar).1
    fun h' => hu (mem_Qbar_iff.2 h')) P h

theorem circle_point_two_pole_extension_carries_two_by_three_configuration_ne_zero_of_not_mem {u : ℂ} (hu : u ∉ Qbar) : u ≠ 0 :=
  fun h => hu (h ▸ Subfield.zero_mem _)

/-- `a + b uᵐ + c uⁿ = 0`, with `0, m, n` distinct, forces `a = b = c = 0`. -/
theorem circle_point_two_pole_extension_carries_two_by_three_configuration_three_terms {u : ℂ} (hu : u ∉ Qbar) {m n : ℕ} (hm : m ≠ 0) (hn : n ≠ 0) (hmn : m ≠ n)
    {a b c : ↥Qbar} (h : (a : ℂ) + b * u ^ m + c * u ^ n = 0) : a = 0 ∧ b = 0 ∧ c = 0 := by
  have hP := circle_point_two_pole_extension_carries_two_by_three_configuration_aeval_eq_zero hu (P := C a + C b * X ^ m + C c * X ^ n)
    (by simp only [map_add, map_mul, aeval_C, aeval_X_pow]; exact h)
  have h0 := congrArg (coeff · 0) hP
  have h1 := congrArg (coeff · m) hP
  have h2 := congrArg (coeff · n) hP
  simp [coeff_C, coeff_X_pow, hm, hn, hmn, hm.symm, hn.symm, hmn.symm] at h0 h1 h2
  exact ⟨h0, h1, h2⟩

/-- `u² - c ≠ 0` for `c ∈ Q̄`: otherwise `u²`, hence `u`, would be algebraic. -/
theorem circle_point_two_pole_extension_carries_two_by_three_configuration_sq_sub_ne_zero {u : ℂ} (hu : u ∉ Qbar) {c : ℂ} (hc : c ∈ Qbar) : u ^ 2 - c ≠ 0 := by
  intro h
  have h2 : u ^ 2 ∈ Qbar := by rw [sub_eq_zero.1 h]; exact hc
  exact hu (mem_Qbar_iff.2 ((mem_Qbar_iff.1 h2).of_pow two_pos))

/-! ## Membership in a `Q̄`-span -/

theorem circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq {S : Set ℂ} {v z : ℂ} (h : v = z) (hz : z ∈ Submodule.span Qbar S) :
    v ∈ Submodule.span Qbar S := by
  rwa [h]

theorem circle_point_two_pole_extension_carries_two_by_three_configuration_span_mul_mem {S : Set ℂ} {c v : ℂ} (hc : c ∈ Qbar) (hv : v ∈ Submodule.span Qbar S) :
    c * v ∈ Submodule.span Qbar S := by
  have := Submodule.smul_mem _ (⟨c, hc⟩ : ↥Qbar) hv
  rwa [Subfield.smul_def, smul_eq_mul] at this

/-- A `Q̄`-combination of three members of a `Q̄`-span is a member. -/
theorem circle_point_two_pole_extension_carries_two_by_three_configuration_span_comb_mem {S : Set ℂ} {c₁ c₂ c₃ v₁ v₂ v₃ : ℂ} (h₁ : c₁ ∈ Qbar) (h₂ : c₂ ∈ Qbar)
    (h₃ : c₃ ∈ Qbar) (hv₁ : v₁ ∈ Submodule.span Qbar S) (hv₂ : v₂ ∈ Submodule.span Qbar S)
    (hv₃ : v₃ ∈ Submodule.span Qbar S) : c₁ * v₁ + c₂ * v₂ + c₃ * v₃ ∈ Submodule.span Qbar S :=
  add_mem (add_mem (circle_point_two_pole_extension_carries_two_by_three_configuration_span_mul_mem h₁ hv₁) (circle_point_two_pole_extension_carries_two_by_three_configuration_span_mul_mem h₂ hv₂)) (circle_point_two_pole_extension_carries_two_by_three_configuration_span_mul_mem h₃ hv₃)

/-- `u⁻¹ = ρ⁻¹ū` with `ρ = u ū`. -/
theorem circle_point_two_pole_extension_carries_two_by_three_configuration_inv_eq_mul_conj {u : ℂ} (hu0 : u ≠ 0) : u⁻¹ = (u * conj u)⁻¹ * conj u := by
  rw [mul_inv, mul_assoc, inv_mul_cancel₀ ((_root_.map_ne_zero _).2 hu0), mul_one]

/-- If `ρ = u ū ∈ Q̄`, then `u⁻¹` lies in every `Q̄`-span containing `ū`. -/
theorem circle_point_two_pole_extension_carries_two_by_three_configuration_span_inv_mem {u : ℂ} (hu0 : u ≠ 0) (hρ : u * conj u ∈ Qbar) {S : Set ℂ}
    (hS : conj u ∈ S) : u⁻¹ ∈ Submodule.span Qbar S := by
  rw [circle_point_two_pole_extension_carries_two_by_three_configuration_inv_eq_mul_conj hu0]
  exact circle_point_two_pole_extension_carries_two_by_three_configuration_span_mul_mem (inv_mem hρ) (Submodule.subset_span hS)

/-! ## The configuration `x = (1, u²)`, `y = (b, bu², bu⁴)` -/

/-- If `b ≠ 0` and `b, bu², bu⁴, bu⁶` lie in a `Q̄`-span, then `x = (1, u²)` and
`y = (b, bu², bu⁴)` are free over `Q̄` and their six products lie in that span. -/
theorem circle_point_two_pole_extension_carries_two_by_three_configuration_config_of_mem {u b : ℂ} (hu : u ∉ Qbar) (hb : b ≠ 0) {S : Set ℂ}
    (h0 : b ∈ Submodule.span Qbar S) (h2 : b * u ^ 2 ∈ Submodule.span Qbar S)
    (h4 : b * u ^ 4 ∈ Submodule.span Qbar S) (h6 : b * u ^ 6 ∈ Submodule.span Qbar S) :
    ∃ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ), LinearIndependent (↥Qbar) x ∧
      LinearIndependent (↥Qbar) y ∧ ∀ i j, x i * y j ∈ Submodule.span Qbar S := by
  refine ⟨![1, u ^ 2], ![b, b * u ^ 2, b * u ^ 4], ?_, ?_, ?_⟩
  · rw [LinearIndependent.pair_iff]
    intro s t h
    have h' : (s : ℂ) + t * u ^ 2 + (0 : ↥Qbar) * u ^ 4 = 0 := by
      simpa [Subfield.smul_def] using h
    obtain ⟨e0, e1, -⟩ := circle_point_two_pole_extension_carries_two_by_three_configuration_three_terms hu two_ne_zero four_ne_zero (by norm_num) h'
    exact ⟨e0, e1⟩
  · rw [Fintype.linearIndependent_iff]
    intro g hg
    have hg' : b * ((g 0 : ℂ) + g 1 * u ^ 2 + g 2 * u ^ 4) = 0 := by
      simp only [Fin.sum_univ_three, Subfield.smul_def, Matrix.cons_val_zero, Matrix.cons_val_one,
        Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons] at hg
      linear_combination hg
    obtain ⟨e0, e1, e2⟩ := circle_point_two_pole_extension_carries_two_by_three_configuration_three_terms hu two_ne_zero four_ne_zero (by norm_num)
      ((mul_eq_zero.1 hg').resolve_left hb)
    intro i
    fin_cases i <;> assumption
  · intro i j
    fin_cases i <;> fin_cases j
    · exact circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq (show (1 : ℂ) * b = b by ring) h0
    · exact circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq (show (1 : ℂ) * (b * u ^ 2) = b * u ^ 2 by ring) h2
    · exact circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq (show (1 : ℂ) * (b * u ^ 4) = b * u ^ 4 by ring) h4
    · exact circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq (show u ^ 2 * b = b * u ^ 2 by ring) h2
    · exact circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq (show u ^ 2 * (b * u ^ 2) = b * u ^ 4 by ring) h4
    · exact circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq (show u ^ 2 * (b * u ^ 4) = b * u ^ 6 by ring) h6

end R7_twoPoleConfig

open R7_twoPoleConfig in
theorem circle_point_two_pole_extension_carries_two_by_three_configuration (u a₁ a₂ : ℂ)
    (hu : u ∉ Qbar) (hρ : IsAlgebraic ℚ (u * conj u)) (ha₁ : a₁ ∈ Qbar) (ha₂ : a₂ ∈ Qbar)
    (ha₁0 : a₁ ≠ 0) (ha₂0 : a₂ ≠ 0) (ha : a₁ ≠ a₂) :
    ∃ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ), LinearIndependent (↥Qbar) x ∧ LinearIndependent (↥Qbar) y ∧
      ∀ i j, x i * y j ∈ Submodule.span Qbar ({1, u, conj u, u / (u ^ 2 - a₁), u / (u ^ 2 - a₂)} : Set ℂ) := by
  have hρ' := mem_Qbar_iff.2 hρ
  have hu0 := circle_point_two_pole_extension_carries_two_by_three_configuration_ne_zero_of_not_mem hu
  have hd : a₁ - a₂ ≠ 0 := sub_ne_zero.2 ha
  have hd' : a₂ - a₁ ≠ 0 := sub_ne_zero.2 (Ne.symm ha)
  have hv₁ := circle_point_two_pole_extension_carries_two_by_three_configuration_sq_sub_ne_zero hu ha₁
  have hv₂ := circle_point_two_pole_extension_carries_two_by_three_configuration_sq_sub_ne_zero hu ha₂
  set S : Set ℂ := {1, u, conj u, u / (u ^ 2 - a₁), u / (u ^ 2 - a₂)} with hS
  have hU : u ∈ Submodule.span Qbar S := Submodule.subset_span (by simp [hS])
  have hZ₁ : u / (u ^ 2 - a₁) ∈ Submodule.span Qbar S := Submodule.subset_span (by simp [hS])
  have hZ₂ : u / (u ^ 2 - a₂) ∈ Submodule.span Qbar S := Submodule.subset_span (by simp [hS])
  have hI := circle_point_two_pole_extension_carries_two_by_three_configuration_span_inv_mem (S := S) hu0 hρ' (by simp [hS])
  have hq : a₁ - a₂ ∈ Qbar := sub_mem ha₁ ha₂
  refine circle_point_two_pole_extension_carries_two_by_three_configuration_config_of_mem hu (b := (u * (u ^ 2 - a₁) * (u ^ 2 - a₂))⁻¹)
    (inv_ne_zero (mul_ne_zero (mul_ne_zero hu0 hv₁) hv₂)) ?_ ?_ ?_ ?_
  · -- `b = (a₁ a₂)⁻¹ u⁻¹ + (a₁ (a₁ - a₂))⁻¹ z₁ + (a₂ (a₂ - a₁))⁻¹ z₂`
    refine circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq ?_ (circle_point_two_pole_extension_carries_two_by_three_configuration_span_comb_mem (inv_mem (mul_mem ha₁ ha₂))
      (inv_mem (mul_mem ha₁ hq)) (inv_mem (mul_mem ha₂ (sub_mem ha₂ ha₁))) hI hZ₁ hZ₂)
    field_simp
    ring
  · -- `bu² = (a₁ - a₂)⁻¹ z₁ - (a₁ - a₂)⁻¹ z₂`
    refine circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq ?_ (circle_point_two_pole_extension_carries_two_by_three_configuration_span_comb_mem (zero_mem _) (inv_mem hq)
      (neg_mem (inv_mem hq)) hU hZ₁ hZ₂)
    field_simp
    ring
  · -- `bu⁴ = (a₁ / (a₁ - a₂)) z₁ - (a₂ / (a₁ - a₂)) z₂`
    refine circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq ?_ (circle_point_two_pole_extension_carries_two_by_three_configuration_span_comb_mem (zero_mem _) (div_mem ha₁ hq)
      (neg_mem (div_mem ha₂ hq)) hU hZ₁ hZ₂)
    field_simp
    ring
  · -- `bu⁶ = u + (a₁² / (a₁ - a₂)) z₁ - (a₂² / (a₁ - a₂)) z₂`
    refine circle_point_two_pole_extension_carries_two_by_three_configuration_span_mem_of_eq ?_ (circle_point_two_pole_extension_carries_two_by_three_configuration_span_comb_mem (one_mem _) (div_mem (pow_mem ha₁ 2) hq)
      (neg_mem (div_mem (pow_mem ha₂ 2) hq)) hU hZ₁ hZ₂)
    field_simp
    ring

end Diaz
