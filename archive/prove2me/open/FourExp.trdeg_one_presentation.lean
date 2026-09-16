-- Open on Prove2Me: statement only, not a proof. Node `FourExp.trdeg_one_presentation`, theorem id f300d712-2c41-46f4-99a9-5475f13944ac.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem trdeg_one_presentation
    (x₁ x₂ y₁ y₂ : ℂ) (hx : LinearIndependent ℚ ![x₁, x₂]) (hy : LinearIndependent ℚ ![y₁, y₂])
    (hexp : ∀ i j : Fin 2, IsAlgebraic ℚ (Complex.exp (![x₁, x₂] i * ![y₁, y₂] j)))
    (htr : Algebra.trdeg ℚ ↥(Algebra.adjoin ℚ ({x₁, x₂, y₁, y₂} : Set ℂ)) ≤ 1) :
    ∃ ω ω₁ : ℂ, Transcendental ℚ ω ∧ ∃ Q : Polynomial (Polynomial ℤ),
        Q.Monic ∧ 0 < Q.natDegree ∧ Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ Q = 0 ∧
        (∀ A : Polynomial (Polynomial ℤ), A.natDegree < Q.natDegree → Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ A = 0 → A = 0) ∧
        ∃ (D : Polynomial (Polynomial ℤ)) (E G : Fin 2 → Polynomial (Polynomial ℤ)) (H : Fin 2 → Fin 2 → Polynomial (Polynomial ℤ)),
          Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ D ≠ 0 ∧ (∀ i, ![x₁, x₂] i * Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ D = Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ (E i)) ∧
          (∀ j, ![y₁, y₂] j * Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ D = Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ (G j)) ∧
          (∀ i j, Complex.exp (![x₁, x₂] i * ![y₁, y₂] j) * Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ D = Polynomial.eval₂ (Polynomial.eval₂RingHom (Int.castRingHom ℂ) ω) ω₁ (H i j)) := by
  sorry

end FourExp
