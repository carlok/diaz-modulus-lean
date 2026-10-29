import Mathlib
import Definitions.Def_DiazHilbertBox

open Complex ComplexConjugate

/-! # The box Hilbert function is monotone in the box

For a monotone filtration `F` by finite-dimensional subspaces, `T ≤ T'` implies
`h_I(T) ≤ h_I(T')`.

Monotonicity of `F` gives `F_T ≤ F_{T'}`, so the images under the quotient map
`q : S → S ⧸ I` satisfy `q(F_T) ≤ q(F_{T'})` (`Submodule.map_mono`). The larger image is
finite-dimensional, being the image of the finite-dimensional `F_{T'}`, and dimension is
monotone on subspaces of a finite-dimensional space (`Submodule.finrank_mono`). -/

namespace C11_F2a
open DiazModulus
end C11_F2a

open DiazModulus C11_F2a in
theorem solution {K S B : Type*} [Field K] [CommRing S] [Algebra K S] (F : (B → ℕ) → Submodule K S)
    (hFmono : Monotone F) (hFfin : ∀ Tₑ, FiniteDimensional K ↥(F Tₑ)) (I : Ideal S) {T T' : B → ℕ} (hT : T ≤ T') :
    boxHilb F I T ≤ boxHilb F I T' := by
  unfold boxHilb
  exact Submodule.finrank_mono (Submodule.map_mono (hFmono hT))
