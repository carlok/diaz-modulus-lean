import Definitions.Def_DiazModulus

/-!
# Shape facts for the two axis halves of `DiazModulus.recip_pi_not_log`

Parent (Open): `∀ γ, IsAlgebraic ℚ γ → γ ≠ 0 → ¬ IsAlgebraic ℚ (exp (γ/(πI)))`.

Children (both Open):
* `recip_pi_not_log_real_gamma` (`γ.im = 0`): `λ = γ/(iπ)` is purely imaginary,
  so `‖exp λ‖ = 1`, and the hypothetical algebraic value is **not a root of
  unity** (that step needs `Transcendental ℚ π`, taken as an explicit
  hypothesis — the mission proves `pi_transcendental` itself, but nothing is
  imported here).
* `recip_pi_not_log_imag_gamma` (`γ.re = 0`): `λ = γ/(iπ)` is real, so
  `exp λ` is a positive real `≠ 1`.

These are the elementary halves of §1 of an unpublished working note (there *hand arguments*);
the transcendence conclusions themselves are open problems (strong four
exponentials) and are **not** attempted here. Clean build, zero `sorry`.
-/

open Complex ComplexConjugate

namespace DiazModulus

/-- Algebraic numbers: closure helpers (same `Qbar`-subfield pattern as
`DZ_SPLITS_core`). -/
theorem DZG_alg_add {z w : ℂ} (hz : IsAlgebraic ℚ z) (hw : IsAlgebraic ℚ w) :
    IsAlgebraic ℚ (z + w) := by
  rw [← mem_Qbar_iff] at *
  exact Subfield.add_mem _ hz hw

theorem DZG_alg_mul {z w : ℂ} (hz : IsAlgebraic ℚ z) (hw : IsAlgebraic ℚ w) :
    IsAlgebraic ℚ (z * w) := by
  rw [← mem_Qbar_iff] at *
  exact Subfield.mul_mem _ hz hw

theorem DZG_alg_neg {z : ℂ} (hz : IsAlgebraic ℚ z) : IsAlgebraic ℚ (-z) := by
  rw [← mem_Qbar_iff] at *
  exact Subfield.neg_mem _ hz

theorem DZG_alg_div {z w : ℂ} (hz : IsAlgebraic ℚ z) (hw : IsAlgebraic ℚ w) :
    IsAlgebraic ℚ (z / w) := by
  rw [← mem_Qbar_iff] at *
  exact Subfield.div_mem _ hz hw

/-- For real `γ`, `γ/(πI)` is purely imaginary. -/
theorem DZG_re_div_pi_I_of_real {γ : ℂ} (h : γ.im = 0) :
    (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)).re = 0 := by
  have hγ : γ = ((γ.re : ℝ) : ℂ) := by
    have h0 := Complex.re_add_im γ
    rw [h] at h0
    simpa using h0.symm
  rw [hγ, div_mul_eq_div_div, Complex.div_I]
  have : ((γ.re : ℝ) : ℂ) / ((Real.pi : ℝ) : ℂ) = (((γ.re / Real.pi) : ℝ) : ℂ) := by
    push_cast
    ring
  rw [this]
  simp [Complex.mul_re, Complex.I_re, Complex.I_im]

/-- Real-`γ` half: `|exp λ| = 1`. -/
theorem DZG_norm_exp_of_real_gamma {γ : ℂ} (h : γ.im = 0) :
    ‖Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))‖ = 1 := by
  rw [Complex.norm_exp, DZG_re_div_pi_I_of_real h, Real.exp_zero]

/-- Real-`γ` half: the hypothetical algebraic value is not a root of unity.
A relation `w ^ n = 1` forces `n * γ = -2 * k * π ^ 2`; `k = 0` gives
`γ = 0`, and `k ≠ 0` makes `π` algebraic. -/
theorem DZG_not_root_of_unity_of_real_gamma {γ : ℂ}
    (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ))
    (hγ : IsAlgebraic ℚ γ) (hγ0 : γ ≠ 0) (_hre : γ.im = 0)
    (n : ℕ) (hn : 0 < n) :
    (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) ^ n ≠ 1 := by
  intro hcon
  have hpi0 : ((Real.pi : ℝ) : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  have hI : Complex.I ≠ 0 := Complex.I_ne_zero
  have hexp : Complex.exp ((n : ℂ) * (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) = 1 := by
    rw [Complex.exp_nat_mul, hcon]
  obtain ⟨k, hk⟩ := Complex.exp_eq_one_iff.mp hexp
  -- clear the denominator: `n * γ = -2 * k * π ^ 2`
  have key : (n : ℂ) * γ = -2 * (k : ℂ) * (((Real.pi : ℝ) : ℂ)) ^ 2 := by
    have hmul := congrArg (· * ((((Real.pi : ℝ) : ℂ) * Complex.I))) hk
    have hL : (n : ℂ) * (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)) *
        (((Real.pi : ℝ) : ℂ) * Complex.I) = (n : ℂ) * γ := by
      field_simp
    rw [hL] at hmul
    -- RHS: `k * (2 * π * I) * (π * I) = -2 * k * π ^ 2`
    have hR : (k : ℂ) * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I) *
        (((Real.pi : ℝ) : ℂ) * Complex.I) = -2 * (k : ℂ) * ((Real.pi : ℝ) : ℂ) ^ 2 := by
      have hI2 : Complex.I ^ 2 = (-1 : ℂ) := by rw [sq, Complex.I_mul_I]
      ring_nf
      rw [hI2]
      ring
    rw [hR] at hmul
    exact hmul
  by_cases hk0 : k = 0
  · -- then `n * γ = 0`, so `γ = 0`
    subst hk0
    simp only [Int.cast_zero, mul_zero, zero_mul] at key
    have hn0 : (n : ℂ) ≠ 0 := by exact_mod_cast Nat.ne_zero_of_lt hn
    exact hγ0 ((mul_eq_zero.mp key).resolve_left hn0)
  · -- then `π ^ 2` is algebraic, so `π` is
    have h2k : (2 : ℂ) * (k : ℂ) ≠ 0 := by
      apply mul_ne_zero two_ne_zero
      exact_mod_cast hk0
    have hpi2 : IsAlgebraic ℚ ((((Real.pi : ℝ) : ℂ)) ^ 2) := by
      have heq : ((((Real.pi : ℝ) : ℂ)) ^ 2) =
          (-((n : ℂ) * γ)) / (2 * (k : ℂ)) := by
        rw [eq_div_iff h2k]
        linear_combination key
      rw [heq]
      exact DZG_alg_div
        (DZG_alg_neg (DZG_alg_mul (isAlgebraic_natCast n) hγ))
        (DZG_alg_mul (isAlgebraic_natCast 2) (isAlgebraic_intCast k))
    exact hpi (IsAlgebraic.of_pow two_pos hpi2)

/-- For purely imaginary `γ ≠ 0`, `γ/(πI)` is a nonzero real. -/
theorem DZG_div_pi_I_of_imag {γ : ℂ} (h : γ.re = 0) (h0 : γ ≠ 0) :
    ∃ s : ℝ, s ≠ 0 ∧
      γ / (((Real.pi : ℝ) : ℂ) * Complex.I) = (((s / Real.pi) : ℝ) : ℂ) := by
  have hγ : γ = ((γ.im : ℝ) : ℂ) * Complex.I := by
    have h0 := Complex.re_add_im γ
    rw [h] at h0
    simpa using h0.symm
  have hs : γ.im ≠ 0 := by
    intro hz
    apply h0
    rw [hγ, hz]
    simp
  refine ⟨γ.im, hs, ?_⟩
  have hI : Complex.I ≠ 0 := Complex.I_ne_zero
  conv_lhs => rw [hγ]
  rw [mul_div_mul_right _ _ hI]
  push_cast
  ring

/-- Imag-`γ` half: `exp λ` is real (`im = 0`) and `≠ 1`. -/
theorem DZG_exp_shape_of_imag_gamma {γ : ℂ} (h : γ.re = 0) (h0 : γ ≠ 0) :
    (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))).im = 0 ∧
      Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)) ≠ 1 := by
  obtain ⟨s, hs, hlam⟩ := DZG_div_pi_I_of_imag h h0
  have hexp : Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)) =
      ((Real.exp (s / Real.pi) : ℝ) : ℂ) := by
    rw [hlam, Complex.ofReal_exp]
  refine ⟨by rw [hexp, Complex.ofReal_im], ?_⟩
  intro hcon
  rw [hexp] at hcon
  have hre : Real.exp (s / Real.pi) = 1 := by exact_mod_cast hcon
  rw [Real.exp_eq_one_iff] at hre
  apply hs
  have hpiR : Real.pi ≠ 0 := Real.pi_ne_zero
  exact (div_eq_zero_iff.mp hre).resolve_right hpiR

end DiazModulus
