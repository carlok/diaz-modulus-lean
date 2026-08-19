/-
# Transfer

The remaining clause of `thm:closure`: that *every* assertion about
ranks, structural ranks over `K`, or vanishing of matrix coefficients
holds for a candidate exactly when it holds in the model.

"Every assertion" is a statement about statements, so what is proved here
is what makes it true: an isomorphism carrying one configuration to the
other, and the fact that such an isomorphism preserves each of the three
kinds of data. Any assertion built from them therefore transfers.

Two halves:

* `hulls_equiv` — the hulls of any two candidates over the same `K` are
  isomorphic as `K`-algebras. This is Mathlib's rational function field
  equivalence applied twice; both hulls are copies of `K(T)`.
* `conj_comm` — an isomorphism sending `u` to `t` automatically
  intertwines complex conjugation. Nothing has to be arranged: the
  relation `conj u = ρ / u` forces it, by the rigidity of `eqOn_hull`.

The second is the one with content, and it is where the note's original
error lived.
-/
import Mathlib
import Diaz.Model
import Diaz.Rigidity

open ComplexConjugate

namespace Diaz

variable {K : Subfield ℂ} {u t : ℂ}

/-! ## Existence: both hulls are copies of `K(T)` -/

/-- The hulls of any two elements transcendental over `K` are isomorphic
as `K`-algebras, both being rational function fields. -/
noncomputable def hullsEquiv (hu : Transcendental (↥K) u) (ht : Transcendental (↥K) t) :
    ↥(IntermediateField.adjoin (↥K) {u}) ≃ₐ[↥K] ↥(IntermediateField.adjoin (↥K) {t}) :=
  (RatFunc.algEquivOfTranscendental u hu).symm.trans
    (RatFunc.algEquivOfTranscendental t ht)

/-! ## The intertwining

This is the part that is not automatic, and the part the note got wrong
in an earlier draft. -/

/-- **An isomorphism matching the generators intertwines conjugation.**

If `Φ` fixes `K` pointwise and sends `u` to `t`, where `u` and `t` both
lie on the circle `z · conj z = ρ` over `K`, then `Φ` commutes with
complex conjugation on the whole hull of `u`.

Note where this comes from: `conj u = ρ / u` is a *rational function of
`u` over `K`*, so conjugation is not extra data that could fail to be
matched — it is already determined by the ring structure. That is the
content of the closure theorem. -/
theorem conj_comm (Φ : ℂ →+* ℂ) (hK : ∀ a ∈ K, Φ a = a)
    (hKconj : ∀ a ∈ K, conj a ∈ K)
    (hu0 : u ≠ 0) (ht0 : t ≠ 0) (hΦu : Φ u = t)
    (hρ : u * conj u ∈ K) (hρt : t * conj t = u * conj u) :
    ∀ z ∈ hull K u, Φ (conj z) = conj (Φ z) := by
  have key : ∀ z ∈ hull K u,
      (Φ.comp (starRingEnd ℂ)) z = ((starRingEnd ℂ).comp Φ) z := by
    refine eqOn_hull _ _ ?_ ?_
    · intro a ha
      simp only [RingHom.coe_comp, Function.comp_apply]
      rw [hK _ (hKconj a ha), hK a ha]
    · simp only [RingHom.coe_comp, Function.comp_apply, hΦu]
      -- `Φ (conj u) = conj t`, both equal `ρ / t`
      have h1 : conj u = (u * conj u) / u := (conj_eq_rho_div hu0).symm
      have h2 : conj t = (u * conj u) / t := by
        rw [← hρt]; field_simp
      rw [h1, h2, map_div₀, hK _ hρ, hΦu]
  intro z hz
  simpa using key z hz

/-! ## What transfer means for matrices -/

/-- A ring homomorphism fixing `K` carries the coefficient `wᵀ M v` to
the coefficient of the transported matrix, for `w, v` over `K`.  So
vanishing of coefficients over `K` transfers. -/
theorem coeff_transfer (Φ : ℂ →+* ℂ) (hK : ∀ a ∈ K, Φ a = a)
    {m n : ℕ} (M : Matrix (Fin m) (Fin n) ℂ) (w : Fin m → ℂ) (v : Fin n → ℂ)
    (hw : ∀ i, w i ∈ K) (hv : ∀ j, v j ∈ K) :
    Φ (∑ i, ∑ j, w i * M i j * v j) = ∑ i, ∑ j, w i * (Φ (M i j)) * v j := by
  rw [map_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [map_mul, map_mul, hK _ (hw i), hK _ (hv j)]

/-- A ring homomorphism of fields is injective.

That injectivity is what *would* give preservation of `K`-linear
independence, and hence of rank and structural rank; neither is
formalized here, and this lemma states only the injectivity. -/
theorem injective_of_hom (Φ : ℂ →+* ℂ) : Function.Injective Φ :=
  Φ.injective

/-- The transported matrix of a candidate is the matrix of its image:
`Φ` carries `H u r` to `H t r` when it fixes `r` and sends `u` to `t`. -/
theorem Hmat_transfer (Φ : ℂ →+* ℂ) (hK : ∀ a ∈ K, Φ a = a) {r : ℂ} (hr : r ∈ K)
    (hKconj : ∀ a ∈ K, conj a ∈ K) (hu0 : u ≠ 0) (ht0 : t ≠ 0) (hΦu : Φ u = t)
    (hρ : u * conj u ∈ K) (hρt : t * conj t = u * conj u) :
    (Hmat u r).map Φ = Hmat t r := by
  have hc : Φ (conj u) = conj t := by
    have := conj_comm Φ hK hKconj hu0 ht0 hΦu hρ hρt u self_mem_hull
    rwa [hΦu] at this
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Hmat, Matrix.map_apply, hΦu, hK _ hr, hc]

/-! ## The existence half

With the Steinitz extension imported, `conj_comm` becomes unconditional:
the isomorphism is no longer a hypothesis. -/

/-- **The closure theorem, existence included.**  Any two candidates over
the same base, with the same `ρ`, are carried onto one another by a ring
endomorphism of `ℂ` that fixes the base and intertwines conjugation.

The intertwining is not arranged — it follows, because `conj u = ρ/u`
makes conjugation a rational function of the generator. -/
theorem exists_conj_intertwining (hKconj : ∀ a ∈ K, conj a ∈ K)
    (hu : Transcendental (↥K) u) (ht : Transcendental (↥K) t)
    (hρ : u * conj u ∈ K) (hρt : t * conj t = u * conj u) :
    ∃ Φ : ℂ →+* ℂ, (∀ a ∈ K, Φ a = a) ∧ Φ u = t
      ∧ ∀ z ∈ hull K u, Φ (conj z) = conj (Φ z) := by
  obtain ⟨Φ, hK, hΦu⟩ := exists_ringHom_of_transcendental hu ht
  exact ⟨Φ, hK, hΦu, conj_comm Φ hK hKconj (transcendental_ne_zero hu)
    (transcendental_ne_zero ht) hΦu hρ hρt⟩

end Diaz
