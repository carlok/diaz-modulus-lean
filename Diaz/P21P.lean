/-
# The quantisation batch

Backups of seven Prove2Me nodes proved together, all of them statements
about a candidate's imaginary part and the lattice it is forced into:

* `q_translate_unique` --- at most one rational translate `u + 2πri` of a
  candidate can keep the modulus algebraic, so the fibre argument has a
  unique representative to work with.
* `order_quantisation`, `torsion_dichotomy` --- the phase `e^u / conj(e^u)`
  is either a root of unity of some exact order, quantising the imaginary
  part further, or it is not a root of unity at all.
* `period_plane_norm`, `indep_of_algebraic_product`, `no_holo_stab`
* `noquad_aux` --- the reusable step: a transcendental element satisfies no
  non-trivial quadratic over the base.

`real_quantisation` is proved in the same batch upstream and lives in
`Diaz.Quantisation` here.
-/
import Mathlib

open Complex ComplexConjugate

namespace Diaz

/-- Auxiliary: a transcendental element satisfies no non-trivial quadratic over the base. -/
private theorem noquad_aux {K : Subfield ℂ} {p : ℂ} (hp : Transcendental K p)
    {a b c : ℂ} (ha : a ∈ K) (hb : b ∈ K) (hc : c ∈ K)
    (h : a * p ^ 2 + b * p + c = 0) : a = 0 ∧ b = 0 ∧ c = 0 := by
  classical
  rw [transcendental_iff_injective] at hp
  have hP : (Polynomial.C (⟨a, ha⟩ : K) * Polynomial.X ^ 2
      + Polynomial.C (⟨b, hb⟩ : K) * Polynomial.X
      + Polynomial.C (⟨c, hc⟩ : K) : Polynomial K) = 0 := by
    apply hp
    simp only [map_add, map_mul, map_pow, Polynomial.aeval_C, Polynomial.aeval_X, map_zero]
    exact_mod_cast h
  have h2 := congrArg (fun q => Polynomial.coeff q 2) hP
  have h1 := congrArg (fun q => Polynomial.coeff q 1) hP
  have h0 := congrArg (fun q => Polynomial.coeff q 0) hP
  simp [Polynomial.coeff_add, Polynomial.coeff_C, Polynomial.coeff_C_mul,
    Polynomial.coeff_X] at h2 h1 h0
  exact ⟨congrArg Subtype.val h2, congrArg Subtype.val h1, congrArg Subtype.val h0⟩

theorem torsion_dichotomy (u : ℂ) :
    (∃ q : ℚ, u.im = (q : ℝ) * Real.pi) ↔
      ∃ k : ℕ, 0 < k ∧ ∃ t : ℝ, 0 < t ∧ Complex.exp u ^ k = (t : ℂ) := by
  constructor
  · rintro ⟨q, hq⟩
    have hd0 : ((q.den : ℝ)) ≠ 0 := Nat.cast_ne_zero.mpr q.den_nz
    have hR : 2 * (q.den : ℝ) * u.im = 2 * (q.num : ℝ) * Real.pi := by
      rw [hq, Rat.cast_def]; field_simp
    refine ⟨2 * q.den, by positivity, Real.exp (2 * (q.den : ℝ) * u.re), Real.exp_pos _, ?_⟩
    rw [← Complex.exp_nat_mul]
    have key : ((2 * q.den : ℕ) : ℂ) * u
        = ((2 * (q.den : ℝ) * u.re : ℝ) : ℂ) + (q.num : ℂ) * (2 * (Real.pi : ℂ) * Complex.I) := by
      apply Complex.ext
      · simp
      · simp
        linarith [hR]
    have hone : Complex.exp ((q.num : ℂ) * (2 * (Real.pi : ℂ) * Complex.I)) = 1 :=
      Complex.exp_eq_one_iff.mpr ⟨q.num, rfl⟩
    rw [key, Complex.exp_add, hone, mul_one, ← Complex.ofReal_exp]
  · rintro ⟨k, hk, t, ht, hkt⟩
    rw [← Complex.exp_nat_mul] at hkt
    have him : (Complex.exp ((k : ℂ) * u)).im = 0 := by rw [hkt]; simp
    rw [Complex.exp_im] at him
    have hs : Real.sin (((k : ℂ) * u).im) = 0 := by
      rcases mul_eq_zero.mp him with h | h
      · exact absurd h (Real.exp_ne_zero _)
      · exact h
    have hkim : ((k : ℂ) * u).im = (k : ℝ) * u.im := by simp
    rw [hkim] at hs
    obtain ⟨n, hn⟩ := Real.sin_eq_zero_iff.mp hs
    have hk0 : ((k : ℝ)) ≠ 0 := Nat.cast_ne_zero.mpr (by omega)
    refine ⟨(n : ℚ) / (k : ℚ), ?_⟩
    have hcast : (((n : ℚ) / (k : ℚ) : ℚ) : ℝ) = (n : ℝ) / (k : ℝ) := by push_cast; ring
    rw [hcast]
    field_simp
    linarith [hn]

theorem order_quantisation {u : ℂ} {m : ℕ} (hm : 0 < m)
    (hξ : (Complex.exp u / conj (Complex.exp u)) ^ m = 1)
    (hre : u.re ≠ 0) (him : u.im ≠ 0) :
    Real.pi ^ 2 / (m : ℝ) ^ 2 < Complex.normSq u := by
  have hconj : conj (Complex.exp u) = Complex.exp (conj u) := (Complex.exp_conj u).symm
  rw [hconj, ← Complex.exp_sub, ← Complex.exp_nat_mul] at hξ
  obtain ⟨n, hn⟩ := Complex.exp_eq_one_iff.mp hξ
  rw [Complex.sub_conj] at hn
  have hIne : (Complex.I : ℂ) ≠ 0 := Complex.I_ne_zero
  have h2 : ((m : ℂ) * (((2 * u.im : ℝ)) : ℂ)) * Complex.I
      = ((n : ℂ) * (2 * (Real.pi : ℂ))) * Complex.I := by linear_combination hn
  have h3 := mul_right_cancel₀ hIne h2
  have hnR : (m : ℝ) * u.im = (n : ℝ) * Real.pi := by
    have hcc : ((((m : ℝ)) * u.im : ℝ) : ℂ) = ((((n : ℝ)) * Real.pi : ℝ) : ℂ) := by
      push_cast at h3 ⊢; linear_combination h3 / 2
    exact_mod_cast hcc
  have hm0 : (0 : ℝ) < (m : ℝ) := by exact_mod_cast hm
  have hn0 : n ≠ 0 := by
    rintro rfl
    simp only [Int.cast_zero, zero_mul] at hnR
    rcases mul_eq_zero.mp hnR with h | h
    · exact absurd h (ne_of_gt hm0)
    · exact him h
  have h1 : (1 : ℝ) ≤ |(n : ℝ)| := by
    have : (1 : ℤ) ≤ |n| := Int.one_le_abs (by omega)
    exact_mod_cast this
  have hpi : (0 : ℝ) < Real.pi := Real.pi_pos
  have habs : Real.pi / (m : ℝ) ≤ |u.im| := by
    have hmul : (m : ℝ) * |u.im| = |(n : ℝ)| * Real.pi := by
      rw [← abs_of_pos hm0, ← abs_mul, hnR, abs_mul, abs_of_pos hpi]
    rw [div_le_iff₀ hm0, mul_comm]
    nlinarith
  have hsq : (Real.pi / (m : ℝ)) ^ 2 ≤ u.im ^ 2 := by
    have h0 : (0 : ℝ) ≤ Real.pi / (m : ℝ) := by positivity
    nlinarith [sq_abs u.im, abs_nonneg u.im]
  have hre2 : 0 < u.re ^ 2 := by positivity
  have hdp : Real.pi ^ 2 / (m : ℝ) ^ 2 = (Real.pi / (m : ℝ)) ^ 2 := (div_pow _ _ 2).symm
  rw [hdp, Complex.normSq_apply]
  nlinarith

theorem q_translate_unique {K : Subfield ℂ} {u : ℂ}
    (hρ : u * conj u ∈ K) (hπ : ((Real.pi : ℂ)) ^ 2 ∉ K)
    {r r' : ℚ} (hr : r ≠ 0) (hr' : r' ≠ 0)
    (h : (u + 2 * (Real.pi : ℂ) * (r : ℂ) * Complex.I)
          * conj (u + 2 * (Real.pi : ℂ) * (r : ℂ) * Complex.I) ∈ K)
    (h' : (u + 2 * (Real.pi : ℂ) * (r' : ℂ) * Complex.I)
          * conj (u + 2 * (Real.pi : ℂ) * (r' : ℂ) * Complex.I) ∈ K) :
    r = r' := by
  set Z : ℂ := 2 * (Real.pi : ℂ) * Complex.I * (conj u - u) with hZdef
  have e : ∀ s : ℚ, (u + 2 * (Real.pi : ℂ) * (s : ℂ) * Complex.I)
      * conj (u + 2 * (Real.pi : ℂ) * (s : ℂ) * Complex.I)
      = u * conj u + (s : ℂ) * (Z + 4 * (Real.pi : ℂ) ^ 2 * (s : ℂ)) := by
    intro s
    have hI : Complex.I ^ 2 = -1 := Complex.I_sq
    simp only [map_add, map_mul, map_ofNat, Complex.conj_ofReal, Complex.conj_I,
      map_ratCast, hZdef]
    linear_combination (-4 * (Real.pi : ℂ) ^ 2 * (s : ℂ) ^ 2) * hI
  rw [e r] at h
  rw [e r'] at h'
  have step : ∀ s : ℚ, s ≠ 0 →
      (s : ℂ) * (Z + 4 * (Real.pi : ℂ) ^ 2 * (s : ℂ)) + u * conj u ∈ K →
      Z + 4 * (Real.pi : ℂ) ^ 2 * (s : ℂ) ∈ K := by
    intro s hs hm
    have hm2 : (s : ℂ) * (Z + 4 * (Real.pi : ℂ) ^ 2 * (s : ℂ)) ∈ K := by
      have := sub_mem hm hρ
      simpa using this
    have hinv : ((s⁻¹ : ℚ) : ℂ) ∈ K := SubfieldClass.ratCast_mem K _
    have hmul := mul_mem hinv hm2
    have hs' : ((s : ℂ)) ≠ 0 := by exact_mod_cast hs
    rwa [show ((s⁻¹ : ℚ) : ℂ) * ((s : ℂ) * (Z + 4 * (Real.pi : ℂ) ^ 2 * (s : ℂ)))
        = Z + 4 * (Real.pi : ℂ) ^ 2 * (s : ℂ) by push_cast; field_simp] at hmul
  have k1 : Z + 4 * (Real.pi : ℂ) ^ 2 * (r : ℂ) ∈ K := step r hr (by rw [add_comm] at h; exact h)
  have k2 : Z + 4 * (Real.pi : ℂ) ^ 2 * (r' : ℂ) ∈ K :=
    step r' hr' (by rw [add_comm] at h'; exact h')
  by_contra hne
  have hd : ((r : ℂ)) - ((r' : ℂ)) ≠ 0 := by
    simp only [sub_ne_zero]
    exact_mod_cast hne
  have hdiff : 4 * (Real.pi : ℂ) ^ 2 * ((r : ℂ) - (r' : ℂ)) ∈ K := by
    have := sub_mem k1 k2
    convert this using 1
    ring
  have hc : (((4 * (r - r'))⁻¹ : ℚ) : ℂ) ∈ K := SubfieldClass.ratCast_mem K _
  apply hπ
  have hfin := mul_mem hc hdiff
  rwa [show (((4 * (r - r'))⁻¹ : ℚ) : ℂ) * (4 * (Real.pi : ℂ) ^ 2 * ((r : ℂ) - (r' : ℂ)))
      = ((Real.pi : ℂ)) ^ 2 by push_cast; field_simp] at hfin

theorem indep_of_algebraic_product {K : Subfield ℂ} {p ν : ℂ}
    (hp : Transcendental K p) (hβ : p * ν ∈ K) (hβ0 : p * ν ≠ 0)
    {A B C : ℂ} (hA : A ∈ K) (hB : B ∈ K) (hC : C ∈ K)
    (h : A + B * ν + C * p = 0) : A = 0 ∧ B = 0 ∧ C = 0 := by
  have key : C * p ^ 2 + A * p + B * (p * ν) = 0 := by linear_combination p * h
  obtain ⟨h1, h2, h3⟩ := noquad_aux hp hC hA (mul_mem hB hβ) key
  refine ⟨h2, ?_, h1⟩
  rcases mul_eq_zero.mp h3 with hb | hpv
  · exact hb
  · exact absurd hpv hβ0

theorem period_plane_norm (u : ℂ) (a b c : ℝ) :
    Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u + 2 * (Real.pi : ℂ) * (c : ℂ) * Complex.I)
      = (a + b) ^ 2 * Complex.normSq u
        + 4 * (a * u.im + Real.pi * c) * (Real.pi * c - b * u.im) := by
  simp [Complex.normSq_apply, Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.conj_re, Complex.conj_im, Complex.I_re, Complex.I_im, Complex.ofReal_re,
    Complex.ofReal_im]
  ring

theorem no_holo_stab {K : Subfield ℂ} {z : ℂ} (hz : Transcendental K z)
    {a b c d : ℂ} (ha : a ∈ K) (hb : b ∈ K) (hc : c ∈ K) (hd : d ∈ K)
    (hden : c * z + d ≠ 0) (h : (a * z + b) / (c * z + d) = z) :
    c = 0 ∧ b = 0 ∧ a = d := by
  have h' : a * z + b = z * (c * z + d) := by
    rw [div_eq_iff hden] at h
    linear_combination h
  have key : c * z ^ 2 + (d - a) * z + (-b) = 0 := by linear_combination -h'
  obtain ⟨h1, h2, h3⟩ := noquad_aux hz hc (sub_mem hd ha) (neg_mem hb) key
  exact ⟨h1, neg_eq_zero.mp h3, (sub_eq_zero.mp h2).symm⟩


end Diaz
