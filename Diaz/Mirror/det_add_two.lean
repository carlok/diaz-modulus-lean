/-
Mirrored from Prove2Me: `Diaz.det_add_two`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.det_add_two__217872be.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

open ComplexConjugate

theorem det_add_two {R : Type*} [CommRing R] (X Y : Matrix (Fin 2) (Fin 2) R) :
    (X + Y).det = X.det + Y.det + Matrix.trace X * Matrix.trace Y - Matrix.trace (X * Y) := by
  simp [Matrix.det_fin_two, Matrix.trace_fin_two, Matrix.mul_apply, Fin.sum_univ_two]
  ring

end Diaz
