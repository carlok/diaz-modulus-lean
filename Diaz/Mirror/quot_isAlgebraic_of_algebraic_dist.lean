/-
Mirrored from Prove2Me: `Diaz.quot_isAlgebraic_of_algebraic_dist`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.quot_isAlgebraic_of_algebraic_dist__0ac19860.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

theorem quot_isAlgebraic_of_algebraic_dist {K : Subfield ℂ} {u v : ℂ} (hv0 : v ≠ 0)
    (hu : u * conj u ∈ K) (hv : v * conj v ∈ K)
    (hd : (u - v) * conj (u - v) ∈ K) :
    IsAlgebraic (↥K) (u / v) := by
  have hcv : conj v ≠ 0 := by simpa using hv0
  have hc0 : v * conj v ≠ 0 := mul_ne_zero hv0 hcv
  have hs : u * conj v + conj u * v ∈ K := by
    have e : u * conj v + conj u * v
        = u * conj u + v * conj v - (u - v) * conj (u - v) := by
      simp [map_sub]; ring
    rw [e]; exact K.sub_mem (K.add_mem hu hv) hd
  have hp : (u * conj v) * (conj u * v) ∈ K := by
    have e : (u * conj v) * (conj u * v) = (u * conj u) * (v * conj v) := by ring
    rw [e]; exact K.mul_mem hu hv
  refine ⟨Polynomial.X ^ 2
      - Polynomial.C (⟨(u * conj v + conj u * v) / (v * conj v), K.div_mem hs hv⟩ : ↥K)
        * Polynomial.X
      + Polynomial.C (⟨((u * conj v) * (conj u * v)) / ((v * conj v) * (v * conj v)),
          K.div_mem hp (K.mul_mem hv hv)⟩ : ↥K), ?_, ?_⟩
  · intro h
    have h2 := congrArg (fun p => Polynomial.coeff p 2) h
    simp at h2
  · simp only [map_add, map_sub, map_mul, map_pow, Polynomial.aeval_X, Polynomial.aeval_C]
    show (u / v) ^ 2 - ((u * conj v + conj u * v) / (v * conj v)) * (u / v)
      + ((u * conj v) * (conj u * v)) / ((v * conj v) * (v * conj v)) = 0
    field_simp
    ring

end Diaz
