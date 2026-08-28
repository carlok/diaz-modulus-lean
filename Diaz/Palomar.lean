/-
# The axiom-free core

Two additions, both proved from Mathlib alone.

`exists_algHom_of_transcendental` discharges the existence half of the
closure theorem *on the hull*, without the Steinitz axiom.  The axiom in
`Diaz.Axioms` asks for a ring endomorphism of all of `ℂ`; extending that
far needs a transcendence-basis argument.  Nothing downstream uses more
than the hull, and on the hull Mathlib already has the isomorphism:
`RatFunc.algEquivOfTranscendental` identifies `K⟮f⟯` with the rational
function field for any transcendental `f`, so `K⟮u⟯ ≅ K⟮t⟯` over `K`
whenever `u` and `t` are both transcendental over `K`.

`coeff_indistinguishable` states the negative result the note is about:
no vanishing-coefficient statement over `K` tells two points on the same
circle apart.

Neither depends on `Diaz.hermite_lindemann` or
`Diaz.exists_ringHom_of_transcendental`.
-/
import Mathlib
import Diaz.Rigidity

open ComplexConjugate IntermediateField

namespace Diaz

variable {K : Subfield ℂ} {u t r : ℂ}

/-! ## Existence on the hull, without the Steinitz axiom -/

/-- **The existence half, hull-local.**  If `u` and `t` are both
transcendental over `K`, some `K`-algebra map from `K⟮u⟯` into `ℂ`
carries `u` to `t`.

Both `K⟮u⟯` and `K⟮t⟯` are rational function fields over `K`, so they are
`K`-isomorphic; composing with the inclusion `K⟮t⟯ ↪ ℂ` gives the map.
Being a `K`-algebra map, it fixes `K` pointwise by construction. -/
theorem exists_algHom_of_transcendental
    (hu : Transcendental (↥K) u) (ht : Transcendental (↥K) t) :
    ∃ Φ : ↥K⟮u⟯ →ₐ[↥K] ℂ, Φ (AdjoinSimple.gen ↥K u) = t := by
  refine ⟨(IntermediateField.val _).comp
    (((RatFunc.algEquivOfTranscendental t ht).toAlgHom).comp
      ((RatFunc.algEquivOfTranscendental u hu).symm.toAlgHom)), ?_⟩
  simp

/-! ## The negative result -/

/-- **Indistinguishability by vanishing coefficients.**  Let `u` and `t`
be two points off `K` on the same circle `z · conj z = r²` over `K`.  For
every pair of non-zero vectors `w, v` over `K`, the coefficient
`wᵀ H v` vanishes for `u` exactly when it vanishes for `t` — namely
never.

This is the negative direction the note argues for: accumulating
vanishing-coefficient constraints over `K` cannot separate a candidate
for Diaz's conjecture from an ordinary point placed on the same circle,
so that style of attack cannot settle the conjecture. -/
theorem coeff_indistinguishable
    (hr : r ∈ K) (huK : u ∉ K) (htK : t ∉ K)
    (hu : u * conj u = r ^ 2) (ht : t * conj t = r ^ 2)
    (w v : Fin 2 → ℂ) (hwK : ∀ i, w i ∈ K) (hvK : ∀ j, v j ∈ K)
    (hw : w ≠ 0) (hv : v ≠ 0) :
    (∑ i, ∑ j, w i * (Hmat u r) i j * v j = 0) ↔
      (∑ i, ∑ j, w i * (Hmat t r) i j * v j = 0) :=
  iff_of_false
    (no_vanishing_coeff_matrix hr huK hu w v hwK hvK hw hv)
    (no_vanishing_coeff_matrix hr htK ht w v hwK hvK hw hv)

end Diaz
