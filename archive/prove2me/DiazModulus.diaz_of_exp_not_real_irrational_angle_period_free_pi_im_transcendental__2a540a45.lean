import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_norm_transcendental_of_generic_conj_pair
import Theorems.Thm_DiazModulus_hermite_lindemann_holds

open Complex ComplexConjugate

-- The target's seven hypotheses are all discarded except `u ≠ 0` and `‖u‖ ∈ Q̄`.
-- Case split on which of `Re u`, `Im u`, `Re u / Im u` is algebraic: in each of the three
-- degenerate cases `u` itself is algebraic and `hermite_lindemann_holds` applies; in the
-- remaining case the three genericity hypotheses of
-- `norm_transcendental_of_generic_conj_pair` hold and it contradicts `‖u‖ ∈ Q̄` directly.
open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
      (¬ ∃ r : ℚ, r ≠ 0 ∧
        IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
      Transcendental ℚ ((Real.pi * u.im : ℝ) : ℂ) →
      Transcendental ℚ (Complex.exp u) := by
  have alg_iff_mem : ∀ {z : ℂ}, IsAlgebraic ℚ z ↔ z ∈ DiazModulus.Qbar :=
    fun {z} => DiazModulus.mem_Qbar_iff.symm
  have alg_rat : ∀ q : ℚ, IsAlgebraic ℚ ((q : ℂ)) := fun q => by
    simpa using (isAlgebraic_algebraMap (R := ℚ) (A := ℂ) q)
  have alg_zero : IsAlgebraic ℚ (0 : ℂ) := by simpa using alg_rat 0
  have alg_one : IsAlgebraic ℚ (1 : ℂ) := by simpa using alg_rat 1
  have alg_add : ∀ {z w : ℂ}, IsAlgebraic ℚ z → IsAlgebraic ℚ w → IsAlgebraic ℚ (z + w) := by
    intro z w hz hw; rw [alg_iff_mem] at *; exact Subfield.add_mem _ hz hw
  have alg_sub : ∀ {z w : ℂ}, IsAlgebraic ℚ z → IsAlgebraic ℚ w → IsAlgebraic ℚ (z - w) := by
    intro z w hz hw; rw [alg_iff_mem] at *; exact Subfield.sub_mem _ hz hw
  have alg_mul : ∀ {z w : ℂ}, IsAlgebraic ℚ z → IsAlgebraic ℚ w → IsAlgebraic ℚ (z * w) := by
    intro z w hz hw; rw [alg_iff_mem] at *; exact Subfield.mul_mem _ hz hw
  have alg_div : ∀ {z w : ℂ}, IsAlgebraic ℚ z → IsAlgebraic ℚ w → IsAlgebraic ℚ (z / w) := by
    intro z w hz hw; rw [alg_iff_mem] at *; exact Subfield.div_mem _ hz hw
  have alg_neg : ∀ {z : ℂ}, IsAlgebraic ℚ z → IsAlgebraic ℚ (-z) := by
    intro z hz; rw [alg_iff_mem] at *; exact Subfield.neg_mem _ hz
  have alg_pow : ∀ {z : ℂ}, IsAlgebraic ℚ z → ∀ n : ℕ, IsAlgebraic ℚ (z ^ n) := by
    intro z hz n; rw [alg_iff_mem] at *; exact Subfield.pow_mem _ hz n
  have alg_of_sq : ∀ {z : ℂ}, IsAlgebraic ℚ (z ^ 2) → IsAlgebraic ℚ z :=
    fun {_} h => IsAlgebraic.of_pow (by norm_num) h
  have alg_I : IsAlgebraic ℚ Complex.I :=
    alg_of_sq (by rw [Complex.I_sq]; exact alg_neg alg_one)
  have alg_conj : ∀ {z : ℂ}, IsAlgebraic ℚ z → IsAlgebraic ℚ (conj z) := by
    intro z h
    obtain ⟨p, hp0, hp⟩ := h
    refine ⟨p, hp0, ?_⟩
    set cj : ℂ →ₐ[ℚ] ℂ := (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ with hcj
    have h2 : Polynomial.aeval (cj z) p = cj (Polynomial.aeval z p) :=
      Polynomial.aeval_algHom_apply cj z p
    have h3 : (conj z : ℂ) = cj z := rfl
    rw [h3, h2, hp, map_zero]
  have alg_of_re_im : ∀ {u : ℂ}, IsAlgebraic ℚ ((u.re : ℝ) : ℂ) →
      IsAlgebraic ℚ ((u.im : ℝ) : ℂ) → IsAlgebraic ℚ u := by
    intro u hre him
    have h := alg_add hre (alg_mul him alg_I)
    rwa [Complex.re_add_im] at h
  have alg_normSq : ∀ {u : ℂ}, IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) →
      IsAlgebraic ℚ (((u.re : ℝ) : ℂ) ^ 2 + ((u.im : ℝ) : ℂ) ^ 2) := by
    intro u hmod
    have h1 : (((u.re : ℝ) : ℂ) ^ 2 + ((u.im : ℝ) : ℂ) ^ 2) = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
      have h2 : (Complex.normSq u : ℝ) = ‖u‖ ^ 2 := Complex.normSq_eq_norm_sq u
      have h3 : (Complex.normSq u : ℝ) = u.re ^ 2 + u.im ^ 2 := by
        rw [Complex.normSq_apply]; ring
      have h4 : (u.re ^ 2 + u.im ^ 2 : ℝ) = ‖u‖ ^ 2 := by rw [← h3, h2]
      have := congrArg (fun t : ℝ => ((t : ℝ) : ℂ)) h4
      push_cast at this ⊢
      exact this
    rw [h1]; exact alg_pow hmod 2
  have alg_of_norm_and_re : ∀ {u : ℂ}, IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) →
      IsAlgebraic ℚ ((u.re : ℝ) : ℂ) → IsAlgebraic ℚ u := by
    intro u hmod hre
    refine alg_of_re_im hre (alg_of_sq ?_)
    have := alg_sub (alg_normSq hmod) (alg_pow hre 2)
    simpa using this
  have alg_of_norm_and_im : ∀ {u : ℂ}, IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) →
      IsAlgebraic ℚ ((u.im : ℝ) : ℂ) → IsAlgebraic ℚ u := by
    intro u hmod him
    refine alg_of_re_im (alg_of_sq ?_) him
    have := alg_sub (alg_normSq hmod) (alg_pow him 2)
    simpa using this
  have alg_of_norm_and_ratio : ∀ {u : ℂ}, u.im ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) →
      IsAlgebraic ℚ ((u.re / u.im : ℝ) : ℂ) → IsAlgebraic ℚ u := by
    intro u him0 hmod hr
    have hden : (1 + (u.re / u.im) ^ 2 : ℝ) ≠ 0 := by positivity
    have key : (u.im ^ 2 : ℝ) = (u.re ^ 2 + u.im ^ 2) / (1 + (u.re / u.im) ^ 2) := by
      field_simp
      ring
    have hcast : ((u.im : ℝ) : ℂ) ^ 2
        = (((u.re : ℝ) : ℂ) ^ 2 + ((u.im : ℝ) : ℂ) ^ 2)
            / (1 + ((u.re / u.im : ℝ) : ℂ) ^ 2) := by
      have := congrArg (fun t : ℝ => ((t : ℝ) : ℂ)) key
      push_cast at this ⊢
      exact this
    refine alg_of_norm_and_im hmod (alg_of_sq ?_)
    rw [hcast]
    exact alg_div (alg_normSq hmod) (alg_add alg_one (alg_pow hr 2))
  intro u hu0 hmod _ _ _ _ _ hexp
  by_cases hre : IsAlgebraic ℚ ((u.re : ℝ) : ℂ)
  · exact DiazModulus.hermite_lindemann_holds u hu0 (alg_of_norm_and_re hmod hre) hexp
  by_cases him : IsAlgebraic ℚ ((u.im : ℝ) : ℂ)
  · exact DiazModulus.hermite_lindemann_holds u hu0 (alg_of_norm_and_im hmod him) hexp
  have hre0 : u.re ≠ 0 := by intro h; exact hre (by rw [h]; simpa using alg_zero)
  have him0 : u.im ≠ 0 := by intro h; exact him (by rw [h]; simpa using alg_zero)
  by_cases hr : IsAlgebraic ℚ ((u.re / u.im : ℝ) : ℂ)
  · exact DiazModulus.hermite_lindemann_holds u hu0 (alg_of_norm_and_ratio him0 hmod hr) hexp
  · exact DiazModulus.norm_transcendental_of_generic_conj_pair u hexp
      (by rw [Complex.exp_conj]; exact alg_conj hexp) hre0 him0 hre him hr hmod
