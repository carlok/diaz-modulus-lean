import Mathlib
import Definitions.Def_Diaz_Rigidity

namespace Diaz

end Diaz

section
open ComplexConjugate
variable {K : Subfield ℂ} {u r : ℂ}

open Diaz in
theorem solution (h : u * conj u = r ^ 2) : (Hmat u r).det = 0 := by
  rw [Hmat, Matrix.det_fin_two_of, h]; ring
end
