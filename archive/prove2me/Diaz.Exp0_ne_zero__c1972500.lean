import Mathlib
import Definitions.Def_Diaz_Exponential

namespace Diaz

section
open ComplexConjugate

theorem Exp0_pos (x : ℚ × ℚ) : 0 < Exp0 x := Real.rpow_pos_of_pos (by norm_num) _
end

end Diaz

section
open ComplexConjugate

open Diaz in
theorem solution (x : ℚ × ℚ) : Exp0 x ≠ 0 := (Exp0_pos x).ne'
end
