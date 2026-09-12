import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_hermite_lindemann_holds

open Complex ComplexConjugate

theorem solution {u : ℂ} (hu : u ≠ 0)
    (hexp : IsAlgebraic ℚ (Complex.exp u)) : Transcendental ℚ u := by
  intro hu_alg
  have h_exp_trans : Transcendental ℚ (Complex.exp u) :=
    DiazModulus.hermite_lindemann_holds u hu hu_alg
  exact h_exp_trans hexp
