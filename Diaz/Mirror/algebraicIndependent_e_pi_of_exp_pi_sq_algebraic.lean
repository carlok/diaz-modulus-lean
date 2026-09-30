/-
Mirrored from Prove2Me: `DiazModulus.algebraicIndependent_e_pi_of_exp_pi_sq_algebraic`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.algebraicIndependent_e_pi_of_exp_pi_sq_algebraic__e65df4a7.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.pi_transcendental
import Diaz.Mirror.isAlgebraic_adjoin_of_not_algebraicIndependent_pair
import Diaz.Mirror.trdeg_adjoin_le_one_of_isAlgebraic_adjoin
import Diaz.Mirror.two_algebraically_independent_of_exp_column

namespace Diaz

/-!
# `e` and `π` are algebraically independent when `e^{π²}` is algebraic

This is Corollary 1 of Waldschmidt (1973) at `α = -1`. Apply Waldschmidt's theorem
(`two_algebraically_independent_of_exp_column`) to

  `x₁ = iπ`, `x₂ = 1`, `y₁ = 1`, `y₂ = iπ`.

Both pairs are `ℚ`-linearly independent, because `iπ` is not real. The column is
`e^{x₁y₂} = e^{-π²} = (e^{π²})⁻¹`, algebraic by assumption, and `e^{x₂y₂} = e^{iπ} = -1`. So two
of the eight numbers

  `iπ`, `1`, `1`, `iπ`, `e^{iπ} = -1`, `e^{-π²}`, `e`, `e^{iπ} = -1`

are algebraically independent. Suppose that `e` and `π` are not. Since `π` is transcendental, `e` is
then algebraic over `ℚ[π]` (`Transcendence.isAlgebraic_adjoin_of_not_algebraicIndependent_pair`),
and so are all eight numbers (`i` is algebraic). They would generate a `ℚ`-algebra of transcendence
degree at most `1`, which contradicts the two algebraically independent numbers it contains.
-/

namespace T2_algebraicIndependent_e_pi_of_exp_pi_sq_algebraic

/-! ## Numbers algebraic over `ℚ[x]` -/

/-- The complex numbers algebraic over `ℚ[x]`, as a `ℚ`-subalgebra of `ℂ`. -/
noncomputable def algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_algOver (x : ℂ) : Subalgebra ℚ ℂ :=
  (Subalgebra.algebraicClosure ↥(Algebra.adjoin ℚ ({x} : Set ℂ)) ℂ).restrictScalars ℚ

theorem algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_mem_algOver_iff {x z : ℂ} :
    z ∈ algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_algOver x ↔ IsAlgebraic ↥(Algebra.adjoin ℚ ({x} : Set ℂ)) z :=
  Iff.rfl

theorem algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_mem_algOver_of_isAlgebraic {x z : ℂ} (h : IsAlgebraic ℚ z) : z ∈ algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_algOver x :=
  h.extendScalars (algebraMap ℚ ↥(Algebra.adjoin ℚ ({x} : Set ℂ))).injective

/-- `i` is algebraic over `ℚ`, being a root of `X² + 1`. -/
theorem algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_isAlgebraic_I : IsAlgebraic ℚ Complex.I := by
  refine IsAlgebraic.of_pow (n := 2) two_pos ?_
  rw [Complex.I_sq]
  exact (isAlgebraic_one (R := ℚ) (A := ℂ)).neg

theorem algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_I_mem_algOver (x : ℂ) : Complex.I ∈ algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_algOver x :=
  algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_mem_algOver_of_isAlgebraic algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_isAlgebraic_I

theorem algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_self_mem_algOver (x : ℂ) : x ∈ algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_algOver x :=
  isAlgebraic_algebraMap (⟨x, Algebra.subset_adjoin rfl⟩ : ↥(Algebra.adjoin ℚ ({x} : Set ℂ)))

/-- If every element of `S` is algebraic over `ℚ[x]`, no two elements of `S` are algebraically
independent over `ℚ`: they would sit in `ℚ[S]`, of transcendence degree at most one. -/
theorem algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_not_algIndep_of_forall_mem_algOver {x : ℂ} {S : Set ℂ} (hS : ∀ s ∈ S, s ∈ algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_algOver x)
    {a b : ℂ} (ha : a ∈ S) (hb : b ∈ S) : ¬ AlgebraicIndependent ℚ ![a, b] := fun hab => by
  have hv : AlgebraicIndependent ℚ (![⟨a, Algebra.subset_adjoin ha⟩, ⟨b, Algebra.subset_adjoin hb⟩] :
      Fin 2 → ↥(Algebra.adjoin ℚ S)) :=
    .of_comp (Algebra.adjoin ℚ S).val (by convert hab using 1; funext i; fin_cases i <;> rfl)
  have h := hv.cardinalMk_le_trdeg.trans
    (Transcendence.trdeg_adjoin_le_one_of_isAlgebraic_adjoin (K := ℚ) x S hS)
  rw [Cardinal.mk_fin] at h
  norm_num at h

/-- Algebraic independence of a pair does not depend on the order. -/
theorem algIndep_swap {a b : ℂ} (h : AlgebraicIndependent ℚ ![a, b]) :
    AlgebraicIndependent ℚ ![b, a] := by
  have he : Function.Injective (![1, 0] : Fin 2 → Fin 2) := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp_all
  convert h.comp _ he using 1
  funext i
  fin_cases i <;> rfl

/-! ## The choice of `x` and `y` -/

/-- `iπ` and `1` are `ℚ`-linearly independent, because `iπ` is not real. -/
theorem algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_linIndep_x : LinearIndependent ℚ ![Complex.I * ((Real.pi : ℝ) : ℂ), 1] := by
  rw [LinearIndependent.pair_iff]
  intro s t hst
  rw [Rat.smul_def, Rat.smul_def] at hst
  have him := congrArg Complex.im hst
  simp [Real.pi_ne_zero] at him
  subst him
  refine ⟨rfl, ?_⟩
  simpa using hst

/-- `1` and `iπ` are `ℚ`-linearly independent, because `iπ` is not real. -/
theorem algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_linIndep_y : LinearIndependent ℚ ![1, Complex.I * ((Real.pi : ℝ) : ℂ)] := by
  rw [LinearIndependent.pair_iff]
  intro s t hst
  rw [Rat.smul_def, Rat.smul_def] at hst
  have him := congrArg Complex.im hst
  simp [Real.pi_ne_zero] at him
  subst him
  refine ⟨?_, rfl⟩
  simpa using hst

theorem exp_I_pi : Complex.exp (Complex.I * ((Real.pi : ℝ) : ℂ)) = -1 := by
  rw [mul_comm]
  exact Complex.exp_pi_mul_I

end T2_algebraicIndependent_e_pi_of_exp_pi_sq_algebraic

open T2_algebraicIndependent_e_pi_of_exp_pi_sq_algebraic in
theorem algebraicIndependent_e_pi_of_exp_pi_sq_algebraic
    (halg : IsAlgebraic ℚ (Complex.exp (((Real.pi : ℝ) : ℂ) ^ 2))) :
    AlgebraicIndependent ℚ ![Complex.exp 1, ((Real.pi : ℝ) : ℂ)] := by
  by_contra h
  have hπ : Transcendental ℚ ((Real.pi : ℝ) : ℂ) := pi_transcendental
  -- `e` is algebraic over `ℚ[π]`
  have he : Complex.exp 1 ∈ algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_algOver ((Real.pi : ℝ) : ℂ) :=
    algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_mem_algOver_iff.2 (Transcendence.isAlgebraic_adjoin_of_not_algebraicIndependent_pair hπ
      fun h' => h (algIndep_swap h'))
  -- the column: `e^{iπ · iπ} = (e^{π²})⁻¹` and `e^{1 · iπ} = -1`
  have hsq : Complex.I * ((Real.pi : ℝ) : ℂ) * (Complex.I * ((Real.pi : ℝ) : ℂ)) =
      -(((Real.pi : ℝ) : ℂ) ^ 2) := by
    linear_combination (((Real.pi : ℝ) : ℂ) ^ 2) * Complex.I_sq
  have h12 : IsAlgebraic ℚ
      (Complex.exp (Complex.I * ((Real.pi : ℝ) : ℂ) * (Complex.I * ((Real.pi : ℝ) : ℂ)))) := by
    rw [hsq, Complex.exp_neg]
    exact halg.inv
  have h22 : IsAlgebraic ℚ (Complex.exp (1 * (Complex.I * ((Real.pi : ℝ) : ℂ)))) := by
    rw [one_mul, exp_I_pi]
    exact isAlgebraic_one.neg
  obtain ⟨a, ha, b, hb, hab⟩ := two_algebraically_independent_of_exp_column
    (Complex.I * ((Real.pi : ℝ) : ℂ)) 1 1 (Complex.I * ((Real.pi : ℝ) : ℂ)) algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_linIndep_x algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_linIndep_y
    h12 h22
  -- all eight numbers are algebraic over `ℚ[π]`
  refine algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_not_algIndep_of_forall_mem_algOver (x := ((Real.pi : ℝ) : ℂ)) ?_ ha hb hab
  intro s hs
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hs
  rcases hs with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · -- `x₁ = iπ`
    exact mul_mem (algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_I_mem_algOver _) (algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_self_mem_algOver _)
  · -- `x₂ = 1`
    exact one_mem _
  · -- `y₁ = 1`
    exact one_mem _
  · -- `y₂ = iπ`
    exact mul_mem (algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_I_mem_algOver _) (algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_self_mem_algOver _)
  · -- `e^{x₁y₁} = e^{iπ} = -1`
    rw [mul_one, exp_I_pi]
    exact neg_mem (one_mem _)
  · -- `e^{x₁y₂} = e^{-π²}`
    exact algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_mem_algOver_of_isAlgebraic h12
  · -- `e^{x₂y₁} = e`
    rw [mul_one]
    exact he
  · -- `e^{x₂y₂} = e^{iπ} = -1`
    exact algebraicIndependent_e_pi_of_exp_pi_sq_algebraic_mem_algOver_of_isAlgebraic h22

end Diaz
