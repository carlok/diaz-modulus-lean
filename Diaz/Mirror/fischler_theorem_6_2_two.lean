/-
Mirrored from Prove2Me: `DiazModulus.fischler_theorem_6_2_two`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.fischler_theorem_6_2_two__130ad1bc.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.fischler_linear_pow_prod_mem
import Diaz.Mirror.fischler_power_span_finrank
import Diaz.Mirror.fischler_rational_hull

namespace Diaz

open Complex ComplexConjugate

/-! # Fischler 2001, Theorem 6.2 (2)

Let `P = Λ²` with `Λ = Σᵢ λᵢXᵢ` and every coefficient of `P` in `ℒ̃`. Then every product `λᵢλⱼ` lies in `ℒ̃`,
so the `Q̄`-span of `λ₁, …, λ_m` has dimension at most `2`. Write `λ = Σₐ cₐwₐ` with complex `cₐ` and algebraic
vectors `wₐ`, the number of terms being that dimension. It suffices to write `λ = aφ₁ + bφ₂` with `φ₁, φ₂`
algebraic, since then `Λ = aΣᵢφ₁ᵢXᵢ + bΣᵢφ₂ᵢXᵢ`. With `0`, `1` or `2` terms, take respectively
`a = b = 0`; `a = c₀`, `φ₁ = w₀`, `b = 0`; and `a = c₀`, `b = c₁`, `φ₁ = w₀`, `φ₂ = w₁`. -/

open MvPolynomial in
theorem fischler_theorem_6_2_two {m : ℕ} (P : MvPolynomial (Fin m) ℂ)
    (hP : ∀ s, P.coeff s ∈ LogAlgTilde) (Λ : Fin m → ℂ)
    (hPΛ : P = (∑ i, MvPolynomial.C (Λ i) * MvPolynomial.X i) ^ 2) :
    ∃ φ₁ φ₂ : Fin m → ℂ, (∀ i, φ₁ i ∈ Qbar) ∧ (∀ i, φ₂ i ∈ Qbar) ∧ ∃ a b : ℂ,
      P = (MvPolynomial.C a * (∑ i, MvPolynomial.C (φ₁ i) * MvPolynomial.X i) +
        MvPolynomial.C b * (∑ i, MvPolynomial.C (φ₂ i) * MvPolynomial.X i)) ^ 2 := by
  subst hPΛ
  have hn := (fischler_power_span_finrank le_rfl Λ
    (fischler_linear_pow_prod_mem Λ hP)).1
  obtain ⟨n, c, w, hn', -, -, hwQ, hvw, -⟩ := fischler_rational_hull Λ
  rw [← hn'] at hn
  suffices h : ∃ φ₁ φ₂ : Fin m → ℂ, (∀ i, φ₁ i ∈ Qbar) ∧ (∀ i, φ₂ i ∈ Qbar) ∧ ∃ a b : ℂ,
      ∀ i, Λ i = a * φ₁ i + b * φ₂ i by
    obtain ⟨φ₁, φ₂, h₁, h₂, a, b, hab⟩ := h
    refine ⟨φ₁, φ₂, h₁, h₂, a, b, ?_⟩
    congr 1
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [hab, C_add, C_mul, C_mul]
    ring
  have hΛ : ∀ i, Λ i = ∑ a, c a * w a i := fun i => by simpa using congr_fun hvw i
  interval_cases n
  · exact ⟨0, 0, fun _ => zero_mem _, fun _ => zero_mem _, 0, 0, fun i => by simp [hΛ i]⟩
  · exact ⟨w 0, 0, hwQ 0, fun _ => zero_mem _, c 0, 0, fun i => by simp [hΛ i]⟩
  · exact ⟨w 0, w 1, hwQ 0, hwQ 1, c 0, c 1, fun i => by simp [hΛ i, Fin.sum_univ_two]⟩

end Diaz
