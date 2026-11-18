/-
Mirrored from Prove2Me: `DiazModulus.dalag_prop_12_13_i_ii`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.dalag_prop_12_13_i_ii__8986b57c.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.dalag_prop_12_13_i_ii_span

namespace Diaz

open Complex ComplexConjugate

/-! # DALAG Prop. 12.13, (i) ⇒ (ii)

Let `(b_i)_{i ∈ I}` be a basis of `E` over `k` with `b_{i₀} = 1` and the other `b_i` algebraically independent
over `k`. Every element of `E` is a `k`-linear combination of the `b_i`, so `E` lies in the `k`-span of `1` and the
`b_i` with `i ≠ i₀` (the basis vector `b_{i₀}` is `1` itself). Hence `x₁, …, x_n ∈ E` lie in that span, and
`1, x₁, …, x_n` are `k`-linearly independent by hypothesis. The span form of (i) ⇒ (ii) — elements of the span of
`1` and an algebraically independent family, linearly independent together with `1`, are algebraically
independent — gives the claim. -/

namespace RC8B_P1213i
/-- `E` lies in the span of `1` and the basis vectors other than `b i₀`. -/
theorem mem_span_insert_rest {k K : Type*} [Field k] [Field K] [Algebra k K] {E : Submodule k K}
    {ι : Type*} (b : Module.Basis ι k ↥E) (i₀ : ι) (hb₀ : (b i₀ : K) = 1) {e : K} (he : e ∈ E) :
    e ∈ Submodule.span k (insert (1 : K) (Set.range fun i : {i : ι // i ≠ i₀} => (b i : K))) := by
  have h2 := Submodule.mem_map_of_mem (f := E.subtype) (b.mem_span ⟨e, he⟩)
  rw [← Submodule.span_image, ← Set.range_comp] at h2
  refine Submodule.span_le.mpr ?_ h2
  rintro _ ⟨i, rfl⟩
  apply Submodule.subset_span
  by_cases h : i = i₀
  · subst h
    exact Or.inl hb₀
  · exact Or.inr ⟨⟨i, h⟩, rfl⟩

end RC8B_P1213i

open RC8B_P1213i in
theorem dalag_prop_12_13_i_ii {k K : Type*} [Field k] [Field K] [Algebra k K] (E : Submodule k K)
    {ι : Type*} (b : Module.Basis ι k ↥E) (i₀ : ι) (hb₀ : (b i₀ : K) = 1)
    (hb : AlgebraicIndependent k (fun i : {i : ι // i ≠ i₀} => (b i : K)))
    {n : ℕ} (x : Fin n → K) (hxE : ∀ i, x i ∈ E)
    (hx : LinearIndependent k (Fin.cons (1 : K) x : Fin (n + 1) → K)) :
    AlgebraicIndependent k x :=
  dalag_prop_12_13_i_ii_span _ hb x (fun i => mem_span_insert_rest b i₀ hb₀ (hxE i)) hx

end Diaz
