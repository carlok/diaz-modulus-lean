import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_hermite_lindemann_holds
import Theorems.Thm_DiazModulus_pi_transcendental
import Theorems.Thm_DiazModulus_norm_transcendental_of_generic_conj_pair

open Complex ComplexConjugate

/-!
# `DiazModulus.diaz_of_exp_real_generic`, reduced against what Mathlib actually has

The reduction below is organised around a survey of the transcendence machinery present in
this Mathlib revision.  What is there: the general `Transcendental` / `IsAlgebraic` algebra,
Liouville numbers, and the *analytic half* of Lindemann–Weierstrass
(`LindemannWeierstrass.exp_polynomial_approx`).  What is not there: transcendence of `π`,
transcendence of `e`, Hermite–Lindemann, Gelfond–Schneider, six exponentials, Baker.  So the
node's every arithmetic input has to be named explicitly; the point of the reduction is to
name as *few* and as *weak* inputs as possible, and to discharge everything else from Mathlib.

Three sub-lemmas.  Two of them are **theorems** — classical, 1882, merely absent from Mathlib —
and each kills one degenerate corner of the configuration.  The third is the genuinely open
crux, and it is stated with every corner already removed, so it is strictly weaker than the
node itself.
-/

namespace DiazAlt

/-! The two classical inputs are already on the platform, both `Proved`, with exactly
these statements — `DiazModulus.hermite_lindemann_holds` and
`DiazModulus.pi_transcendental`. They are imported, not restated: re-declaring them
would add duplicate nodes to a public graph, and reuse is what the platform rewards.
Only the crux below is new. -/

/-! ### The Mathlib half of the reduction -/

/-- `exp u` real forces `Im u` onto the lattice `πℤ`.  Pure Mathlib:
`Complex.exp_im` plus `Real.sin_eq_zero_iff`. -/
theorem im_eq_int_mul_pi {u : ℂ} (h : (Complex.exp u).im = 0) :
    ∃ k : ℤ, (k : ℝ) * Real.pi = u.im := by
  rw [Complex.exp_im] at h
  rcases mul_eq_zero.mp h with h | h
  · exact absurd h (Real.exp_ne_zero _)
  · exact Real.sin_eq_zero_iff.mp h

/-- `Im u` is transcendental: it is a non-zero integer multiple of `π`. -/
theorem transcendental_im {u : ℂ} (h : (Complex.exp u).im = 0) (him : u.im ≠ 0) :
    Transcendental ℚ ((u.im : ℝ) : ℂ) := by
  intro halg
  obtain ⟨k, hk⟩ := im_eq_int_mul_pi h
  have hkR : (k : ℝ) ≠ 0 := fun h0 => him (by rw [← hk, h0, zero_mul])
  have hpiR : Real.pi = (u.im : ℝ) / (k : ℝ) := by
    rw [eq_div_iff hkR, ← hk]; ring
  refine DiazModulus.pi_transcendental ?_
  have hpiC : ((Real.pi : ℝ) : ℂ) = ((u.im : ℝ) : ℂ) / ((k : ℤ) : ℂ) := by
    rw [hpiR]; push_cast; ring
  rw [hpiC]
  exact DiazModulus.mem_Qbar_iff.mp
    (div_mem (DiazModulus.mem_Qbar_iff.mpr halg) (intCast_mem _ _))

end DiazAlt

/-! ### The node -/

theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      u.im ≠ 0 → Complex.exp u ≠ 1 → u.re ≠ 0 →
      Transcendental ℚ (Complex.exp u) := by
  intro u _hu0 hnorm himzero him _hne1 hre halg
  -- `exp u` is real, hence its own conjugate, so `conj u` is a logarithm of an algebraic
  -- number as well: the configuration is a conjugate pair, and `‖u‖² = u * conj u`.
  have hconj : IsAlgebraic ℚ (Complex.exp ((starRingEnd ℂ) u)) := by
    rw [Complex.exp_conj, Complex.conj_eq_iff_im.mpr himzero]; exact halg
  -- (1) `Im u` is transcendental — sub-lemma 2.
  have h_im : Transcendental ℚ ((u.im : ℝ) : ℂ) := DiazAlt.transcendental_im himzero him
  -- (2) `Re u` is transcendental — sub-lemma 1, applied to `Re u = log ‖exp u‖`.
  have h_re : Transcendental ℚ ((u.re : ℝ) : ℂ) := by
    intro hra
    have hsqR : (Real.exp u.re) ^ 2 = ((Complex.exp u).re) ^ 2 := by
      rw [← Complex.norm_exp, Complex.sq_norm, Complex.normSq_apply, himzero]; ring
    have hreal : Complex.exp u = (((Complex.exp u).re : ℝ) : ℂ) :=
      Complex.ext (by simp) (by simp [himzero])
    have hsqC : ((Real.exp u.re : ℝ) : ℂ) ^ 2 = (Complex.exp u) ^ 2 := by
      rw [← Complex.ofReal_pow, hsqR, Complex.ofReal_pow, ← hreal]
    have hexp_alg : IsAlgebraic ℚ ((Real.exp u.re : ℝ) : ℂ) :=
      IsAlgebraic.of_pow (n := 2) (by norm_num) (by rw [hsqC]; exact halg.pow 2)
    refine DiazModulus.hermite_lindemann_holds ((u.re : ℝ) : ℂ) (Complex.ofReal_ne_zero.mpr hre) hra ?_
    rw [← Complex.ofReal_exp]; exact hexp_alg
  -- (3) the ratio `Re u / Im u` is transcendental: otherwise `‖u‖² = (Im u)² (r² + 1)`
  -- would make `Im u` algebraic, against (1).
  have h_ratio : Transcendental ℚ ((u.re / u.im : ℝ) : ℂ) := by
    intro hr
    refine h_im ?_
    have hidR : (u.im) ^ 2 * ((u.re / u.im) ^ 2 + 1) = ‖u‖ ^ 2 := by
      rw [Complex.sq_norm, Complex.normSq_apply]; field_simp
    have hD : (((u.re / u.im : ℝ) : ℂ)) ^ 2 + 1 ≠ 0 := by
      have hpos : (0 : ℝ) < (u.re / u.im) ^ 2 + 1 := by positivity
      have hne : ((((u.re / u.im) ^ 2 + 1 : ℝ)) : ℂ) ≠ 0 :=
        Complex.ofReal_ne_zero.mpr (ne_of_gt hpos)
      simpa using hne
    have hCid : ((u.im : ℝ) : ℂ) ^ 2 * ((((u.re / u.im : ℝ) : ℂ)) ^ 2 + 1)
        = ((‖u‖ : ℝ) : ℂ) ^ 2 := by exact_mod_cast hidR
    have heq : ((u.im : ℝ) : ℂ) ^ 2
        = ((‖u‖ : ℝ) : ℂ) ^ 2 / ((((u.re / u.im : ℝ) : ℂ)) ^ 2 + 1) := (eq_div_iff hD).mpr hCid
    refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
    rw [heq]
    exact DiazModulus.mem_Qbar_iff.mp
      (div_mem (pow_mem (DiazModulus.mem_Qbar_iff.mpr hnorm) 2)
        (add_mem (pow_mem (DiazModulus.mem_Qbar_iff.mpr hr) 2) (one_mem _)))
  -- (4) the crux — sub-lemma 3.
  exact DiazModulus.norm_transcendental_of_generic_conj_pair u halg hconj hre him h_re h_im
    h_ratio hnorm
