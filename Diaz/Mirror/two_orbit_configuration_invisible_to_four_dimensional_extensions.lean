/-
Mirrored from Prove2Me: `DiazModulus.two_orbit_configuration_invisible_to_four_dimensional_extensions`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.two_orbit_configuration_invisible_to_four_dimensional_extensions__4cb185ad.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.two_orbit_space_excludes_squares_and_reciprocals
import Diaz.Mirror.circle_point_extension_two_by_three_configuration_iff

namespace Diaz

open Complex ComplexConjugate

/-! # The two-orbit configuration needs the whole space

Let `u ∉ Q̄` with `ρ = u ū` algebraic, `a, b, α, β, γ, δ ∈ Q̄` non-zero, `a² ≠ b²`,
`α ≠ β ∨ γ ≠ δ`, `g₁ = α/(u − a) + β/(u + a)`, `g₂ = γ/(u − b) + δ/(u + b)` and
`W = span_Q̄ {1, u, u⁻¹, g₁, g₂}`. Put `H₀ = Q̄ + Q̄u + Q̄ū`.

* `x = (1, u²)`, `y = (u⁻¹, g₁, g₂)` is a configuration whose six products span `W`. Since
  `u²/(u ∓ a) = u ± a + a²/(u ∓ a)`, `u²g₁ = (α + β)u + (α − β)a + a²g₁` (`sq_mul_pair`), and
  likewise for `g₂`; so the products `u⁻¹, g₁, g₂, u, u²g₁, u²g₂` lie in `W`, and their span
  contains `u`, `u⁻¹`, `g₁`, `g₂` and `1`, as `(α − β)a ≠ 0` or `(γ − δ)b ≠ 0`. `x` is free since
  `u² ∉ Q̄`; `y` is part of the free family of `two_orbit_space_excludes_squares_and_reciprocals`.
* No `H₀ + Q̄w` with `w ∈ W`, `w ∉ H₀`, carries a configuration. Since `ū = ρ u⁻¹`,
  `H₀ + Q̄w ≤ W`. By Theorem B (`circle_point_extension_two_by_three_configuration_iff`) a
  configuration there puts `w` in `H₀ + Q̄t` with `t = u²`, `ū²` or `(u − e)⁻¹`, `e ∈ Q̄ \ {0}`;
  by two_orbit_configuration_invisible_to_four_dimensional_extensions_exchange `t ∈ H₀ + Q̄w ≤ W`. But `u²`, `u⁻²` and `(u − e)⁻¹` are not in `W`
  (`two_orbit_space_excludes_squares_and_reciprocals`), and `ū² ∈ W` would give
  `u⁻² = ρ⁻² ū² ∈ W`.
-/

namespace R14_orbitInvisible

theorem two_orbit_configuration_invisible_to_four_dimensional_extensions_set_eq_insert (u w : ℂ) : ({1, u, conj u, w} : Set ℂ) = insert w {1, u, conj u} := by
  ext t
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff]
  tauto

/-- Exchange: `w ∉ H₀` and `w ∈ H₀ + Q̄t` give `t ∈ H₀ + Q̄w`. -/
theorem two_orbit_configuration_invisible_to_four_dimensional_extensions_exchange {u t w : ℂ} (hw : w ∉ Submodule.span Qbar ({1, u, conj u} : Set ℂ))
    (h : w ∈ Submodule.span Qbar ({1, u, conj u, t} : Set ℂ)) :
    t ∈ Submodule.span Qbar ({1, u, conj u, w} : Set ℂ) := by
  rw [two_orbit_configuration_invisible_to_four_dimensional_extensions_set_eq_insert] at h ⊢
  exact mem_span_insert_exchange h hw

theorem two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mul_mem {S : Set ℂ} {c v : ℂ} (hc : c ∈ Qbar) (hv : v ∈ Submodule.span Qbar S) :
    c * v ∈ Submodule.span Qbar S := by
  have := Submodule.smul_mem _ (⟨c, hc⟩ : ↥Qbar) hv
  rwa [Subfield.smul_def, smul_eq_mul] at this

theorem two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq {S : Set ℂ} {v z : ℂ} (h : v = z) (hz : z ∈ Submodule.span Qbar S) :
    v ∈ Submodule.span Qbar S := by
  rwa [h]

/-- `c₁ v₁ + c₂ v₂ + c₃ v₃` stays in a `Q̄`-span. -/
theorem two_orbit_configuration_invisible_to_four_dimensional_extensions_span_comb_mem {S : Set ℂ} {c₁ c₂ c₃ v₁ v₂ v₃ : ℂ} (h₁ : c₁ ∈ Qbar) (h₂ : c₂ ∈ Qbar)
    (h₃ : c₃ ∈ Qbar) (hv₁ : v₁ ∈ Submodule.span Qbar S) (hv₂ : v₂ ∈ Submodule.span Qbar S)
    (hv₃ : v₃ ∈ Submodule.span Qbar S) : c₁ * v₁ + c₂ * v₂ + c₃ * v₃ ∈ Submodule.span Qbar S :=
  add_mem (add_mem (two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mul_mem h₁ hv₁) (two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mul_mem h₂ hv₂)) (two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mul_mem h₃ hv₃)

/-- `H₀ + Q̄w ≤ W` for `w ∈ W`, as `ū = (u ū) u⁻¹ ∈ W`. -/
theorem two_orbit_configuration_invisible_to_four_dimensional_extensions_span_four_le {u w g₁ g₂ : ℂ} (hu0 : u ≠ 0) (hρ : u * conj u ∈ Qbar)
    (hw : w ∈ Submodule.span Qbar ({1, u, u⁻¹, g₁, g₂} : Set ℂ)) :
    Submodule.span Qbar ({1, u, conj u, w} : Set ℂ) ≤
      Submodule.span Qbar ({1, u, u⁻¹, g₁, g₂} : Set ℂ) := by
  have hc : conj u ∈ Submodule.span Qbar ({1, u, u⁻¹, g₁, g₂} : Set ℂ) :=
    two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (show conj u = u * conj u * u⁻¹ by field_simp)
      (two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mul_mem hρ (Submodule.subset_span (show u⁻¹ ∈ ({1, u, u⁻¹, g₁, g₂} : Set ℂ) by simp)))
  refine Submodule.span_le.2 (Set.insert_subset_iff.2 ⟨Submodule.subset_span (by simp),
    Set.insert_subset_iff.2 ⟨Submodule.subset_span (by simp),
      Set.insert_subset_iff.2 ⟨hc, Set.singleton_subset_iff.2 hw⟩⟩⟩)

/-- `ū² ∈ W` forces `u⁻² ∈ W`: `u⁻² = ρ⁻² ū²`. -/
theorem two_orbit_configuration_invisible_to_four_dimensional_extensions_inv_sq_mem {u : ℂ} {S : Set ℂ} (hu0 : u ≠ 0) (hρ : u * conj u ∈ Qbar)
    (h : conj u ^ 2 ∈ Submodule.span Qbar S) : (u ^ 2)⁻¹ ∈ Submodule.span Qbar S := by
  have := two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mul_mem (inv_mem (pow_mem hρ 2)) h
  have hc : conj u ≠ 0 := (map_ne_zero _).2 hu0
  rwa [show ((u * conj u) ^ 2)⁻¹ * conj u ^ 2 = (u ^ 2)⁻¹ by field_simp] at this

/-- `u² (α/(u − a) + β/(u + a)) = (α + β) u + (α − β) a + a² (α/(u − a) + β/(u + a))`. -/
theorem sq_mul_pair {u a α β : ℂ} (hua : u - a ≠ 0) (hua' : u + a ≠ 0) :
    u ^ 2 * (α / (u - a) + β / (u + a)) =
      (α + β) * u + (α - β) * a * 1 + a ^ 2 * (α / (u - a) + β / (u + a)) := by
  field_simp
  ring

theorem two_orbit_configuration_invisible_to_four_dimensional_extensions_sub_ne {u x : ℂ} (hu : u ∉ Qbar) (hx : x ∈ Qbar) : u - x ≠ 0 :=
  fun h => hu (by rw [sub_eq_zero.1 h]; exact hx)

theorem two_orbit_configuration_invisible_to_four_dimensional_extensions_add_ne {u x : ℂ} (hu : u ∉ Qbar) (hx : x ∈ Qbar) : u + x ≠ 0 := by
  rw [← sub_neg_eq_add]; exact two_orbit_configuration_invisible_to_four_dimensional_extensions_sub_ne hu (neg_mem hx)

/-- `1` from `u²g = (α + β)u + (α − β)a + a²g` when `(α − β)a ≠ 0`. -/
theorem one_mem_of_pair {S : Set ℂ} {u a α β g : ℂ} (ha : a ∈ Qbar) (hα : α ∈ Qbar)
    (hβ : β ∈ Qbar) (ha0 : a ≠ 0) (hαβ : α ≠ β)
    (hp : u ^ 2 * g = (α + β) * u + (α - β) * a * 1 + a ^ 2 * g)
    (hP : u ^ 2 * g ∈ Submodule.span Qbar S) (hU : u ∈ Submodule.span Qbar S)
    (hG : g ∈ Submodule.span Qbar S) : (1 : ℂ) ∈ Submodule.span Qbar S := by
  have hd : (α - β) * a ≠ 0 := mul_ne_zero (sub_ne_zero.2 hαβ) ha0
  have hq : (α - β) * a ∈ Qbar := mul_mem (sub_mem hα hβ) ha
  refine two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq ?_ (two_orbit_configuration_invisible_to_four_dimensional_extensions_span_comb_mem (inv_mem hq)
    (neg_mem (div_mem (add_mem hα hβ) hq)) (neg_mem (div_mem (pow_mem ha 2) hq)) hP hU hG)
  rw [hp]
  field_simp
  ring

end R14_orbitInvisible

open R14_orbitInvisible in
theorem two_orbit_configuration_invisible_to_four_dimensional_extensions
    (u : ℂ) (hu : u ∉ Qbar) (a b α β γ δ : ℂ) (ha : a ∈ Qbar) (hb : b ∈ Qbar) (hα : α ∈ Qbar) (hβ : β ∈ Qbar)
    (hγ : γ ∈ Qbar) (hδ : δ ∈ Qbar) (ha0 : a ≠ 0) (hb0 : b ≠ 0) (hab : a ^ 2 ≠ b ^ 2)
    (hα0 : α ≠ 0) (hβ0 : β ≠ 0) (hγ0 : γ ≠ 0) (hδ0 : δ ≠ 0)
    (hαγ : α ≠ β ∨ γ ≠ δ) (hρ : IsAlgebraic ℚ (u * conj u)) :
    (∃ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ), LinearIndependent (↥Qbar) x ∧ LinearIndependent (↥Qbar) y ∧
        (∀ i j, x i * y j ∈ Submodule.span Qbar ({1, u, u⁻¹, (α / (u - a) + β / (u + a)), (γ / (u - b) + δ / (u + b))} : Set ℂ)) ∧
        Submodule.span Qbar (Set.range (fun p : Fin 2 × Fin 3 => x p.1 * y p.2)) = Submodule.span Qbar ({1, u, u⁻¹, (α / (u - a) + β / (u + a)), (γ / (u - b) + δ / (u + b))} : Set ℂ)) ∧
      ∀ w ∈ Submodule.span Qbar ({1, u, u⁻¹, (α / (u - a) + β / (u + a)), (γ / (u - b) + δ / (u + b))} : Set ℂ), w ∉ Submodule.span Qbar ({1, u, conj u} : Set ℂ) →
        ¬ ∃ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ), LinearIndependent (↥Qbar) x ∧ LinearIndependent (↥Qbar) y ∧
          ∀ i j, x i * y j ∈ Submodule.span Qbar ({1, u, conj u, w} : Set ℂ) := by
  have hu0 : u ≠ 0 := fun h => hu (h ▸ Subfield.zero_mem _)
  have hρ' := mem_Qbar_iff.2 hρ
  obtain ⟨hind, hsq, hisq, hinv⟩ := two_orbit_space_excludes_squares_and_reciprocals
    u hu a b α β γ δ ha hb hα hβ hγ hδ ha0 hb0 hab hα0 hβ0 hγ0 hδ0
  have p₁ := sq_mul_pair (α := α) (β := β) (two_orbit_configuration_invisible_to_four_dimensional_extensions_sub_ne hu ha) (two_orbit_configuration_invisible_to_four_dimensional_extensions_add_ne hu ha)
  have p₂ := sq_mul_pair (α := γ) (β := δ) (two_orbit_configuration_invisible_to_four_dimensional_extensions_sub_ne hu hb) (two_orbit_configuration_invisible_to_four_dimensional_extensions_add_ne hu hb)
  set g₁ := α / (u - a) + β / (u + a) with hg₁
  set g₂ := γ / (u - b) + δ / (u + b) with hg₂
  set W := Submodule.span Qbar ({1, u, u⁻¹, g₁, g₂} : Set ℂ) with hW
  have m1 : (1 : ℂ) ∈ W := Submodule.subset_span (by simp)
  have mu : u ∈ W := Submodule.subset_span (by simp)
  have mi : u⁻¹ ∈ W := Submodule.subset_span (by simp)
  have mg₁ : g₁ ∈ W := Submodule.subset_span (by simp)
  have mg₂ : g₂ ∈ W := Submodule.subset_span (by simp)
  have P : ∀ i j, ![1, u ^ 2] i * ![u⁻¹, g₁, g₂] j ∈ W := by
    intro i j
    fin_cases i <;> fin_cases j
    · exact two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (show (1 : ℂ) * u⁻¹ = u⁻¹ by ring) mi
    · exact two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (show (1 : ℂ) * g₁ = g₁ by ring) mg₁
    · exact two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (show (1 : ℂ) * g₂ = g₂ by ring) mg₂
    · exact two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (show u ^ 2 * u⁻¹ = u by field_simp) mu
    · exact two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq p₁ (two_orbit_configuration_invisible_to_four_dimensional_extensions_span_comb_mem (add_mem hα hβ) (mul_mem (sub_mem hα hβ) ha)
        (pow_mem ha 2) mu m1 mg₁)
    · exact two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq p₂ (two_orbit_configuration_invisible_to_four_dimensional_extensions_span_comb_mem (add_mem hγ hδ) (mul_mem (sub_mem hγ hδ) hb)
        (pow_mem hb 2) mu m1 mg₂)
  refine ⟨⟨![1, u ^ 2], ![u⁻¹, g₁, g₂], ?_, ?_, P, ?_⟩, ?_⟩
  · -- `x = (1, u²)` is free, as `u² ∉ Q̄`
    rw [LinearIndependent.pair_iff]
    intro s t h
    simp only [Subfield.smul_def, smul_eq_mul, mul_one] at h
    have ht : (t : ℂ) = 0 := by
      by_contra ht
      apply hu
      have h2 : u ^ 2 ∈ Qbar := by
        rw [show u ^ 2 = -(s : ℂ) / t by rw [eq_div_iff ht]; linear_combination h]
        exact div_mem (neg_mem s.2) t.2
      exact mem_Qbar_iff.2 ((mem_Qbar_iff.1 h2).of_pow two_pos)
    have hs : (s : ℂ) = 0 := by rw [ht] at h; linear_combination h
    exact ⟨Subtype.ext hs, Subtype.ext ht⟩
  · -- `y` is part of the free family `1, u, u⁻¹, g₁, g₂`
    have := hind.comp ![2, 3, 4] (by decide)
    convert this using 1
    funext i
    fin_cases i <;> rfl
  · -- the six products span `W`
    set V := Submodule.span Qbar
      (Set.range (fun p : Fin 2 × Fin 3 => ![1, u ^ 2] p.1 * ![u⁻¹, g₁, g₂] p.2)) with hV
    have mem : ∀ i j, ![1, u ^ 2] i * ![u⁻¹, g₁, g₂] j ∈ V :=
      fun i j => Submodule.subset_span ⟨(i, j), rfl⟩
    have vi : u⁻¹ ∈ V := two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (by simp) (mem 0 0)
    have vg₁ : g₁ ∈ V := two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (by simp) (mem 0 1)
    have vg₂ : g₂ ∈ V := two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (by simp) (mem 0 2)
    have vu : u ∈ V := two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (by simp; field_simp) (mem 1 0)
    have vP₁ : u ^ 2 * g₁ ∈ V := two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (by simp) (mem 1 1)
    have vP₂ : u ^ 2 * g₂ ∈ V := two_orbit_configuration_invisible_to_four_dimensional_extensions_span_mem_of_eq (by simp) (mem 1 2)
    have v1 : (1 : ℂ) ∈ V := by
      rcases hαγ with h | h
      · exact one_mem_of_pair ha hα hβ ha0 h p₁ vP₁ vu vg₁
      · exact one_mem_of_pair hb hγ hδ hb0 h p₂ vP₂ vu vg₂
    refine le_antisymm (Submodule.span_le.2 ?_) (Submodule.span_le.2 ?_)
    · rintro _ ⟨⟨i, j⟩, rfl⟩
      exact P i j
    · intro t ht
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at ht
      rcases ht with rfl | rfl | rfl | rfl | rfl
      exacts [v1, vu, vi, vg₁, vg₂]
  · -- no four-dimensional extension of `H₀` inside `W` carries a configuration
    intro w hw hw0 hconf
    have hle := two_orbit_configuration_invisible_to_four_dimensional_extensions_span_four_le hu0 hρ' hw
    rcases (circle_point_extension_two_by_three_configuration_iff u w hu hρ hw0).1
      hconf with h | h | ⟨e, he, he0, h⟩
    · exact hsq (hle (two_orbit_configuration_invisible_to_four_dimensional_extensions_exchange hw0 h))
    · exact hisq (two_orbit_configuration_invisible_to_four_dimensional_extensions_inv_sq_mem hu0 hρ' (hle (two_orbit_configuration_invisible_to_four_dimensional_extensions_exchange hw0 h)))
    · exact hinv e he he0 (hle (two_orbit_configuration_invisible_to_four_dimensional_extensions_exchange hw0 h))

end Diaz
