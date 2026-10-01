/-
Mirrored from Prove2Me: `DiazModulus.generic_no_homogeneous_relation`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.generic_no_homogeneous_relation__b2732506.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
Names and spellings that changed between the platform's Mathlib revision and the one
pinned here were updated to match, and proof steps that became no-ops there were
dropped; the mathematics is unchanged.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

namespace GenericNoHomogeneousRelation

open MvPolynomial

/-- The exponent of `Y₀^(2a+c) Y₁^c`, the monomial that `X₀^a X₁^b X₂^c` becomes under
`X₀ ↦ Y₀²`, `X₁ ↦ ρ`, `X₂ ↦ Y₀ Y₁` (up to the constant `ρ^b`). -/
noncomputable def expo (m : Fin 3 →₀ ℕ) : Fin 2 →₀ ℕ :=
  Finsupp.single 0 (2 * m 0 + m 2) + Finsupp.single 1 (m 2)

theorem expo_zero (m : Fin 3 →₀ ℕ) : expo m 0 = 2 * m 0 + m 2 := by simp [expo]

theorem expo_one (m : Fin 3 →₀ ℕ) : expo m 1 = m 2 := by simp [expo]

/-- On exponents of one total degree `d`, `expo` is injective: `(2a + c, c)` gives `c`, then `a`,
then `b = d - a - c`. -/
theorem expo_inj {d : ℕ} {m n : Fin 3 →₀ ℕ} (hm : m.degree = d) (hn : n.degree = d)
    (h : expo m = expo n) : m = n := by
  have h0 := congrArg (fun e => e 0) h
  have h1 := congrArg (fun e => e 1) h
  simp only [expo_zero, expo_one] at h0 h1
  rw [Finsupp.degree_eq_sum, Fin.sum_univ_three] at hm hn
  ext i
  fin_cases i <;> simp <;> omega

end GenericNoHomogeneousRelation

open GenericNoHomogeneousRelation MvPolynomial in
/-- Multiply the relation by `u^d`: since `u ū = ρ`, the point `u • (u, ū, iπ)` is `(u², ρ, u iπ)`,
so `Q(Y₀, Y₁) = P(Y₀², ρ, Y₀ Y₁)` vanishes at `(u, iπ)`. Algebraic independence gives `Q = 0`, and
the coefficient of `Q` at `expo m` is `coeff m P · ρ^(m 1)`, since `expo` is injective on the
support of the homogeneous `P`. -/
theorem generic_no_homogeneous_relation (u : ℂ) (hu : u ≠ 0)
    (hρ : IsAlgebraic ℚ (u * conj u))
    (hgen : AlgebraicIndependent (↥Qbar) ![u, ((Real.pi : ℝ) : ℂ) * Complex.I])
    {d : ℕ} (P : MvPolynomial (Fin 3) ↥Qbar) (hP : P.IsHomogeneous d)
    (h : MvPolynomial.aeval ![u, conj u, ((Real.pi : ℝ) : ℂ) * Complex.I] P = 0) :
    P = 0 := by
  classical
  obtain ⟨ρ, hρv⟩ : ∃ ρ : ↥Qbar, (ρ : ℂ) = u * conj u :=
    ⟨⟨u * conj u, mem_Qbar_iff.2 hρ⟩, rfl⟩
  have hρ0 : ρ ≠ 0 := by
    rintro rfl
    rcases mul_eq_zero.1 hρv.symm with h0 | h0
    · exact hu h0
    · exact hu ((map_eq_zero _).1 h0)
  have hdeg : ∀ m ∈ P.support, m.degree = d := fun m hm => by
    by_contra hne
    exact (mem_support_iff.1 hm) (hP.coeff_eq_zero hne)
  -- `Q(Y₀, Y₁) = P(Y₀², ρ, Y₀ Y₁)`, written monomial by monomial
  set Q : MvPolynomial (Fin 2) ↥Qbar :=
    ∑ m ∈ P.support, monomial (expo m) (P.coeff m * ρ ^ m 1) with hQdef
  have hQ : aeval ![u, ((Real.pi : ℝ) : ℂ) * Complex.I] Q =
      u ^ d * aeval ![u, conj u, ((Real.pi : ℝ) : ℂ) * Complex.I] P := by
    conv_rhs => rw [aeval_def, eval₂_eq', Finset.mul_sum]
    rw [hQdef, map_sum]
    refine Finset.sum_congr rfl fun m hm => ?_
    rw [aeval_monomial, Finsupp.prod_fintype _ _ (fun _ => pow_zero _), Fin.prod_univ_two,
      Fin.prod_univ_three, expo_zero, expo_one, ← hdeg m hm, Finsupp.degree_eq_sum,
      Fin.sum_univ_three, map_mul, map_pow]
    have hρa : algebraMap (↥Qbar) ℂ ρ = u * conj u := hρv
    rw [hρa]
    simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two, Matrix.head_cons,
      Matrix.tail_cons]
    ring
  have hQ0 : Q = 0 := algebraicIndependent_iff.1 hgen Q (by rw [hQ, h, mul_zero])
  refine MvPolynomial.ext _ _ fun m => ?_
  change P.coeff m = 0
  by_contra hm
  have hmS : m ∈ P.support := mem_support_iff.2 hm
  have hc : Q.coeff (expo m) = P.coeff m * ρ ^ m 1 := by
    rw [hQdef, MvPolynomial.coeff_sum, Finset.sum_eq_single m]
    · rw [MvPolynomial.coeff_monomial, ite_eq_left rfl]
    · intro n hn hnm
      rw [MvPolynomial.coeff_monomial, ite_eq_right fun he => hnm (expo_inj (hdeg n hn) (hdeg m hmS) he)]
    · intro h'
      exact absurd hmS h'
  rw [hQ0] at hc
  have hc' : (0 : ↥Qbar) = P.coeff m * ρ ^ m 1 := hc
  exact hm ((mul_eq_zero.1 hc'.symm).resolve_right (pow_ne_zero _ hρ0))

end Diaz
