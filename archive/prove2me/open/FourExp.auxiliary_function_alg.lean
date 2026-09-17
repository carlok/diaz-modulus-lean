-- Open on Prove2Me: statement only, not a proof. Node `FourExp.auxiliary_function_alg`, theorem id 88de0071-cb97-40ae-90e2-33e7eb593322.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem auxiliary_function_alg
    (x₁ x₂ y₁ y₂ : ℂ)
    (hexp : ∀ i j : Fin 2, IsAlgebraic ℚ (Complex.exp (![x₁, x₂] i * ![y₁, y₂] j))) (ω ω₁ : ℂ) (hω : Transcendental ℚ ω) (Q : Polynomial (Polynomial ℤ)) (hQm : Q.Monic) (hQd : 0 < Q.natDegree)
    (hQroot : Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ Q = 0)
    (hQmin : ∀ A : Polynomial (Polynomial ℤ), A.natDegree < Q.natDegree → Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ A = 0 → A = 0)
    (D : Polynomial (Polynomial ℤ)) (E G : Fin 2 → Polynomial (Polynomial ℤ)) (H : Fin 2 → Fin 2 → Polynomial (Polynomial ℤ))
    (hD : Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ D ≠ 0) (hE : ∀ i, ![x₁, x₂] i * Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ D = Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ (E i))
    (hG : ∀ j, ![y₁, y₂] j * Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ D = Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ (G j))
    (hH : ∀ i j, Complex.exp (![x₁, x₂] i * ![y₁, y₂] j) * Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ D = Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ (H i j)) :
    ∃ κ : ℝ, 0 < κ ∧ ∃ N₀ : ℕ, ∀ N : ℕ, N₀ < N →
      ∃ M : ℕ, (M : ℝ) ≤ κ * ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊ ∧
      ∃ q : Fin ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊ → Fin (2 * N) → Fin (2 * N) → Fin M → Fin Q.natDegree → ℤ,
        (∀ i j k' μ ν, |((q i j k' μ ν : ℤ) : ℝ)| ≤ Real.exp (κ * ((N : ℝ) ^ 2 * Real.sqrt (Real.log (N : ℝ))))) ∧
        (∃ i j k', (fun i j k' => ∑ μ : Fin M, ∑ ν : Fin Q.natDegree, ((q i j k' μ ν : ℤ) : ℂ) * ω ^ (μ : ℕ) * ω₁ ^ (ν : ℕ)) i j k' ≠ 0) ∧
        (∀ i j k', ‖(fun i j k' => ∑ μ : Fin M, ∑ ν : Fin Q.natDegree, ((q i j k' μ ν : ℤ) : ℂ) * ω ^ (μ : ℕ) * ω₁ ^ (ν : ℕ)) i j k'‖ ≤ Real.exp (κ * ((N : ℝ) ^ 2 * Real.sqrt (Real.log (N : ℝ))))) ∧
        (∀ a b m : ℕ, a < ⌊(N : ℝ) / Real.sqrt (Real.log (N : ℝ))⌋₊ → b < ⌊(N : ℝ) * Real.sqrt (Real.log (N : ℝ))⌋₊ → m < ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊ →
          iteratedDeriv m (fun z : ℂ => ∑ i : Fin ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊, ∑ j : Fin (2 * N), ∑ k' : Fin (2 * N),
              (fun i j k' => ∑ μ : Fin M, ∑ ν : Fin Q.natDegree, ((q i j k' μ ν : ℤ) : ℂ) * ω ^ (μ : ℕ) * ω₁ ^ (ν : ℕ)) i j k' * z ^ (i : ℕ) * Complex.exp ((((j : ℕ) : ℂ) * x₁ + ((k' : ℕ) : ℂ) * x₂) * z)) ((a : ℂ) * y₁ + (b : ℂ) * y₂) = 0) := by
  sorry

end FourExp
