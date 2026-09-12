/-
# Distance from a candidate to a non-zero algebraic point

Backup of `DiazModulus.candidate_distance_transcendental`
(`2ccd6ba0-97b2-4e09-8a47-2102927ddcf9`), Prove2Me node of mission
`3045e100-83a7-4863-9c02-21f90105f182`, Proved 2026-09-12.

For a candidate `u` and every non-zero algebraic `a`, the distance `|u - a|`
is transcendental. The argument reduces to the cheap line exclusion
`candidate_no_real_algebraic_line` via the polarization identity
`2 Re(conj(a)·u) = |u|² + |a|² - |u-a|²`.
-/
import Mathlib
import Diaz.CheapLine

open Complex ComplexConjugate

namespace Diaz

private lemma nsq_ofReal (z : ℂ) : ((‖z‖ : ℝ) : ℂ) ^ 2 = z * conj z := by
  calc ((‖z‖ : ℝ) : ℂ) ^ 2
      = ((‖z‖ ^ 2 : ℝ) : ℂ) := by rw [ofReal_pow]
    _ = (Complex.normSq z : ℂ) := by rw [Complex.normSq_eq_norm_sq]
    _ = z * conj z := by rw [Complex.mul_conj]

private lemma two_mul_re (z : ℂ) : (2 : ℂ) * ((z.re : ℝ) : ℂ) = z + conj z := by
  apply Complex.ext
  · simp [Complex.mul_re, Complex.add_re, Complex.conj_re]; ring
  · simp [Complex.mul_im, Complex.add_im, Complex.conj_im]

private lemma two_mul_im_I (a : ℂ) :
    (2 : ℂ) * ((a.im : ℝ) : ℂ) * I = a - conj a := by
  apply Complex.ext
  · simp [Complex.mul_re, Complex.mul_im, Complex.sub_re, Complex.conj_re, I]
  · simp [Complex.mul_re, Complex.mul_im, Complex.sub_im, Complex.conj_im, I]; ring

private lemma re_as_coords (a u : ℂ) :
    (((conj a * u).re : ℝ) : ℂ) =
      ((a.re : ℝ) : ℂ) * ((u.re : ℝ) : ℂ) + ((a.im : ℝ) : ℂ) * ((u.im : ℝ) : ℂ) := by
  simp [Complex.mul_re, Complex.conj_re, Complex.conj_im]

private lemma dist_line_identity (u a : ℂ) :
    ((‖u‖ : ℝ) : ℂ) ^ 2 + ((‖a‖ : ℝ) : ℂ) ^ 2 - ((‖u - a‖ : ℝ) : ℂ) ^ 2 =
      (2 : ℂ) * (((conj a * u).re : ℝ) : ℂ) := by
  have hconj_prod : conj (u * conj a) = conj u * a := by
    simp [map_mul]
  have hsum : u * conj a + conj u * a = (2 : ℂ) * (((u * conj a).re : ℝ) : ℂ) := by
    have := two_mul_re (u * conj a)
    rw [← hconj_prod]
    exact this.symm
  have hcomm : (((u * conj a).re : ℝ) : ℂ) = (((conj a * u).re : ℝ) : ℂ) := by
    have : u * conj a = conj a * u := by ring
    simp [this]
  calc
    ((‖u‖ : ℝ) : ℂ) ^ 2 + ((‖a‖ : ℝ) : ℂ) ^ 2 - ((‖u - a‖ : ℝ) : ℂ) ^ 2
        = u * conj u + a * conj a - (u - a) * conj (u - a) := by
          simp only [nsq_ofReal]
    _ = u * conj u + a * conj a -
          (u * conj u - u * conj a - a * conj u + a * conj a) := by
          simp [map_sub]; ring
    _ = u * conj a + a * conj u := by ring
    _ = u * conj a + conj u * a := by ring
    _ = (2 : ℂ) * (((u * conj a).re : ℝ) : ℂ) := hsum
    _ = (2 : ℂ) * (((conj a * u).re : ℝ) : ℂ) := by rw [hcomm]

private lemma ofReal_sq_im (r : ℝ) : ((r : ℂ) ^ 2).im = 0 := by
  rw [← ofReal_pow]
  exact ofReal_im (r ^ 2)

/-- **Distance corollary.** Distance from a Diaz candidate to a non-zero
algebraic point is transcendental. -/
theorem candidate_distance_transcendental {u : ℂ} (hcand : IsCandidate u)
    {a : ℂ} (ha : IsAlgebraic ℚ a) (ha0 : a ≠ 0) :
    Transcendental ℚ ((‖u - a‖ : ℝ) : ℂ) := by
  intro hdist
  have hcand_keep := hcand
  obtain ⟨_hu, hnorm, _hexp⟩ := hcand
  have haconj : IsAlgebraic ℚ (conj a) := isAlgebraic_conj ha
  have haQ : a ∈ Qbar := mem_Qbar_iff.mpr ha
  have haconjQ : conj a ∈ Qbar := mem_Qbar_iff.mpr haconj
  set A : ℂ := ((a.re : ℝ) : ℂ)
  set B : ℂ := ((a.im : ℝ) : ℂ)
  have hA_eq : A = (a + conj a) / 2 := by
    have h2A : (2 : ℂ) * A = a + conj a := by simpa [A] using two_mul_re a
    field_simp
    linear_combination h2A
  have hAQ : IsAlgebraic ℚ A := by
    rw [hA_eq]
    exact mem_Qbar_iff.mp (Subfield.div_mem _
      (Subfield.add_mem _ haQ haconjQ) ((2 : ↥Qbar).property))
  have hB_eq : B = (a - conj a) / (2 * I) := by
    have hBI : (2 : ℂ) * B * I = a - conj a := by simpa [B] using two_mul_im_I a
    field_simp [I_ne_zero]
    linear_combination hBI
  have hBQ : IsAlgebraic ℚ B := by
    rw [hB_eq]
    have I_mem_Qbar : (I : ℂ) ∈ Qbar := by
      rw [mem_Qbar_iff]
      refine ⟨Polynomial.X ^ 2 + Polynomial.C (1 : ℚ),
        Polynomial.X_pow_add_C_ne_zero (by norm_num : (0 : ℕ) < 2) (1 : ℚ), ?_⟩
      simp [Polynomial.aeval_add, Polynomial.aeval_X_pow, I_sq]
    exact mem_Qbar_iff.mp (Subfield.div_mem _
      (Subfield.sub_mem _ haQ haconjQ)
      (Subfield.mul_mem _ ((2 : ↥Qbar).property) I_mem_Qbar))
  have hAim : A.im = 0 := by simp [A]
  have hBim : B.im = 0 := by simp [B]
  have hanorm : IsAlgebraic ℚ ((‖a‖ : ℝ) : ℂ) := by
    have hsq : ((‖a‖ : ℝ) : ℂ) ^ 2 ∈ Qbar := by
      have : ((‖a‖ : ℝ) : ℂ) ^ 2 = a * conj a := nsq_ofReal a
      rw [this]
      exact Subfield.mul_mem _ haQ haconjQ
    exact IsAlgebraic.of_pow (n := 2) (by norm_num) (mem_Qbar_iff.mp hsq)
  set ρu : ℂ := ((‖u‖ : ℝ) : ℂ) ^ 2
  set ρa : ℂ := ((‖a‖ : ℝ) : ℂ) ^ 2
  set ρd : ℂ := ((‖u - a‖ : ℝ) : ℂ) ^ 2
  set C : ℂ := (ρu + ρa - ρd) / 2
  have hCQ : IsAlgebraic ℚ C := by
    have hρu : ρu ∈ Qbar := Subfield.pow_mem _ (mem_Qbar_iff.mpr hnorm) 2
    have hρa : ρa ∈ Qbar := Subfield.pow_mem _ (mem_Qbar_iff.mpr hanorm) 2
    have hρd : ρd ∈ Qbar := Subfield.pow_mem _ (mem_Qbar_iff.mpr hdist) 2
    have hnum : ρu + ρa - ρd ∈ Qbar :=
      Subfield.sub_mem _ (Subfield.add_mem _ hρu hρa) hρd
    exact mem_Qbar_iff.mp (Subfield.div_mem _ hnum ((2 : ↥Qbar).property))
  have hCim : C.im = 0 := by
    have hρu_im : ρu.im = 0 := by simpa [ρu] using ofReal_sq_im ‖u‖
    have hρa_im : ρa.im = 0 := by simpa [ρa] using ofReal_sq_im ‖a‖
    have hρd_im : ρd.im = 0 := by simpa [ρd] using ofReal_sq_im ‖u - a‖
    have : C = ((((ρu.re + ρa.re - ρd.re) / 2) : ℝ) : ℂ) := by
      apply Complex.ext
      · simp [C, Complex.add_re, Complex.sub_re]
      · simp [C, Complex.add_im, Complex.sub_im, hρu_im, hρa_im, hρd_im]
    rw [this]; simp
  have hne : ¬(A = 0 ∧ B = 0) := by
    intro ⟨hA0, hB0⟩
    have ha_decomp : a = A + B * I := by
      apply Complex.ext <;> simp [A, B]
    exact ha0 (by simp [ha_decomp, hA0, hB0])
  have hline :
      A * ((u.re : ℝ) : ℂ) + B * ((u.im : ℝ) : ℂ) = C := by
    have hre : (((conj a * u).re : ℝ) : ℂ) = A * ((u.re : ℝ) : ℂ) + B * ((u.im : ℝ) : ℂ) := by
      simpa [A, B] using re_as_coords a u
    have hid : ρu + ρa - ρd = (2 : ℂ) * (((conj a * u).re : ℝ) : ℂ) := by
      simpa [ρu, ρa, ρd] using dist_line_identity u a
    have hRe_eq_C : (((conj a * u).re : ℝ) : ℂ) = C := by
      have : (2 : ℂ) * (((conj a * u).re : ℝ) : ℂ) = (2 : ℂ) * C := by
        calc (2 : ℂ) * (((conj a * u).re : ℝ) : ℂ)
            = ρu + ρa - ρd := hid.symm
          _ = (2 : ℂ) * C := by
              simp only [C]
              field_simp
      exact mul_left_cancel₀ (two_ne_zero' ℂ) this
    exact hre.symm.trans hRe_eq_C
  exact (candidate_no_real_algebraic_line hcand_keep hAQ hBQ hCQ hAim hBim hCim hne) hline

end Diaz
