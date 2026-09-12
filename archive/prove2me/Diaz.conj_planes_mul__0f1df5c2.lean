import Mathlib
import Definitions.Def_Diaz_Closure
import Definitions.Def_Diaz_Instantiation

open ComplexConjugate
open Diaz

open Diaz in
theorem solution {K : Subfield ℂ} {u : ℂ} (hρ : u * conj u ∈ K)
    {A B C D : ℂ} (hA : A ∈ K) (hB : B ∈ K) (hC : C ∈ K) (hD : D ∈ K) :
    ∃ p q r : ℂ, p ∈ K ∧ q ∈ K ∧ r ∈ K ∧
      (A + B * u) * (C + D * conj u) = p + q * u + r * conj u := by
  refine ⟨A * C + B * D * (u * conj u), B * C, A * D,
    K.add_mem (K.mul_mem hA hC) (K.mul_mem (K.mul_mem hB hD) hρ),
    K.mul_mem hB hC, K.mul_mem hA hD, by ring⟩
