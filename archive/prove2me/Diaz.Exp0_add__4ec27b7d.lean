import Mathlib
import Definitions.Def_Diaz_Exponential

namespace Diaz

end Diaz

section
open ComplexConjugate

open Diaz in
theorem solution (x y : ℚ × ℚ) : Exp0 (x + y) = Exp0 x * Exp0 y := by
  simp only [Exp0, Prod.fst_add, Prod.snd_add]
  rw [← Real.rpow_add (by norm_num)]
  push_cast
  ring_nf
end
