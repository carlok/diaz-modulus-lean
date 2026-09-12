import Mathlib
import Definitions.Def_Diaz_Closure

namespace Diaz

end Diaz

section
open ComplexConjugate
variable (K : Subfield ℂ) (u : ℂ)
variable {K u}

open Diaz in
theorem solution (f g : ℂ →+* ℂ) (hK : ∀ z ∈ K, f z = g z) (hu : f u = g u) :
    ∀ z ∈ hull K u, f z = g z := by
  intro z hz
  induction hz using Subfield.closure_induction with
  | mem x hx =>
      rcases hx with hx | hx
      · exact hK x hx
      · rw [Set.mem_singleton_iff] at hx; subst hx; exact hu
  | one => simp
  | add x y _ _ hx hy => rw [map_add, map_add, hx, hy]
  | neg x _ hx => rw [map_neg, map_neg, hx]
  | inv x _ hx => rw [map_inv₀, map_inv₀, hx]
  | mul x y _ _ hx hy => rw [map_mul, map_mul, hx, hy]
end
