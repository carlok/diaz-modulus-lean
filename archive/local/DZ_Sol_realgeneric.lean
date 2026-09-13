import Definitions.Def_DiazModulus

open Complex ComplexConjugate

/-!
# The real-generic leaf, in arithmetic normal form

`DiazModulus.diaz_of_exp_real_generic` is the open leaf

```
∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ (‖u‖ : ℂ) → (exp u).im = 0 →
  u.im ≠ 0 → exp u ≠ 1 → u.re ≠ 0 → Transcendental ℚ (exp u)
```

an unpublished working note §3.2 asserts, without proof, that this is equivalent to a concrete
statement about `(log β)² + k²π²`, and records that the equivalence "is *not* formalised — it
needs `Complex.exp` real `⟺ Im u ∈ πℤ`, which is routine but not free".  This file supplies it.

`RealLogQuadratic` is the concrete statement: for every non-zero real `t` whose exponential is
algebraic (equivalently `t = log β` for a real algebraic `β > 0`, `β ≠ 1`) and every non-zero
integer `k`, the number `t² + k²π²` is transcendental.

`leaf_iff_realLogQuadratic` proves the two are equivalent.  Nothing is assumed: no
Hermite–Lindemann, no Schanuel, no six-exponentials input.  The content is the change of
variables and nothing else — the leaf is *not* proved here and is not claimed to be.

`log_two_sq_add_pi_sq_of_leaf` is the smallest instance, `(log 2)² + π² = ‖Log(-2)‖²`.
-/

namespace DiazRealGeneric

open DiazModulus

/-- The open leaf `DiazModulus.diaz_of_exp_real_generic`, verbatim. -/
def DiazExpRealGeneric : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
    u.im ≠ 0 → Complex.exp u ≠ 1 → u.re ≠ 0 → Transcendental ℚ (Complex.exp u)

/-- The arithmetic normal form: for `t` a non-zero real logarithm of an algebraic number and
`k` a non-zero integer, `t² + k²π²` is transcendental. -/
def RealLogQuadratic : Prop :=
  ∀ (t : ℝ) (k : ℤ), t ≠ 0 → k ≠ 0 → IsAlgebraic ℚ ((Real.exp t : ℝ) : ℂ) →
    Transcendental ℚ (((t ^ 2 + (k : ℝ) ^ 2 * Real.pi ^ 2 : ℝ) : ℂ))

/-! ### Two small facts about `exp` on the horizontal lines `Im = kπ` -/

/-- On the line `Im z = kπ` the exponential is real, and equal to `exp (Re z) * cos (kπ)`. -/
private theorem exp_eq_of_im_eq_int_mul_pi {z : ℂ} {k : ℤ} (hk : z.im = (k : ℝ) * Real.pi) :
    Complex.exp z = ((Real.exp z.re * Real.cos ((k : ℝ) * Real.pi) : ℝ) : ℂ) := by
  have hsin : Real.sin ((k : ℝ) * Real.pi) = 0 := Real.sin_eq_zero_iff.mpr ⟨k, rfl⟩
  apply Complex.ext
  · simp only [Complex.exp_re, Complex.ofReal_re, hk]
  · simp only [Complex.exp_im, Complex.ofReal_im, hk, hsin, mul_zero]

/-- `cos (kπ) = ±1`, in the multiplicative form that transfers algebraicity. -/
private theorem cos_int_mul_pi_mul_self (k : ℤ) :
    Real.cos ((k : ℝ) * Real.pi) * Real.cos ((k : ℝ) * Real.pi) = 1 := by
  have hsin : Real.sin ((k : ℝ) * Real.pi) = 0 := Real.sin_eq_zero_iff.mpr ⟨k, rfl⟩
  have h := Real.sin_sq_add_cos_sq ((k : ℝ) * Real.pi)
  rw [hsin] at h
  nlinarith [h]

/-- Multiplying by `cos (kπ)` preserves algebraicity, in both directions. -/
private theorem isAlgebraic_mul_cos_iff (k : ℤ) (x : ℝ) :
    IsAlgebraic ℚ ((x * Real.cos ((k : ℝ) * Real.pi) : ℝ) : ℂ) ↔ IsAlgebraic ℚ ((x : ℝ) : ℂ) := by
  rcases mul_self_eq_one_iff.mp (cos_int_mul_pi_mul_self k) with h | h <;>
    rw [h] <;> push_cast <;> simp
  constructor
  · intro hx
    simpa using hx.neg
  · intro hx
    simpa using hx.neg

/-- `‖u‖² = (Re u)² + (Im u)²`, transported to `ℂ`. -/
private theorem norm_sq_eq (u : ℂ) :
    (((‖u‖ : ℝ) : ℂ)) ^ 2 = ((u.re ^ 2 + u.im ^ 2 : ℝ) : ℂ) := by
  have : (‖u‖ : ℝ) ^ 2 = u.re ^ 2 + u.im ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; ring
  push_cast [← this]
  ring

/-! ### The equivalence -/

theorem leaf_of_realLogQuadratic (h : RealLogQuadratic) : DiazExpRealGeneric := by
  intro u hu hmod _hre him _hne hurne
  -- Suppose `exp u` were algebraic; derive a contradiction.
  rw [Transcendental]
  intro hexp
  -- `exp u` real forces `sin (Im u) = 0`, i.e. `Im u = kπ`.
  have hsin : Real.sin u.im = 0 := by
    have : Real.exp u.re * Real.sin u.im = 0 := by
      simpa [Complex.exp_im] using _hre
    rcases mul_eq_zero.mp this with h0 | h0
    · exact absurd h0 (Real.exp_ne_zero _)
    · exact h0
  obtain ⟨k, hk⟩ := Real.sin_eq_zero_iff.mp hsin
  -- `k ≠ 0`, because `Im u ≠ 0`.
  have hk0 : k ≠ 0 := by
    rintro rfl
    exact him (by simpa using hk.symm)
  -- `exp (Re u)` is algebraic, since `exp u = exp (Re u) * cos (kπ)`.
  have hexpre : IsAlgebraic ℚ ((Real.exp u.re : ℝ) : ℂ) := by
    have hz := exp_eq_of_im_eq_int_mul_pi (z := u) (k := k) hk.symm
    rw [hz] at hexp
    exact (isAlgebraic_mul_cos_iff k (Real.exp u.re)).mp hexp
  -- `‖u‖² = (Re u)² + k²π²` is algebraic.
  have hmod2 : IsAlgebraic ℚ ((u.re ^ 2 + (k : ℝ) ^ 2 * Real.pi ^ 2 : ℝ) : ℂ) := by
    have := hmod.pow (n := 2)
    rw [norm_sq_eq u] at this
    have himsq : u.im ^ 2 = (k : ℝ) ^ 2 * Real.pi ^ 2 := by rw [← hk]; ring
    rwa [himsq] at this
  -- But the normal form says it is transcendental.
  exact h u.re k hurne hk0 hexpre hmod2

theorem realLogQuadratic_of_leaf (h : DiazExpRealGeneric) : RealLogQuadratic := by
  intro t k ht hk hexpt
  rw [Transcendental]
  intro halg
  -- The witness `u = t + kπ i`.
  set u : ℂ := ⟨t, (k : ℝ) * Real.pi⟩ with hu_def
  have hu_re : u.re = t := rfl
  have hu_im : u.im = (k : ℝ) * Real.pi := rfl
  have hpi : Real.pi ≠ 0 := Real.pi_ne_zero
  have hkpi : (k : ℝ) * Real.pi ≠ 0 :=
    mul_ne_zero (Int.cast_ne_zero.mpr hk) hpi
  have hu0 : u ≠ 0 := by
    intro h0
    exact ht (by simpa [hu_re] using congrArg Complex.re h0)
  -- `‖u‖` is algebraic, because `‖u‖² = t² + k²π²` is.
  have hmod : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) := by
    refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
    rw [norm_sq_eq u, hu_re, hu_im]
    have : (t ^ 2 + ((k : ℝ) * Real.pi) ^ 2 : ℝ) = t ^ 2 + (k : ℝ) ^ 2 * Real.pi ^ 2 := by ring
    rw [this]
    exact halg
  -- `exp u` is real, non-`1`, and algebraic.
  have hz := exp_eq_of_im_eq_int_mul_pi (z := u) (k := k) hu_im
  have himzero : (Complex.exp u).im = 0 := by rw [hz]; exact Complex.ofReal_im _
  have hne1 : Complex.exp u ≠ 1 := by
    intro h1
    obtain ⟨n, hn⟩ := Complex.exp_eq_one_iff.mp h1
    have : u.re = 0 := by rw [hn]; simp
    exact ht (by rwa [hu_re] at this)
  have hexpu : IsAlgebraic ℚ (Complex.exp u) := by
    rw [hz, hu_re]
    exact (isAlgebraic_mul_cos_iff k (Real.exp t)).mpr hexpt
  exact h u hu0 hmod himzero (by rw [hu_im]; exact hkpi) hne1 (by rw [hu_re]; exact ht) hexpu

/-- **The leaf is exactly the arithmetic statement.**  No transcendence input is used; the
content is the change of variables `u = t + kπi`. -/
theorem leaf_iff_realLogQuadratic : DiazExpRealGeneric ↔ RealLogQuadratic :=
  ⟨realLogQuadratic_of_leaf, leaf_of_realLogQuadratic⟩

/-- The smallest instance: `(log 2)² + π² = ‖Log (-2)‖²`.  Open. -/
theorem log_two_sq_add_pi_sq_of_leaf (h : DiazExpRealGeneric) :
    Transcendental ℚ (((Real.log 2 ^ 2 + Real.pi ^ 2 : ℝ) : ℂ)) := by
  have hlog : Real.log 2 ≠ 0 := ne_of_gt (Real.log_pos (by norm_num))
  have h2 : IsAlgebraic ℚ ((2 : ℂ)) := by
    have := isAlgebraic_algebraMap (R := ℚ) (A := ℂ) (2 : ℚ)
    simpa using this
  have hexp : IsAlgebraic ℚ ((Real.exp (Real.log 2) : ℝ) : ℂ) := by
    rw [Real.exp_log (by norm_num : (0:ℝ) < 2)]
    simpa using h2
  have := (leaf_iff_realLogQuadratic.mp h) (Real.log 2) 1 hlog one_ne_zero hexp
  simpa using this

end DiazRealGeneric
