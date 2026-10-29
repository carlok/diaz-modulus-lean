/-
Mirrored from Prove2Me: `DiazModulus.card_le_boxHilb_of_linearIndependent`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.card_le_boxHilb_of_linearIndependent__e671449e.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.HilbertBox

namespace Diaz

open Complex ComplexConjugate

/-! # Independent families modulo `I` bound the box Hilbert function

If `e : ι → F_T` is linearly independent modulo `I`, then `|ι| ≤ h_I(T)`.

Write `q : S → S ⧸ I` for the quotient map and `W = q(F_T)`, so `h_I(T) = dim_K W`. Each
`q(e_i)` lies in `W`, so the family factors through `W` as `i ↦ ⟨q(e_i), _⟩`; it is still
linearly independent there, since composing with the inclusion `W → S ⧸ I` recovers the given
independent family (`LinearIndependent.of_comp`). `W` is finite-dimensional, being the image of
`F_T`, and an independent family in a finite-dimensional space has at most `dim` members
(`LinearIndependent.fintype_card_le_finrank`). -/

namespace C11_F3
end C11_F3

open C11_F3 in
theorem card_le_boxHilb_of_linearIndependent {K S B : Type*} [Field K] [CommRing S] [Algebra K S] (F : (B → ℕ) → Submodule K S)
    (hFfin : ∀ Tₑ, FiniteDimensional K ↥(F Tₑ)) {ι : Type*} [Fintype ι] (I : Ideal S) (T : B → ℕ)
    (e : ι → S) (he : ∀ i, e i ∈ F T)
    (hli : LinearIndependent K (fun i => Ideal.Quotient.mk I (e i))) :
    Fintype.card ι ≤ boxHilb F I T := by
  unfold boxHilb
  set W := (F T).map (Ideal.Quotient.mkₐ K I).toLinearMap
  let v : ι → W := fun i => ⟨Ideal.Quotient.mk I (e i), Submodule.mem_map_of_mem (he i)⟩
  have hv : LinearIndependent K v := LinearIndependent.of_comp W.subtype hli
  exact hv.fintype_card_le_finrank

end Diaz
