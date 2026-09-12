import Mathlib


section
open ComplexConjugate
variable {K : Subfield ℂ} {u t : ℂ}

theorem solution (Φ : ℂ →+* ℂ) (hK : ∀ a ∈ K, Φ a = a)
    {m n : ℕ} (M : Matrix (Fin m) (Fin n) ℂ) (w : Fin m → ℂ) (v : Fin n → ℂ)
    (hw : ∀ i, w i ∈ K) (hv : ∀ j, v j ∈ K) :
    Φ (∑ i, ∑ j, w i * M i j * v j) = ∑ i, ∑ j, w i * (Φ (M i j)) * v j := by
  rw [map_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [map_mul, map_mul, hK _ (hw i), hK _ (hv j)]
end
