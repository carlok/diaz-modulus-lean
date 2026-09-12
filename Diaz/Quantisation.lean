/-
# Quantisation of the imaginary part, and the single surviving relation

Backups of five Prove2Me nodes:

* `exp_ratio_pow_eq_one_iff`
* `exp_ratMul_isAlgebraic`
* `Diaz.real_quantisation` --- a logarithm with real exponential has its
  imaginary part in `πZ`, which forces `|u| > π`.
* `Diaz.quantisation_orbit_iff_re_ne_zero`
* `DiazModulus.leaf_iff_one` --- the whole real branch reduces to one
  relation: for real `t ≠ 0` with `exp t` algebraic, is `t² + π²`
  transcendental? The smallest open instance is `t = log 2`.

Conventions as in `Diaz.Multipliers`.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation
import Diaz.Multipliers

open Complex ComplexConjugate

namespace Diaz

theorem exp_ratio_pow_eq_one_iff (v : ℂ) (m : ℕ) :
    (Complex.exp v / conj (Complex.exp v)) ^ m = 1
      ↔ ∃ n : ℤ, (m : ℝ) * v.im = (n : ℝ) * Real.pi := by
  have hsub : v - conj v = ((2 * v.im : ℝ) : ℂ) * Complex.I := by
    refine Complex.ext ?_ ?_
    · simp
    · simp
      ring
  have h2 : (Complex.exp v / conj (Complex.exp v)) ^ m
      = Complex.exp ((m : ℂ) * (v - conj v)) := by
    rw [← Complex.exp_conj, ← Complex.exp_sub, ← Complex.exp_nat_mul]
  rw [h2, Complex.exp_eq_one_iff]
  constructor
  · rintro ⟨n, hn⟩
    refine ⟨n, ?_⟩
    rw [hsub] at hn
    have := congrArg Complex.im hn
    simp at this
    linarith
  · rintro ⟨n, hn⟩
    refine ⟨n, ?_⟩
    rw [hsub]
    refine Complex.ext ?_ ?_
    · simp
    · simp
      linarith

open Diaz

open Diaz in
theorem exp_ratMul_isAlgebraic {u : ℂ} (hexp : IsAlgebraic ℚ (Complex.exp u)) (a : ℚ) :
    IsAlgebraic ℚ (Complex.exp ((a : ℂ) * u)) := by
  have hq : 0 < a.den := a.pos
  have hd : (a.den : ℚ) ≠ 0 := by exact_mod_cast a.den_ne_zero
  have hnum : (a : ℚ) * (a.den : ℚ) = (a.num : ℚ) := by
    rw [eq_comm, ← div_eq_iff hd]; exact Rat.num_div_den a
  have hnumC : (a : ℂ) * (a.den : ℂ) = (a.num : ℂ) := by
    exact_mod_cast congrArg (fun r : ℚ => (r : ℂ)) hnum
  have key : (Complex.exp ((a : ℂ) * u)) ^ (a.den) = (Complex.exp u) ^ (a.num) := by
    rw [← Complex.exp_nat_mul, ← Complex.exp_int_mul]
    congr 1
    rw [← mul_assoc, mul_comm ((a.den : ℂ)) ((a : ℂ)), hnumC]
  have hint : IsIntegral ℚ (Complex.exp u) := isAlgebraic_iff_isIntegral.mp hexp
  have halg : IsAlgebraic ℚ ((Complex.exp u) ^ (a.num)) := by
    rcases lt_or_ge a.num 0 with h | h
    · obtain ⟨m, hm⟩ : ∃ m : ℕ, a.num = -(m : ℤ) := ⟨(-a.num).toNat, by omega⟩
      rw [hm, zpow_neg, zpow_natCast]
      exact IsAlgebraic.inv (isAlgebraic_iff_isIntegral.mpr (hint.pow m))
    · obtain ⟨m, hm⟩ : ∃ m : ℕ, a.num = (m : ℤ) := ⟨a.num.toNat, by omega⟩
      rw [hm, zpow_natCast]
      exact isAlgebraic_iff_isIntegral.mpr (hint.pow m)
  exact IsAlgebraic.of_pow hq (key ▸ halg)

theorem real_quantisation {u : ℂ} (hexp : (Complex.exp u).im = 0)
    (hre : u.re ≠ 0) (him : u.im ≠ 0) :
    (∃ n : ℤ, u.im = n * Real.pi) ∧ Real.pi ^ 2 < Complex.normSq u := by
  have hs : Real.sin u.im = 0 := by
    have hx := Complex.exp_im u
    rw [hexp] at hx
    rcases mul_eq_zero.mp hx.symm with h | h
    · exact absurd h (Real.exp_ne_zero _)
    · exact h
  obtain ⟨n, hn⟩ := Real.sin_eq_zero_iff.mp hs
  refine ⟨⟨n, hn.symm⟩, ?_⟩
  have hn0 : n ≠ 0 := by rintro rfl; simp at hn; exact him hn.symm
  have h1 : (1 : ℝ) ≤ |(n : ℝ)| := by
    have : (1 : ℤ) ≤ |n| := Int.one_le_abs (by omega)
    exact_mod_cast this
  have hpi : (0 : ℝ) < Real.pi := Real.pi_pos
  have habs : Real.pi ≤ |u.im| := by
    rw [← hn, abs_mul, abs_of_pos hpi]
    nlinarith [abs_nonneg ((n : ℝ))]
  have hsq : Real.pi ^ 2 ≤ u.im ^ 2 := by
    have := sq_abs u.im
    nlinarith [abs_nonneg u.im]
  have hre2 : 0 < u.re ^ 2 := by positivity
  rw [Complex.normSq_apply]
  nlinarith

private theorem polar2_ratMul_re (q : ℚ) (u : ℂ) : ((q : ℂ) * u).re = (q : ℝ) * u.re := by
  simp [Complex.mul_re]

private theorem polar2_ratMul_im (q : ℚ) (u : ℂ) : ((q : ℂ) * u).im = (q : ℝ) * u.im := by
  simp [Complex.mul_im]

theorem quantisation_orbit_iff_re_ne_zero {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi) :
    (∀ q : ℚ, q ≠ 0 → ∀ m : ℕ, 0 < m →
        (Complex.exp ((q : ℂ) * u) / conj (Complex.exp ((q : ℂ) * u))) ^ m = 1 →
        Real.pi ^ 2 / (m : ℝ) ^ 2 < Complex.normSq ((q : ℂ) * u))
      ↔ u.re ≠ 0 := by
  have hpi : (0 : ℝ) < Real.pi := Real.pi_pos
  have hkR : (k : ℝ) ≠ 0 := Int.cast_ne_zero.mpr hk
  constructor
  · intro h hre
    have hq : ((1 : ℚ) / (k : ℚ)) ≠ 0 := by
      simp [Int.cast_ne_zero.mpr hk]
    have hre' : ((((1 : ℚ) / (k : ℚ) : ℚ) : ℂ) * u).re = 0 := by
      rw [polar2_ratMul_re, hre, mul_zero]
    have him' : ((((1 : ℚ) / (k : ℚ) : ℚ) : ℂ) * u).im = Real.pi := by
      rw [polar2_ratMul_im, him]
      push_cast
      field_simp
    have hcond : (Complex.exp ((((1 : ℚ) / (k : ℚ) : ℚ) : ℂ) * u) /
        conj (Complex.exp ((((1 : ℚ) / (k : ℚ) : ℚ) : ℂ) * u))) ^ 1 = 1 := by
      rw [exp_ratio_pow_eq_one_iff]
      exact ⟨1, by rw [him']; push_cast; ring⟩
    have := h ((1 : ℚ) / (k : ℚ)) hq 1 one_pos hcond
    rw [Complex.normSq_apply, hre', him'] at this
    norm_num at this
    nlinarith [Real.pi_pos]
  · intro hre q hq m hm hcond
    rw [exp_ratio_pow_eq_one_iff] at hcond
    obtain ⟨n, hn⟩ := hcond
    have hmR : (0 : ℝ) < (m : ℝ) := by exact_mod_cast hm
    have hqR : (q : ℝ) ≠ 0 := Rat.cast_ne_zero.mpr hq
    set y : ℝ := ((q : ℂ) * u).im with hy
    have hyv : y = (q : ℝ) * ((k : ℝ) * Real.pi) := by rw [hy, polar2_ratMul_im, him]
    have hy0 : y ≠ 0 := by
      rw [hyv]
      exact mul_ne_zero hqR (mul_ne_zero hkR (ne_of_gt hpi))
    have hn0 : n ≠ 0 := by
      intro h0
      apply hy0
      have : (m : ℝ) * y = 0 := by rw [hn, h0]; simp
      rcases mul_eq_zero.mp this with h | h
      · exact absurd h (ne_of_gt hmR)
      · exact h
    have hn1 : (1 : ℝ) ≤ |(n : ℝ)| := by
      rw [← Int.cast_abs]
      exact_mod_cast Int.one_le_abs (by omega)
    have hysq : Real.pi ^ 2 / (m : ℝ) ^ 2 ≤ y ^ 2 := by
      rw [div_le_iff₀ (by positivity)]
      have h1 : ((m : ℝ) * y) ^ 2 = ((n : ℝ) * Real.pi) ^ 2 := by rw [hn]
      have h2 : ((n : ℝ) * Real.pi) ^ 2 = (n : ℝ) ^ 2 * Real.pi ^ 2 := by ring
      have h3 : (1 : ℝ) ≤ (n : ℝ) ^ 2 := by nlinarith [abs_nonneg ((n : ℝ)), sq_abs ((n : ℝ))]
      nlinarith [sq_nonneg ((m : ℝ) * y), Real.pi_pos]
    have hrepos : (0 : ℝ) < ((q : ℂ) * u).re ^ 2 := by
      have : ((q : ℂ) * u).re = (q : ℝ) * u.re := polar2_ratMul_re q u
      rw [this]
      positivity
    rw [Complex.normSq_apply]
    nlinarith [hysq, hrepos]

private theorem polar2_isAlgebraic_ratCast (q : ℚ) : IsAlgebraic ℚ ((q : ℂ)) := by
  have h := isAlgebraic_algebraMap (R := ℚ) (A := ℂ) q
  rwa [show (algebraMap ℚ ℂ) q = ((q : ℂ)) from rfl] at h

private theorem polar2_exp_eq_of_im {z : ℂ} {k : ℤ} (hk : z.im = (k : ℝ) * Real.pi) :
    Complex.exp z = ((Real.exp z.re * Real.cos ((k : ℝ) * Real.pi) : ℝ) : ℂ) := by
  have hsin : Real.sin ((k : ℝ) * Real.pi) = 0 := Real.sin_eq_zero_iff.mpr ⟨k, rfl⟩
  apply Complex.ext
  · simp only [Complex.exp_re, Complex.ofReal_re, hk]
  · simp only [Complex.exp_im, Complex.ofReal_im, hk, hsin, mul_zero]

private theorem polar2_cos_int_mul_pi_mul_self (k : ℤ) :
    Real.cos ((k : ℝ) * Real.pi) * Real.cos ((k : ℝ) * Real.pi) = 1 := by
  have hsin : Real.sin ((k : ℝ) * Real.pi) = 0 := Real.sin_eq_zero_iff.mpr ⟨k, rfl⟩
  have h := Real.sin_sq_add_cos_sq ((k : ℝ) * Real.pi)
  rw [hsin] at h
  nlinarith [h]

private theorem polar2_isAlgebraic_mul_cos_iff (k : ℤ) (x : ℝ) :
    IsAlgebraic ℚ ((x * Real.cos ((k : ℝ) * Real.pi) : ℝ) : ℂ) ↔ IsAlgebraic ℚ ((x : ℝ) : ℂ) := by
  rcases mul_self_eq_one_iff.mp (polar2_cos_int_mul_pi_mul_self k) with h | h <;>
    rw [h] <;> push_cast <;> simp
  constructor
  · intro hx
    simpa using hx.neg
  · intro hx
    simpa using hx.neg

private theorem polar2_norm_sq_eq (u : ℂ) :
    (((‖u‖ : ℝ) : ℂ)) ^ 2 = ((u.re ^ 2 + u.im ^ 2 : ℝ) : ℂ) := by
  have : (‖u‖ : ℝ) ^ 2 = u.re ^ 2 + u.im ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; ring
  push_cast [← this]
  ring

private theorem polar2_natAbs_cast_sq (k : ℤ) : ((k.natAbs : ℝ)) ^ 2 = (k : ℝ) ^ 2 := by
  rw [Nat.cast_natAbs, Int.cast_abs, sq_abs]

theorem leaf_iff_one :
    (∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
        u.im ≠ 0 → Complex.exp u ≠ 1 → u.re ≠ 0 → Transcendental ℚ (Complex.exp u))
      ↔ (∀ t : ℝ, t ≠ 0 → IsAlgebraic ℚ ((Real.exp t : ℝ) : ℂ) →
          Transcendental ℚ ((t ^ 2 + Real.pi ^ 2 : ℝ) : ℂ)) := by
  constructor
  · intro h t ht hexpt halg
    set u : ℂ := ⟨t, (1 : ℝ) * Real.pi⟩ with hu_def
    have hu_re : u.re = t := rfl
    have hu_im : u.im = ((1 : ℤ) : ℝ) * Real.pi := by rw [hu_def]; norm_num
    have hpi : Real.pi ≠ 0 := Real.pi_ne_zero
    have hu0 : u ≠ 0 := by
      intro h0
      exact ht (by simpa [hu_re] using congrArg Complex.re h0)
    have hmod : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) := by
      refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
      rw [polar2_norm_sq_eq u, hu_re, hu_im]
      have hrw : (t ^ 2 + (((1 : ℤ) : ℝ) * Real.pi) ^ 2 : ℝ) = t ^ 2 + Real.pi ^ 2 := by
        push_cast; ring
      rw [hrw]
      exact halg
    have hz := polar2_exp_eq_of_im (z := u) (k := 1) hu_im
    have himzero : (Complex.exp u).im = 0 := by rw [hz]; exact Complex.ofReal_im _
    have hne1 : Complex.exp u ≠ 1 := by
      intro h1
      obtain ⟨n, hn⟩ := Complex.exp_eq_one_iff.mp h1
      have : u.re = 0 := by rw [hn]; simp
      exact ht (by rwa [hu_re] at this)
    have hexpu : IsAlgebraic ℚ (Complex.exp u) := by
      rw [hz, hu_re]
      exact (polar2_isAlgebraic_mul_cos_iff 1 (Real.exp t)).mpr hexpt
    refine h u hu0 hmod himzero ?_ hne1 (by rw [hu_re]; exact ht) hexpu
    rw [hu_im]
    simpa using hpi
  · intro h u hu hmod hre him _hne hurne hexp
    have hsin : Real.sin u.im = 0 := by
      have : Real.exp u.re * Real.sin u.im = 0 := by
        simpa [Complex.exp_im] using hre
      rcases mul_eq_zero.mp this with h0 | h0
      · exact absurd h0 (Real.exp_ne_zero _)
      · exact h0
    obtain ⟨k, hk⟩ := Real.sin_eq_zero_iff.mp hsin
    have hk0 : k ≠ 0 := by
      rintro rfl
      exact him (by simpa using hk.symm)
    have hexpre : IsAlgebraic ℚ ((Real.exp u.re : ℝ) : ℂ) := by
      have hz := polar2_exp_eq_of_im (z := u) (k := k) hk.symm
      rw [hz] at hexp
      exact (polar2_isAlgebraic_mul_cos_iff k (Real.exp u.re)).mp hexp
    have hmod2 : IsAlgebraic ℚ ((u.re ^ 2 + (k : ℝ) ^ 2 * Real.pi ^ 2 : ℝ) : ℂ) := by
      have hp := hmod.pow (n := 2)
      rw [polar2_norm_sq_eq u] at hp
      have himsq : u.im ^ 2 = (k : ℝ) ^ 2 * Real.pi ^ 2 := by rw [← hk]; ring
      rwa [himsq] at hp
    set t : ℝ := u.re with ht_def
    set N : ℕ := k.natAbs with hN
    have hN0 : 0 < N := Int.natAbs_pos.mpr hk0
    have hNR : (0 : ℝ) < (N : ℝ) := by exact_mod_cast hN0
    have hkR : (k : ℝ) ≠ 0 := Int.cast_ne_zero.mpr hk0
    have hkQ : (k : ℚ) ≠ 0 := Int.cast_ne_zero.mpr hk0
    have hNk : ((N : ℝ)) ^ 2 = (k : ℝ) ^ 2 := by rw [hN]; exact polar2_natAbs_cast_sq k
    set s : ℝ := t / (N : ℝ) with hs
    have hs0 : s ≠ 0 := div_ne_zero hurne (ne_of_gt hNR)
    have hsexp : IsAlgebraic ℚ ((Real.exp s : ℝ) : ℂ) := by
      have hbase : IsAlgebraic ℚ (Complex.exp ((t : ℝ) : ℂ)) := by
        rw [Complex.ofReal_exp] at hexpre
        exact hexpre
      have hmul := exp_ratMul_isAlgebraic hbase ((1 : ℚ) / (N : ℚ))
      have hrw : ((((1 : ℚ) / (N : ℚ) : ℚ) : ℂ)) * ((t : ℝ) : ℂ) = ((s : ℝ) : ℂ) := by
        rw [hs, ← Complex.ofReal_ratCast, ← Complex.ofReal_mul]
        norm_num
        ring
      rw [hrw, ← Complex.ofReal_exp] at hmul
      exact hmul
    have hssq : s ^ 2 = t ^ 2 / (k : ℝ) ^ 2 := by
      rw [hs, div_pow, hNk]
    have hcoef : ((s ^ 2 + Real.pi ^ 2 : ℝ) : ℂ)
        = (((1 / (k : ℚ) ^ 2 : ℚ) : ℂ)) * ((t ^ 2 + (k : ℝ) ^ 2 * Real.pi ^ 2 : ℝ) : ℂ) := by
      rw [← Complex.ofReal_ratCast, ← Complex.ofReal_mul]
      congr 1
      rw [hssq]
      push_cast
      field_simp
    have hrat : IsAlgebraic ℚ (((1 / (k : ℚ) ^ 2 : ℚ) : ℂ)) := polar2_isAlgebraic_ratCast _
    have hfinal : IsAlgebraic ℚ ((s ^ 2 + Real.pi ^ 2 : ℝ) : ℂ) := by
      rw [hcoef]; exact hrat.mul hmod2
    exact h s hs0 hsexp hfinal

end Diaz
