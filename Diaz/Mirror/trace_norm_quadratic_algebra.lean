/-
Mirrored from Prove2Me: `Diaz.trace_norm_quadratic_algebra`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.trace_norm_quadratic_algebra__5a95accc.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

theorem trace_norm_quadratic_algebra {R : Type*} [CommRing R] (σ : R →+* R) (hσ : ∀ x, σ (σ x) = x)
    (u v : R) :
    (u * σ v) + σ (u * σ v)
        = u * σ u + v * σ v - (u - v) * σ (u - v)
      ∧ (u * σ v) * σ (u * σ v) = (u * σ u) * (v * σ v) := by
  constructor
  · simp only [map_mul, hσ, map_sub]
    ring
  · simp only [map_mul, hσ]
    ring

end Diaz
