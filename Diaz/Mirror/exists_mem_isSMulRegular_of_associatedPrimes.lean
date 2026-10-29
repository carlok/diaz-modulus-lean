/-
Mirrored from Prove2Me: `DiazModulus.exists_mem_isSMulRegular_of_associatedPrimes`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.exists_mem_isSMulRegular_of_associatedPrimes__b03cf9f6.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.exists_mem_forall_notMem_of_not_subset

namespace Diaz

open Complex ComplexConjugate

/-! # A regular element in a subspace avoiding the associated primes

Let `K` be an infinite field, `S` a Noetherian `K`-algebra and `M` a finite `S`-module. If a
`K`-subspace `V` of `S` lies in no associated prime of `M`, then `V` contains an `M`-regular
element. The set of associated primes is finite (`associatedPrimes.finite`), so the avoidance
node `exists_mem_forall_notMem_of_not_subset` gives `x ∈ V` outside every associated prime. Over a
Noetherian ring the union of the associated primes is exactly the set of non-regular elements
(`biUnion_associatedPrimes_eq_compl_regular`), so `x` is regular on `M`. -/

theorem exists_mem_isSMulRegular_of_associatedPrimes {K S M : Type*} [Field K] [CommRing S] [Algebra K S]
    [IsNoetherianRing S] [Infinite K] [AddCommGroup M] [Module S M] [Module.Finite S M]
    (V : Submodule K S) (hV : ∀ p ∈ associatedPrimes S M, ¬ (V : Set S) ⊆ (p : Set S)) :
    ∃ x ∈ V, IsSMulRegular M x := by
  obtain ⟨x, hxV, hx⟩ := exists_mem_forall_notMem_of_not_subset V
    (associatedPrimes S M) (associatedPrimes.finite S M) hV
  refine ⟨x, hxV, ?_⟩
  have hnot : x ∉ ⋃ p ∈ associatedPrimes S M, (p : Set S) := by
    simp only [Set.mem_iUnion, SetLike.mem_coe, not_exists]
    exact fun p hp => hx p hp
  rw [biUnion_associatedPrimes_eq_compl_regular S M] at hnot
  simpa using hnot

end Diaz
