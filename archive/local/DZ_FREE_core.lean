/-
# The period-aligned **norm-free** half: the four-exponentials route is unavailable

`DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_free`
(`1b43101e-b00e-4168-9769-ddd07242b0c6`).

Write `t = Re u`, `θ = Im u`, `β = π(θ + rπ)`, `A = ‖u‖²`.  On the sibling half `A = cβ` with
`c ∈ ℚ`, and the matrix `[[u, ν],[c·2πi, conj u]]` has vanishing determinant, `ℚ`-independent
rows and `ℚ`-independent columns, so the four exponentials statement applies.

**Here it does not, and no other matrix over the certified logarithm space does either.**
`no_admissible_matrix` below: every `2 × 2` matrix whose entries lie in
`span_ℚ {u, conj u, 2πi}` and whose determinant vanishes has `ℚ`-linearly dependent rows or
`ℚ`-linearly dependent columns.  Inputs: `Transcendental ℚ π`, `Re u ≠ 0`, `β ≠ 0`, `β` and
`‖u‖²` algebraic, and `‖u‖² ∉ ℚ·β`.
-/
import Mathlib
import Definitions.Def_DiazModulus
import Solutions.DZ_LEAFSPLIT_core
import Solutions.DZ_ALIGNED_core

open Complex ComplexConjugate

namespace DiazFree

open DiazModulus DiazLeafSplit DiazAligned

/-! ## 1. `π` admits no algebraic quartic relation in `π²`. -/

/-- If `c₂π⁴ + c₁π² + c₀ = 0` with `c₀, c₁, c₂` algebraic, then all three vanish.
Proof: completing the square exhibits `π² + c₁/(2c₂)` as a square root of an algebraic
number, hence algebraic, hence `π` algebraic. -/
theorem pi_no_alg_quartic (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ))
    {c₀ c₁ c₂ : ℂ} (h₀ : IsAlgebraic ℚ c₀) (h₁ : IsAlgebraic ℚ c₁) (h₂ : IsAlgebraic ℚ c₂)
    (h : c₂ * ((Real.pi : ℝ) : ℂ) ^ 4 + c₁ * ((Real.pi : ℝ) : ℂ) ^ 2 + c₀ = 0) :
    c₂ = 0 ∧ c₁ = 0 ∧ c₀ = 0 := by
  set P : ℂ := ((Real.pi : ℝ) : ℂ) with hP
  -- `π²` algebraic is already a contradiction
  have hsq : ¬ IsAlgebraic ℚ (P ^ 2) := by
    intro hc
    exact hpi (IsAlgebraic.of_pow (n := 2) (by norm_num) hc)
  have hc2 : c₂ = 0 := by
    by_contra hne
    -- complete the square: `(P² + c₁/(2c₂))² = c₁²/(4c₂²) − c₀/c₂`
    set s : ℂ := c₁ / (2 * c₂) with hs
    set D : ℂ := c₁ ^ 2 / (4 * c₂ ^ 2) - c₀ / c₂ with hD
    have hsalg : IsAlgebraic ℚ s := by
      rw [hs]; exact alg_div h₁ (alg_mul (alg_rat 2) h₂)
    have hDalg : IsAlgebraic ℚ D := by
      rw [hD]
      rw [alg_iff_mem] at h₀ h₁ h₂ ⊢
      exact Subfield.sub_mem _
        (Subfield.div_mem _ (Subfield.pow_mem _ h₁ 2)
          (Subfield.mul_mem _ (by rw [← alg_iff_mem]; exact alg_rat 4)
            (Subfield.pow_mem _ h₂ 2)))
        (Subfield.div_mem _ h₀ h₂)
    have hkey : (P ^ 2 + s) ^ 2 = D := by
      have hstep : (P ^ 2 + s) ^ 2 - D = (c₂ * P ^ 4 + c₁ * P ^ 2 + c₀) / c₂ := by
        rw [hs, hD]; field_simp; ring
      rw [h, zero_div] at hstep
      linear_combination hstep
    have halg1 : IsAlgebraic ℚ (P ^ 2 + s) := by
      refine IsAlgebraic.of_pow (n := 2) (by norm_num) ?_
      rw [hkey]; exact hDalg
    have : IsAlgebraic ℚ (P ^ 2) := by
      have := halg1
      rw [alg_iff_mem] at this hsalg ⊢
      simpa using Subfield.sub_mem _ this hsalg
    exact hsq this
  subst hc2
  have h' : c₁ * P ^ 2 + c₀ = 0 := by linear_combination h
  have hc1 : c₁ = 0 := by
    by_contra hne
    have : P ^ 2 = -c₀ / c₁ := by field_simp; linear_combination h'
    refine hsq ?_
    rw [this]
    exact alg_div (alg_neg h₀) h₁
  subst hc1
  refine ⟨rfl, rfl, ?_⟩
  linear_combination h'


/-! ## 2.  Linear algebra over `ℚ`.

The transcendence input of §3 will say that the quadratic form `det` vanishes identically on
the rational subspace spanned by the three coefficient matrices of the entries.  Everything
after that is the following statement: a `2 × 2` array of vectors in `ℚ³` on which every
"evaluation determinant" vanishes has `ℚ`-dependent rows or `ℚ`-dependent columns. -/

theorem sumsq_ne_zero {p q r : ℚ} (h : ¬ (p = 0 ∧ q = 0 ∧ r = 0)) :
    p ^ 2 + q ^ 2 + r ^ 2 ≠ 0 := by
  have : p ≠ 0 ∨ q ≠ 0 ∨ r ≠ 0 := by tauto
  rcases this with h' | h' | h' <;>
    · intro hc
      have h1 := sq_nonneg p
      have h2 := sq_nonneg q
      have h3 := sq_nonneg r
      have : p = 0 ∧ q = 0 ∧ r = 0 := by
        refine ⟨?_, ?_, ?_⟩ <;> nlinarith [sq_nonneg p, sq_nonneg q, sq_nonneg r]
      tauto

/-- Linear forms on `ℚ³` have no zero divisors: if the product of two of them vanishes
identically then one of the two vectors is `0`.  Three evaluations suffice. -/
theorem lin_nz {p q r p' q' r' : ℚ}
    (h : ∀ α γ δ : ℚ, (α * p + γ * q + δ * r) * (α * p' + γ * q' + δ * r') = 0) :
    (p = 0 ∧ q = 0 ∧ r = 0) ∨ (p' = 0 ∧ q' = 0 ∧ r' = 0) := by
  by_contra hc
  push Not at hc
  obtain ⟨h1, h2⟩ := hc
  have hn : p ^ 2 + q ^ 2 + r ^ 2 ≠ 0 := sumsq_ne_zero (by tauto)
  have hn' : p' ^ 2 + q' ^ 2 + r' ^ 2 ≠ 0 := sumsq_ne_zero (by tauto)
  have e1 := h p q r
  have hcross : p * p' + q * q' + r * r' = 0 := by
    rcases mul_eq_zero.1 e1 with hz | hz
    · exact absurd (by linear_combination hz) hn
    · linear_combination hz
  have e3 := h (p + p') (q + q') (r + r')
  have : (p ^ 2 + q ^ 2 + r ^ 2) * (p' ^ 2 + q' ^ 2 + r' ^ 2) = 0 := by
    linear_combination e3 - (p ^ 2 + q ^ 2 + r ^ 2 + p' ^ 2 + q' ^ 2 + r' ^ 2 +
      (p * p' + q * q' + r * r')) * hcross
  rcases mul_eq_zero.1 this with hz | hz
  · exact hn hz
  · exact hn' hz

/-- The small generic step: two independent kernel directions are impossible. -/
theorem no_two_kernels
    {p₁ e₁ f₁ p₂ e₂ f₂ p₃ e₃ f₃ p₄ e₄ f₄ : ℚ}
    (hid : ∀ α γ δ : ℚ,
      (α * p₁ + γ * e₁ + δ * f₁) * (α * p₄ + γ * e₄ + δ * f₄)
        = (α * p₂ + γ * e₂ + δ * f₂) * (α * p₃ + γ * e₃ + δ * f₃))
    {α₀ γ₀ δ₀ α₁ γ₁ δ₁ : ℚ}
    (h1a : α₀ * p₁ + γ₀ * e₁ + δ₀ * f₁ = 0)
    (h2a : α₀ * p₂ + γ₀ * e₂ + δ₀ * f₂ ≠ 0)
    (h1b : α₁ * p₁ + γ₁ * e₁ + δ₁ * f₁ = 0)
    (h3b : α₁ * p₃ + γ₁ * e₃ + δ₁ * f₃ ≠ 0) : False := by
  have e1 := hid α₀ γ₀ δ₀
  have h3a : α₀ * p₃ + γ₀ * e₃ + δ₀ * f₃ = 0 := by
    have hz : (α₀ * p₂ + γ₀ * e₂ + δ₀ * f₂) * (α₀ * p₃ + γ₀ * e₃ + δ₀ * f₃) = 0 := by
      linear_combination -e1 + (α₀ * p₄ + γ₀ * e₄ + δ₀ * f₄) * h1a
    rcases mul_eq_zero.1 hz with hz' | hz'
    · exact absurd hz' h2a
    · exact hz'
  have e2 := hid α₁ γ₁ δ₁
  have h2b : α₁ * p₂ + γ₁ * e₂ + δ₁ * f₂ = 0 := by
    have hz : (α₁ * p₂ + γ₁ * e₂ + δ₁ * f₂) * (α₁ * p₃ + γ₁ * e₃ + δ₁ * f₃) = 0 := by
      linear_combination -e2 + (α₁ * p₄ + γ₁ * e₄ + δ₁ * f₄) * h1b
    rcases mul_eq_zero.1 hz with hz' | hz'
    · exact hz'
    · exact absurd hz' h3b
  have e3 := hid (α₀ + α₁) (γ₀ + γ₁) (δ₀ + δ₁)
  have hprod : (α₀ * p₂ + γ₀ * e₂ + δ₀ * f₂) * (α₁ * p₃ + γ₁ * e₃ + δ₁ * f₃) = 0 := by
    linear_combination -e3 + ((α₀ + α₁) * p₄ + (γ₀ + γ₁) * e₄ + (δ₀ + δ₁) * f₄) * h1a
      + ((α₀ + α₁) * p₄ + (γ₀ + γ₁) * e₄ + (δ₀ + δ₁) * f₄) * h1b
      - (α₁ * p₃ + γ₁ * e₃ + δ₁ * f₃) * h2b
      - ((α₀ * p₂ + γ₀ * e₂ + δ₀ * f₂) + (α₁ * p₂ + γ₁ * e₂ + δ₁ * f₂)) * h3a
  rcases mul_eq_zero.1 hprod with hz | hz
  · exact h2a hz
  · exact h3b hz

/-- **The rank-one dichotomy over `ℚ`.**  Four vectors `v₁ v₂ v₃ v₄ ∈ ℚ³` arranged as a
`2 × 2` array, such that for *every* `v ∈ ℚ³` the numerical determinant
`⟨v,v₁⟩⟨v,v₄⟩ − ⟨v,v₂⟩⟨v,v₃⟩` vanishes, have `ℚ`-dependent columns or `ℚ`-dependent rows. -/
theorem rank_one_dichotomy
    {p₁ e₁ f₁ p₂ e₂ f₂ p₃ e₃ f₃ p₄ e₄ f₄ : ℚ}
    (hid : ∀ α γ δ : ℚ,
      (α * p₁ + γ * e₁ + δ * f₁) * (α * p₄ + γ * e₄ + δ * f₄)
        = (α * p₂ + γ * e₂ + δ * f₂) * (α * p₃ + γ * e₃ + δ * f₃)) :
    (∃ a b : ℚ, (a ≠ 0 ∨ b ≠ 0) ∧
        a * p₁ + b * p₂ = 0 ∧ a * e₁ + b * e₂ = 0 ∧ a * f₁ + b * f₂ = 0 ∧
        a * p₃ + b * p₄ = 0 ∧ a * e₃ + b * e₄ = 0 ∧ a * f₃ + b * f₄ = 0)
  ∨ (∃ a b : ℚ, (a ≠ 0 ∨ b ≠ 0) ∧
        a * p₁ + b * p₃ = 0 ∧ a * e₁ + b * e₃ = 0 ∧ a * f₁ + b * f₃ = 0 ∧
        a * p₂ + b * p₄ = 0 ∧ a * e₂ + b * e₄ = 0 ∧ a * f₂ + b * f₄ = 0) := by
  by_cases hv1 : p₁ = 0 ∧ e₁ = 0 ∧ f₁ = 0
  · obtain ⟨hp, he, hf⟩ := hv1
    have h23 : ∀ α γ δ : ℚ,
        (α * p₂ + γ * e₂ + δ * f₂) * (α * p₃ + γ * e₃ + δ * f₃) = 0 := by
      intro α γ δ
      rw [← hid α γ δ, hp, he, hf]; ring
    rcases lin_nz h23 with ⟨q1, q2, q3⟩ | ⟨q1, q2, q3⟩
    · exact Or.inr ⟨1, 0, Or.inl one_ne_zero, by rw [hp]; ring, by rw [he]; ring,
        by rw [hf]; ring, by rw [q1]; ring, by rw [q2]; ring, by rw [q3]; ring⟩
    · exact Or.inl ⟨1, 0, Or.inl one_ne_zero, by rw [hp]; ring, by rw [he]; ring,
        by rw [hf]; ring, by rw [q1]; ring, by rw [q2]; ring, by rw [q3]; ring⟩
  · have hn1 : p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2 ≠ 0 := sumsq_ne_zero hv1
    by_cases hc12 : e₁ * f₂ - f₁ * e₂ = 0 ∧ f₁ * p₂ - p₁ * f₂ = 0 ∧ p₁ * e₂ - e₁ * p₂ = 0
    · obtain ⟨c1, c2, c3⟩ := hc12
      have hp2 : (p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * p₂ - (p₁ * p₂ + e₁ * e₂ + f₁ * f₂) * p₁ = 0 := by
        linear_combination (-e₁) * c3 + f₁ * c2
      have he2 : (p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * e₂ - (p₁ * p₂ + e₁ * e₂ + f₁ * f₂) * e₁ = 0 := by
        linear_combination p₁ * c3 - f₁ * c1
      have hf2 : (p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * f₂ - (p₁ * p₂ + e₁ * e₂ + f₁ * f₂) * f₁ = 0 := by
        linear_combination (-p₁) * c2 + e₁ * c1
      have hkey : ∀ α γ δ : ℚ,
          (α * p₁ + γ * e₁ + δ * f₁) *
            (α * ((p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * p₄ - (p₁ * p₂ + e₁ * e₂ + f₁ * f₂) * p₃)
              + γ * ((p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * e₄ - (p₁ * p₂ + e₁ * e₂ + f₁ * f₂) * e₃)
              + δ * ((p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * f₄ - (p₁ * p₂ + e₁ * e₂ + f₁ * f₂) * f₃)) = 0 := by
        intro α γ δ
        linear_combination (p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * hid α γ δ
          + ((α * p₃ + γ * e₃ + δ * f₃) * α) * hp2
          + ((α * p₃ + γ * e₃ + δ * f₃) * γ) * he2
          + ((α * p₃ + γ * e₃ + δ * f₃) * δ) * hf2
      rcases lin_nz hkey with h | ⟨q1, q2, q3⟩
      · exact absurd h hv1
      · refine Or.inl ⟨p₁ * p₂ + e₁ * e₂ + f₁ * f₂, -(p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2),
          Or.inr (neg_ne_zero.2 hn1), by linear_combination -hp2, by linear_combination -he2,
          by linear_combination -hf2, by linear_combination -q1, by linear_combination -q2,
          by linear_combination -q3⟩
    · by_cases hc13 : e₁ * f₃ - f₁ * e₃ = 0 ∧ f₁ * p₃ - p₁ * f₃ = 0 ∧ p₁ * e₃ - e₁ * p₃ = 0
      · obtain ⟨c1, c2, c3⟩ := hc13
        have hp3 : (p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * p₃ - (p₁ * p₃ + e₁ * e₃ + f₁ * f₃) * p₁ = 0 := by
          linear_combination (-e₁) * c3 + f₁ * c2
        have he3 : (p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * e₃ - (p₁ * p₃ + e₁ * e₃ + f₁ * f₃) * e₁ = 0 := by
          linear_combination p₁ * c3 - f₁ * c1
        have hf3 : (p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * f₃ - (p₁ * p₃ + e₁ * e₃ + f₁ * f₃) * f₁ = 0 := by
          linear_combination (-p₁) * c2 + e₁ * c1
        have hkey : ∀ α γ δ : ℚ,
            (α * p₁ + γ * e₁ + δ * f₁) *
              (α * ((p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * p₄ - (p₁ * p₃ + e₁ * e₃ + f₁ * f₃) * p₂)
                + γ * ((p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * e₄ - (p₁ * p₃ + e₁ * e₃ + f₁ * f₃) * e₂)
                + δ * ((p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * f₄ - (p₁ * p₃ + e₁ * e₃ + f₁ * f₃) * f₂)) = 0 := by
          intro α γ δ
          linear_combination (p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2) * hid α γ δ
            + ((α * p₂ + γ * e₂ + δ * f₂) * α) * hp3
            + ((α * p₂ + γ * e₂ + δ * f₂) * γ) * he3
            + ((α * p₂ + γ * e₂ + δ * f₂) * δ) * hf3
        rcases lin_nz hkey with h | ⟨q1, q2, q3⟩
        · exact absurd h hv1
        · refine Or.inr ⟨p₁ * p₃ + e₁ * e₃ + f₁ * f₃, -(p₁ ^ 2 + e₁ ^ 2 + f₁ ^ 2),
            Or.inr (neg_ne_zero.2 hn1), by linear_combination -hp3, by linear_combination -he3,
            by linear_combination -hf3, by linear_combination -q1, by linear_combination -q2,
            by linear_combination -q3⟩
      · exfalso
        have hA : ∃ α γ δ : ℚ, α * p₁ + γ * e₁ + δ * f₁ = 0 ∧ α * p₂ + γ * e₂ + δ * f₂ ≠ 0 := by
          have : e₁ * f₂ - f₁ * e₂ ≠ 0 ∨ f₁ * p₂ - p₁ * f₂ ≠ 0 ∨ p₁ * e₂ - e₁ * p₂ ≠ 0 := by
            tauto
          rcases this with h | h | h
          · exact ⟨0, f₁, -e₁, by ring, fun hz => h (by linear_combination -hz)⟩
          · exact ⟨f₁, 0, -p₁, by ring, fun hz => h (by linear_combination hz)⟩
          · exact ⟨e₁, -p₁, 0, by ring, fun hz => h (by linear_combination -hz)⟩
        have hB : ∃ α γ δ : ℚ, α * p₁ + γ * e₁ + δ * f₁ = 0 ∧ α * p₃ + γ * e₃ + δ * f₃ ≠ 0 := by
          have : e₁ * f₃ - f₁ * e₃ ≠ 0 ∨ f₁ * p₃ - p₁ * f₃ ≠ 0 ∨ p₁ * e₃ - e₁ * p₃ ≠ 0 := by
            tauto
          rcases this with h | h | h
          · exact ⟨0, f₁, -e₁, by ring, fun hz => h (by linear_combination -hz)⟩
          · exact ⟨f₁, 0, -p₁, by ring, fun hz => h (by linear_combination hz)⟩
          · exact ⟨e₁, -p₁, 0, by ring, fun hz => h (by linear_combination -hz)⟩
        obtain ⟨α₀, γ₀, δ₀, h1a, h2a⟩ := hA
        obtain ⟨α₁, γ₁, δ₁, h1b, h3b⟩ := hB
        exact no_two_kernels hid h1a h2a h1b h3b

/-! ## 3.  The certified logarithm space, and its normal form. -/

/-- The `ℚ`-span of `u`, `conj u` and `2πi` — every logarithm of an algebraic number that the
class data certifies once `exp u` is assumed algebraic. -/
def MemL3 (u z : ℂ) : Prop :=
  ∃ a b c : ℚ, z = (a : ℂ) * u + (b : ℂ) * (starRingEnd ℂ) u
    + (c : ℂ) * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I)

theorem alg_add {z w : ℂ} (hz : IsAlgebraic ℚ z) (hw : IsAlgebraic ℚ w) :
    IsAlgebraic ℚ (z + w) := by
  rw [alg_iff_mem] at *; exact Subfield.add_mem _ hz hw

theorem alg_sub {z w : ℂ} (hz : IsAlgebraic ℚ z) (hw : IsAlgebraic ℚ w) :
    IsAlgebraic ℚ (z - w) := by
  rw [alg_iff_mem] at *; exact Subfield.sub_mem _ hz hw

/-- **Normal form on `L₃`.**  Adapted to the quartic relation: `z = p·Re u + i·m` with `p`
rational and `π m = e·β + f·π²` with `e, f` rational.  The basis is `Re u`, `β/(πi)`, `πi`. -/
theorem memL3_normal (u z : ℂ) (r : ℚ) (h : MemL3 u z) :
    ∃ p e f : ℚ, ∃ m : ℝ,
      z = (((p : ℝ) * u.re : ℝ) : ℂ) + ((m : ℝ) : ℂ) * Complex.I ∧
      Real.pi * m
        = (e : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi)) + (f : ℝ) * Real.pi ^ 2 := by
  obtain ⟨a, b, c, hz⟩ := h
  refine ⟨a + b, a - b, 2 * c - (a - b) * r,
    ((a : ℝ) - (b : ℝ)) * u.im + 2 * (c : ℝ) * Real.pi, ?_, ?_⟩
  · rw [hz]
    apply Complex.ext <;> simp <;> ring
  · push_cast; ring

/-! ## 4.  The no-go. -/

/-- **No admissible matrix.**  On the period-aligned, norm-**free** half, every `2 × 2` matrix
with entries in `span_ℚ {u, conj u, 2πi}` and vanishing determinant has `ℚ`-linearly dependent
rows or `ℚ`-linearly dependent columns.  Hence the hypotheses of the four exponentials
statement (`DiazAligned.FourExpDet`) can never be met from the certified data on this half. -/
theorem no_admissible_matrix
    (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ))
    (u : ℂ) (r : ℚ)
    (hre : u.re ≠ 0)
    (hβ0 : Real.pi * (u.im + (r : ℝ) * Real.pi) ≠ 0)
    (hβalg : IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ))
    (hAalg : IsAlgebraic ℚ ((((‖u‖ : ℝ)) ^ 2 : ℝ) : ℂ))
    (hfree : ¬ ∃ c : ℚ, (‖u‖ : ℝ) ^ 2 = (c : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi)))
    {l₁ l₂ l₃ l₄ : ℂ}
    (hm₁ : MemL3 u l₁) (hm₂ : MemL3 u l₂) (hm₃ : MemL3 u l₃) (hm₄ : MemL3 u l₄)
    (hdet : l₁ * l₄ - l₂ * l₃ = 0) :
    (∃ a b : ℚ, (a ≠ 0 ∨ b ≠ 0) ∧
        (a : ℂ) * l₁ + (b : ℂ) * l₃ = 0 ∧ (a : ℂ) * l₂ + (b : ℂ) * l₄ = 0)
  ∨ (∃ a b : ℚ, (a ≠ 0 ∨ b ≠ 0) ∧
        (a : ℂ) * l₁ + (b : ℂ) * l₂ = 0 ∧ (a : ℂ) * l₃ + (b : ℂ) * l₄ = 0) := by
  obtain ⟨p₁, e₁, f₁, n₁, hl₁, hn₁⟩ := memL3_normal u l₁ r hm₁
  obtain ⟨p₂, e₂, f₂, n₂, hl₂, hn₂⟩ := memL3_normal u l₂ r hm₂
  obtain ⟨p₃, e₃, f₃, n₃, hl₃, hn₃⟩ := memL3_normal u l₃ r hm₃
  obtain ⟨p₄, e₄, f₄, n₄, hl₄, hn₄⟩ := memL3_normal u l₄ r hm₄
  set t : ℝ := u.re with ht
  set β : ℝ := Real.pi * (u.im + (r : ℝ) * Real.pi) with hβ
  set A : ℝ := (‖u‖ : ℝ) ^ 2 with hA
  have hπ : Real.pi ≠ 0 := Real.pi_ne_zero
  -- the two real equations coming from `det = 0`
  have hz0 : l₁ * l₄ - l₂ * l₃
      = ((((p₁ : ℝ) * t) * ((p₄ : ℝ) * t) - n₁ * n₄
        - (((p₂ : ℝ) * t) * ((p₃ : ℝ) * t) - n₂ * n₃) : ℝ) : ℂ)
      + ((((p₁ : ℝ) * t) * n₄ + n₁ * ((p₄ : ℝ) * t)
        - (((p₂ : ℝ) * t) * n₃ + n₂ * ((p₃ : ℝ) * t)) : ℝ) : ℂ) * Complex.I := by
    rw [hl₁, hl₂, hl₃, hl₄]; push_cast
    linear_combination (((n₁ : ℝ) : ℂ) * ((n₄ : ℝ) : ℂ) - ((n₂ : ℝ) : ℂ) * ((n₃ : ℝ) : ℂ)) * Complex.I_sq
  have hz : ((((p₁ : ℝ) * t) * ((p₄ : ℝ) * t) - n₁ * n₄
        - (((p₂ : ℝ) * t) * ((p₃ : ℝ) * t) - n₂ * n₃) : ℝ) : ℂ)
      + ((((p₁ : ℝ) * t) * n₄ + n₁ * ((p₄ : ℝ) * t)
        - (((p₂ : ℝ) * t) * n₃ + n₂ * ((p₃ : ℝ) * t)) : ℝ) : ℂ) * Complex.I = 0 := by
    rw [← hz0]; exact hdet
  have hR : ((p₁ : ℝ) * t) * ((p₄ : ℝ) * t) - n₁ * n₄
      - (((p₂ : ℝ) * t) * ((p₃ : ℝ) * t) - n₂ * n₃) = 0 := by
    have := congrArg Complex.re hz; simpa using this
  have hI : ((p₁ : ℝ) * t) * n₄ + n₁ * ((p₄ : ℝ) * t)
      - (((p₂ : ℝ) * t) * n₃ + n₂ * ((p₃ : ℝ) * t)) = 0 := by
    have := congrArg Complex.im hz; simpa using this
  -- the six rational forms
  set P : ℚ := p₁ * p₄ - p₂ * p₃ with hP
  set E : ℚ := e₁ * e₄ - e₂ * e₃ with hE
  set F : ℚ := f₁ * f₄ - f₂ * f₃ with hF
  set G : ℚ := p₁ * e₄ + e₁ * p₄ - p₂ * e₃ - e₂ * p₃ with hG
  set H : ℚ := p₁ * f₄ + f₁ * p₄ - p₂ * f₃ - f₂ * p₃ with hH
  set J : ℚ := e₁ * f₄ + f₁ * e₄ - e₂ * f₃ - f₂ * e₃ with hJ
  have hPR : (P : ℝ) = (p₁ : ℝ) * (p₄ : ℝ) - (p₂ : ℝ) * (p₃ : ℝ) := by
    rw [hP]; push_cast; ring
  -- imaginary part: `β G + π² H = 0`
  have hY : (p₁ : ℝ) * n₄ + n₁ * (p₄ : ℝ) - ((p₂ : ℝ) * n₃ + n₂ * (p₃ : ℝ)) = 0 := by
    have hmul : t * ((p₁ : ℝ) * n₄ + n₁ * (p₄ : ℝ) - ((p₂ : ℝ) * n₃ + n₂ * (p₃ : ℝ))) = 0 := by
      linear_combination hI
    rcases mul_eq_zero.1 hmul with h | h
    · exact absurd h hre
    · exact h
  have hGH : β * (G : ℝ) + Real.pi ^ 2 * (H : ℝ) = 0 := by
    have : Real.pi * ((p₁ : ℝ) * n₄ + n₁ * (p₄ : ℝ) - ((p₂ : ℝ) * n₃ + n₂ * (p₃ : ℝ))) = 0 := by
      rw [hY]; ring
    rw [hG, hH]; push_cast
    linear_combination this - (p₁ : ℝ) * hn₄ - (p₄ : ℝ) * hn₁ + (p₂ : ℝ) * hn₃ + (p₃ : ℝ) * hn₂
  have hHz : H = 0 := by
    by_contra hne
    have hHR : (H : ℝ) ≠ 0 := by exact_mod_cast hne
    have hval : Real.pi ^ 2 = -(β * (G : ℝ)) / (H : ℝ) := by field_simp; linarith [hGH]
    have halg : IsAlgebraic ℚ (((Real.pi ^ 2 : ℝ)) : ℂ) := by
      rw [hval]; push_cast
      exact alg_div (alg_neg (alg_mul hβalg (alg_rat G))) (alg_rat H)
    refine hpi (IsAlgebraic.of_pow (n := 2) (by norm_num) ?_)
    push_cast at halg; exact halg
  have hGz : G = 0 := by
    have : β * (G : ℝ) = 0 := by rw [hHz] at hGH; push_cast at hGH; linarith [hGH]
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h hβ0
    · exact_mod_cast h
  -- real part: the algebraic quartic in `π`
  have hquart : t ^ 2 * Real.pi ^ 2 + (r : ℝ) ^ 2 * Real.pi ^ 4
      - (A + 2 * (r : ℝ) * β) * Real.pi ^ 2 + β ^ 2 = 0 :=
    DiazAligned.aligned_quartic_relation u r A β rfl rfl
  have hN : Real.pi ^ 2 * (n₁ * n₄ - n₂ * n₃)
      = β ^ 2 * (E : ℝ) + β * Real.pi ^ 2 * (J : ℝ) + Real.pi ^ 4 * (F : ℝ) := by
    rw [hE, hJ, hF]; push_cast
    linear_combination (Real.pi * n₄) * hn₁
      + ((e₁ : ℝ) * β + (f₁ : ℝ) * Real.pi ^ 2) * hn₄
      - (Real.pi * n₃) * hn₂ - ((e₂ : ℝ) * β + (f₂ : ℝ) * Real.pi ^ 2) * hn₃
  have hquartic : Real.pi ^ 4 * ((-(P * r ^ 2 + F) : ℚ) : ℝ)
      + Real.pi ^ 2 * ((P : ℝ) * (A + 2 * (r : ℝ) * β) - β * (J : ℝ))
      + (-(β ^ 2 * ((P : ℝ) + (E : ℝ)))) = 0 := by
    push_cast
    linear_combination (-(P : ℝ)) * hquart + Real.pi ^ 2 * hR + hN
      + t ^ 2 * Real.pi ^ 2 * hPR
  -- transcendence: all three coefficients vanish
  have hCplx : (((-(P * r ^ 2 + F) : ℚ) : ℂ)) * ((Real.pi : ℝ) : ℂ) ^ 4
      + ((((P : ℝ) * (A + 2 * (r : ℝ) * β) - β * (J : ℝ) : ℝ)) : ℂ) * ((Real.pi : ℝ) : ℂ) ^ 2
      + ((((-(β ^ 2 * ((P : ℝ) + (E : ℝ)))) : ℝ)) : ℂ) = 0 := by
    have h := congrArg (fun x : ℝ => ((x : ℝ) : ℂ)) hquartic
    push_cast at h ⊢
    linear_combination h
  have hAlg2 : IsAlgebraic ℚ (((-(P * r ^ 2 + F) : ℚ) : ℂ)) := alg_rat _
  have hAlg1 : IsAlgebraic ℚ ((((P : ℝ) * (A + 2 * (r : ℝ) * β) - β * (J : ℝ) : ℝ)) : ℂ) := by
    have e : ((((P : ℝ) * (A + 2 * (r : ℝ) * β) - β * (J : ℝ) : ℝ)) : ℂ)
        = ((P : ℚ) : ℂ) * (((A : ℝ) : ℂ) + 2 * ((r : ℚ) : ℂ) * ((β : ℝ) : ℂ))
          - ((β : ℝ) : ℂ) * ((J : ℚ) : ℂ) := by push_cast; ring
    rw [e]
    exact alg_sub (alg_mul (alg_rat P) (alg_add hAalg
      (alg_mul (alg_mul (alg_rat 2) (alg_rat r)) hβalg))) (alg_mul hβalg (alg_rat J))
  have hAlg0 : IsAlgebraic ℚ ((((-(β ^ 2 * ((P : ℝ) + (E : ℝ)))) : ℝ)) : ℂ) := by
    have e : ((((-(β ^ 2 * ((P : ℝ) + (E : ℝ)))) : ℝ)) : ℂ)
        = -(((β : ℝ) : ℂ) ^ 2 * (((P : ℚ) : ℂ) + ((E : ℚ) : ℂ))) := by push_cast; ring
    rw [e]
    exact alg_neg (alg_mul (alg_pow hβalg 2) (alg_add (alg_rat P) (alg_rat E)))
  obtain ⟨z2, z1, z0⟩ := pi_no_alg_quartic hpi hAlg0 hAlg1 hAlg2 hCplx
  have hF' : -(P * r ^ 2 + F) = 0 := by exact_mod_cast z2
  have hC1 : (P : ℝ) * (A + 2 * (r : ℝ) * β) - β * (J : ℝ) = 0 := by
    exact_mod_cast z1
  have hC0 : -(β ^ 2 * ((P : ℝ) + (E : ℝ))) = 0 := by exact_mod_cast z0
  -- `P = 0` is exactly where the norm-free hypothesis bites
  have hPz : P = 0 := by
    by_contra hne
    have hPR : (P : ℝ) ≠ 0 := by exact_mod_cast hne
    refine hfree ⟨(J - 2 * r * P) / P, ?_⟩
    have : (P : ℝ) * A = β * ((J : ℝ) - 2 * (r : ℝ) * (P : ℝ)) := by linarith [hC1]
    push_cast
    field_simp
    linear_combination this
  have hEz : E = 0 := by
    rw [hPz] at hC0
    have hβ2 : β ^ 2 ≠ 0 := pow_ne_zero 2 hβ0
    have : β ^ 2 * ((E : ℝ)) = 0 := by push_cast at hC0 ⊢; linarith [hC0]
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h hβ2
    · exact_mod_cast h
  have hFz : F = 0 := by rw [hPz] at hF'; linarith [hF']
  have hJz : J = 0 := by
    rw [hPz] at hC1
    have : β * (J : ℝ) = 0 := by push_cast at hC1 ⊢; linarith [hC1]
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h hβ0
    · exact_mod_cast h
  -- the determinant form vanishes identically on the rational span
  have hid : ∀ α γ δ : ℚ,
      (α * p₁ + γ * e₁ + δ * f₁) * (α * p₄ + γ * e₄ + δ * f₄)
        = (α * p₂ + γ * e₂ + δ * f₂) * (α * p₃ + γ * e₃ + δ * f₃) := by
    intro α γ δ
    have hP' : p₁ * p₄ - p₂ * p₃ = 0 := by rw [← hP]; exact hPz
    have hE' : e₁ * e₄ - e₂ * e₃ = 0 := by rw [← hE]; exact hEz
    have hF'' : f₁ * f₄ - f₂ * f₃ = 0 := by rw [← hF]; exact hFz
    have hG' : p₁ * e₄ + e₁ * p₄ - p₂ * e₃ - e₂ * p₃ = 0 := by rw [← hG]; exact hGz
    have hH' : p₁ * f₄ + f₁ * p₄ - p₂ * f₃ - f₂ * p₃ = 0 := by rw [← hH]; exact hHz
    have hJ' : e₁ * f₄ + f₁ * e₄ - e₂ * f₃ - f₂ * e₃ = 0 := by rw [← hJ]; exact hJz
    linear_combination α ^ 2 * hP' + γ ^ 2 * hE' + δ ^ 2 * hF''
      + α * γ * hG' + α * δ * hH' + γ * δ * hJ'
  -- transport back to the entries
  have combine : ∀ (a b pk ek fk pj ej fj : ℚ) (mk mj : ℝ) (lk lj : ℂ),
      Real.pi * mk = (ek : ℝ) * β + (fk : ℝ) * Real.pi ^ 2 →
      Real.pi * mj = (ej : ℝ) * β + (fj : ℝ) * Real.pi ^ 2 →
      lk = (((pk : ℝ) * t : ℝ) : ℂ) + ((mk : ℝ) : ℂ) * Complex.I →
      lj = (((pj : ℝ) * t : ℝ) : ℂ) + ((mj : ℝ) : ℂ) * Complex.I →
      a * pk + b * pj = 0 → a * ek + b * ej = 0 → a * fk + b * fj = 0 →
      (a : ℂ) * lk + (b : ℂ) * lj = 0 := by
    intro a b pk ek fk pj ej fj mk mj lk lj hk hj hlk hlj q1 q2 q3
    have q1' : (a : ℝ) * (pk : ℝ) + (b : ℝ) * (pj : ℝ) = 0 := by exact_mod_cast q1
    have q2' : (a : ℝ) * (ek : ℝ) + (b : ℝ) * (ej : ℝ) = 0 := by exact_mod_cast q2
    have q3' : (a : ℝ) * (fk : ℝ) + (b : ℝ) * (fj : ℝ) = 0 := by exact_mod_cast q3
    have hmm : (a : ℝ) * mk + (b : ℝ) * mj = 0 := by
      have hmul : Real.pi * ((a : ℝ) * mk + (b : ℝ) * mj) = 0 := by
        linear_combination (a : ℝ) * hk + (b : ℝ) * hj + β * q2' + Real.pi ^ 2 * q3'
      rcases mul_eq_zero.1 hmul with h | h
      · exact absurd h hπ
      · exact h
    have hpp : (a : ℝ) * ((pk : ℝ) * t) + (b : ℝ) * ((pj : ℝ) * t) = 0 := by
      linear_combination t * q1'
    rw [hlk, hlj]
    have hshape : (a : ℂ) * ((((pk : ℝ) * t : ℝ) : ℂ) + ((mk : ℝ) : ℂ) * Complex.I)
        + (b : ℂ) * ((((pj : ℝ) * t : ℝ) : ℂ) + ((mj : ℝ) : ℂ) * Complex.I)
        = ((((a : ℝ) * ((pk : ℝ) * t) + (b : ℝ) * ((pj : ℝ) * t)) : ℝ) : ℂ)
          + ((((a : ℝ) * mk + (b : ℝ) * mj) : ℝ) : ℂ) * Complex.I := by push_cast; ring
    rw [hshape, hpp, hmm]; simp
  rcases rank_one_dichotomy hid with ⟨a, b, hab, k1, k2, k3, k4, k5, k6⟩
    | ⟨a, b, hab, k1, k2, k3, k4, k5, k6⟩
  · exact Or.inr ⟨a, b, hab,
      combine a b p₁ e₁ f₁ p₂ e₂ f₂ n₁ n₂ l₁ l₂ hn₁ hn₂ hl₁ hl₂ k1 k2 k3,
      combine a b p₃ e₃ f₃ p₄ e₄ f₄ n₃ n₄ l₃ l₄ hn₃ hn₄ hl₃ hl₄ k4 k5 k6⟩
  · exact Or.inl ⟨a, b, hab,
      combine a b p₁ e₁ f₁ p₃ e₃ f₃ n₁ n₃ l₁ l₃ hn₁ hn₃ hl₁ hl₃ k1 k2 k3,
      combine a b p₂ e₂ f₂ p₄ e₄ f₄ n₂ n₄ l₂ l₄ hn₂ hn₄ hl₂ hl₄ k4 k5 k6⟩

/-! ## 5.  Two corollaries.

The first says what the no-go is for: on this half the hypothesis package of the four
exponentials statement is *unsatisfiable* over the certified logarithm space.  The second
checks that the no-go is not vacuous, on the machine-checked witness `wC` of
`DZ_ALIGNED_core.lean` (`‖wC‖² = 16√2`, `β = 1`, so `‖wC‖² ∉ ℚ·β`). -/

/-- The hypotheses of `DiazAligned.FourExpDet` cannot be met by a determinant-zero matrix over
`span_ℚ {u, conj u, 2πi}` on the norm-free half. -/
theorem fourExp_hypotheses_unsatisfiable
    (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ))
    (u : ℂ) (r : ℚ)
    (hre : u.re ≠ 0)
    (hβ0 : Real.pi * (u.im + (r : ℝ) * Real.pi) ≠ 0)
    (hβalg : IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ))
    (hAalg : IsAlgebraic ℚ ((((‖u‖ : ℝ)) ^ 2 : ℝ) : ℂ))
    (hfree : ¬ ∃ c : ℚ, (‖u‖ : ℝ) ^ 2 = (c : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi)))
    {l₁ l₂ l₃ l₄ : ℂ}
    (hm₁ : MemL3 u l₁) (hm₂ : MemL3 u l₂) (hm₃ : MemL3 u l₃) (hm₄ : MemL3 u l₄)
    (hrows : ∀ a b : ℚ, (a : ℂ) * l₁ + (b : ℂ) * l₃ = 0 → (a : ℂ) * l₂ + (b : ℂ) * l₄ = 0 →
      a = 0 ∧ b = 0)
    (hcols : ∀ a b : ℚ, (a : ℂ) * l₁ + (b : ℂ) * l₂ = 0 → (a : ℂ) * l₃ + (b : ℂ) * l₄ = 0 →
      a = 0 ∧ b = 0)
    (hdet : l₁ * l₄ - l₂ * l₃ = 0) : False := by
  rcases no_admissible_matrix hpi u r hre hβ0 hβalg hAalg hfree hm₁ hm₂ hm₃ hm₄ hdet with
    ⟨a, b, hab, h1, h2⟩ | ⟨a, b, hab, h1, h2⟩
  · obtain ⟨ha, hb⟩ := hrows a b h1 h2
    rcases hab with h | h
    · exact h ha
    · exact h hb
  · obtain ⟨ha, hb⟩ := hcols a b h1 h2
    rcases hab with h | h
    · exact h ha
    · exact h hb

/-- The witness `wC` of `DZ_ALIGNED_core.lean` really does satisfy every hypothesis of
`no_admissible_matrix`, with `r = 1`, `β = 1`, `‖wC‖² = 16√2`. -/
theorem wC_no_admissible_matrix (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ))
    {l₁ l₂ l₃ l₄ : ℂ}
    (hm₁ : MemL3 DiazAligned.wC l₁) (hm₂ : MemL3 DiazAligned.wC l₂)
    (hm₃ : MemL3 DiazAligned.wC l₃) (hm₄ : MemL3 DiazAligned.wC l₄)
    (hdet : l₁ * l₄ - l₂ * l₃ = 0) :
    (∃ a b : ℚ, (a ≠ 0 ∨ b ≠ 0) ∧
        (a : ℂ) * l₁ + (b : ℂ) * l₃ = 0 ∧ (a : ℂ) * l₂ + (b : ℂ) * l₄ = 0)
  ∨ (∃ a b : ℚ, (a ≠ 0 ∨ b ≠ 0) ∧
        (a : ℂ) * l₁ + (b : ℂ) * l₂ = 0 ∧ (a : ℂ) * l₃ + (b : ℂ) * l₄ = 0) := by
  have him : DiazAligned.wC.im = DiazLeafSplit.yA := rfl
  have hb1 : Real.pi * (DiazAligned.wC.im + ((1 : ℚ) : ℝ) * Real.pi) = 1 := by
    rw [him]; exact DiazAligned.beta_yA
  refine no_admissible_matrix hpi DiazAligned.wC 1 (ne_of_gt DiazAligned.wC_re_pos)
    (by rw [hb1]; exact one_ne_zero) ?_ ?_ ?_ hm₁ hm₂ hm₃ hm₄ hdet
  · rw [hb1]; simpa using (isAlgebraic_one (R := ℚ) (A := ℂ))
  · have h := DiazAligned.norm_wC_alg
    have := alg_pow h 2
    have e : ((((‖DiazAligned.wC‖ : ℝ)) ^ 2 : ℝ) : ℂ) = (((‖DiazAligned.wC‖ : ℝ)) : ℂ) ^ 2 := by
      push_cast; ring
    rw [e]; exact this
  · rintro ⟨c, hc⟩
    rw [hb1, DiazAligned.norm_wC_sq] at hc
    exact irrational_sqrt_two ⟨c / 16, by push_cast; linarith [hc]⟩

end DiazFree
