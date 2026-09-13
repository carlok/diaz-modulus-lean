/-
Mirrored from Prove2Me: `Diaz.coeff_transfer_iff`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.coeff_transfer_iff__ed698637.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

open ComplexConjugate

theorem coeff_transfer_iff {K : Subfield ℂ} {m n : Type*} [Fintype m] [Fintype n]
    (Φ : ℂ →+* ℂ) (hK : ∀ a ∈ K, Φ a = a)
    (M : Matrix m n ℂ) (w : m → ℂ) (v : n → ℂ)
    (hw : ∀ i, w i ∈ K) (hv : ∀ j, v j ∈ K) :
    Φ (∑ i, ∑ j, w i * M i j * v j) = ∑ i, ∑ j, w i * Φ (M i j) * v j ∧
      ((∑ i, ∑ j, w i * M i j * v j) = 0 ↔ (∑ i, ∑ j, w i * Φ (M i j) * v j) = 0) := by
  have key : Φ (∑ i, ∑ j, w i * M i j * v j) = ∑ i, ∑ j, w i * Φ (M i j) * v j := by
    rw [map_sum]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [map_sum]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [map_mul, map_mul, hK _ (hw i), hK _ (hv j)]
  refine ⟨key, ?_, ?_⟩
  · intro h0
    rw [← key, h0, map_zero]
  · intro h0
    refine Φ.injective ?_
    rw [key, h0, map_zero]

end Diaz
