/-
# The intended base, worked out

Everything else is stated for an arbitrary conjugation-stable subfield
`K ⊆ ℂ`, which is all the arguments use. The base actually meant is the
algebraic numbers, and an adversarial audit observed that the repository
never exhibited it: the instance `Algebra.IsAlgebraic ℚ ↥L` failed to
synthesize for every candidate base, so `candidate_no_vanishing_coeff`,
though sound, applied to nothing.

This file supplies the base and the missing instance, and applies the
end-to-end theorem to it. The instance does exist in Mathlib
(`algebraicClosure.isAlgebraic`); what was missing is that it does not
fire through the `IntermediateField → Subfield` coercion on its own.
-/
import Mathlib
import Diaz.Model
import Diaz.Rigidity
import Diaz.Transfer

open ComplexConjugate

namespace Diaz

/-- The algebraic numbers, as a subfield of `ℂ`. -/
noncomputable def Qbar : Subfield ℂ := (algebraicClosure ℚ ℂ).toSubfield

/-- The instance that does not fire on its own.  Named rather than
anonymous so that it appears in the generated artefacts: an anonymous
instance has no identifier for the generator to match, and would be
invisible to the very document meant to expose the assumed surface. -/
noncomputable instance QbarIsAlgebraic : Algebra.IsAlgebraic ℚ (↥Qbar) :=
  algebraicClosure.isAlgebraic ℚ ℂ

theorem mem_Qbar_iff {a : ℂ} : a ∈ Qbar ↔ IsAlgebraic ℚ a := by
  simp only [Qbar, IntermediateField.mem_toSubfield]
  exact mem_algebraicClosure_iff

/-- `Qbar` is conjugation-stable, which every result above assumes of the
base.  If `p` kills `a` then it kills `conj a`, its coefficients being
rational and so fixed by conjugation. -/
theorem conj_mem_Qbar {a : ℂ} (h : a ∈ Qbar) : conj a ∈ Qbar := by
  rw [mem_Qbar_iff] at h ⊢
  obtain ⟨p, hp0, hpa⟩ := h
  refine ⟨p, hp0, ?_⟩
  have := congrArg (starRingEnd ℂ) hpa
  simpa [Polynomial.aeval_def, Polynomial.eval₂_eq_sum, map_sum,
    Polynomial.sum] using this

/-- **The end-to-end statement over the intended base.**

If `u` is a Diaz candidate — non-zero, with `exp u` algebraic and
`u · conj u = r²` for an algebraic `r` — then the attached rank-one
matrix has no vanishing coefficient over the algebraic numbers.

This is `candidate_no_vanishing_coeff` with `L = Qbar`, and its point is
that the hypotheses are the arithmetic ones rather than transcendence,
and that the base is the one the note is about rather than an arbitrary
subfield. -/
theorem candidate_no_vanishing_coeff_Qbar
    {u r : ℂ} (hu0 : u ≠ 0) (hexp : IsAlgebraic ℚ (Complex.exp u))
    (hr : r ∈ Qbar) (h : u * conj u = r ^ 2)
    (w v : Fin 2 → ℂ) (hwK : ∀ i, w i ∈ Qbar) (hvK : ∀ j, v j ∈ Qbar)
    (hw : w ≠ 0) (hv : v ≠ 0) :
    ∑ i, ∑ j, w i * (Hmat u r) i j * v j ≠ 0 :=
  candidate_no_vanishing_coeff hu0 hexp hr h w v hwK hvK hw hv

/-- And the circle carries a transcendental point over that base, so the
model results are instantiated too. -/
theorem exists_transcendental_on_circle_Qbar {r : ℂ} (hr : r ∈ Qbar) (hr0 : r ≠ 0) :
    ∃ t : ℂ, t ≠ 0 ∧ Transcendental (↥Qbar) t ∧ t * conj t = r * conj r
      ∧ t * conj t ∈ Qbar :=
  exists_transcendental_on_circle hr (conj_mem_Qbar hr) hr0

/-! ## The closure theorem, end to end -/

/-- **A candidate is carried onto an ordinary complex number.**

If `u` is a Diaz candidate over `Qbar` with `u · conj u = r²`, `r` real
and algebraic, then there is a transcendental `t` and a ring
endomorphism of `ℂ` fixing `Qbar`, sending `u` to `t`, and intertwining
conjugation on the hull of `u`.  That `t` lies on the same circle is
derivable from the statement, `Φ` fixing `Qbar` and the intertwining at
`z = u`.

The witness is `t = r · e^i`, and it is *not* asserted that `exp t` is
transcendental: were it algebraic, `t` would itself be a candidate, so
that assertion is an instance of the conjecture rather than something
proved here.

This runs from the arithmetic hypotheses to the endomorphism with no
step left in prose.  It does not itself apply `coeff_transfer` or
`Hmat_transfer`; those consume the endomorphism it produces. -/
theorem candidate_indistinguishable
    {u r : ℂ} (hu0 : u ≠ 0) (hexp : IsAlgebraic ℚ (Complex.exp u))
    (hr : r ∈ Qbar) (hrr : conj r = r) (hr0 : r ≠ 0)
    (h : u * conj u = r ^ 2) :
    ∃ t : ℂ, t ≠ 0 ∧ Transcendental (↥Qbar) t ∧
      ∃ Φ : ℂ →+* ℂ, (∀ a ∈ Qbar, Φ a = a) ∧ Φ u = t
        ∧ ∀ z ∈ hull Qbar u, Φ (conj z) = conj (Φ z) := by
  obtain ⟨t, ht0, hT, hteq, htmem⟩ := exists_transcendental_on_circle_sq hr hrr hr0
  have hu : Transcendental (↥Qbar) u := transcendental_candidate_over_base hu0 hexp
  obtain ⟨Φ, hK, hΦu, hcomm⟩ :=
    exists_conj_intertwining (K := Qbar) (fun a ha => conj_mem_Qbar ha) hu hT
      (by rw [h]; exact pow_mem hr 2) (by rw [hteq, h])
  exact ⟨t, ht0, hT, Φ, hK, hΦu, hcomm⟩

end Diaz
