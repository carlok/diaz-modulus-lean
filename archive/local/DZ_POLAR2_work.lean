import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_pi_transcendental
import Theorems.Thm_DiazModulus_hermite_lindemann_holds
import Theorems.Thm_Diaz_period_plane_norm
import Theorems.Thm_Diaz_exp_ratMul_isAlgebraic

open ComplexConjugate

/-!
# Polar-coordinates import — all nine proofs, against the published nodes

Every proof here is the one that goes into the corresponding `/verify` submission, with the
platform's own nodes cited (`DiazModulus.pi_transcendental`,
`DiazModulus.hermite_lindemann_holds`, `Diaz.period_plane_norm`,
`Diaz.exp_ratMul_isAlgebraic`) instead of local re-derivations.
-/

/-! ## 1. `π²` is transcendental -/

namespace DiazModulus

theorem pi_sq_transcendental : Transcendental ℚ ((Real.pi ^ 2 : ℝ) : ℂ) := by
  intro h
  refine DiazModulus.pi_transcendental ?_
  refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
  simpa using h

end DiazModulus

/-! ## 2. The unwrapped quantisation hypothesis -/

theorem Diaz.exp_ratio_pow_eq_one_iff (v : ℂ) (m : ℕ) :
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

/-! ## 3. The quantisation family over the whole orbit -/

private theorem polar2_ratMul_re (q : ℚ) (u : ℂ) : ((q : ℂ) * u).re = (q : ℝ) * u.re := by
  simp [Complex.mul_re]

private theorem polar2_ratMul_im (q : ℚ) (u : ℂ) : ((q : ℂ) * u).im = (q : ℝ) * u.im := by
  simp [Complex.mul_im]

theorem Diaz.quantisation_orbit_iff_re_ne_zero {u : ℂ} {k : ℤ} (hk : k ≠ 0)
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
      rw [Diaz.exp_ratio_pow_eq_one_iff]
      exact ⟨1, by rw [him']; push_cast; ring⟩
    have := h ((1 : ℚ) / (k : ℚ)) hq 1 one_pos hcond
    rw [Complex.normSq_apply, hre', him'] at this
    norm_num at this
    nlinarith [Real.pi_pos]
  · intro hre q hq m hm hcond
    rw [Diaz.exp_ratio_pow_eq_one_iff] at hcond
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

/-! ## 4. The period plane -/

private theorem polar2_isAlgebraic_ratCast (q : ℚ) : IsAlgebraic ℚ ((q : ℂ)) := by
  have h := isAlgebraic_algebraMap (R := ℚ) (A := ℂ) q
  rwa [show (algebraMap ℚ ℂ) q = ((q : ℂ)) from rfl] at h

private theorem polar2_sub_conj_eq (v : ℂ) : v - conj v = ((2 * v.im : ℝ) : ℂ) * Complex.I := by
  refine Complex.ext ?_ ?_
  · simp
  · simp
    ring

/-- The `c = 0` case of `Diaz.period_plane_norm`. -/
private theorem polar2_normSq_plane (a b : ℝ) (u : ℂ) :
    Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u)
      = (a + b) ^ 2 * Complex.normSq u - 4 * a * b * u.im ^ 2 := by
  have h := Diaz.period_plane_norm u a b 0
  simp only [Complex.ofReal_zero, mul_zero, zero_mul, add_zero, zero_sub] at h
  rw [h]; ring

theorem Diaz.plane_normSq_algebraic_iff {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (a b : ℚ) :
    IsAlgebraic ℚ ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u) : ℝ) : ℂ)
      ↔ a = 0 ∨ b = 0 := by
  have hcastA : ((a : ℂ)) = (((a : ℝ) : ℂ)) := by push_cast; ring
  have hcastB : ((b : ℂ)) = (((b : ℝ) : ℂ)) := by push_cast; ring
  have hkeyR : Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u)
      = ((a : ℝ) + (b : ℝ)) ^ 2 * Complex.normSq u
        - 4 * (a : ℝ) * (b : ℝ) * (k : ℝ) ^ 2 * Real.pi ^ 2 := by
    rw [hcastA, hcastB, polar2_normSq_plane, him]
    ring
  have hkey : ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u) : ℝ) : ℂ)
      = ((((a + b) ^ 2 : ℚ)) : ℂ) * ((Complex.normSq u : ℝ) : ℂ)
        - (((4 * a * b * (k : ℚ) ^ 2 : ℚ)) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ) := by
    rw [hkeyR]
    push_cast
    ring
  constructor
  · intro halg
    by_contra hcon
    rw [not_or] at hcon
    obtain ⟨ha, hb⟩ := hcon
    apply DiazModulus.pi_sq_transcendental
    set q : ℚ := 4 * a * b * (k : ℚ) ^ 2 with hqdef
    have hq0 : q ≠ 0 := by
      rw [hqdef]
      exact mul_ne_zero (mul_ne_zero (mul_ne_zero (by norm_num) ha) hb)
        (pow_ne_zero 2 (Int.cast_ne_zero.mpr hk))
    have h1 : IsAlgebraic ℚ (((q : ℚ) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ)) := by
      have hrw : ((q : ℚ) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ)
          = ((((a + b) ^ 2 : ℚ)) : ℂ) * ((Complex.normSq u : ℝ) : ℂ)
            - ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u) : ℝ) : ℂ) := by
        rw [hkey, hqdef]
        ring
      rw [hrw]
      exact IsAlgebraic.sub (IsAlgebraic.mul (polar2_isAlgebraic_ratCast _) hn) halg
    have h2 : ((Real.pi ^ 2 : ℝ) : ℂ)
        = ((q⁻¹ : ℚ) : ℂ) * (((q : ℚ) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ)) := by
      rw [← mul_assoc, ← Rat.cast_mul, inv_mul_cancel₀ hq0, Rat.cast_one, one_mul]
    rw [h2]
    exact IsAlgebraic.mul (polar2_isAlgebraic_ratCast _) h1
  · intro h
    have hz : (((4 * a * b * (k : ℚ) ^ 2 : ℚ)) : ℂ) = 0 := by
      rcases h with h | h <;> subst h <;> push_cast <;> ring
    rw [hkey, hz, zero_mul, sub_zero]
    exact IsAlgebraic.mul (polar2_isAlgebraic_ratCast _) hn

theorem Diaz.period_plane_classification {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (a b c : ℚ) :
    IsAlgebraic ℚ ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u
        + 2 * (Real.pi : ℂ) * (c : ℂ) * Complex.I) : ℝ) : ℂ)
      ↔ (c = -(a * (k : ℚ)) ∨ c = b * (k : ℚ)) := by
  have hkQ : ((k : ℚ)) ≠ 0 := Int.cast_ne_zero.mpr hk
  have hper : (a : ℂ) * u + (b : ℂ) * conj u
      + 2 * (Real.pi : ℂ) * (c : ℂ) * Complex.I
      = (((a + c / (k : ℚ) : ℚ)) : ℂ) * u + (((b - c / (k : ℚ) : ℚ)) : ℂ) * conj u := by
    have hs : u - conj u = ((2 * ((k : ℝ) * Real.pi) : ℝ) : ℂ) * Complex.I := by
      rw [polar2_sub_conj_eq, him]
    have hexp : (((a + c / (k : ℚ) : ℚ)) : ℂ) * u + (((b - c / (k : ℚ) : ℚ)) : ℂ) * conj u
        = (a : ℂ) * u + (b : ℂ) * conj u
          + (((c / (k : ℚ) : ℚ)) : ℂ) * (u - conj u) := by
      push_cast
      ring
    rw [hexp, hs]
    push_cast
    field_simp
  rw [hper, Diaz.plane_normSq_algebraic_iff hk him hn]
  constructor
  · rintro (h | h)
    · left
      have h2 : c / (k : ℚ) = -a := by linarith
      rw [div_eq_iff hkQ] at h2
      linarith
    · right
      have h2 : c / (k : ℚ) = b := by linarith
      rw [div_eq_iff hkQ] at h2
      linarith
  · rintro (h | h)
    · left
      rw [h]
      field_simp
      ring
    · right
      rw [h]
      field_simp
      ring

/-! ## 5. Two-point fibres on the leaf -/

theorem Diaz.fibre_second_point_is_conj {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (q : ℚ) (n : ℤ) (hn0 : n ≠ 0)
    (halg : IsAlgebraic ℚ ((Complex.normSq ((q : ℂ) * u
        + 2 * (Real.pi : ℂ) * (n : ℂ) * Complex.I) : ℝ) : ℂ)) :
    q * (k : ℚ) = -(n : ℚ)
      ∧ (q : ℂ) * u + 2 * (Real.pi : ℂ) * (n : ℂ) * Complex.I = conj ((q : ℂ) * u)
      ∧ (Complex.exp ((q : ℂ) * u)).im = 0 := by
  have hcastn : ((n : ℂ)) = (((n : ℚ) : ℂ)) := by push_cast; ring
  have hcl := (Diaz.period_plane_classification hk him hn q 0 (n : ℚ)).mp (by
    rw [hcastn] at halg
    simpa using halg)
  have hqk : q * (k : ℚ) = -(n : ℚ) := by
    rcases hcl with h | h
    · linarith
    · simp at h
      exact absurd (by exact_mod_cast h : (n : ℤ) = 0) hn0
  refine ⟨hqk, ?_, ?_⟩
  · have hs : u - conj u = ((2 * ((k : ℝ) * Real.pi) : ℝ) : ℂ) * Complex.I := by
      rw [polar2_sub_conj_eq, him]
    have hnk : ((n : ℂ)) = -((q : ℂ) * ((k : ℤ) : ℂ)) := by
      have h := congrArg (fun x : ℚ => ((x : ℂ))) hqk
      simp only [Rat.cast_mul, Rat.cast_neg] at h
      push_cast at h ⊢
      linear_combination h
    rw [hnk]
    have hconj : conj ((q : ℂ) * u) = (q : ℂ) * conj u := by
      simp
    rw [hconj]
    have hd : (q : ℂ) * u - (q : ℂ) * conj u
        = (q : ℂ) * (((2 * ((k : ℝ) * Real.pi) : ℝ) : ℂ) * Complex.I) := by
      rw [← mul_sub, hs]
    push_cast at hd ⊢
    linear_combination hd
  · have him2 : ((q : ℂ) * u).im = -((n : ℝ) * Real.pi) := by
      rw [polar2_ratMul_im, him]
      have : (q : ℝ) * (k : ℝ) = -(n : ℝ) := by exact_mod_cast hqk
      rw [← mul_assoc, this]
      ring
    rw [Complex.exp_im, him2]
    have : Real.sin (-((n : ℝ) * Real.pi)) = 0 := by
      rw [Real.sin_neg, Real.sin_int_mul_pi]
      ring
    rw [this, mul_zero]

/-! ## 6. Rigidity of the counterexample set -/

theorem Diaz.two_failures_give_algebraic_log_product {t₁ t₂ : ℝ}
    (e₁ : IsAlgebraic ℚ ((Real.exp t₁ : ℝ) : ℂ)) (e₂ : IsAlgebraic ℚ ((Real.exp t₂ : ℝ) : ℂ))
    (h₁ : IsAlgebraic ℚ ((t₁ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ))
    (h₂ : IsAlgebraic ℚ ((t₂ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ)) :
    IsAlgebraic ℚ ((Real.exp (t₁ + t₂) : ℝ) : ℂ)
      ∧ IsAlgebraic ℚ ((Real.exp (t₁ - t₂) : ℝ) : ℂ)
      ∧ IsAlgebraic ℚ (((t₁ + t₂) * (t₁ - t₂) : ℝ) : ℂ)
      ∧ (t₁ ^ 2 ≠ t₂ ^ 2 → ((t₁ + t₂) * (t₁ - t₂) : ℝ) ≠ 0) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · rw [Real.exp_add, Complex.ofReal_mul]
    exact e₁.mul e₂
  · rw [Real.exp_sub, Complex.ofReal_div, div_eq_mul_inv]
    exact e₁.mul e₂.inv
  · have hrw : (((t₁ + t₂) * (t₁ - t₂) : ℝ) : ℂ)
        = ((t₁ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ) - ((t₂ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ) := by
      rw [← Complex.ofReal_sub]
      congr 1
      ring
    rw [hrw]
    exact h₁.sub h₂
  · intro hne hzero
    apply hne
    nlinarith [hzero]

theorem Diaz.failure_rational_multiple_rigid {t₁ t₂ : ℝ} (ht₁ : t₁ ≠ 0)
    (e₁ : IsAlgebraic ℚ ((Real.exp t₁ : ℝ) : ℂ))
    (h₁ : IsAlgebraic ℚ ((t₁ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ))
    (h₂ : IsAlgebraic ℚ ((t₂ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ))
    (r : ℚ) (hr : t₂ = (r : ℝ) * t₁) : r = 1 ∨ r = -1 := by
  by_contra hcon
  rw [not_or] at hcon
  obtain ⟨hr1, hr2⟩ := hcon
  have hrsq : (1 - r ^ 2 : ℚ) ≠ 0 := by
    intro h
    have : (r - 1) * (r + 1) = 0 := by linarith [h]
    rcases mul_eq_zero.mp this with h' | h'
    · exact hr1 (by linarith)
    · exact hr2 (by linarith)
  have hdiff : IsAlgebraic ℚ ((((1 - r ^ 2 : ℚ) : ℝ) * t₁ ^ 2 : ℝ) : ℂ) := by
    have hrw : ((((1 - r ^ 2 : ℚ) : ℝ) * t₁ ^ 2 : ℝ) : ℂ)
        = ((t₁ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ) - ((t₂ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ) := by
      rw [← Complex.ofReal_sub]
      congr 1
      rw [hr]
      push_cast
      ring
    rw [hrw]
    exact h₁.sub h₂
  have hsq : IsAlgebraic ℚ ((t₁ ^ 2 : ℝ) : ℂ) := by
    have hrw : ((t₁ ^ 2 : ℝ) : ℂ)
        = ((((1 - r ^ 2 : ℚ)⁻¹ : ℚ)) : ℂ) * ((((1 - r ^ 2 : ℚ) : ℝ) * t₁ ^ 2 : ℝ) : ℂ) := by
      rw [Complex.ofReal_mul, ← mul_assoc, ← Complex.ofReal_ratCast, ← Complex.ofReal_mul]
      rw [show (((1 - r ^ 2 : ℚ)⁻¹ : ℚ) : ℝ) * (((1 - r ^ 2 : ℚ) : ℝ)) = 1 by
        rw [← Rat.cast_mul, inv_mul_cancel₀ hrsq, Rat.cast_one]]
      rw [Complex.ofReal_one, one_mul]
    rw [hrw]
    exact IsAlgebraic.mul (polar2_isAlgebraic_ratCast _) hdiff
  have ht₁alg : IsAlgebraic ℚ (((t₁ : ℝ)) : ℂ) := by
    refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
    rwa [← Complex.ofReal_pow]
  have ht₁ne : ((t₁ : ℝ) : ℂ) ≠ 0 := by
    simpa using ht₁
  have := DiazModulus.hermite_lindemann_holds _ ht₁ne ht₁alg
  rw [← Complex.ofReal_exp] at this
  exact this e₁

/-! ## 7. The leaf is one relation -/

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

namespace DiazModulus

theorem leaf_iff_one :
    (∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
        u.im ≠ 0 → Complex.exp u ≠ 1 → u.re ≠ 0 → Transcendental ℚ (Complex.exp u))
      ↔ (∀ t : ℝ, t ≠ 0 → IsAlgebraic ℚ ((Real.exp t : ℝ) : ℂ) →
          Transcendental ℚ ((t ^ 2 + Real.pi ^ 2 : ℝ) : ℂ)) := by
  constructor
  · -- The leaf gives its `k = 1` slice: use the witness `u = t + πi`.
    intro h t ht hexpt halg
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
  · -- The `k = 1` slice gives the leaf: descend from `k` by taking a real `|k|`-th root.
    intro h u hu hmod hre him _hne hurne hexp
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
    -- Descend to `k = 1`.
    set t : ℝ := u.re with ht_def
    set N : ℕ := k.natAbs with hN
    have hN0 : 0 < N := Int.natAbs_pos.mpr hk0
    have hNR : (0 : ℝ) < (N : ℝ) := by exact_mod_cast hN0
    have hkR : (k : ℝ) ≠ 0 := Int.cast_ne_zero.mpr hk0
    have hkQ : (k : ℚ) ≠ 0 := Int.cast_ne_zero.mpr hk0
    have hNk : ((N : ℝ)) ^ 2 = (k : ℝ) ^ 2 := by rw [hN]; exact polar2_natAbs_cast_sq k
    set s : ℝ := t / (N : ℝ) with hs
    have hs0 : s ≠ 0 := div_ne_zero hurne (ne_of_gt hNR)
    -- `exp s` is algebraic: it is `exp` of the rational multiple `(1/N) · t`.
    have hsexp : IsAlgebraic ℚ ((Real.exp s : ℝ) : ℂ) := by
      have hbase : IsAlgebraic ℚ (Complex.exp ((t : ℝ) : ℂ)) := by
        rw [Complex.ofReal_exp] at hexpre
        exact hexpre
      have hmul := Diaz.exp_ratMul_isAlgebraic hbase ((1 : ℚ) / (N : ℚ))
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

end DiazModulus

/-! ## Axioms -/

#print axioms DiazModulus.pi_sq_transcendental
#print axioms Diaz.exp_ratio_pow_eq_one_iff
#print axioms Diaz.quantisation_orbit_iff_re_ne_zero
#print axioms Diaz.plane_normSq_algebraic_iff
#print axioms Diaz.period_plane_classification
#print axioms Diaz.fibre_second_point_is_conj
#print axioms Diaz.two_failures_give_algebraic_log_product
#print axioms Diaz.failure_rational_multiple_rigid
#print axioms DiazModulus.leaf_iff_one
