/-
Mirrored from Prove2Me: `Diaz.quadratic_algebra_distance`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.quadratic_algebra_distance__b742c757.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

theorem quadratic_algebra_distance {R : Type*} [CommRing R] (σ : R →+* R) (hσ : ∀ x, σ (σ x) = x)
    (A : Subring R)
    (hquad : ∀ z p q : R, p ∈ A → q ∈ A → z * z - p * z + q = 0 → z ∈ A)
    {u v : R} (hu : u * σ u ∈ A) (hv : v * σ v ∈ A)
    (huv : (u - v) * σ (u - v) ∈ A) :
    u * σ v ∈ A := by
  have htr : (u * σ v) + σ (u * σ v)
      = u * σ u + v * σ v - (u - v) * σ (u - v) := by
    simp only [map_mul, hσ, map_sub]; ring
  have hnz : (u * σ v) * σ (u * σ v) = (u * σ u) * (v * σ v) := by
    simp only [map_mul, hσ]; ring
  refine hquad (u * σ v) ((u * σ v) + σ (u * σ v)) ((u * σ v) * σ (u * σ v)) ?_ ?_ (by ring)
  · rw [htr]; exact A.sub_mem (A.add_mem hu hv) huv
  · rw [hnz]; exact A.mul_mem hu hv

end Diaz
