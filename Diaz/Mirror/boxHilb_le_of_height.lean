/-
Mirrored from Prove2Me: `DiazModulus.boxHilb_le_of_height`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.boxHilb_le_of_height__c4127662.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.HilbertBox
import Diaz.Mirror.isSMulRegular_quotient_of_isWeaklyRegular_append
import Diaz.Mirror.exists_isWeaklyRegular_append_of_height
import Diaz.Mirror.boxHilb_chain_bound
import Diaz.Mirror.boxHilb_anti

namespace Diaz

open Complex ComplexConjugate

/-! # Hilbert function bound from heights (DALAG Th. 8.8★ at finite level)

Under (U), if every prime over `(ps₀) + (V)` has height at least `|ps₀| + r`, then
`exists_isWeaklyRegular_append_of_height` gives `r` elements `rs` of `V` with `ps₀ ++ rs` weakly
regular. Index them as `P = rs.get : Fin r → S`, so `List.ofFn P = rs`;
`isSMulRegular_quotient_of_isWeaklyRegular_append` turns the weakly regular list into the chain
condition "`P_k` is regular on `S ⧸ ((ps₀) + (P_j)_{j<k})`". Each `P_k ∈ V ≤ F(D)`, so the chain
bound `boxHilb_chain_bound` gives
`2^{r(r−1)/2} u^r h_{(ps₀)+(P)}(uD) ≤ h_{(ps₀)}(2^r uD)`. Finally `(ps₀) + (P) ≤ (ps₀) + (V)`
because the `P_k` lie in `V`, and the Hilbert function is antitone in the ideal
(`boxHilb_anti`), so `h_{(ps₀)+(V)}(uD) ≤ h_{(ps₀)+(P)}(uD)`. -/

theorem boxHilb_le_of_height {K S B : Type*} [Field K] [CommRing S] [Algebra K S] [IsNoetherianRing S] [Infinite K]
    (F : (B → ℕ) → Submodule K S) (hFmono : Monotone F)
    (hFmul : ∀ {Tₑ Uₑ : B → ℕ} {aₑ bₑ : S}, aₑ ∈ F Tₑ → bₑ ∈ F Uₑ → aₑ * bₑ ∈ F (Tₑ + Uₑ))
    (hFfin : ∀ Tₑ, FiniteDimensional K ↥(F Tₑ))
    (hU : UnmixedHeight S)
    (ps₀ : List S) (hps₀ : RingTheory.Sequence.IsWeaklyRegular S ps₀) (D : B → ℕ)
    (V : Submodule K S) (hV : V ≤ F D) (r : ℕ)
    (hH : ∀ p : Ideal S, p.IsPrime → Ideal.ofList ps₀ ⊔ Ideal.span (V : Set S) ≤ p →
      ((ps₀.length + r : ℕ) : ℕ∞) ≤ p.height) (u : ℕ) :
    2 ^ (r * (r - 1) / 2) * u ^ r * boxHilb F (Ideal.ofList ps₀ ⊔ Ideal.span (V : Set S)) (u • D)
      ≤ boxHilb F (Ideal.ofList ps₀) ((2 ^ r * u) • D) := by
  obtain ⟨rs, hlen, hrsV, hwr⟩ :=
    exists_isWeaklyRegular_append_of_height (K := K) hU ps₀ hps₀ V r hH
  subst hlen
  have hofFn : List.ofFn rs.get = rs := List.ofFn_get rs
  have hreg := isSMulRegular_quotient_of_isWeaklyRegular_append ps₀ rs.get
    (by rw [hofFn]; exact hwr)
  have hmemV : ∀ k, rs.get k ∈ V := fun k => hrsV _ (List.get_mem _ _)
  have hchain := boxHilb_chain_bound F hFmono hFmul hFfin (Ideal.ofList ps₀) D
    rs.length rs.get (fun k => hV (hmemV k)) hreg u
  have hle : Ideal.ofList ps₀ ⊔ Ideal.span (Set.range rs.get)
      ≤ Ideal.ofList ps₀ ⊔ Ideal.span (V : Set S) := by
    refine sup_le_sup_left (Ideal.span_mono ?_) _
    rintro _ ⟨k, rfl⟩
    exact hmemV k
  have hanti := boxHilb_anti F hFfin hle (u • D)
  exact le_trans (Nat.mul_le_mul_left _ hanti) hchain

end Diaz
