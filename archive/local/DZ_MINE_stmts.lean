import Mathlib
import Definitions.Def_Diaz_Closure
import Definitions.Def_Diaz_Instantiation

open ComplexConjugate
open Diaz

theorem Diaz.pair_dichotomy_exclusive {u v : ℂ}
    (hq : IsAlgebraic ℚ (u * conj u))
    (h : (∃ c : ℚ, c ≠ 0 ∧ v = (c : ℂ) * u) ∨
         (∃ c : ℚ, c ≠ 0 ∧ v = (c : ℂ) * conj u)) :
    ¬ AlgebraicIndependent ℚ ![u, v] := by sorry

theorem Diaz.conj_combination_off_rays {u : ℂ}
    (h1 : conj u ≠ u) (h2 : conj u ≠ -u)
    {a b : ℚ} (ha : a ≠ 0) (hb : b ≠ 0) :
    (∀ c : ℚ, (a : ℂ) * u + (b : ℂ) * conj u ≠ (c : ℂ) * u) ∧
      (∀ c : ℚ, (a : ℂ) * u + (b : ℂ) * conj u ≠ (c : ℂ) * conj u) := by sorry
