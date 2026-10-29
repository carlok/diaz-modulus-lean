/-
Mirrored from Prove2Me: `DiazModulus.nat_telescope_step`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.nat_telescope_step__46b129fd.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

open Complex ComplexConjugate

/-! # One telescoping step: `u · g(u) ≤ f(2u)`

The step that replaces the polynomial argument of DALAG's Lemma 5.4 at finite level. If `g` is
monotone and `g(v + 1) + f(v) ≤ f(v + 1)` for every `v`, then by induction on `k`,
`f(u) + k · g(u) ≤ f(u + k)`: each step adds `g(u + k + 1) ≥ g(u)`. Taking `k = u` gives
`u · g(u) ≤ f(u) + u · g(u) ≤ f(2u)`. -/

namespace C11_telescopeStep

/-- `f(u) + k · g(u) ≤ f(u + k)`. -/
theorem add_mul_le (f g : ℕ → ℕ) (hg : Monotone g) (h : ∀ v, g (v + 1) + f v ≤ f (v + 1))
    (u k : ℕ) : f u + k * g u ≤ f (u + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
    have h1 := h (u + k)
    have h2 : g u ≤ g (u + k + 1) := hg (by omega)
    rw [Nat.succ_mul, ← Nat.add_assoc u k 1]
    omega

end C11_telescopeStep

open C11_telescopeStep in
theorem nat_telescope_step (f g : ℕ → ℕ) (hg : Monotone g) (h : ∀ v, g (v + 1) + f v ≤ f (v + 1)) (u : ℕ) :
    u * g u ≤ f (2 * u) := by
  have := add_mul_le f g hg h u u
  rw [show u + u = 2 * u by ring] at this
  omega

end Diaz
