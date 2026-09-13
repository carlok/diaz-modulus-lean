import Mathlib
import Definitions.Def_Diaz_Closure
import Definitions.Def_Diaz_Instantiation

open ComplexConjugate
open Diaz

theorem solution {R : Type*} [CommRing R] (σ : R →+* R) (hσ : ∀ x, σ (σ x) = x)
    (u v : R) :
    (u * σ v) + σ (u * σ v)
        = u * σ u + v * σ v - (u - v) * σ (u - v)
      ∧ (u * σ v) * σ (u * σ v) = (u * σ u) * (v * σ v) := by
  constructor
  · simp only [map_mul, hσ, map_sub]
    ring
  · simp only [map_mul, hσ]
    ring
