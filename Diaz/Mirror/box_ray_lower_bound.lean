/-
Mirrored from Prove2Me: `DiazModulus.box_ray_lower_bound`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.box_ray_lower_bound__8583ffd8.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

open Complex ComplexConjugate

/-! # The box count along the ray `u ↦ u · D`, from below

The products over `H` and `J` are over constant factors, hence the powers
`(uD₀ + 1)^{|H|}` and `(2uD₁ + 1)^{|J|}` (`Finset.prod_const`). The left side regroups as
`(uD₀)^{|H|} (uD₁)^{|J|}` (`mul_pow`, `pow_add`), and factor by factor `uD₀ ≤ uD₀ + 1` and
`uD₁ ≤ 2uD₁ + 1`; monotonicity of powers and products finishes. No hypotheses are needed. -/

namespace C11_A2b

theorem regroup (u D₀ D₁ h j : ℕ) :
    u ^ (h + j) * (D₀ ^ h * D₁ ^ j) = (u * D₀) ^ h * (u * D₁) ^ j := by
  rw [mul_pow, mul_pow, pow_add]; ring

end C11_A2b

open C11_A2b in
theorem box_ray_lower_bound {A₀ A₁ : Type*} (D₀ D₁ : ℕ) (H : Finset A₀) (J : Finset A₁) (u : ℕ) :
    u ^ (H.card + J.card) * (D₀ ^ H.card * D₁ ^ J.card)
      ≤ (∏ _h ∈ H, (u * D₀ + 1)) * ∏ _j ∈ J, (2 * (u * D₁) + 1) := by
  simp only [Finset.prod_const]
  rw [regroup]
  exact Nat.mul_le_mul (Nat.pow_le_pow_left (Nat.le_succ _) _)
    (Nat.pow_le_pow_left (by omega) _)

end Diaz
