/-
Mirrored from Prove2Me: `DiazModulus.exp_two_pi_I_mul_transcendental_of_normSq_rat`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.exp_two_pi_I_mul_transcendental_of_normSq_rat__fe002d5f.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.log_pair_algebraicIndependent_of_mul_eq_rat_pi_sq
import Diaz.Mirror.trdeg_adjoin_le_one_of_isAlgebraic_adjoin

namespace Diaz

open ComplexConjugate

namespace P17_a4

/-! Diaz's property (4-1) when `τ` is algebraic over `ℚ(π)`: a consequence of Proposition 1
(J. Théor. Nombres Bordeaux 9 (1997), p. 238). Write `T = 2πi` and `l₁ = T τ`. If `exp l₁` were
algebraic, Proposition 1 applied to `l₁` and `l₂ = conj l₁` (with `l₁ l₂ = 4 c π²`) would make
`l₁` and `T` algebraically independent over `ℚ`; but both are algebraic over `ℚ[π]`. -/

/-- Complex conjugation as a `ℚ`-algebra map. -/
noncomputable def exp_two_pi_I_mul_transcendental_of_normSq_rat_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

theorem exp_two_pi_I_mul_transcendental_of_normSq_rat_alg_conj {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hp⟩ := h
  refine ⟨p, hp0, ?_⟩
  have : Polynomial.aeval (exp_two_pi_I_mul_transcendental_of_normSq_rat_cjQ z) p = exp_two_pi_I_mul_transcendental_of_normSq_rat_cjQ (Polynomial.aeval z p) :=
    Polynomial.aeval_algHom_apply exp_two_pi_I_mul_transcendental_of_normSq_rat_cjQ z p
  rw [show (conj z : ℂ) = exp_two_pi_I_mul_transcendental_of_normSq_rat_cjQ z from rfl, this, hp, map_zero]

theorem exp_two_pi_I_mul_transcendental_of_normSq_rat_exp_conj_alg {w : ℂ} (hw : IsAlgebraic ℚ (Complex.exp w)) :
    IsAlgebraic ℚ (Complex.exp (conj w)) := by
  rw [Complex.exp_conj]; exact exp_two_pi_I_mul_transcendental_of_normSq_rat_alg_conj hw

theorem pi_ne_zero' : ((Real.pi : ℝ) : ℂ) ≠ 0 :=
  Complex.ofReal_ne_zero.2 Real.pi_ne_zero

theorem exp_two_pi_I_mul_transcendental_of_normSq_rat_T_ne_zero : 2 * ((Real.pi : ℝ) : ℂ) * Complex.I ≠ 0 :=
  mul_ne_zero (mul_ne_zero two_ne_zero pi_ne_zero') Complex.I_ne_zero

/-- `l₁ = 2πiτ` is not a rational multiple of `2πi`, since `τ` is not real. -/
theorem hroot_of_im (τ : ℂ) (hτ : τ.im ≠ 0) (q : ℚ) :
    2 * ((Real.pi : ℝ) : ℂ) * Complex.I * τ ≠
      (q : ℂ) * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I) := by
  intro h
  apply hτ
  have h' : (2 * ((Real.pi : ℝ) : ℂ) * Complex.I) * τ =
      (2 * ((Real.pi : ℝ) : ℂ) * Complex.I) * (q : ℂ) := by
    rw [h]; ring
  rw [mul_left_cancel₀ exp_two_pi_I_mul_transcendental_of_normSq_rat_T_ne_zero h']
  simp

theorem exp_two_pi_I_mul_transcendental_of_normSq_rat_c_ne_zero (τ : ℂ) (hτ : τ.im ≠ 0) (c : ℚ) (hc : τ * conj τ = (c : ℂ)) : c ≠ 0 := by
  intro h0
  apply hτ
  rw [h0, Rat.cast_zero, mul_eq_zero, map_eq_zero, or_self] at hc
  rw [hc]
  simp

theorem conj_T :
    conj (2 * ((Real.pi : ℝ) : ℂ) * Complex.I) = -(2 * ((Real.pi : ℝ) : ℂ) * Complex.I) := by
  rw [map_mul, map_mul, Complex.conj_ofReal, Complex.conj_I, map_ofNat]
  ring

theorem prod_eq (τ : ℂ) (c : ℚ) (hc : τ * conj τ = (c : ℂ)) :
    (2 * ((Real.pi : ℝ) : ℂ) * Complex.I * τ) * conj (2 * ((Real.pi : ℝ) : ℂ) * Complex.I * τ)
      = ((4 * c : ℚ) : ℂ) * ((Real.pi : ℝ) : ℂ) ^ 2 := by
  rw [map_mul conj (2 * ((Real.pi : ℝ) : ℂ) * Complex.I) τ, conj_T]
  have : (2 * ((Real.pi : ℝ) : ℂ) * Complex.I * τ) *
      (-(2 * ((Real.pi : ℝ) : ℂ) * Complex.I) * conj τ)
      = -(4 * Complex.I ^ 2) * ((Real.pi : ℝ) : ℂ) ^ 2 * (τ * conj τ) := by ring
  rw [this, hc, Complex.I_sq]
  push_cast
  ring

/-- The complex numbers algebraic over `ℚ[x]`, as a `ℚ`-subalgebra of `ℂ`. -/
noncomputable def exp_two_pi_I_mul_transcendental_of_normSq_rat_E (x : ℂ) : Subalgebra ℚ ℂ :=
  (Subalgebra.algebraicClosure ↥(Algebra.adjoin ℚ ({x} : Set ℂ)) ℂ).restrictScalars ℚ

theorem exp_two_pi_I_mul_transcendental_of_normSq_rat_mem_E_iff {x z : ℂ} : z ∈ exp_two_pi_I_mul_transcendental_of_normSq_rat_E x ↔ IsAlgebraic ↥(Algebra.adjoin ℚ ({x} : Set ℂ)) z :=
  Iff.rfl

theorem exp_two_pi_I_mul_transcendental_of_normSq_rat_mem_E_of_alg {x z : ℂ} (h : IsAlgebraic ℚ z) : z ∈ exp_two_pi_I_mul_transcendental_of_normSq_rat_E x :=
  h.extendScalars (algebraMap ℚ ↥(Algebra.adjoin ℚ ({x} : Set ℂ))).injective

theorem exp_two_pi_I_mul_transcendental_of_normSq_rat_self_mem_E (x : ℂ) : x ∈ exp_two_pi_I_mul_transcendental_of_normSq_rat_E x := by
  rw [exp_two_pi_I_mul_transcendental_of_normSq_rat_mem_E_iff]
  have h : x = algebraMap ↥(Algebra.adjoin ℚ ({x} : Set ℂ)) ℂ
      ⟨x, Algebra.subset_adjoin rfl⟩ := rfl
  rw [h]
  exact isAlgebraic_algebraMap _

theorem rat_alg (r : ℚ) : IsAlgebraic ℚ (r : ℂ) :=
  isAlgebraic_algebraMap r

/-- `i` is algebraic over `ℚ`: its square is `-1`. -/
theorem exp_two_pi_I_mul_transcendental_of_normSq_rat_I_alg : IsAlgebraic ℚ Complex.I := by
  refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
  rw [Complex.I_sq]
  simpa using rat_alg (-1)

theorem two_alg : IsAlgebraic ℚ (2 : ℂ) := by
  simpa using rat_alg 2

theorem T_mem_E : 2 * ((Real.pi : ℝ) : ℂ) * Complex.I ∈ exp_two_pi_I_mul_transcendental_of_normSq_rat_E ((Real.pi : ℝ) : ℂ) :=
  mul_mem (mul_mem (exp_two_pi_I_mul_transcendental_of_normSq_rat_mem_E_of_alg two_alg) (exp_two_pi_I_mul_transcendental_of_normSq_rat_self_mem_E _)) (exp_two_pi_I_mul_transcendental_of_normSq_rat_mem_E_of_alg exp_two_pi_I_mul_transcendental_of_normSq_rat_I_alg)

/-- Two complex numbers algebraic over `ℚ[x]` are never algebraically independent over `ℚ`. -/
theorem not_indep (a b x : ℂ) (ha : a ∈ exp_two_pi_I_mul_transcendental_of_normSq_rat_E x) (hb : b ∈ exp_two_pi_I_mul_transcendental_of_normSq_rat_E x) :
    ¬ AlgebraicIndependent ℚ ![a, b] := by
  intro hind
  have htr : Algebra.trdeg ℚ ↥(Algebra.adjoin ℚ ({a, b} : Set ℂ)) ≤ 1 := by
    apply Transcendence.trdeg_adjoin_le_one_of_isAlgebraic_adjoin x
    intro s hs
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hs
    rcases hs with h | h
    · rw [h]; exact exp_two_pi_I_mul_transcendental_of_normSq_rat_mem_E_iff.1 ha
    · rw [h]; exact exp_two_pi_I_mul_transcendental_of_normSq_rat_mem_E_iff.1 hb
  have hmem : ∀ i, ![a, b] i ∈ Algebra.adjoin ℚ ({a, b} : Set ℂ) := by
    intro i
    fin_cases i
    · exact Algebra.subset_adjoin (by simp)
    · exact Algebra.subset_adjoin (by simp)
  let y : Fin 2 → ↥(Algebra.adjoin ℚ ({a, b} : Set ℂ)) := fun i => ⟨![a, b] i, hmem i⟩
  have hy : AlgebraicIndependent ℚ y :=
    AlgebraicIndependent.of_comp (Algebra.adjoin ℚ ({a, b} : Set ℂ)).val hind
  have h2 := hy.cardinalMk_le_trdeg.trans htr
  rw [Cardinal.mk_fin] at h2
  have h3 : (2 : ℕ) ≤ 1 := by exact_mod_cast h2
  omega

theorem main (τ : ℂ) (hτ : τ.im ≠ 0)
    (halg : IsAlgebraic ↥(Algebra.adjoin ℚ ({((Real.pi : ℝ) : ℂ)} : Set ℂ)) τ)
    (c : ℚ) (hc : τ * conj τ = (c : ℂ)) :
    Transcendental ℚ (Complex.exp (2 * ((Real.pi : ℝ) : ℂ) * Complex.I * τ)) := by
  intro hexp
  have hc4 : (4 * c : ℚ) ≠ 0 := mul_ne_zero (by norm_num) (exp_two_pi_I_mul_transcendental_of_normSq_rat_c_ne_zero τ hτ c hc)
  obtain ⟨-, hind⟩ := log_pair_algebraicIndependent_of_mul_eq_rat_pi_sq
    (2 * ((Real.pi : ℝ) : ℂ) * Complex.I * τ) (conj (2 * ((Real.pi : ℝ) : ℂ) * Complex.I * τ))
    hexp (exp_two_pi_I_mul_transcendental_of_normSq_rat_exp_conj_alg hexp) (hroot_of_im τ hτ) (4 * c) hc4 (prod_eq τ c hc)
  have hτE : τ ∈ exp_two_pi_I_mul_transcendental_of_normSq_rat_E ((Real.pi : ℝ) : ℂ) := exp_two_pi_I_mul_transcendental_of_normSq_rat_mem_E_iff.2 halg
  exact not_indep _ _ ((Real.pi : ℝ) : ℂ) (mul_mem T_mem_E hτE) T_mem_E hind

end P17_a4

open P17_a4 in
theorem exp_two_pi_I_mul_transcendental_of_normSq_rat (τ : ℂ) (hτ : τ.im ≠ 0)
    (halg : IsAlgebraic ↥(Algebra.adjoin ℚ ({((Real.pi : ℝ) : ℂ)} : Set ℂ)) τ)
    (c : ℚ) (hc : τ * conj τ = (c : ℂ)) :
    Transcendental ℚ (Complex.exp (2 * ((Real.pi : ℝ) : ℂ) * Complex.I * τ)) := by
  exact main τ hτ halg c hc

end Diaz
