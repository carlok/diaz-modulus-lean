/-
Mirrored from Prove2Me: `FourExp.expPoly_zero_count`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/FourExp.expPoly_zero_count__236257b1.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.expPoly_zero_count_scaled
import Diaz.Mirror.zero_count_degenerate
import Diaz.Mirror.zero_count_arith
import Diaz.Mirror.zero_count_arith_poly

namespace Diaz

open Finset

theorem expPoly_zero_count
    {l : ℕ} (q : Fin l → ℕ) (ω : Fin l → ℂ) (hω : Function.Injective ω)
    (b : (j : Fin l) → Fin (q j) → ℂ) (hb : ∃ j i, b j i ≠ 0)
    (z₀ : ℂ) (ρ : ℝ) (hρ : 0 ≤ ρ) (lam : ℝ) (hlam : 0 < lam)
    (S : Finset ℂ) (hS : ∀ z ∈ S, ‖z - z₀‖ ≤ ρ) :
    (∑ z ∈ S, (analyticOrderNatAt
        (fun w : ℂ => ∑ j, ∑ i : Fin (q j), b j i * w ^ (i : ℕ) * Complex.exp (ω j * w)) z : ℝ))
      < ((∑ j, q j : ℕ) : ℝ) / lam
        + 2 * (1 + ((∑ j, q j : ℕ) : ℝ) ^ lam) / (lam * Real.log ((∑ j, q j : ℕ) : ℝ))
          * (1 + ρ * ⨆ j, ‖ω j‖) := by
  classical
  have hΩ0 : 0 ≤ ⨆ j, ‖ω j‖ := Real.iSup_nonneg (fun j => norm_nonneg _)
  have hx : 0 ≤ ρ * ⨆ j, ‖ω j‖ := mul_nonneg hρ hΩ0
  have hcast : (∑ z ∈ S, (analyticOrderNatAt
      (fun w : ℂ => ∑ j, ∑ i : Fin (q j), b j i * w ^ (i : ℕ) * Complex.exp (ω j * w)) z : ℝ))
      = ((∑ z ∈ S, analyticOrderNatAt
      (fun w : ℂ => ∑ j, ∑ i : Fin (q j), b j i * w ^ (i : ℕ) * Complex.exp (ω j * w)) z : ℕ) : ℝ) := by
    push_cast; rfl
  by_cases hdeg : (∑ j, q j) ≤ 1 ∨ (⨆ j, ‖ω j‖) = 0
  · have h1 := zero_count_degenerate q ω hω b hb S hdeg
    rw [hcast]
    exact zero_count_arith_poly (∑ j, q j) (ρ * ⨆ j, ‖ω j‖) lam hx hlam _ h1
  · push_neg at hdeg
    obtain ⟨hn, hΩ⟩ := hdeg
    have hΩpos : 0 < ⨆ j, ‖ω j‖ := lt_of_le_of_ne hΩ0 (Ne.symm hΩ)
    have h2 := expPoly_zero_count_scaled q ω hω b hb z₀ ρ hρ S hS hΩpos
    exact zero_count_arith (∑ j, q j) (by omega) (ρ * ⨆ j, ‖ω j‖) lam hx hlam _
      (Finset.sum_nonneg (fun z _ => Nat.cast_nonneg _)) h2

end Diaz
