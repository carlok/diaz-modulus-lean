import Mathlib


section
open ComplexConjugate
variable {K : Subfield ℂ} {u : ℂ}

theorem solution (hT : Transcendental K u) (hρ : u * conj u ∈ K) :
    conj u ≠ u ∧ conj u ≠ -u := by
  have key : u ^ 2 ∈ K → False := by
    intro hsq
    refine hT ⟨Polynomial.X ^ 2 - Polynomial.C (⟨_, hsq⟩ : K),
      (Polynomial.monic_X_pow_sub_C _ (by norm_num)).ne_zero, ?_⟩
    simp only [map_sub, map_pow, Polynomial.aeval_X, Polynomial.aeval_C]
    show u ^ 2 - u ^ 2 = 0
    ring
  constructor
  · intro h
    exact key (by rw [show u ^ 2 = u * conj u by rw [h]; ring]; exact hρ)
  · intro h
    refine key ?_
    have : u * conj u = -u ^ 2 := by rw [h]; ring
    rw [this] at hρ
    simpa using neg_mem hρ
end
