/-
Mirrored from Prove2Me: `Diaz.conj_planes_mul`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.conj_planes_mul__0f1df5c2.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

theorem conj_planes_mul {K : Subfield ℂ} {u : ℂ} (hρ : u * conj u ∈ K)
    {A B C D : ℂ} (hA : A ∈ K) (hB : B ∈ K) (hC : C ∈ K) (hD : D ∈ K) :
    ∃ p q r : ℂ, p ∈ K ∧ q ∈ K ∧ r ∈ K ∧
      (A + B * u) * (C + D * conj u) = p + q * u + r * conj u := by
  refine ⟨A * C + B * D * (u * conj u), B * C, A * D,
    K.add_mem (K.mul_mem hA hC) (K.mul_mem (K.mul_mem hB hD) hρ),
    K.mul_mem hB hC, K.mul_mem hA hD, by ring⟩

end Diaz
