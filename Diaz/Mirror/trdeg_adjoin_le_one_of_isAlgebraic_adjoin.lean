/-
Mirrored from Prove2Me: `Transcendence.trdeg_adjoin_le_one_of_isAlgebraic_adjoin`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Transcendence.trdeg_adjoin_le_one_of_isAlgebraic_adjoin__1cb70071.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Transcendence

namespace P17_trdeg

variable {K L : Type*} [Field K] [Field L] [Algebra K L]

-- A subalgebra containing `x`, all of whose elements are algebraic over `K[x]`, has
-- transcendence degree at most one.
theorem trdeg_adjoin_le_one_of_isAlgebraic_adjoin_trdeg_le_one_of_adjoin_singleton
    {B : Subalgebra K L} {x : L} (hxB : x ∈ B)
    (halg : ∀ y ∈ B, IsAlgebraic ↥(Algebra.adjoin K ({x} : Set L)) y) :
    Algebra.trdeg K ↥B ≤ 1 := by
  set x' : (↥B) := ⟨x, hxB⟩ with hx'
  have hmap : Subalgebra.map B.val (Algebra.adjoin K ({x'} : Set ↥B))
      = Algebra.adjoin K ({x} : Set L) := by
    rw [AlgHom.map_adjoin]
    congr 1
    simp [hx']
  let e : ↥(Algebra.adjoin K ({x'} : Set ↥B)) ≃ₐ[K] ↥(Algebra.adjoin K ({x} : Set L)) :=
    (Subalgebra.equivMapOfInjective _ B.val Subtype.val_injective).trans
      (Subalgebra.equivOfEq _ _ hmap)
  have : Algebra.IsAlgebraic ↥(Algebra.adjoin K ({x'} : Set ↥B)) ↥B := by
    constructor
    intro y
    refine IsAlgebraic.of_ringHom_of_comp_eq (f := (e : _ →+* _))
      (g := (B.val : ↥B →+* L)) (halg y y.2) e.surjective Subtype.val_injective ?_
    ext c
    rfl
  simpa using Algebra.IsAlgebraic.trdeg_le_cardinalMk K ({x'} : Set ↥B)

-- The elements of `L` algebraic over `K[x]`, as a `K`-subalgebra of `L`.
noncomputable def trdeg_adjoin_le_one_of_isAlgebraic_adjoin_E (K : Type*) {L : Type*} [Field K] [Field L] [Algebra K L] (x : L) :
    Subalgebra K L :=
  (Subalgebra.algebraicClosure ↥(Algebra.adjoin K ({x} : Set L)) L).restrictScalars K

theorem trdeg_adjoin_le_one_of_isAlgebraic_adjoin_mem_E_iff {x z : L} : z ∈ trdeg_adjoin_le_one_of_isAlgebraic_adjoin_E K x ↔ IsAlgebraic ↥(Algebra.adjoin K ({x} : Set L)) z :=
  Iff.rfl

theorem trdeg_adjoin_le_one_of_isAlgebraic_adjoin_self_mem_E (x : L) : x ∈ trdeg_adjoin_le_one_of_isAlgebraic_adjoin_E K x := by
  rw [trdeg_adjoin_le_one_of_isAlgebraic_adjoin_mem_E_iff]
  have h : x = algebraMap ↥(Algebra.adjoin K ({x} : Set L)) L
      ⟨x, Algebra.subset_adjoin rfl⟩ := rfl
  rw [h]
  exact isAlgebraic_algebraMap _

theorem trdeg_adjoin_le_one_of_isAlgebraic_adjoin_trdeg_le_one_of_le_E {B : Subalgebra K L} {x : L} (h : B ≤ trdeg_adjoin_le_one_of_isAlgebraic_adjoin_E K x) :
    Algebra.trdeg K ↥B ≤ 1 :=
  (trdeg_le_of_injective (Subalgebra.inclusion h) (Subalgebra.inclusion_injective h)).trans
    (trdeg_adjoin_le_one_of_isAlgebraic_adjoin_trdeg_le_one_of_adjoin_singleton (trdeg_adjoin_le_one_of_isAlgebraic_adjoin_self_mem_E x) (fun _ hy => hy))

end P17_trdeg

open P17_trdeg in
theorem trdeg_adjoin_le_one_of_isAlgebraic_adjoin {K L : Type*} [Field K] [Field L]
    [Algebra K L] (x : L) (S : Set L)
    (hS : ∀ s ∈ S, IsAlgebraic ↥(Algebra.adjoin K ({x} : Set L)) s) :
    Algebra.trdeg K ↥(Algebra.adjoin K S) ≤ 1 := by
  exact trdeg_adjoin_le_one_of_isAlgebraic_adjoin_trdeg_le_one_of_le_E (x := x) (Algebra.adjoin_le fun s hs => trdeg_adjoin_le_one_of_isAlgebraic_adjoin_mem_E_iff.2 (hS s hs))

end Transcendence
