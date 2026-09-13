import Mathlib
import Definitions.Def_DiazModulus
import Solutions.DZ_LEAFSPLIT_core

/-!
# One more generation under leaf 2's period-free child

`DiazModulus.diaz_of_exp_not_real_irrational_angle` was split on

```
PeriodAligned u  :⟺  ∃ r ∈ ℚ, r ≠ 0 ∧ π (Im u + r π) ∈ Q̄
```

into `..._period_aligned` and `..._period_free`.  The clause `r ≠ 0` is there for the
*geometric* reading of the predicate (`r = n/q` with `n` the index of the period translate,
so `n = 0` is not a second fibre point).  It is **not** needed for the arithmetic that makes
the aligned half tractable: the published route lemma
`DiazModulus.recip_pi_log_of_period_aligned` never uses `r ≠ 0`, and its `r = 0` instance is
even shorter.

Consequence: the *degenerate* case `r = 0`, i.e. `π · Im u ∈ Q̄`, was left on the **free**
side of the split, although it behaves exactly like the aligned side.  This file splits the
period-free child on that predicate and proves the resulting halves honest.

Everything here is `sorry`-free.  `Transcendental ℚ π` is taken as an explicit hypothesis
wherever it is needed; nothing is imported from the platform.
-/

open Complex ComplexConjugate

namespace DiazLeaf2Free

open DiazModulus DiazLeafSplit

/-! ## 1.  The predicate, and the two new children -/

/-- **The new split predicate**: `π · Im u` is algebraic.

This is exactly the `r = 0` instance of the parent split's arithmetic condition
`π (Im u + r π) ∈ Q̄`, which `DiazLeafSplit.PeriodAligned` excludes by requiring `r ≠ 0`. -/
def PiImAlg (u : ℂ) : Prop := IsAlgebraic ℚ ((Real.pi * u.im : ℝ) : ℂ)

/-- **The saturated predicate**: `π (Im u + r π) ∈ Q̄` for some rational `r`, zero allowed.
`RatAligned u ↔ PeriodAligned u ∨ PiImAlg u` (`ratAligned_iff` below). -/
def RatAligned (u : ℂ) : Prop :=
  ∃ r : ℚ, IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)

/-- The period-free child restricted to `π · Im u ∈ Q̄`. -/
def Leaf2FreePiAlg : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
    ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
    (¬ ∃ r : ℚ, r ≠ 0 ∧ IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
    IsAlgebraic ℚ ((Real.pi * u.im : ℝ) : ℂ) →
    Transcendental ℚ (Complex.exp u)

/-- The period-free child restricted to `π · Im u ∉ Q̄`.  This is the residual. -/
def Leaf2FreePiTrans : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
    ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
    (¬ ∃ r : ℚ, r ≠ 0 ∧ IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
    (¬ IsAlgebraic ℚ ((Real.pi * u.im : ℝ) : ℂ)) →
    Transcendental ℚ (Complex.exp u)

/-! ## 2.  The reduction: the two new halves are exactly the period-free child -/

theorem leaf2free_of_halves (hA : Leaf2FreePiAlg) (hB : Leaf2FreePiTrans) : Leaf2Free := by
  intro u hu0 hmod hnr hax hirr hfree
  by_cases h : IsAlgebraic ℚ ((Real.pi * u.im : ℝ) : ℂ)
  · exact hA u hu0 hmod hnr hax hirr hfree h
  · exact hB u hu0 hmod hnr hax hirr hfree h

theorem piAlg_of_leaf2free (h : Leaf2Free) : Leaf2FreePiAlg :=
  fun u a b c d e f _ => h u a b c d e f

theorem piTrans_of_leaf2free (h : Leaf2Free) : Leaf2FreePiTrans :=
  fun u a b c d e f _ => h u a b c d e f

theorem leaf2free_iff_halves : Leaf2Free ↔ (Leaf2FreePiAlg ∧ Leaf2FreePiTrans) :=
  ⟨fun h => ⟨piAlg_of_leaf2free h, piTrans_of_leaf2free h⟩,
   fun h => leaf2free_of_halves h.1 h.2⟩

/-- Leaf 2 from the three leaves of the two-generation tree. -/
theorem leaf2_of_three (hAl : Leaf2Aligned) (hA : Leaf2FreePiAlg) (hB : Leaf2FreePiTrans) :
    Leaf2 :=
  leaf2_of_halves hAl (leaf2free_of_halves hA hB)

end DiazLeaf2Free

namespace DiazLeaf2Free

open DiazModulus DiazLeafSplit

/-! ## 3.  The route lemma, with the `r ≠ 0` clause removed

`DiazLeafSplit.recip_pi_of_aligned_candidate` is stated with `r ≠ 0`, and the published node
`DiazModulus.recip_pi_log_of_period_aligned` carries the same clause, but neither proof uses
it.  Here is the version that does not assume it; the `r = 0` instance is what the new
`PiImAlg` half needs. -/

theorem recip_pi_of_ratAligned_candidate (u : ℂ)
    (hirr : ¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi)
    (hal : RatAligned u)
    (hexp : IsAlgebraic ℚ (Complex.exp u)) :
    ∃ γ : ℂ, IsAlgebraic ℚ γ ∧ γ ≠ 0 ∧
      IsAlgebraic ℚ (Complex.exp (γ / ((Real.pi : ℂ) * Complex.I))) := by
  obtain ⟨r, halg⟩ := hal
  have hπ0 : (Real.pi : ℝ) ≠ 0 := Real.pi_ne_zero
  set s : ℝ := u.im + (r : ℝ) * Real.pi with hs_def
  have hs0 : s ≠ 0 := by
    intro h
    refine hirr ⟨-r, ?_⟩
    have : u.im = -((r : ℝ) * Real.pi) := by rw [hs_def] at h; linarith
    push_cast
    linarith [this]
  have hsC : ((s : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hs0
  set ν : ℂ := Complex.I * ((s : ℝ) : ℂ) with hν_def
  have hν0 : ν ≠ 0 := mul_ne_zero Complex.I_ne_zero hsC
  have hmul : (((2 * r.den : ℕ)) : ℂ) * ν =
      ((r.den : ℕ) : ℂ) * (u - conj u)
        + ((r.num : ℤ) : ℂ) * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I) := by
    rw [Complex.sub_conj, hν_def, hs_def]
    push_cast [Rat.cast_def]
    field_simp
  have hkey : Complex.exp ν ^ (2 * r.den) =
      (Complex.exp u / conj (Complex.exp u)) ^ r.den := by
    rw [← Complex.exp_nat_mul, hmul, Complex.exp_add, Complex.exp_int_mul_two_pi_mul_I,
      mul_one, Complex.exp_nat_mul, Complex.exp_sub, Complex.exp_conj]
  have hexpν : IsAlgebraic ℚ (Complex.exp ν) := by
    refine IsAlgebraic.of_pow (n := 2 * r.den) (by positivity) ?_
    rw [hkey]
    exact alg_pow (alg_div hexp (alg_conj hexp)) r.den
  refine ⟨-(((Real.pi * s : ℝ)) : ℂ), alg_neg (by rw [hs_def] at halg ⊢; exact halg), ?_, ?_⟩
  · simp only [neg_ne_zero, Complex.ofReal_ne_zero]
    exact mul_ne_zero hπ0 hs0
  · have hid : -(((Real.pi * s : ℝ)) : ℂ) / (((Real.pi : ℝ) : ℂ) * Complex.I) = ν := by
      rw [hν_def]
      push_cast
      field_simp
      ring_nf
      rw [Complex.I_sq]
    rw [hid]
    exact hexpν

/-- The `r = 0` instance: `π · Im u ∈ Q̄` already forces an algebraic multiple of `1/(iπ)`
into `ℒ`.  This is the route lemma for the new `Leaf2FreePiAlg` half, and it is *shorter*
than the aligned one — no period translate is involved, `ν` is literally `(u − ū)/2`. -/
theorem recip_pi_of_piImAlg_candidate (u : ℂ)
    (hirr : ¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi)
    (hpa : PiImAlg u)
    (hexp : IsAlgebraic ℚ (Complex.exp u)) :
    ∃ γ : ℂ, IsAlgebraic ℚ γ ∧ γ ≠ 0 ∧
      IsAlgebraic ℚ (Complex.exp (γ / ((Real.pi : ℂ) * Complex.I))) := by
  refine recip_pi_of_ratAligned_candidate u hirr ⟨0, ?_⟩ hexp
  have : (Real.pi * (u.im + ((0 : ℚ) : ℝ) * Real.pi) : ℝ) = (Real.pi * u.im : ℝ) := by
    push_cast; ring
  rw [this]
  exact hpa

end DiazLeaf2Free

namespace DiazLeaf2Free

open DiazModulus DiazLeafSplit

/-! ## 4.  The two predicates are complementary where it matters

`PiImAlg` and `PeriodAligned` are **mutually exclusive** (given `π` transcendental), so the
free-child hypothesis `¬ PeriodAligned u` is redundant on the `PiImAlg` half, and the union
of the aligned child with the new `PiImAlg` child is exactly the saturated region
`RatAligned`. -/

theorem ratAligned_iff {u : ℂ} : RatAligned u ↔ (PeriodAligned u ∨ PiImAlg u) := by
  constructor
  · rintro ⟨r, halg⟩
    by_cases hr : r = 0
    · right
      subst hr
      have hz : (Real.pi * (u.im + ((0 : ℚ) : ℝ) * Real.pi) : ℝ) = (Real.pi * u.im : ℝ) := by
        push_cast; ring
      rw [hz] at halg
      exact halg
    · exact Or.inl ⟨r, hr, halg⟩
  · rintro (⟨r, _, halg⟩ | hpa)
    · exact ⟨r, halg⟩
    · refine ⟨0, ?_⟩
      have hz : (Real.pi * (u.im + ((0 : ℚ) : ℝ) * Real.pi) : ℝ) = (Real.pi * u.im : ℝ) := by
        push_cast; ring
      rw [hz]
      exact hpa

/-- `π · Im u ∈ Q̄` forces `¬ PeriodAligned u`: the free-child hypothesis carried by the new
`PiImAlg` child is **redundant**, not load-bearing. -/
theorem not_periodAligned_of_piImAlg (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ))
    {u : ℂ} (hpa : PiImAlg u) : ¬ PeriodAligned u := by
  rintro ⟨r, hr0, halg⟩
  refine pi_not_quadratic hpi (r := r) (b := 0) hr0 ?_
  have hsplit : ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)
      = ((Real.pi * u.im : ℝ) : ℂ)
        + (((0 : ℚ) : ℂ) * ((Real.pi : ℝ) : ℂ) + ((r : ℚ) : ℂ) * ((Real.pi : ℝ) : ℂ) ^ 2) := by
    push_cast; ring
  rw [hsplit] at halg
  have := (alg_iff_mem).1 halg
  have hbase := (alg_iff_mem).1 hpa
  exact (alg_iff_mem).2 (by simpa using Subfield.sub_mem _ this hbase)

/-- Conversely `PeriodAligned u` forces `¬ PiImAlg u`: the two children below the parent's
aligned/free split are disjoint, and their union is `RatAligned`. -/
theorem not_piImAlg_of_periodAligned (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ))
    {u : ℂ} (hal : PeriodAligned u) : ¬ PiImAlg u :=
  fun hpa => not_periodAligned_of_piImAlg hpi hpa hal

end DiazLeaf2Free

namespace DiazLeaf2Free

open DiazModulus DiazLeafSplit

/-! ## 5.  Both new halves are non-empty, with explicit witnesses

`wC = √(16 − 1/π²) + i/π`: modulus `4`, `π · Im wC = 1`.
`wB = √15 + i` (the sibling file's period-free witness): modulus `4`, `π · Im wB = π`. -/

noncomputable def yC : ℝ := 1 / Real.pi

noncomputable def wC : ℂ := ⟨Real.sqrt (16 - yC ^ 2), yC⟩

theorem yC_pos : 0 < yC := by
  have := pi_pos'
  unfold yC; positivity

theorem yC_lt : yC < 1 / 3 := by
  have h3 : (3 : ℝ) < Real.pi := Real.pi_gt_three
  have hpos : (0 : ℝ) < Real.pi := pi_pos'
  unfold yC
  rw [div_lt_div_iff₀ hpos (by norm_num)]
  linarith

theorem yC_sq_lt : yC ^ 2 < 16 := by
  nlinarith [yC_pos, yC_lt]

theorem norm_wC : ‖wC‖ = 4 := by
  have h1 : (0 : ℝ) ≤ 16 - yC ^ 2 := by linarith [yC_sq_lt]
  have h2 : Complex.normSq wC = 16 := by
    rw [wC, Complex.normSq_mk, Real.mul_self_sqrt h1]; ring
  have h3 : ‖wC‖ ^ 2 = 16 := by rw [← Complex.normSq_eq_norm_sq, h2]
  nlinarith [norm_nonneg wC, h3]

theorem wC_re_pos : 0 < wC.re := by
  have h1 : (0 : ℝ) < 16 - yC ^ 2 := by linarith [yC_sq_lt]
  simpa [wC] using Real.sqrt_pos.2 h1

theorem wC_im : wC.im = 1 / Real.pi := rfl

theorem pi_mul_wC_im : (Real.pi * wC.im : ℝ) = 1 := by
  rw [wC_im]
  field_simp

theorem wC_not_pi_rat (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ)) :
    ¬ ∃ q : ℚ, wC.im = (q : ℝ) * Real.pi := by
  rintro ⟨q, hq⟩
  have hpos : (0 : ℝ) < Real.pi := pi_pos'
  have hy : (1 / Real.pi : ℝ) = (q : ℝ) * Real.pi := by rw [← wC_im]; exact hq
  have h1 : (1 / Real.pi) * Real.pi = 1 := by field_simp
  have hmul : (1 / Real.pi) * Real.pi = ((q : ℝ) * Real.pi) * Real.pi := by rw [hy]
  have hkey : (q : ℝ) * Real.pi ^ 2 = 1 := by nlinarith [hmul, h1]
  by_cases hq0 : (q : ℚ) = 0
  · have hz : ((q : ℚ) : ℝ) = 0 := by exact_mod_cast hq0
    rw [hz] at hkey; norm_num at hkey
  · refine pi_not_quadratic hpi (r := q) (b := 0) hq0 ?_
    have hval : ((0 : ℚ) : ℂ) * ((Real.pi : ℝ) : ℂ)
        + ((q : ℚ) : ℂ) * ((Real.pi : ℝ) : ℂ) ^ 2 = 1 := by
      have hcast : ((((q : ℝ)) * Real.pi ^ 2 : ℝ) : ℂ) = ((1 : ℝ) : ℂ) := by rw [hkey]
      push_cast at hcast ⊢
      linear_combination hcast
    rw [hval]
    simpa using (isAlgebraic_one (R := ℚ) (A := ℂ))

/-- The new `PiImAlg` half of the period-free child is non-empty. -/
theorem wC_mem_free_piAlg (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ)) :
    wC ≠ 0 ∧ IsAlgebraic ℚ ((‖wC‖ : ℝ) : ℂ) ∧ (Complex.exp wC).im ≠ 0 ∧
      ¬ (wC.im = 0 ∨ wC.re = 0) ∧ (¬ ∃ q : ℚ, wC.im = (q : ℝ) * Real.pi) ∧
      ¬ PeriodAligned wC ∧ PiImAlg wC := by
  have hre : wC.re ≠ 0 := ne_of_gt wC_re_pos
  have him : wC.im ≠ 0 := by rw [wC_im]; positivity
  have hpiim : PiImAlg wC := by
    unfold PiImAlg
    rw [pi_mul_wC_im]
    have : (((1 : ℝ)) : ℂ) = ((1 : ℚ) : ℂ) := by push_cast; ring
    rw [this]; exact alg_rat _
  refine ⟨?_, ?_, exp_im_ne_zero_of_not_pi_rat (wC_not_pi_rat hpi), ?_,
    wC_not_pi_rat hpi, not_periodAligned_of_piImAlg hpi hpiim, hpiim⟩
  · intro h; exact hre (by rw [h]; rfl)
  · rw [norm_wC]
    have : (((4 : ℝ)) : ℂ) = ((4 : ℚ) : ℂ) := by push_cast; ring
    rw [this]; exact alg_rat _
  · rintro (h | h)
    · exact him h
    · exact hre h

/-- The residual half of the period-free child is non-empty: the sibling file's witness
`wB = √15 + i` has `π · Im wB = π ∉ Q̄`. -/
theorem wB_mem_free_piTrans (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ)) :
    wB ≠ 0 ∧ IsAlgebraic ℚ ((‖wB‖ : ℝ) : ℂ) ∧ (Complex.exp wB).im ≠ 0 ∧
      ¬ (wB.im = 0 ∨ wB.re = 0) ∧ (¬ ∃ q : ℚ, wB.im = (q : ℝ) * Real.pi) ∧
      ¬ PeriodAligned wB ∧ ¬ PiImAlg wB := by
  obtain ⟨h1, h2, h3, h4, h5, h6⟩ := wB_mem_free hpi
  refine ⟨h1, h2, h3, h4, h5, h6, ?_⟩
  intro hpa
  unfold PiImAlg at hpa
  refine hpi ?_
  have hb : wB.im = 1 := rfl
  have hz : ((Real.pi * wB.im : ℝ) : ℂ) = ((Real.pi : ℝ) : ℂ) := by
    rw [hb]; push_cast; ring
  rw [hz] at hpa
  exact hpa

end DiazLeaf2Free

namespace DiazLeaf2Free

open DiazModulus DiazLeafSplit

/-! ## 6.  The new predicate is invariant under the rational-scaling action

Same check as for `PeriodAligned`: the mechanism that collapses a split on this mission —
carry a counterexample back onto the parent by `u ↦ q u` (`Diaz.locus_stable`) — does not
apply.  This does not prove strictness; it only removes the known collapse. -/

theorem piImAlg_ratMul {u : ℂ} {q : ℚ} (hq : q ≠ 0) :
    PiImAlg ((q : ℂ) * u) ↔ PiImAlg u := by
  have him : ((q : ℂ) * u).im = ((q : ℚ) : ℝ) * u.im := by simp
  constructor
  · intro h
    unfold PiImAlg at h ⊢
    have hid : (Real.pi * u.im : ℝ)
        = ((1 / q : ℚ) : ℝ) * (Real.pi * ((q : ℂ) * u).im) := by
      rw [him]
      have hqR : ((q : ℚ) : ℝ) ≠ 0 := Rat.cast_ne_zero.2 hq
      push_cast
      field_simp
    rw [hid, Complex.ofReal_mul]
    have hcc : ((((1 / q : ℚ) : ℝ)) : ℂ) = ((1 / q : ℚ) : ℂ) := by norm_cast
    rw [hcc]
    exact alg_mul (alg_rat _) h
  · intro h
    unfold PiImAlg at h ⊢
    have hid : (Real.pi * ((q : ℂ) * u).im : ℝ) = ((q : ℚ) : ℝ) * (Real.pi * u.im) := by
      rw [him]; ring
    rw [hid, Complex.ofReal_mul]
    have hcc : ((((q : ℚ) : ℝ)) : ℂ) = ((q : ℚ) : ℂ) := by norm_cast
    rw [hcc]
    exact alg_mul (alg_rat _) h

end DiazLeaf2Free
