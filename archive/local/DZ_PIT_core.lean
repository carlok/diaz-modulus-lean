import Mathlib
import Definitions.Def_DiazModulus
import Solutions.DZ_LEAFSPLIT_core

/-!
# The residual leaf `..._period_free_pi_im_transcendental` is subsumed by the conjugate-pair crux

Target node: `DiazModulus.diaz_of_exp_not_real_irrational_angle_period_free_pi_im_transcendental`
(`693914d7-8d52-4eb7-bc0b-e49d1985a621`, Open).

The mission's frontier carries four open leaves.  One of them,
`DiazModulus.norm_transcendental_of_generic_conj_pair` (`ed970912-…`, Open), already appears as
the sole non-proved hypothesis of the published sketch for `DiazModulus.diaz_of_exp_real_generic`.
This file shows that the *same* node, together with `HermiteLindemann` (a **Proved** node of the
mission, `DiazModulus.hermite_lindemann_holds`), implies

* the target leaf,
* the whole off-axes leaf `DiazModulus.diaz_of_exp_not_real_off_axes`,
* and in fact `DiazModulus.DiazModulusConjecture` itself,

and, conversely, is implied by the conjecture.  So modulo Hermite–Lindemann the crux and the root
are **equivalent**, and the residual leaf carries no content beyond the crux.

Nothing is imported from the platform: `NormTranscGenericConjPair` and `HermiteLindemann` are
explicit hypotheses, so `#print axioms` stays at `[propext, Classical.choice, Quot.sound]`.
-/

open Complex ComplexConjugate

namespace DiazPiImTrans

open DiazModulus DiazLeafSplit

/-! ## 0.  Algebraicity bookkeeping not already in `DZ_LEAFSPLIT_core` -/

theorem alg_add {z w : ℂ} (hz : IsAlgebraic ℚ z) (hw : IsAlgebraic ℚ w) :
    IsAlgebraic ℚ (z + w) := by
  rw [alg_iff_mem] at *
  exact Subfield.add_mem _ hz hw

theorem alg_sub {z w : ℂ} (hz : IsAlgebraic ℚ z) (hw : IsAlgebraic ℚ w) :
    IsAlgebraic ℚ (z - w) := by
  rw [alg_iff_mem] at *
  exact Subfield.sub_mem _ hz hw

theorem alg_zero : IsAlgebraic ℚ (0 : ℂ) := by simpa using alg_rat 0

theorem alg_one : IsAlgebraic ℚ (1 : ℂ) := by simpa using alg_rat 1

/-- A square root of an algebraic number is algebraic. -/
theorem alg_of_sq {z : ℂ} (h : IsAlgebraic ℚ (z ^ 2)) : IsAlgebraic ℚ z :=
  IsAlgebraic.of_pow (by norm_num) h

theorem alg_I : IsAlgebraic ℚ Complex.I :=
  alg_of_sq (by rw [Complex.I_sq]; exact alg_neg alg_one)

theorem alg_of_re_im {u : ℂ} (hre : IsAlgebraic ℚ ((u.re : ℝ) : ℂ))
    (him : IsAlgebraic ℚ ((u.im : ℝ) : ℂ)) : IsAlgebraic ℚ u := by
  have h := alg_add hre (alg_mul him alg_I)
  rwa [Complex.re_add_im] at h

/-- `normSq u = (Re u)² + (Im u)²`, pushed into `ℂ`. -/
theorem normSq_cast (u : ℂ) :
    ((Complex.normSq u : ℝ) : ℂ) = ((u.re : ℝ) : ℂ) ^ 2 + ((u.im : ℝ) : ℂ) ^ 2 := by
  rw [Complex.normSq_apply]; push_cast; ring

theorem alg_normSq {u : ℂ} (hmod : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ)) :
    IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ) := (alg_norm_iff_normSq u).1 hmod

/-! ## 1.  The three degenerate slices all collapse to `u ∈ Q̄` -/

/-- `‖u‖ ∈ Q̄` and `Re u ∈ Q̄` force `u ∈ Q̄`. -/
theorem alg_of_norm_and_re {u : ℂ} (hmod : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ))
    (hre : IsAlgebraic ℚ ((u.re : ℝ) : ℂ)) : IsAlgebraic ℚ u := by
  have hns := alg_normSq hmod
  rw [normSq_cast] at hns
  have him2 : IsAlgebraic ℚ (((u.im : ℝ) : ℂ) ^ 2) := by
    have := alg_sub hns (alg_pow hre 2)
    simpa using this
  exact alg_of_re_im hre (alg_of_sq him2)

/-- `‖u‖ ∈ Q̄` and `Im u ∈ Q̄` force `u ∈ Q̄`. -/
theorem alg_of_norm_and_im {u : ℂ} (hmod : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ))
    (him : IsAlgebraic ℚ ((u.im : ℝ) : ℂ)) : IsAlgebraic ℚ u := by
  have hns := alg_normSq hmod
  rw [normSq_cast] at hns
  have hre2 : IsAlgebraic ℚ (((u.re : ℝ) : ℂ) ^ 2) := by
    have := alg_sub hns (alg_pow him 2)
    simpa using this
  exact alg_of_re_im (alg_of_sq hre2) him

/-- `‖u‖ ∈ Q̄` and `Re u / Im u ∈ Q̄` (with `Im u ≠ 0`) force `u ∈ Q̄`. -/
theorem alg_of_norm_and_ratio {u : ℂ} (him0 : u.im ≠ 0)
    (hmod : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ))
    (hr : IsAlgebraic ℚ ((u.re / u.im : ℝ) : ℂ)) : IsAlgebraic ℚ u := by
  have hden : (1 + (u.re / u.im) ^ 2 : ℝ) ≠ 0 := by positivity
  have key : (u.im ^ 2 : ℝ) = Complex.normSq u / (1 + (u.re / u.im) ^ 2) := by
    rw [Complex.normSq_apply]
    field_simp
    ring
  have hdenC : IsAlgebraic ℚ (1 + ((u.re / u.im : ℝ) : ℂ) ^ 2) :=
    alg_add alg_one (alg_pow hr 2)
  have him2 : IsAlgebraic ℚ (((u.im : ℝ) : ℂ) ^ 2) := by
    have hcast : ((u.im : ℝ) : ℂ) ^ 2
        = ((Complex.normSq u : ℝ) : ℂ) / (1 + ((u.re / u.im : ℝ) : ℂ) ^ 2) := by
      have := congrArg (fun t : ℝ => ((t : ℝ) : ℂ)) key
      simpa using this
    rw [hcast]
    exact alg_div (alg_normSq hmod) hdenC
  exact alg_of_norm_and_im hmod (alg_of_sq him2)

/-! ## 2.  The crux, as a `Prop` -/

/-- `DiazModulus.norm_transcendental_of_generic_conj_pair` (`ed970912-…`), verbatim. -/
def NormTranscGenericConjPair : Prop :=
  ∀ u : ℂ,
    IsAlgebraic ℚ (Complex.exp u) →
    IsAlgebraic ℚ (Complex.exp ((starRingEnd ℂ) u)) →
    u.re ≠ 0 → u.im ≠ 0 →
    Transcendental ℚ ((u.re : ℝ) : ℂ) →
    Transcendental ℚ ((u.im : ℝ) : ℂ) →
    Transcendental ℚ ((u.re / u.im : ℝ) : ℂ) →
    Transcendental ℚ ((‖u‖ : ℝ) : ℂ)

/-! ## 3.  The crux plus Hermite–Lindemann gives the whole conjecture -/

theorem diaz_of_crux_and_hl (hNT : NormTranscGenericConjPair) (hHL : HermiteLindemann) :
    DiazModulusConjecture := by
  intro u hu0 hmod hexp
  by_cases hre : IsAlgebraic ℚ ((u.re : ℝ) : ℂ)
  · exact hHL u hu0 (alg_of_norm_and_re hmod hre) hexp
  by_cases him : IsAlgebraic ℚ ((u.im : ℝ) : ℂ)
  · exact hHL u hu0 (alg_of_norm_and_im hmod him) hexp
  have hre0 : u.re ≠ 0 := by
    intro h; exact hre (by rw [h]; simpa using alg_zero)
  have him0 : u.im ≠ 0 := by
    intro h; exact him (by rw [h]; simpa using alg_zero)
  by_cases hr : IsAlgebraic ℚ ((u.re / u.im : ℝ) : ℂ)
  · exact hHL u hu0 (alg_of_norm_and_ratio him0 hmod hr) hexp
  · exact hNT u hexp (by rw [Complex.exp_conj]; exact alg_conj hexp) hre0 him0 hre him hr hmod

/-! ## 4.  The converse: the conjecture gives the crux -/

theorem crux_of_diaz (h : DiazModulusConjecture) : NormTranscGenericConjPair := by
  intro u hexp _ hre0 _ _ _ _
  have hu0 : u ≠ 0 := by
    intro h0; exact hre0 (by rw [h0]; simp)
  intro hmod
  exact h u hu0 hmod hexp

theorem crux_iff_diaz (hHL : HermiteLindemann) :
    NormTranscGenericConjPair ↔ DiazModulusConjecture :=
  ⟨fun h => diaz_of_crux_and_hl h hHL, crux_of_diaz⟩

/-! ## 5.  The target leaf and the off-axes leaf, verbatim, and their reductions -/

/-- `DiazModulus.diaz_of_exp_not_real_off_axes` (`63575de5-…`), verbatim. -/
def LeafOffAxes : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
    ¬ (u.im = 0 ∨ u.re = 0) → Transcendental ℚ (Complex.exp u)

/-- The target node `693914d7-…`, verbatim. -/
def LeafPiImTrans : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
    ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
    (¬ ∃ r : ℚ, r ≠ 0 ∧
      IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
    Transcendental ℚ ((Real.pi * u.im : ℝ) : ℂ) →
    Transcendental ℚ (Complex.exp u)

theorem offAxes_of_crux_and_hl (hNT : NormTranscGenericConjPair) (hHL : HermiteLindemann) :
    LeafOffAxes :=
  fun u hu0 hmod _ _ => diaz_of_crux_and_hl hNT hHL u hu0 hmod

theorem leafPiImTrans_of_crux_and_hl (hNT : NormTranscGenericConjPair)
    (hHL : HermiteLindemann) : LeafPiImTrans :=
  fun u hu0 hmod _ _ _ _ _ => diaz_of_crux_and_hl hNT hHL u hu0 hmod

/-! ## 6.  None of the leaf's own hypotheses is used

The reduction above discards all five of the target's distinguishing hypotheses.  Recorded
explicitly: the target follows from the *unrestricted* statement obtained by deleting them. -/

theorem leafPiImTrans_of_offAxes (h : LeafOffAxes) : LeafPiImTrans :=
  fun u a b c d _ _ _ => h u a b c d

/-! ## 7.  A hypothesis of the target node is redundant

`¬ ∃ q : ℚ, Im u = q π` (clause 5) follows from clauses 6 and 7 together: those two say
`π (Im u + r π) ∉ Q̄` for **every** rational `r`, and `Im u = q π` would make the `r = -q`
instance equal to `0`. -/

theorem irr_of_free_and_trans {u : ℂ}
    (hfree : ¬ ∃ r : ℚ, r ≠ 0 ∧
      IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ))
    (htr : Transcendental ℚ ((Real.pi * u.im : ℝ) : ℂ)) :
    ¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi := by
  rintro ⟨q, hq⟩
  by_cases hq0 : q = 0
  · subst hq0
    refine htr ?_
    have : (Real.pi * u.im : ℝ) = 0 := by rw [hq]; push_cast; ring
    rw [this]; simpa using alg_zero
  · refine hfree ⟨-q, neg_ne_zero.2 hq0, ?_⟩
    have : (Real.pi * (u.im + ((-q : ℚ) : ℝ) * Real.pi) : ℝ) = 0 := by
      rw [hq]; push_cast; ring
    rw [this]; simpa using alg_zero

end DiazPiImTrans
