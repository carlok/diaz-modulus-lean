import Mathlib
import Definitions.Def_Diaz_Closure

namespace Diaz

end Diaz

section
open ComplexConjugate
variable (K : Subfield ℂ) (u : ℂ)
variable {K u}

open Diaz in
theorem solution {a : ℂ} (hne : conj a ≠ a) :
    ¬ (∀ z ∈ hull K u, conj (a * z) = a * conj z) := by
  intro h
  exact hne (by simpa using h 1 (hull K u).one_mem)
end
