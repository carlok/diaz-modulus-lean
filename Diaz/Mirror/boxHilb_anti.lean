/-
Mirrored from Prove2Me: `DiazModulus.boxHilb_anti`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.boxHilb_anti__599c2267.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.HilbertBox

namespace Diaz

open Complex ComplexConjugate

/-! # The box Hilbert function is antitone in the ideal

`I ≤ J` implies `h_J(T) ≤ h_I(T)` (DALAG Ex. 8.3, the easy direction).

Since `I ≤ J`, the quotient map `S → S ⧸ J` factors as `S → S ⧸ I → S ⧸ J` through the
`K`-algebra map `Ideal.Quotient.factorₐ`. Hence the image of `F_T` in `S ⧸ J` is the image,
under a linear map, of its image in `S ⧸ I` (`Submodule.map_comp`). That image is
finite-dimensional, being the image of `F_T`, and a linear map does not raise dimension
(`Submodule.finrank_map_le`). -/

namespace C11_F2b
end C11_F2b

open C11_F2b in
theorem boxHilb_anti {K S B : Type*} [Field K] [CommRing S] [Algebra K S] (F : (B → ℕ) → Submodule K S)
    (hFfin : ∀ Tₑ, FiniteDimensional K ↥(F Tₑ)) {I J : Ideal S} (hIJ : I ≤ J) (T : B → ℕ) :
    boxHilb F J T ≤ boxHilb F I T := by
  unfold boxHilb
  have hcomp : (Ideal.Quotient.mkₐ K J).toLinearMap =
      (Ideal.Quotient.factorₐ K hIJ).toLinearMap ∘ₗ (Ideal.Quotient.mkₐ K I).toLinearMap := by
    ext x
    rfl
  rw [hcomp, Submodule.map_comp]
  exact Submodule.finrank_map_le _ _

end Diaz
