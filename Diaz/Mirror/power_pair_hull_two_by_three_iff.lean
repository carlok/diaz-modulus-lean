/-
Mirrored from Prove2Me: `DiazModulus.power_pair_hull_two_by_three_iff`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.power_pair_hull_two_by_three_iff__984c95fb.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.laurent_hull_config_iff
import Diaz.Mirror.two_sumset_iff_difference_count
import Diaz.Mirror.power_pair_difference_count_iff

namespace Diaz

open Complex ComplexConjugate

/-! # `2 × 3` configurations in `Σ_{s ∈ {0, ±1, ±k, ±l}} K uˢ`

Let `u` be transcendental over `K` and `4 ≤ k < l`. By `laurent_hull_config_iff`, a `2 × 3`
configuration in the hull of `S = {0, ±1, ±k, ±l}` exists exactly when `S` contains a sumset
`A + B` with `|A| = 2`, `|B| = 3`. By `two_sumset_iff_difference_count`, this happens exactly when
some difference `d > 0` occurs at least three times in `S` (three `s ∈ S` with `s + d ∈ S`), and
`power_pair_difference_count_iff` lists the `l` for which this happens:
`l ∈ {k + 1, k + 2, 2k − 1, 2k, 2k + 1, 3k}`. The proof is the composition of the three nodes,
after reading the set literal as a finite set.
-/

namespace R6_pairs

theorem coe_S (k l : ℤ) :
    (({0, 1, -1, k, -k, l, -l} : Finset ℤ) : Set ℤ) = ({0, 1, -1, k, -k, l, -l} : Set ℤ) := by
  push_cast
  rfl

end R6_pairs

open R6_pairs in
theorem power_pair_hull_two_by_three_iff (K : Subfield ℂ) (u : ℂ) (hT : Transcendental K u)
    (k l : ℤ) (hk : 4 ≤ k) (hkl : k < l) :
    (∃ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ), LinearIndependent K x ∧ LinearIndependent K y ∧
      ∀ i j, x i * y j ∈ Submodule.span K
        ((fun s : ℤ => u ^ s) '' ({0, 1, -1, k, -k, l, -l} : Set ℤ))) ↔
    (l = k + 1 ∨ l = k + 2 ∨ l = 2 * k - 1 ∨ l = 2 * k ∨ l = 2 * k + 1 ∨ l = 3 * k) := by
  rw [← coe_S, laurent_hull_config_iff K u hT _ 2 3 (by norm_num) (by norm_num),
    two_sumset_iff_difference_count]
  exact power_pair_difference_count_iff k l hk hkl

end Diaz
