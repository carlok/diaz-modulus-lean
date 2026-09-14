-- Open on Prove2Me: statement only, not a proof. Node `FourExp.transcendence_criterion`, theorem id 65f053a5-33bf-46c5-95a8-ac81974255c5.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

open Filter Topology

namespace FourExp

theorem transcendence_criterion
    (α : ℂ) (ε : ℝ) (hε : 0 < ε)
    (σ₁ σ₂ : ℝ → ℝ) (hσ₁ : StrictMono σ₁) (hσ₂ : StrictMono σ₂)
    (hσ₁t : Tendsto σ₁ atTop atTop) (hσ₂t : Tendsto σ₂ atTop atTop)
    (a₁ a₂ : ℝ) (ha₁ : 1 ≤ a₁) (ha₂ : 1 ≤ a₂)
    (h₂₁ : ∀ x : ℝ, 0 < x → σ₂ x ≤ σ₁ x)
    (hgrowth₁ : ∀ x : ℝ, 0 < x → σ₁ (x + 1) ≤ a₁ * σ₁ x)
    (hgrowth₂ : ∀ x : ℝ, 0 < x → σ₂ (x + 1) ≤ a₂ * σ₂ x)
    (N₀ : ℕ) (P : ℕ → Polynomial ℤ)
    (hP_ne : ∀ N : ℕ, N₀ < N → P N ≠ 0)
    (hP_height : ∀ N : ℕ, N₀ < N → ∀ i : ℕ, |((P N).coeff i : ℝ)| ≤ Real.exp (σ₁ N))
    (hP_deg : ∀ N : ℕ, N₀ < N → ((P N).natDegree : ℝ) ≤ σ₂ N)
    (hP_small : ∀ N : ℕ, N₀ < N →
      ‖Polynomial.aeval α (P N)‖ <
        Real.exp (-(max (10 + ε) ((4 + ε) * (a₁ * a₂)) * σ₁ N * σ₂ N))) :
    IsAlgebraic ℚ α := by
  sorry

end FourExp
