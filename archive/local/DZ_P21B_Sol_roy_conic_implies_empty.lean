import Mathlib

open ComplexConjugate

theorem solution {ρ : ℂ} (hρ : ρ ≠ 0) (L : Set ℂ)
    (hRoy : ∀ p : Fin 2 → ℂ, (∀ i, p i ∈ L) → p 0 * p 1 = ρ →
      ∃ V : Submodule ℚ (Fin 2 → ℂ), p ∈ V ∧ ∀ q ∈ V, q 0 * q 1 = ρ) :
    ∀ p : Fin 2 → ℂ, (∀ i, p i ∈ L) → p 0 * p 1 ≠ ρ := by
  intro p hp hcon
  obtain ⟨V, -, hV⟩ := hRoy p hp hcon
  have h0 := hV 0 V.zero_mem
  simp only [Pi.zero_apply, mul_zero] at h0
  exact hρ h0.symm
