import Mathlib
import Theorems.Thm_DiazModulus_exists_mem_forall_notMem_of_not_subset

open Complex ComplexConjugate

/-! # A regular element in a subspace avoiding the associated primes

Let `K` be an infinite field, `S` a Noetherian `K`-algebra and `M` a finite `S`-module. If a
`K`-subspace `V` of `S` lies in no associated prime of `M`, then `V` contains an `M`-regular
element. The set of associated primes is finite (`associatedPrimes.finite`), so the avoidance
node `exists_mem_forall_notMem_of_not_subset` gives `x ∈ V` outside every associated prime. Over a
Noetherian ring the union of the associated primes is exactly the set of non-regular elements
(`biUnion_associatedPrimes_eq_compl_regular`), so `x` is regular on `M`. -/

open DiazModulus in
theorem solution {K S M : Type*} [Field K] [CommRing S] [Algebra K S]
    [IsNoetherianRing S] [Infinite K] [AddCommGroup M] [Module S M] [Module.Finite S M]
    (V : Submodule K S) (hV : ∀ p ∈ associatedPrimes S M, ¬ (V : Set S) ⊆ (p : Set S)) :
    ∃ x ∈ V, IsSMulRegular M x := by
  obtain ⟨x, hxV, hx⟩ := DiazModulus.exists_mem_forall_notMem_of_not_subset V
    (associatedPrimes S M) (associatedPrimes.finite S M) hV
  refine ⟨x, hxV, ?_⟩
  have hnot : x ∉ ⋃ p ∈ associatedPrimes S M, (p : Set S) := by
    simp only [Set.mem_iUnion, SetLike.mem_coe, not_exists]
    exact fun p hp => hx p hp
  rw [biUnion_associatedPrimes_eq_compl_regular S M] at hnot
  simpa using hnot
