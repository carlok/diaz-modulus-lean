import Solutions.DZ_Sol_realgeneric
import Solutions.DZH_Sol_hermite_lindemann_holds

open Complex ComplexConjugate

namespace DiazLeaf2

open DiazModulus DiazRealGeneric

/-! ## 0. `π` is transcendental -/

theorem isAlgebraic_I : IsAlgebraic ℚ Complex.I := by
  apply IsAlgebraic.of_pow (n := 2) (by norm_num)
  rw [Complex.I_sq]
  simpa using (isAlgebraic_algebraMap (R := ℚ) (A := ℂ) (-1 : ℚ))

theorem transcendental_pi : Transcendental ℚ ((Real.pi : ℝ) : ℂ) := by
  intro h
  have h2 : IsAlgebraic ℚ (((Real.pi : ℝ) : ℂ) * Complex.I) := h.mul isAlgebraic_I
  have h3 : ((Real.pi : ℝ) : ℂ) * Complex.I ≠ 0 := by
    simp [Real.pi_ne_zero, Complex.I_ne_zero]
  have h4 := solution _ h3 h2
  rw [Complex.exp_pi_mul_I] at h4
  exact h4 (by simpa using (isAlgebraic_algebraMap (R := ℚ) (A := ℂ) (-1 : ℚ)))

theorem transcendental_pi_sq : Transcendental ℚ ((Real.pi ^ 2 : ℝ) : ℂ) := by
  intro h
  refine transcendental_pi ?_
  refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
  simpa using h

/-! ## 1. The leaf has no `k`-content: it is its own `k = 1` slice -/

/-- The `k = 1` slice of the arithmetic normal form. -/
def RealLogQuadraticOne : Prop :=
  ∀ t : ℝ, t ≠ 0 → IsAlgebraic ℚ ((Real.exp t : ℝ) : ℂ) →
    Transcendental ℚ (((t ^ 2 + Real.pi ^ 2 : ℝ) : ℂ))

private theorem natAbs_cast_sq (k : ℤ) : ((k.natAbs : ℝ)) ^ 2 = (k : ℝ) ^ 2 := by
  rw [Nat.cast_natAbs, Int.cast_abs, sq_abs]

theorem realLogQuadratic_iff_one : RealLogQuadratic ↔ RealLogQuadraticOne := by
  constructor
  · intro h t ht hexp
    simpa using h t 1 ht one_ne_zero hexp
  · intro h t k ht hk hexp halg
    set n : ℕ := k.natAbs with hn
    have hn0 : 0 < n := Int.natAbs_pos.mpr hk
    have hnR : (0 : ℝ) < (n : ℝ) := by exact_mod_cast hn0
    have hkR : (k : ℝ) ≠ 0 := Int.cast_ne_zero.mpr hk
    have hkQ : (k : ℚ) ≠ 0 := Int.cast_ne_zero.mpr hk
    have hnk : ((n : ℝ)) ^ 2 = (k : ℝ) ^ 2 := by rw [hn]; exact natAbs_cast_sq k
    set s : ℝ := t / (n : ℝ) with hs
    have hs0 : s ≠ 0 := div_ne_zero ht (ne_of_gt hnR)
    have hsexp : IsAlgebraic ℚ ((Real.exp s : ℝ) : ℂ) := by
      refine IsAlgebraic.of_pow (n := n) hn0 ?_
      have hpow : ((Real.exp s : ℝ) : ℂ) ^ n = ((Real.exp t : ℝ) : ℂ) := by
        rw [← Complex.ofReal_pow, ← Real.exp_nat_mul]
        congr 1
        rw [hs]
        field_simp
      rw [hpow]; exact hexp
    have hsq : s ^ 2 = t ^ 2 / (k : ℝ) ^ 2 := by
      rw [hs, div_pow, hnk]
    have hcoef : ((s ^ 2 + Real.pi ^ 2 : ℝ) : ℂ)
        = (((1 / (k : ℚ) ^ 2 : ℚ) : ℂ)) * ((t ^ 2 + (k : ℝ) ^ 2 * Real.pi ^ 2 : ℝ) : ℂ) := by
      rw [← Complex.ofReal_ratCast, ← Complex.ofReal_mul]
      congr 1
      rw [hsq]
      push_cast
      field_simp
    have hrat : IsAlgebraic ℚ (((1 / (k : ℚ) ^ 2 : ℚ) : ℂ)) := by
      have h := isAlgebraic_algebraMap (R := ℚ) (A := ℂ) ((1 : ℚ) / (k : ℚ) ^ 2)
      rwa [show (algebraMap ℚ ℂ) ((1 : ℚ) / (k : ℚ) ^ 2)
        = (((1 / (k : ℚ) ^ 2 : ℚ) : ℂ)) from rfl] at h
    have : IsAlgebraic ℚ ((s ^ 2 + Real.pi ^ 2 : ℝ) : ℂ) := by
      rw [hcoef]; exact hrat.mul halg
    exact h s hs0 hsexp this

/-- The open leaf is equivalent to its `k = 1` slice: for every non-zero real logarithm `t` of an
algebraic number, `t² + π²` is transcendental.  Equivalently: the principal logarithm of a
negative algebraic number of modulus `≠ 1` has transcendental modulus. -/
theorem leaf_iff_one : DiazExpRealGeneric ↔ RealLogQuadraticOne :=
  leaf_iff_realLogQuadratic.trans realLogQuadratic_iff_one

/-! ## 2. The quantisation family is vacuous on this leaf -/

/-- `exp v / conj (exp v)` is a root of unity of order dividing `m` exactly when `m · Im v ∈ πℤ`.
This is the hypothesis of `Diaz.order_quantisation`, unwrapped. -/
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

private theorem ratMul_re (q : ℚ) (u : ℂ) : ((q : ℂ) * u).re = (q : ℝ) * u.re := by
  simp [Complex.mul_re]

private theorem ratMul_im (q : ℚ) (u : ℂ) : ((q : ℂ) * u).im = (q : ℝ) * u.im := by
  simp [Complex.mul_im]

/-- **The quantisation bound carries no arithmetic information on this leaf.**
For a point `u` of the line `Im = kπ` with `k ≠ 0`, the conclusion of `Diaz.order_quantisation`,
asserted at *every* non-zero rational multiple of `u` and for *every* admissible order `m`, is
equivalent to the single hypothesis `Re u ≠ 0`.  No algebraicity is used in either direction, so
the whole quantisation family — applied across the entire `ℚ`-orbit — is exactly as strong as
`Re u ≠ 0` and no stronger. -/
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
      rw [ratMul_re, hre, mul_zero]
    have him' : ((((1 : ℚ) / (k : ℚ) : ℚ) : ℂ) * u).im = Real.pi := by
      rw [ratMul_im, him]
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
    have hyv : y = (q : ℝ) * ((k : ℝ) * Real.pi) := by rw [hy, ratMul_im, him]
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
      have : ((q : ℂ) * u).re = (q : ℝ) * u.re := ratMul_re q u
      rw [this]
      positivity
    rw [Complex.normSq_apply]
    nlinarith [hysq, hrepos]

/-! ## 3. The period plane of a leaf candidate contains no new candidate -/

private theorem isAlgebraic_ratCast (q : ℚ) : IsAlgebraic ℚ ((q : ℂ)) := by
  have h := isAlgebraic_algebraMap (R := ℚ) (A := ℂ) q
  rwa [show (algebraMap ℚ ℂ) q = ((q : ℂ)) from rfl] at h

private theorem sub_conj_eq (v : ℂ) : v - conj v = ((2 * v.im : ℝ) : ℂ) * Complex.I := by
  refine Complex.ext ?_ ?_
  · simp
  · simp
    ring

/-- The classification form of `Diaz.period_plane_norm`: on the real plane spanned by `u` and
`conj u`, the squared modulus is `(a+b)²‖u‖² − 4ab (Im u)²`. -/
theorem normSq_plane (a b : ℝ) (u : ℂ) :
    Complex.normSq (((a : ℝ) : ℂ) * u + ((b : ℝ) : ℂ) * conj u)
      = (a + b) ^ 2 * Complex.normSq u - 4 * a * b * u.im ^ 2 := by
  simp only [Complex.normSq_apply, Complex.add_re, Complex.add_im, Complex.mul_re,
    Complex.mul_im, Complex.conj_re, Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im]
  ring

/-- **No point of the plane `ℚu ⊕ ℚ·conj u` other than a rational multiple of `u` or of `conj u`
has algebraic modulus.**  On this leaf that plane contains the period `2πi` and the real
logarithm `Re u`, so this says exactly that the period translates of a candidate are not
candidates. -/
theorem plane_normSq_algebraic_iff {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (a b : ℚ) :
    IsAlgebraic ℚ ((Complex.normSq (((a : ℚ) : ℂ) * u + ((b : ℚ) : ℂ) * conj u) : ℝ) : ℂ)
      ↔ a = 0 ∨ b = 0 := by
  have hcastA : (((a : ℚ) : ℂ)) = (((a : ℝ) : ℂ)) := by push_cast; ring
  have hcastB : (((b : ℚ) : ℂ)) = (((b : ℝ) : ℂ)) := by push_cast; ring
  have hkeyR : Complex.normSq (((a : ℚ) : ℂ) * u + ((b : ℚ) : ℂ) * conj u)
      = ((a : ℝ) + (b : ℝ)) ^ 2 * Complex.normSq u
        - 4 * (a : ℝ) * (b : ℝ) * (k : ℝ) ^ 2 * Real.pi ^ 2 := by
    rw [hcastA, hcastB, normSq_plane, him]
    ring
  have hkey : ((Complex.normSq (((a : ℚ) : ℂ) * u + ((b : ℚ) : ℂ) * conj u) : ℝ) : ℂ)
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
    apply transcendental_pi_sq
    set q : ℚ := 4 * a * b * (k : ℚ) ^ 2 with hqdef
    have hq0 : q ≠ 0 := by
      rw [hqdef]
      exact mul_ne_zero (mul_ne_zero (mul_ne_zero (by norm_num) ha) hb)
        (pow_ne_zero 2 (Int.cast_ne_zero.mpr hk))
    have h1 : IsAlgebraic ℚ (((q : ℚ) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ)) := by
      have hrw : ((q : ℚ) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ)
          = ((((a + b) ^ 2 : ℚ)) : ℂ) * ((Complex.normSq u : ℝ) : ℂ)
            - ((Complex.normSq (((a : ℚ) : ℂ) * u + ((b : ℚ) : ℂ) * conj u) : ℝ) : ℂ) := by
        rw [hkey, hqdef]
        ring
      rw [hrw]
      exact IsAlgebraic.sub (IsAlgebraic.mul (isAlgebraic_ratCast _) hn) halg
    have h2 : ((Real.pi ^ 2 : ℝ) : ℂ)
        = ((q⁻¹ : ℚ) : ℂ) * (((q : ℚ) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ)) := by
      rw [← mul_assoc, ← Rat.cast_mul, inv_mul_cancel₀ hq0, Rat.cast_one, one_mul]
    rw [h2]
    exact IsAlgebraic.mul (isAlgebraic_ratCast _) h1
  · intro h
    have hz : (((4 * a * b * (k : ℚ) ^ 2 : ℚ)) : ℂ) = 0 := by
      rcases h with h | h <;> subst h <;> push_cast <;> ring
    rw [hkey, hz, zero_mul, sub_zero]
    exact IsAlgebraic.mul (isAlgebraic_ratCast _) hn

/-- The two exceptional points of the period plane are the rational multiples of `u` and of
`conj u` themselves: adding the period `2πγi` to `a·u + b·conj u` lands back on the locus only
for `γ = -ak` (giving `(a+b)·conj u`) or `γ = bk` (giving `(a+b)·u`). -/
theorem period_plane_classification {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (a b γ : ℚ) :
    IsAlgebraic ℚ ((Complex.normSq (((a : ℚ) : ℂ) * u + ((b : ℚ) : ℂ) * conj u
        + 2 * ((Real.pi : ℝ) : ℂ) * ((γ : ℚ) : ℂ) * Complex.I) : ℝ) : ℂ)
      ↔ (γ = -(a * (k : ℚ)) ∨ γ = b * (k : ℚ)) := by
  have hkQ : ((k : ℚ)) ≠ 0 := Int.cast_ne_zero.mpr hk
  have hper : ((a : ℚ) : ℂ) * u + ((b : ℚ) : ℂ) * conj u
      + 2 * ((Real.pi : ℝ) : ℂ) * ((γ : ℚ) : ℂ) * Complex.I
      = (((a + γ / (k : ℚ) : ℚ)) : ℂ) * u + (((b - γ / (k : ℚ) : ℚ)) : ℂ) * conj u := by
    have hs : u - conj u = ((2 * ((k : ℝ) * Real.pi) : ℝ) : ℂ) * Complex.I := by
      rw [sub_conj_eq, him]
    have hexp : (((a + γ / (k : ℚ) : ℚ)) : ℂ) * u + (((b - γ / (k : ℚ) : ℚ)) : ℂ) * conj u
        = ((a : ℚ) : ℂ) * u + ((b : ℚ) : ℂ) * conj u
          + (((γ / (k : ℚ) : ℚ)) : ℂ) * (u - conj u) := by
      push_cast
      ring
    rw [hexp, hs]
    push_cast
    field_simp
  rw [hper, plane_normSq_algebraic_iff hk him hn]
  constructor
  · rintro (h | h)
    · left
      have h2 : γ / (k : ℚ) = -a := by linarith
      rw [div_eq_iff hkQ] at h2
      linarith
    · right
      have h2 : γ / (k : ℚ) = b := by linarith
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

/-! ## 4. Two-point fibres on the leaf are conjugate pairs -/

/-- **The only period translate of a `ℚ`-multiple of a leaf candidate that stays on the locus is
its own complex conjugate**, and the common exponential value is then real.  Consequently
`Diaz.fibre_at_most_two` is saturated by the trivial pair `{v, conj v}`, and
`Diaz.nonreal_two_point_fibre_pi_sq`, whose hypothesis asks for a two-point fibre over a
*non-real* algebraic value, has no instance anywhere on the `ℚ`-orbit of a leaf candidate. -/
theorem fibre_second_point_is_conj {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (q : ℚ) (n : ℤ) (hn0 : n ≠ 0)
    (halg : IsAlgebraic ℚ ((Complex.normSq (((q : ℚ) : ℂ) * u
        + 2 * ((Real.pi : ℝ) : ℂ) * (((n : ℚ)) : ℂ) * Complex.I) : ℝ) : ℂ)) :
    q * (k : ℚ) = -(n : ℚ)
      ∧ ((q : ℚ) : ℂ) * u + 2 * ((Real.pi : ℝ) : ℂ) * (((n : ℚ)) : ℂ) * Complex.I
          = conj (((q : ℚ) : ℂ) * u)
      ∧ (Complex.exp (((q : ℚ) : ℂ) * u)).im = 0 := by
  have hcl := (period_plane_classification hk him hn q 0 (n : ℚ)).mp (by simpa using halg)
  have hqk : q * (k : ℚ) = -(n : ℚ) := by
    rcases hcl with h | h
    · linarith
    · simp at h
      exact absurd (by exact_mod_cast h : (n : ℤ) = 0) hn0
  refine ⟨hqk, ?_, ?_⟩
  · have hs : u - conj u = ((2 * ((k : ℝ) * Real.pi) : ℝ) : ℂ) * Complex.I := by
      rw [sub_conj_eq, him]
    have hnk : ((n : ℚ) : ℂ) = -(((q : ℚ) : ℂ) * ((k : ℚ) : ℂ)) := by
      have h := congrArg (fun x : ℚ => ((x : ℂ))) hqk
      simp only [Rat.cast_mul, Rat.cast_neg] at h
      linear_combination h
    have hkc : (((k : ℚ)) : ℂ) = ((k : ℤ) : ℂ) := by push_cast; ring
    rw [hnk, hkc]
    have hconj : conj (((q : ℚ) : ℂ) * u) = ((q : ℚ) : ℂ) * conj u := by
      simp
    rw [hconj]
    have : ((q : ℚ) : ℂ) * u - ((q : ℚ) : ℂ) * conj u
        = ((q : ℚ) : ℂ) * (((2 * ((k : ℝ) * Real.pi) : ℝ) : ℂ) * Complex.I) := by
      rw [← mul_sub, hs]
    have h2 := this
    push_cast at h2 ⊢
    linear_combination h2
  · have him2 : (((q : ℚ) : ℂ) * u).im = -((n : ℝ) * Real.pi) := by
      rw [ratMul_im, him]
      have : (q : ℝ) * (k : ℝ) = -(n : ℝ) := by exact_mod_cast hqk
      rw [← mul_assoc, this]
      ring
    rw [Complex.exp_im, him2]
    have : Real.sin (-((n : ℝ) * Real.pi)) = 0 := by
      rw [Real.sin_neg, Real.sin_int_mul_pi]
      ring
    rw [this, mul_zero]

/-! ## 5. Two counterexamples would settle a different open problem -/

/-- **Rigidity of the counterexample set.**  If the `k = 1` slice fails at `t₁` and at `t₂`, then
`log β₁β₂ = t₁ + t₂` and `log (β₁/β₂) = t₁ - t₂` are two *real* logarithms of algebraic numbers
whose product `t₁² − t₂²` is algebraic — and non-zero as soon as `t₁² ≠ t₂²`.  So the leaf can
fail at two multiplicatively independent points only if the (open) question "is the product of
two `ℚ`-linearly independent real logarithms of algebraic numbers transcendental?" has a negative
answer.  Nothing here proves the leaf; it bounds how badly it could fail. -/
theorem two_failures_give_algebraic_log_product {t₁ t₂ : ℝ}
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
  · have e₁' : ((Real.exp t₁ : ℝ) : ℂ) ∈ DiazModulus.Qbar := DiazModulus.mem_Qbar_iff.mpr e₁
    have e₂' : ((Real.exp t₂ : ℝ) : ℂ) ∈ DiazModulus.Qbar := DiazModulus.mem_Qbar_iff.mpr e₂
    rw [Real.exp_sub, Complex.ofReal_div]
    exact DiazModulus.mem_Qbar_iff.mp (Subfield.div_mem _ e₁' e₂')
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

/-- **Multiplicative rigidity of the counterexample set.**  If the `k = 1` slice fails at `t₁`
and at `t₂ = r·t₁` for a rational `r`, then `r = ±1`.  So no rational multiple of a
counterexample other than `±` itself is a counterexample: distinct counterexample classes are
multiplicatively independent, and by `two_failures_give_algebraic_log_product` each such pair
produces two `ℚ`-linearly independent *real* logarithms of algebraic numbers with non-zero
algebraic product. -/
theorem failure_rational_multiple_rigid {t₁ t₂ : ℝ} (ht₁ : t₁ ≠ 0)
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
  -- `(1 − r²) t₁²` is algebraic, hence so is `t₁²`, hence so is `t₁`
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
    exact IsAlgebraic.mul (isAlgebraic_ratCast _) hdiff
  have ht₁alg : IsAlgebraic ℚ (((t₁ : ℝ)) : ℂ) := by
    refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
    rwa [← Complex.ofReal_pow]
  have ht₁ne : ((t₁ : ℝ) : ℂ) ≠ 0 := by
    simpa using ht₁
  have := solution _ ht₁ne ht₁alg
  rw [← Complex.ofReal_exp] at this
  exact this e₁

end DiazLeaf2
