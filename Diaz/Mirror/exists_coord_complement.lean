/-
Mirrored from Prove2Me: `DiazModulus.exists_coord_complement`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.exists_coord_complement__7d20d10c.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
Names and spellings that changed between the platform's Mathlib revision and the one
pinned here were updated to match, and proof steps that became no-ops there were
dropped; the mathematics is unchanged.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

/-! # A coordinate complement of a rational span

Let `W ≤ ℚᴺ` be the `ℚ`-span of an integer set `A`, and `π : ℚᴺ → ℚᴺ ⧸ W` the quotient map.
The images `π eⱼ` of the standard basis vectors span the quotient. By
`exists_linearIndependent'` an injectively indexed subfamily `π e_{a(k)}` is a basis of the
quotient; let `J` be the set of the indices `a(k)`. Then `|J| = dim (ℚᴺ ⧸ W) = N − dim W`
(`Submodule.finrank_quotient_add_finrank`). If `v ∈ W` vanishes off `J`, then
`v = ∑ₖ v(a k) e_{a(k)}`, and applying `π` gives `∑ₖ v(a k) π e_{a(k)} = π v = 0`, so every
`v(a k)` is zero by linear independence, and `v = 0`.
-/

namespace C14_O1
/-- The standard basis vectors of `ℚᴺ` span it. -/
theorem span_single (N : Type) [Fintype N] [DecidableEq N] :
    Submodule.span ℚ (Set.range (fun j : N => (Pi.single j (1 : ℚ) : N → ℚ))) = ⊤ := by
  rw [show (fun j : N => (Pi.single j (1 : ℚ) : N → ℚ)) = ⇑(Pi.basisFun ℚ N) from
    funext fun j => (Pi.basisFun_apply ℚ N j).symm]
  exact (Pi.basisFun ℚ N).span_eq

end C14_O1

open C14_O1 in
theorem exists_coord_complement {N : Type} [Fintype N] (A : Set (N → ℤ)) :
    ∃ J : Finset N, J.card + Module.finrank ℚ ↥(Submodule.span ℚ ((fun s : N → ℤ => fun j => (s j : ℚ)) '' A)) = Fintype.card N ∧
      ∀ v ∈ Submodule.span ℚ ((fun s : N → ℤ => fun j => (s j : ℚ)) '' A), (∀ j ∉ J, v j = 0) → v = 0 := by
  classical
  set W := Submodule.span ℚ ((fun s : N → ℤ => fun j => (s j : ℚ)) '' A) with hW
  let e : N → (N → ℚ) := fun j => Pi.single j (1 : ℚ)
  let w : N → (N → ℚ) ⧸ W := fun j => W.mkQ (e j)
  have hspan : Submodule.span ℚ (Set.range w) = ⊤ := by
    have : Set.range w = W.mkQ '' Set.range e := by
      rw [← Set.range_comp]; rfl
    rw [this, Submodule.span_image, span_single, Submodule.map_top, Submodule.range_mkQ]
  obtain ⟨κ, a, ha, hspan', hli⟩ := exists_linearIndependent' ℚ w
  have : Finite κ := Finite.of_injective a ha
  have : Fintype κ := Fintype.ofFinite κ
  refine ⟨Finset.univ.image a, ?_, ?_⟩
  · rw [Finset.card_image_of_injective _ ha, Finset.card_univ, ← finrank_span_eq_card hli,
      hspan', hspan, finrank_top, Submodule.finrank_quotient_add_finrank,
      Module.finrank_fintype_fun_eq_card]
  · intro v hv hJ
    have hdec : v = ∑ k : κ, v (a k) • e (a k) := by
      ext j
      simp only [Finset.sum_apply, Pi.smul_apply, e, Pi.single_apply, smul_eq_mul, mul_ite,
        mul_one, mul_zero]
      by_cases hj : ∃ k, a k = j
      · obtain ⟨k0, rfl⟩ := hj
        rw [Finset.sum_eq_single k0]
        · simp
        · intro k _ hk
          rw [ite_eq_right]
          intro h; exact hk (ha h.symm)
        · intro h; exact absurd (Finset.mem_univ k0) h
      · push Not at hj
        have hvj : v j = 0 := hJ j (by simpa using hj)
        rw [hvj, Finset.sum_eq_zero]
        intro k _
        rw [ite_eq_right]
        intro h; exact hj k h.symm
    have hπ : ∑ k : κ, v (a k) • (w ∘ a) k = 0 := by
      have h0 : W.mkQ v = 0 := (Submodule.Quotient.mk_eq_zero W).mpr hv
      rw [hdec, map_sum] at h0
      simpa [w, map_smul] using h0
    have hcoef := Fintype.linearIndependent_iff.mp hli _ hπ
    ext j
    by_cases hj : ∃ k, a k = j
    · obtain ⟨k, rfl⟩ := hj
      simpa using hcoef k
    · push Not at hj
      simpa using hJ j (by simpa using hj)

end Diaz
