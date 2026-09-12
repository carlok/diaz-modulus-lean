import Mathlib
import Definitions.Def_DiazModulus
import Solutions.DZ_LEAFSPLIT_core

/-!
# Splitting the period-aligned leaf at the four-exponentials boundary.

Ambient class of the leaf `DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned`:
`u ≠ 0`, `‖u‖ ∈ Q̄`, `(exp u).im ≠ 0`, `Im u ≠ 0 ≠ Re u`, `Im u ∉ πℚ`, and
`π (Im u + rπ) ∈ Q̄` for some `r ∈ ℚ^×`.  Write `s = Im u + rπ`, `β = π s`, `A = ‖u‖²`.

The split predicate is `A ∈ ℚ·β`.  On that half the leaf follows from the **theorem of the
four exponentials**, taken here as an explicit hypothesis `FourExpDet` (it is a theorem of
Siegel–Lang–Ramachandra, not of Mathlib).  No other transcendence input is used.
-/

open Complex ComplexConjugate

namespace DiazAligned

open DiazModulus DiazLeafSplit

/-! ## 1. The four exponentials theorem, determinant form, as an explicit hypothesis. -/

-- **Four exponentials conjecture, determinant form.**  A `2 × 2` matrix
-- `![![l₁, l₂], ![l₃, l₄]]` whose four entries are logarithms of algebraic numbers, whose two
-- rows are `ℚ`-linearly independent and whose two columns are `ℚ`-linearly independent, has
-- non-zero determinant.  This is **4EC**, still open in general; it is *known* when the four
-- entries generate a field of transcendence degree at most one (Roy–Waldschmidt, ported to
-- this mission as `Diaz.four_exp_trdeg_one`).  Strictly weaker than the *strong* four
-- exponentials conjecture, which is what the aligned leaf needs in full.
def FourExpDet : Prop :=
  ∀ l₁ l₂ l₃ l₄ : ℂ,
    IsAlgebraic ℚ (Complex.exp l₁) → IsAlgebraic ℚ (Complex.exp l₂) →
    IsAlgebraic ℚ (Complex.exp l₃) → IsAlgebraic ℚ (Complex.exp l₄) →
    (∀ a b : ℚ, (a : ℂ) * l₁ + (b : ℂ) * l₃ = 0 → (a : ℂ) * l₂ + (b : ℂ) * l₄ = 0 →
      a = 0 ∧ b = 0) →
    (∀ a b : ℚ, (a : ℂ) * l₁ + (b : ℂ) * l₂ = 0 → (a : ℂ) * l₃ + (b : ℂ) * l₄ = 0 →
      a = 0 ∧ b = 0) →
    l₁ * l₄ - l₂ * l₃ ≠ 0

/-! ## 2. The split predicate and the two halves. -/

/-- `‖u‖²` is a **rational** multiple of the aligned datum `π (Im u + rπ)`. -/
def NormRatMult (u : ℂ) : Prop :=
  ∃ r : ℚ, r ≠ 0 ∧ IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ) ∧
    ∃ c : ℚ, (‖u‖ : ℝ) ^ 2 = (c : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi))

/-- The published leaf, verbatim. -/
def Aligned : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
    ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
    (∃ r : ℚ, r ≠ 0 ∧ IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
    Transcendental ℚ (Complex.exp u)

/-- Half A: the norm is a rational multiple of the aligned datum. -/
def AlignedRatMult : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
    ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
    (∃ r : ℚ, r ≠ 0 ∧ IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
    NormRatMult u →
    Transcendental ℚ (Complex.exp u)

/-- Half B: it is not. -/
def AlignedNormFree : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
    ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
    (∃ r : ℚ, r ≠ 0 ∧ IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
    ¬ NormRatMult u →
    Transcendental ℚ (Complex.exp u)

theorem aligned_of_halves (hA : AlignedRatMult) (hB : AlignedNormFree) : Aligned := by
  intro u h0 hmod hnr hax hirr hal
  by_cases h : NormRatMult u
  · exact hA u h0 hmod hnr hax hirr hal h
  · exact hB u h0 hmod hnr hax hirr hal h

theorem ratMult_of_aligned (h : Aligned) : AlignedRatMult :=
  fun u a b c d e f _ => h u a b c d e f

theorem normFree_of_aligned (h : Aligned) : AlignedNormFree :=
  fun u a b c d e f _ => h u a b c d e f

theorem aligned_iff_halves : Aligned ↔ (AlignedRatMult ∧ AlignedNormFree) :=
  ⟨fun h => ⟨ratMult_of_aligned h, normFree_of_aligned h⟩,
   fun h => aligned_of_halves h.1 h.2⟩


/-! ## 3. The rational-multiple half follows from the four exponentials theorem. -/

/-- A rational multiple of `2πi` is a logarithm of a root of unity. -/
theorem alg_exp_rat_two_pi_I (c : ℚ) :
    IsAlgebraic ℚ (Complex.exp ((c : ℂ) * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I))) := by
  refine IsAlgebraic.of_pow (n := c.den) c.pos ?_
  have hden : ((c.den : ℕ) : ℂ) * (c : ℂ) = ((c.num : ℤ) : ℂ) := by
    rw [Rat.cast_def]; field_simp
  have hstep : ((c.den : ℕ) : ℂ) * ((c : ℂ) * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I))
      = ((c.num : ℤ) : ℂ) * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I) := by
    rw [← mul_assoc, hden]
  rw [← Complex.exp_nat_mul, hstep, Complex.exp_int_mul_two_pi_mul_I]
  simpa using (isAlgebraic_one (R := ℚ) (A := ℂ))

/-- **The main route lemma.**  Under the theorem of the four exponentials, a point whose
norm-square is a rational multiple of the aligned datum `π (Im u + rπ)` cannot have an
algebraic exponential.

Load-bearing hypotheses: `Re u ≠ 0`, `Im u ∉ πℚ` (only through `Im u + rπ ≠ 0`), and the
rational-multiple relation.  `u ≠ 0`, `‖u‖ ∈ Q̄` and `(exp u).im ≠ 0` are **not** used. -/
theorem transcendental_of_fourExpDet (h4 : FourExpDet) (u : ℂ)
    (hre : u.re ≠ 0)
    (hirr : ¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi)
    {r c₀ : ℚ}
    (hc : (‖u‖ : ℝ) ^ 2 = (c₀ : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi))) :
    Transcendental ℚ (Complex.exp u) := by
  intro hexp
  have hπ0 : (Real.pi : ℝ) ≠ 0 := Real.pi_ne_zero
  have hπC : ((Real.pi : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hπ0
  set s : ℝ := u.im + (r : ℝ) * Real.pi with hs_def
  have hs0 : s ≠ 0 := by
    intro h
    refine hirr ⟨-r, ?_⟩
    have : u.im = -((r : ℝ) * Real.pi) := by rw [hs_def] at h; linarith
    push_cast; linarith [this]
  have hsC : ((s : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hs0
  have hu0 : u ≠ 0 := by intro h; exact hre (by rw [h]; rfl)
  have hnorm_pos : (0 : ℝ) < (‖u‖ : ℝ) ^ 2 := by
    have : (0 : ℝ) < ‖u‖ := norm_pos_iff.2 hu0
    positivity
  have hc₀0 : c₀ ≠ 0 := by
    intro h
    rw [h] at hc
    have hz : (‖u‖ : ℝ) ^ 2 = 0 := by rw [hc]; push_cast; ring
    linarith [hnorm_pos, hz]
  set ν : ℂ := Complex.I * ((s : ℝ) : ℂ) with hν_def
  have hν0 : ν ≠ 0 := mul_ne_zero Complex.I_ne_zero hsC
  set c : ℚ := -c₀ / 2 with hc_def
  have hcne : c ≠ 0 := by
    rw [hc_def]; simpa using hc₀0
  have hcC : (c : ℂ) ≠ 0 := by exact_mod_cast hcne
  set l₃ : ℂ := (c : ℂ) * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I) with hl3_def
  have hexpν : IsAlgebraic ℚ (Complex.exp ν) := by
    refine IsAlgebraic.of_pow (n := 2 * r.den) (by positivity) ?_
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
    rw [hkey]
    exact alg_pow (alg_div hexp (alg_conj hexp)) r.den
  have hexpconj : IsAlgebraic ℚ (Complex.exp (conj u)) := by
    rw [Complex.exp_conj]; exact alg_conj hexp
  have hexpl₃ : IsAlgebraic ℚ (Complex.exp l₃) := by
    rw [hl3_def]; exact alg_exp_rat_two_pi_I c
  have hrows : ∀ a b : ℚ, (a : ℂ) * u + (b : ℂ) * l₃ = 0 →
      (a : ℂ) * ν + (b : ℂ) * (conj u) = 0 → a = 0 ∧ b = 0 := by
    intro a b h1 _
    have hre1 : ((a : ℂ) * u + (b : ℂ) * l₃).re = 0 := by rw [h1]; rfl
    have hz : ((a : ℂ) * u + (b : ℂ) * l₃).re = (a : ℝ) * u.re := by
      rw [hl3_def]; simp
    rw [hz] at hre1
    have ha : (a : ℝ) = 0 := by
      rcases mul_eq_zero.1 hre1 with h | h
      · exact h
      · exact absurd h hre
    have ha' : a = 0 := by exact_mod_cast ha
    refine ⟨ha', ?_⟩
    rw [ha'] at h1
    simp only [Rat.cast_zero, zero_mul, zero_add] at h1
    have : (b : ℂ) = 0 := by
      rcases mul_eq_zero.1 h1 with h | h
      · exact h
      · exact absurd h (by rw [hl3_def]; exact mul_ne_zero hcC (by
          simp [hπC, Complex.I_ne_zero]))
    exact_mod_cast this
  have hcols : ∀ a b : ℚ, (a : ℂ) * u + (b : ℂ) * ν = 0 →
      (a : ℂ) * l₃ + (b : ℂ) * (conj u) = 0 → a = 0 ∧ b = 0 := by
    intro a b h1 _
    have hre1 : ((a : ℂ) * u + (b : ℂ) * ν).re = 0 := by rw [h1]; rfl
    have hz : ((a : ℂ) * u + (b : ℂ) * ν).re = (a : ℝ) * u.re := by
      rw [hν_def]; simp
    rw [hz] at hre1
    have ha : (a : ℝ) = 0 := by
      rcases mul_eq_zero.1 hre1 with h | h
      · exact h
      · exact absurd h hre
    have ha' : a = 0 := by exact_mod_cast ha
    refine ⟨ha', ?_⟩
    rw [ha'] at h1
    simp only [Rat.cast_zero, zero_mul, zero_add] at h1
    have : (b : ℂ) = 0 := by
      rcases mul_eq_zero.1 h1 with h | h
      · exact h
      · exact absurd h hν0
    exact_mod_cast this
  have hdet : u * (conj u) - ν * l₃ = 0 := by
    have h1 : u * conj u = ((‖u‖ ^ 2 : ℝ) : ℂ) := by
      rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]
    have h2 : ν * l₃ = -(2 * (c : ℂ) * ((Real.pi : ℝ) : ℂ) * ((s : ℝ) : ℂ)) := by
      rw [hν_def, hl3_def]
      have := Complex.I_sq
      ring_nf
      rw [Complex.I_sq]
      ring
    rw [h1, h2, hc]
    have : ((c : ℝ)) = -(c₀ : ℝ) / 2 := by rw [hc_def]; push_cast; ring
    push_cast
    rw [hc_def]
    push_cast
    ring
  exact h4 u ν l₃ (conj u) hexp hexpν hexpl₃ hexpconj hrows hcols hdet

/-- The rational-multiple half of the aligned leaf, from the four exponentials conjecture. -/
theorem alignedRatMult_of_fourExpDet (h4 : FourExpDet) : AlignedRatMult := by
  intro u _ _ _ hax hirr _ hnrm
  obtain ⟨r, _, _, c₀, hc⟩ := hnrm
  have hre : u.re ≠ 0 := fun h => hax (Or.inr h)
  exact transcendental_of_fourExpDet h4 u hre hirr (r := r) (c₀ := c₀) hc

/-! ## 4. Both halves of the split are non-empty.

Both witnesses use the same angle `yA = 1/π − π` (so `r = 1` and `β = π(yA+π) = 1`) and
differ only in the norm: `‖wA‖² = 16 ∈ ℚ·β` and `‖wC‖² = 16√2 ∉ ℚ·β`. -/

theorem beta_yA : (Real.pi * (yA + ((1 : ℚ) : ℝ) * Real.pi) : ℝ) = 1 := by
  have hne : Real.pi ≠ 0 := Real.pi_ne_zero
  have hw : yA = 1 / Real.pi - Real.pi := rfl
  rw [hw]
  have hsimp : (1 / Real.pi - Real.pi + ((1 : ℚ) : ℝ) * Real.pi) = 1 / Real.pi := by
    push_cast; ring
  rw [hsimp]; field_simp

/-- On the `yA` line the aligned witness is unique: `r = 1`. -/
theorem yA_witness_unique (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ)) {r : ℚ}
    (halg : IsAlgebraic ℚ ((Real.pi * (yA + (r : ℝ) * Real.pi) : ℝ) : ℂ)) : r = 1 := by
  by_contra hne
  have hr1 : r - 1 ≠ 0 := sub_ne_zero.2 hne
  refine pi_not_quadratic hpi (r := r - 1) (b := 0) hr1 ?_
  have hπ0 : (Real.pi : ℝ) ≠ 0 := Real.pi_ne_zero
  have hval : (Real.pi * (yA + (r : ℝ) * Real.pi) : ℝ)
      = 1 + ((r : ℝ) - 1) * Real.pi ^ 2 := by
    have hw : yA = 1 / Real.pi - Real.pi := rfl
    rw [hw]; field_simp; ring
  rw [hval] at halg
  have hcast : (((1 + ((r : ℝ) - 1) * Real.pi ^ 2 : ℝ)) : ℂ)
      = 1 + (((r - 1 : ℚ)) : ℂ) * ((Real.pi : ℝ) : ℂ) ^ 2 := by push_cast; ring
  rw [hcast] at halg
  have h1 : IsAlgebraic ℚ ((1 : ℂ)) := by simpa using (isAlgebraic_one (R := ℚ) (A := ℂ))
  have hsub : IsAlgebraic ℚ ((1 + (((r - 1 : ℚ)) : ℂ) * ((Real.pi : ℝ) : ℂ) ^ 2) - 1) := by
    rw [alg_iff_mem] at halg h1 ⊢
    exact Subfield.sub_mem _ halg h1
  have hfix : ((1 : ℂ) + (((r - 1 : ℚ)) : ℂ) * ((Real.pi : ℝ) : ℂ) ^ 2) - 1
      = ((0 : ℚ) : ℂ) * ((Real.pi : ℝ) : ℂ)
        + (((r - 1 : ℚ)) : ℂ) * ((Real.pi : ℝ) : ℂ) ^ 2 := by push_cast; ring
  rw [hfix] at hsub
  exact hsub

theorem wA_normRatMult : NormRatMult wA := by
  refine ⟨1, one_ne_zero, ?_, 16, ?_⟩
  · have : wA.im = yA := rfl
    rw [this, beta_yA]
    simpa using (isAlgebraic_one (R := ℚ) (A := ℂ))
  · have him : wA.im = yA := rfl
    rw [him, beta_yA, norm_wA]; norm_num

/-! ### The `¬Φ` witness: same angle, norm `16√2`. -/

noncomputable def wC : ℂ := ⟨Real.sqrt (16 * Real.sqrt 2 - yA ^ 2), yA⟩

theorem sqrt2_gt_one : (1 : ℝ) < Real.sqrt 2 := by
  have : Real.sqrt 1 < Real.sqrt 2 := by
    apply Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  simpa using this

theorem yA_sq_lt' : yA ^ 2 < 16 * Real.sqrt 2 := by
  have h := yA_sq_lt
  have h2 := sqrt2_gt_one
  nlinarith [h, h2]

theorem normSq_wC : Complex.normSq wC = 16 * Real.sqrt 2 := by
  have h1 : (0 : ℝ) ≤ 16 * Real.sqrt 2 - yA ^ 2 := by linarith [yA_sq_lt']
  rw [wC, Complex.normSq_mk, Real.mul_self_sqrt h1]; ring

theorem norm_wC_sq : (‖wC‖ : ℝ) ^ 2 = 16 * Real.sqrt 2 := by
  rw [← Complex.normSq_eq_norm_sq, normSq_wC]

theorem norm_wC_alg : IsAlgebraic ℚ ((‖wC‖ : ℝ) : ℂ) := by
  refine IsAlgebraic.of_pow (n := 4) (by norm_num) ?_
  have h2 : ((‖wC‖ : ℝ) : ℂ) ^ 4 = (((‖wC‖ : ℝ) ^ 2 : ℝ) : ℂ) ^ 2 := by push_cast; ring
  have hs : ((16 : ℝ) * Real.sqrt 2) ^ 2 = 512 := by
    have : Real.sqrt 2 * Real.sqrt 2 = 2 := Real.mul_self_sqrt (by norm_num)
    nlinarith [this]
  rw [h2, norm_wC_sq]
  have : ((((16 : ℝ) * Real.sqrt 2 : ℝ)) : ℂ) ^ 2 = ((512 : ℚ) : ℂ) := by
    have hc : (((((16 : ℝ) * Real.sqrt 2) ^ 2 : ℝ)) : ℂ) = ((512 : ℝ) : ℂ) := by rw [hs]
    push_cast at hc ⊢
    linear_combination hc
  rw [this]
  exact alg_rat _

theorem wC_re_pos : 0 < wC.re := by
  have h1 : (0 : ℝ) < 16 * Real.sqrt 2 - yA ^ 2 := by linarith [yA_sq_lt']
  simpa [wC] using Real.sqrt_pos.2 h1

/-- `wC` lies in the aligned class but **not** in the rational-multiple half. -/
theorem wC_mem_normFree (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ)) :
    wC ≠ 0 ∧ IsAlgebraic ℚ ((‖wC‖ : ℝ) : ℂ) ∧ (Complex.exp wC).im ≠ 0 ∧
      ¬ (wC.im = 0 ∨ wC.re = 0) ∧ (¬ ∃ q : ℚ, wC.im = (q : ℝ) * Real.pi) ∧
      PeriodAligned wC ∧ ¬ NormRatMult wC := by
  have him' : wC.im = yA := rfl
  have hre : wC.re ≠ 0 := ne_of_gt wC_re_pos
  have him : wC.im ≠ 0 := by rw [him']; exact ne_of_lt yA_neg
  have hnpr : ¬ ∃ q : ℚ, wC.im = (q : ℝ) * Real.pi := by
    rw [him']
    have := wA_not_pi_rat hpi
    have hA : wA.im = yA := rfl
    rw [hA] at this
    exact this
  refine ⟨?_, norm_wC_alg, exp_im_ne_zero_of_not_pi_rat hnpr, ?_, hnpr, ⟨1, one_ne_zero, ?_⟩, ?_⟩
  · intro h; exact hre (by rw [h]; rfl)
  · rintro (h | h)
    · exact him h
    · exact hre h
  · rw [him', beta_yA]
    simpa using (isAlgebraic_one (R := ℚ) (A := ℂ))
  · rintro ⟨r, _, halg, c, hc⟩
    rw [him'] at halg hc
    have hr1 : r = 1 := yA_witness_unique hpi halg
    rw [hr1, beta_yA, norm_wC_sq] at hc
    have hval : Real.sqrt 2 = ((c / 16 : ℚ) : ℝ) := by
      push_cast; linarith [hc]
    exact irrational_sqrt_two ⟨c / 16, hval.symm⟩

end DiazAligned


namespace DiazAligned

open DiazModulus DiazLeafSplit

/-! ## 5. The aligned class has transcendence degree one.

`t = Re u` is algebraic over `Q̄(π)`: eliminating `θ = Im u = β/π − rπ` from
`t² + θ² = A` gives a polynomial relation over `Q̄` between `t` and `π`.  This holds on the
**whole** aligned class, not just on the rational-multiple half, and it is what puts the
configuration inside the regime where the four exponentials conjecture is a theorem
(`Diaz.four_exp_trdeg_one`).  On the period-**free** half there is no such relation. -/

/-- **The transcendence-degree-one certificate.**  With `β = π (Im u + rπ)` and
`A = ‖u‖²`, the real part `t = Re u` satisfies
`t²π² + r²π⁴ − (A + 2rβ)π² + β² = 0`, a non-trivial polynomial over `ℚ(A, β, r)`. -/
theorem aligned_quartic_relation (u : ℂ) (r : ℚ)
    (A β : ℝ) (hA : (‖u‖ : ℝ) ^ 2 = A)
    (hβ : Real.pi * (u.im + (r : ℝ) * Real.pi) = β) :
    u.re ^ 2 * Real.pi ^ 2 + (r : ℝ) ^ 2 * Real.pi ^ 4
      - (A + 2 * (r : ℝ) * β) * Real.pi ^ 2 + β ^ 2 = 0 := by
  have hnorm : (‖u‖ : ℝ) ^ 2 = u.re ^ 2 + u.im ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; ring
  rw [hnorm] at hA
  linear_combination (Real.pi ^ 2) * hA
    + (-(2 * (β - (r : ℝ) * Real.pi ^ 2))
        - (Real.pi * (u.im + (r : ℝ) * Real.pi) - β)) * hβ

end DiazAligned
