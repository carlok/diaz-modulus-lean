import Definitions.Def_DiazModulus
import Definitions.Def_Diaz_Instantiation

open Complex ComplexConjugate

namespace DiazModulus

theorem diaz_locus_dictionary :
    Qbar = Diaz.Qbar ∧
      ∀ u : ℂ, IsCandidate u ↔
        (u ≠ 0 ∧ IsAlgebraic ℚ (Complex.exp u) ∧ IsAlgebraic ℚ (u * conj u)) := by sorry

end DiazModulus
