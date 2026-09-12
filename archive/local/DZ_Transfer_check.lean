import Definitions.Def_DiazModulus

open Complex ComplexConjugate

namespace TransferCheck
open DiazModulus

theorem hom_inj (Φ : ℂ →+* ℂ) : Function.Injective Φ := Φ.injective

/-- A ring hom fixing `Qbar` pointwise commutes with `Qbar`-scaling. -/
theorem map_smul' (Φ : ℂ →+* ℂ) (hfix : ∀ a : ↥Qbar, Φ (a : ℂ) = (a : ℂ))
    (a : ↥Qbar) (z : ℂ) : Φ (a • z) = a • Φ z := by
  show Φ ((a : ℂ) * z) = (a : ℂ) * Φ z
  rw [map_mul, hfix]

/-- **A ring hom fixing `Qbar` preserves `Qbar`-linear independence, in both directions.**
This is the step that carries a six-exponentials template at `u` to one at `Φ u`. -/
theorem indep_transfer {n : ℕ} (Φ : ℂ →+* ℂ)
    (hfix : ∀ a : ↥Qbar, Φ (a : ℂ) = (a : ℂ)) (x : Fin n → ℂ) :
    LinearIndependent (↥Qbar) x ↔ LinearIndependent (↥Qbar) (fun i => Φ (x i)) := by
  classical
  rw [Fintype.linearIndependent_iff, Fintype.linearIndependent_iff]
  constructor
  · intro h g hg i
    refine h g ?_ i
    apply hom_inj Φ
    rw [map_zero, map_sum]
    rw [← hg]
    exact Finset.sum_congr rfl fun j _ => map_smul' Φ hfix (g j) (x j)
  · intro h g hg i
    refine h g ?_ i
    rw [← map_zero Φ, ← hg, map_sum]
    exact (Finset.sum_congr rfl fun j _ => map_smul' Φ hfix (g j) (x j)).symm

end TransferCheck
