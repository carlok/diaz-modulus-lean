import Solutions.DZ_LEAF2_normalform
import Solutions.DZ_POLAR2_work

open ComplexConjugate

/-!
# Axiom check for the polar-coordinates import

`DZ_POLAR2_work` cites four **already-Proved** platform nodes through their local `Theorems/Thm_*`
stubs, which carry `sorry`; so its own `#print axioms` shows `sorryAx`.  This file discharges all
four locally, with clean axioms, which is what makes the nine proofs sorry-free once the platform
substitutes the real proofs.
-/

/-- `Diaz.period_plane_norm` (`6319618f`, Proved), re-proved here. -/
theorem polar2_chk_period_plane_norm (u : ℂ) (a b c : ℝ) :
    Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u + 2 * (Real.pi : ℂ) * (c : ℂ) * Complex.I)
      = (a + b) ^ 2 * Complex.normSq u
        + 4 * (a * u.im + Real.pi * c) * (Real.pi * c - b * u.im) := by
  simp [Complex.normSq_apply, Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.conj_re, Complex.conj_im, Complex.I_re, Complex.I_im, Complex.ofReal_re,
    Complex.ofReal_im]
  ring

private theorem polar2_chk_zpow {z : ℂ} (h : IsAlgebraic ℚ z) (m : ℤ) :
    IsAlgebraic ℚ (z ^ m) := by
  rcases Int.natAbs_eq m with hm | hm
  · rw [hm, zpow_natCast]; exact h.pow _
  · rw [hm, zpow_neg, zpow_natCast]; exact (h.pow _).inv

/-- `Diaz.exp_ratMul_isAlgebraic` (`177f92bd`, Proved), re-proved here. -/
theorem polar2_chk_exp_ratMul {u : ℂ} (hexp : IsAlgebraic ℚ (Complex.exp u)) (a : ℚ) :
    IsAlgebraic ℚ (Complex.exp ((a : ℂ) * u)) := by
  refine IsAlgebraic.of_pow (n := a.den) a.pos ?_
  have hden : ((a.den : ℂ)) ≠ 0 := Nat.cast_ne_zero.mpr a.den_nz
  have hq : ((a.den : ℂ)) * (a : ℂ) = ((a.num : ℂ)) := by
    rw [Rat.cast_def]
    field_simp
  have hpow : (Complex.exp ((a : ℂ) * u)) ^ a.den = (Complex.exp u) ^ (a.num : ℤ) := by
    rw [← Complex.exp_nat_mul, ← Complex.exp_int_mul, ← mul_assoc, hq]
  rw [hpow]
  exact polar2_chk_zpow hexp _

/-- `DiazModulus.pi_transcendental` (`e1503dd8`, Proved), re-proved on the mission. -/
theorem polar2_chk_pi : Transcendental ℚ ((Real.pi : ℝ) : ℂ) :=
  DiazLeaf2.transcendental_pi

/-- `DiazModulus.hermite_lindemann_holds` (`fdc68131`, Proved), re-proved on the mission. -/
theorem polar2_chk_hl : DiazModulus.HermiteLindemann := solution

#print axioms polar2_chk_period_plane_norm
#print axioms polar2_chk_exp_ratMul
#print axioms polar2_chk_pi
#print axioms polar2_chk_hl

/-! The nine results themselves, in their self-contained form. -/

#print axioms DiazLeaf2.transcendental_pi_sq
#print axioms DiazLeaf2.exp_ratio_pow_eq_one_iff
#print axioms DiazLeaf2.quantisation_orbit_iff_re_ne_zero
#print axioms DiazLeaf2.plane_normSq_algebraic_iff
#print axioms DiazLeaf2.period_plane_classification
#print axioms DiazLeaf2.fibre_second_point_is_conj
#print axioms DiazLeaf2.two_failures_give_algebraic_log_product
#print axioms DiazLeaf2.failure_rational_multiple_rigid
#print axioms DiazLeaf2.leaf_iff_one
