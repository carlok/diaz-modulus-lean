import Mathlib

open ComplexConjugate

/-! Verbatim copy of the published `formal_statement` of every `Diaz.*` node. -/

theorem Diaz.exp_ratio_pow_eq_one_iff (v : ℂ) (m : ℕ) :
    (Complex.exp v / conj (Complex.exp v)) ^ m = 1
      ↔ ∃ n : ℤ, (m : ℝ) * v.im = (n : ℝ) * Real.pi := by sorry

theorem Diaz.quantisation_orbit_iff_re_ne_zero {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi) :
    (∀ q : ℚ, q ≠ 0 → ∀ m : ℕ, 0 < m →
        (Complex.exp ((q : ℂ) * u) / conj (Complex.exp ((q : ℂ) * u))) ^ m = 1 →
        Real.pi ^ 2 / (m : ℝ) ^ 2 < Complex.normSq ((q : ℂ) * u))
      ↔ u.re ≠ 0 := by sorry

theorem Diaz.plane_normSq_algebraic_iff {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (a b : ℚ) :
    IsAlgebraic ℚ ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u) : ℝ) : ℂ)
      ↔ a = 0 ∨ b = 0 := by sorry

theorem Diaz.period_plane_classification {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (a b c : ℚ) :
    IsAlgebraic ℚ ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u
        + 2 * (Real.pi : ℂ) * (c : ℂ) * Complex.I) : ℝ) : ℂ)
      ↔ (c = -(a * (k : ℚ)) ∨ c = b * (k : ℚ)) := by sorry

theorem Diaz.fibre_second_point_is_conj {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (q : ℚ) (n : ℤ) (hn0 : n ≠ 0)
    (halg : IsAlgebraic ℚ ((Complex.normSq ((q : ℂ) * u
        + 2 * (Real.pi : ℂ) * (n : ℂ) * Complex.I) : ℝ) : ℂ)) :
    q * (k : ℚ) = -(n : ℚ)
      ∧ (q : ℂ) * u + 2 * (Real.pi : ℂ) * (n : ℂ) * Complex.I = conj ((q : ℂ) * u)
      ∧ (Complex.exp ((q : ℂ) * u)).im = 0 := by sorry

theorem Diaz.two_failures_give_algebraic_log_product {t₁ t₂ : ℝ}
    (e₁ : IsAlgebraic ℚ ((Real.exp t₁ : ℝ) : ℂ)) (e₂ : IsAlgebraic ℚ ((Real.exp t₂ : ℝ) : ℂ))
    (h₁ : IsAlgebraic ℚ ((t₁ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ))
    (h₂ : IsAlgebraic ℚ ((t₂ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ)) :
    IsAlgebraic ℚ ((Real.exp (t₁ + t₂) : ℝ) : ℂ)
      ∧ IsAlgebraic ℚ ((Real.exp (t₁ - t₂) : ℝ) : ℂ)
      ∧ IsAlgebraic ℚ (((t₁ + t₂) * (t₁ - t₂) : ℝ) : ℂ)
      ∧ (t₁ ^ 2 ≠ t₂ ^ 2 → ((t₁ + t₂) * (t₁ - t₂) : ℝ) ≠ 0) := by sorry

theorem Diaz.failure_rational_multiple_rigid {t₁ t₂ : ℝ} (ht₁ : t₁ ≠ 0)
    (e₁ : IsAlgebraic ℚ ((Real.exp t₁ : ℝ) : ℂ))
    (h₁ : IsAlgebraic ℚ ((t₁ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ))
    (h₂ : IsAlgebraic ℚ ((t₂ ^ 2 + Real.pi ^ 2 : ℝ) : ℂ))
    (r : ℚ) (hr : t₂ = (r : ℝ) * t₁) : r = 1 ∨ r = -1 := by sorry
