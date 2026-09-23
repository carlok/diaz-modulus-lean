import Mathlib

/-- From the `α ^ β` form of Gelfond–Schneider (principal branch) to the logarithmic form for an
arbitrary non-zero logarithm `l`: pick `m` with `|Im l| < m π`, so that `l / m` is the principal
logarithm of `α := exp (l / m)`; then `exp (b * l) = α ^ (m * b)`. -/
theorem gs_log_form_of_cpow_form
    (hGS : ∀ α β : ℂ, IsAlgebraic ℚ α → IsAlgebraic ℚ β → (α ≠ 0 ∧ α ≠ 1) →
      (∀ i j : ℤ, β ≠ i / j) → Transcendental ℚ (α ^ β))
    (b l : ℂ) (hb : IsAlgebraic ℚ b) (hbq : ∀ q : ℚ, b ≠ (q : ℂ))
    (hl : IsAlgebraic ℚ (Complex.exp l)) (hl0 : l ≠ 0) :
    Transcendental ℚ (Complex.exp (b * l)) := by
  set m : ℕ := ⌈|l.im| / Real.pi⌉₊ + 1 with hm_def
  have hm0 : 0 < m := Nat.succ_pos _
  have hmR : (0 : ℝ) < m := by exact_mod_cast hm0
  have hbound : |l.im| < m * Real.pi := by
    have h1 : |l.im| / Real.pi < m := by
      have := Nat.le_ceil (|l.im| / Real.pi)
      rw [hm_def]; push_cast; linarith
    rwa [div_lt_iff₀ Real.pi_pos] at h1
  set w : ℂ := l / m with hw
  have hwim : w.im = l.im / m := by rw [hw, Complex.div_natCast_im]
  have hw_lt : |w.im| < Real.pi := by
    rw [hwim, abs_div, abs_of_pos hmR, div_lt_iff₀ hmR]; linarith
  have hw_lo : -Real.pi < w.im := by linarith [neg_abs_le w.im]
  have hw_hi : w.im ≤ Real.pi := by linarith [le_abs_self w.im]
  have hmC : (m : ℂ) ≠ 0 := by exact_mod_cast hm0.ne'
  have hlw : l = m * w := by rw [hw]; field_simp
  -- α = exp w is algebraic, non-zero, and not 1
  have hα : IsAlgebraic ℚ (Complex.exp w) := by
    refine IsAlgebraic.of_pow hm0 ?_
    rw [← Complex.exp_nat_mul, ← hlw]; exact hl
  have hα0 : Complex.exp w ≠ 0 := Complex.exp_ne_zero w
  have hα1 : Complex.exp w ≠ 1 := by
    intro h
    obtain ⟨n, hn⟩ := Complex.exp_eq_one_iff.mp h
    have him : w.im = n * (2 * Real.pi) := by
      rw [hn]; simp [Complex.mul_im]
    have hn0 : n = 0 := by
      by_contra hne
      have : (1 : ℝ) ≤ |(n : ℝ)| := by
        rw [← Int.cast_abs]; exact_mod_cast Int.one_le_abs hne
      have : 2 * Real.pi ≤ |w.im| := by
        rw [him, abs_mul, abs_of_pos (by positivity : (0:ℝ) < 2 * Real.pi)]
        nlinarith [Real.pi_pos]
      linarith [Real.pi_pos]
    apply hl0
    rw [hlw, hn, hn0]; simp
  -- β = m * b is algebraic and irrational
  have hβ : IsAlgebraic ℚ ((m : ℂ) * b) := by
    have h := (isAlgebraic_algebraMap (R := ℚ) (A := ℂ) (m : ℚ)).mul hb
    simpa using h
  have hβirr : ∀ i j : ℤ, (m : ℂ) * b ≠ i / j := by
    intro i j h
    apply hbq ((i : ℚ) / (j * m))
    push_cast
    rw [div_mul_eq_div_div, ← h]; field_simp
  -- exp (b * l) = (exp w) ^ (m * b)
  have hkey : Complex.exp (b * l) = Complex.exp w ^ ((m : ℂ) * b) := by
    rw [Complex.cpow_def_of_ne_zero hα0, Complex.log_exp hw_lo hw_hi, hlw]; ring_nf
  rw [hkey]
  exact hGS _ _ hα hβ ⟨hα0, hα1⟩ hβirr
