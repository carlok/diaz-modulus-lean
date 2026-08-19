/-
# The rank-one matrix attached to a candidate

The rank-one matrix attached to a candidate: the concrete object at the
boundary of the Matrix Coefficient Conjecture.

For a candidate `u` with `ρ = u * conj u` and `r = √ρ`, the matrix

    H = ( u  r )
        ( r  ū )

has vanishing determinant — its rows are dependent over `ℂ` — and yet no
coefficient `wᵀ H v` vanishes for non-zero `w, v` over the base field.
Dependent over `ℂ`, independent over `K`. That gap is the four
exponentials problem in miniature, and it is why `H` sits exactly at the
boundary of the Matrix Coefficient Conjecture.

Note what is *not* needed: transcendence of `u`. Only `u ∉ K` is used.
-/
import Mathlib
import Diaz.Closure

open ComplexConjugate

namespace Diaz

variable {K : Subfield ℂ} {u r : ℂ}

/-- The matrix `H` attached to a candidate. -/
noncomputable def Hmat (u r : ℂ) : Matrix (Fin 2) (Fin 2) ℂ :=
  !![u, r; r, conj u]

/-- `det H = 0`: over `ℂ` the rows are dependent. -/
theorem det_Hmat (h : u * conj u = r ^ 2) : (Hmat u r).det = 0 := by
  rw [Hmat, Matrix.det_fin_two_of, h]; ring

/-- The coefficient `wᵀ H v` factors, because `H` has rank one. -/
theorem coeff_factor (hu0 : u ≠ 0) (h : u * conj u = r ^ 2)
    (w v : Fin 2 → ℂ) :
    w 0 * (u * v 0 + r * v 1) + w 1 * (r * v 0 + conj u * v 1)
      = (w 0 + (r / u) * w 1) * (u * v 0 + r * v 1) := by
  have hc : conj u = r ^ 2 / u := by
    rw [eq_div_iff hu0]; linear_combination h
  rw [hc]; field_simp

/-- If `u * a + r * b = 0` with `a, b` in `K`, not both zero, and `r ≠ 0`
in `K`, then `u ∈ K`. -/
theorem mem_of_lin_rel (hr : r ∈ K) (hr0 : r ≠ 0) {a b : ℂ}
    (ha : a ∈ K) (hb : b ∈ K) (hab : ¬ (a = 0 ∧ b = 0))
    (h : u * a + r * b = 0) : u ∈ K := by
  by_cases ha0 : a = 0
  · exfalso
    rw [ha0, mul_zero, zero_add] at h
    exact hab ⟨ha0, by simpa [hr0] using mul_eq_zero.mp h⟩
  · have : u = -(r * b) / a := by
      rw [eq_div_iff ha0]; linear_combination h
    rw [this]
    exact div_mem (neg_mem (mul_mem hr hb)) ha

/-- **No vanishing coefficient.** For non-zero `w, v` over `K`, the
coefficient `wᵀ H v` is non-zero. -/
theorem no_vanishing_coeff (hr : r ∈ K) (huK : u ∉ K)
    (h : u * conj u = r ^ 2)
    (w v : Fin 2 → ℂ) (hwK : ∀ i, w i ∈ K) (hvK : ∀ i, v i ∈ K)
    (hw : w ≠ 0) (hv : v ≠ 0) :
    w 0 * (u * v 0 + r * v 1) + w 1 * (r * v 0 + conj u * v 1) ≠ 0 := by
  have hu0 : u ≠ 0 := ne_zero_of_notMem huK
  have hr0 : r ≠ 0 := by
    rintro rfl
    have hz : u * conj u = 0 := by simpa using h
    rcases mul_eq_zero.mp hz with h' | h'
    · exact hu0 h'
    · exact hu0 (by simpa using h')
  rw [coeff_factor hu0 h]
  intro hzero
  rcases mul_eq_zero.mp hzero with hfac | hfac
  · -- `w 0 + (r/u) * w 1 = 0`, i.e. `u * w 0 + r * w 1 = 0`
    have h' : u * w 0 + r * w 1 = 0 := by
      field_simp at hfac; linear_combination hfac
    refine huK (mem_of_lin_rel hr hr0 (hwK 0) (hwK 1) ?_ h')
    rintro ⟨h0, h1⟩
    exact hw (funext fun i => by fin_cases i <;> assumption)
  · -- `u * v 0 + r * v 1 = 0`
    refine huK (mem_of_lin_rel hr hr0 (hvK 0) (hvK 1) ?_ hfac)
    rintro ⟨h0, h1⟩
    exact hv (funext fun i => by fin_cases i <;> assumption)

/-! ## Linking the coefficient to the matrix

The statement above writes the coefficient out by hand.  This says it is
`wᵀ H v`, so that `det_Hmat` and `no_vanishing_coeff` are about the same
object. -/

theorem coeff_eq_matrix (u r : ℂ) (w v : Fin 2 → ℂ) :
    ∑ i, ∑ j, w i * (Hmat u r) i j * v j
      = w 0 * (u * v 0 + r * v 1) + w 1 * (r * v 0 + conj u * v 1) := by
  simp [Hmat, Fin.sum_univ_two]
  ring

/-- **No vanishing coefficient, in matrix form.** -/
theorem no_vanishing_coeff_matrix (hr : r ∈ K) (huK : u ∉ K)
    (h : u * conj u = r ^ 2)
    (w v : Fin 2 → ℂ) (hwK : ∀ i, w i ∈ K) (hvK : ∀ j, v j ∈ K)
    (hw : w ≠ 0) (hv : v ≠ 0) :
    ∑ i, ∑ j, w i * (Hmat u r) i j * v j ≠ 0 := by
  rw [coeff_eq_matrix]
  exact no_vanishing_coeff hr huK h w v hwK hvK hw hv

/-! ## End to end

The one statement that starts from the arithmetic hypothesis rather than
from transcendence.  This is the only place where being a Diaz candidate,
rather than merely being outside the base field, is what is assumed. -/

/-- If `u` is a Diaz candidate over a base algebraic over `ℚ`, then the
attached rank-one matrix has no vanishing coefficient over that base. -/
theorem candidate_no_vanishing_coeff {L : Subfield ℂ} [Algebra.IsAlgebraic ℚ (↥L)]
    {u r : ℂ} (hu0 : u ≠ 0) (hexp : IsAlgebraic ℚ (Complex.exp u))
    (hr : r ∈ L) (hr0 : r ≠ 0) (h : u * conj u = r ^ 2)
    (w v : Fin 2 → ℂ) (hwK : ∀ i, w i ∈ L) (hvK : ∀ j, v j ∈ L)
    (hw : w ≠ 0) (hv : v ≠ 0) :
    ∑ i, ∑ j, w i * (Hmat u r) i j * v j ≠ 0 := by
  have ht : Transcendental (↥L) u := transcendental_candidate_over_base hu0 hexp
  have huL : u ∉ L := fun hm => ht (isAlgebraic_algebraMap (R := ↥L) ⟨u, hm⟩)
  exact no_vanishing_coeff_matrix hr huL h w v hwK hvK hw hv

end Diaz
