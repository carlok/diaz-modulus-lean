/-
Mirrored from Prove2Me: `Transcendence.length_sum_le`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Transcendence.length_sum_le__33d1f23d.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Transcendence

/-!
For a size function `ν : R → ℕ` on a semiring `R` and `p ∈ R[X]`, let `λ_ν(p) = ∑ₙ ν(pₙ)`, the
sum running over the support of `p`. The length of `P ∈ ℤ[X][Y]` is `λ_{λ_ν}(P)` with `ν = |·|`.

If `ν(0) = 0` and `ν` is subadditive, then so is `λ_ν`: both sides may be summed over the union
of the two supports, since a coefficient outside the support is `0` and has size `0`, and there
the inequality holds termwise. Applied first to `|·|` on `ℤ` and then to `λ_{|·|}` on `ℤ[X]`, this
makes the length subadditive, and induction on the finset gives the claim.
-/

namespace S7W3_length_sum_le

open Polynomial

variable {R : Type*} [Semiring R]

/-- The sum of the sizes of the coefficients of `p`. -/
def length_sum_le_lam (ν : R → ℕ) (p : R[X]) : ℕ :=
  ∑ n ∈ p.support, ν (p.coeff n)

theorem length_sum_le_lam_zero (ν : R → ℕ) : length_sum_le_lam ν 0 = 0 := by
  rw [length_sum_le_lam, support_zero, Finset.sum_empty]

/-- The sum may run over any finset containing the support. -/
theorem length_sum_le_lam_eq_sum (ν : R → ℕ) (hν : ν 0 = 0) (p : R[X]) {s : Finset ℕ} (hs : p.support ⊆ s) :
    length_sum_le_lam ν p = ∑ n ∈ s, ν (p.coeff n) :=
  Finset.sum_subset hs fun n _ hn => by rw [notMem_support_iff.1 hn, hν]

theorem length_sum_le_lam_add_le (ν : R → ℕ) (hν : ν 0 = 0) (hadd : ∀ a b, ν (a + b) ≤ ν a + ν b)
    (p q : R[X]) : length_sum_le_lam ν (p + q) ≤ length_sum_le_lam ν p + length_sum_le_lam ν q := by
  classical
  rw [length_sum_le_lam_eq_sum ν hν (p + q) support_add, length_sum_le_lam_eq_sum ν hν p Finset.subset_union_left,
    length_sum_le_lam_eq_sum ν hν q Finset.subset_union_right, ← Finset.sum_add_distrib]
  exact Finset.sum_le_sum fun n _ => by
    rw [coeff_add]
    exact hadd _ _

end S7W3_length_sum_le

open S7W3_length_sum_le in
theorem length_sum_le {ι : Type*} (s : Finset ι) (f : ι → Polynomial (Polynomial ℤ)) :
    ∑ k ∈ (∑ i ∈ s, f i).support, ∑ j ∈ ((∑ i ∈ s, f i).coeff k).support,
        (((∑ i ∈ s, f i).coeff k).coeff j).natAbs ≤
      ∑ i ∈ s, ∑ k ∈ (f i).support, ∑ j ∈ ((f i).coeff k).support,
        (((f i).coeff k).coeff j).natAbs := by
  exact Finset.le_sum_of_subadditive (length_sum_le_lam (length_sum_le_lam Int.natAbs)) (length_sum_le_lam_zero (length_sum_le_lam Int.natAbs)).le
    (length_sum_le_lam_add_le (length_sum_le_lam Int.natAbs) (length_sum_le_lam_zero Int.natAbs)
      (length_sum_le_lam_add_le Int.natAbs Int.natAbs_zero Int.natAbs_add_le)) s f

end Transcendence
