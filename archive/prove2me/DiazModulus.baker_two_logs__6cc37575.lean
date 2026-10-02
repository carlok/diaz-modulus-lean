import Mathlib
import Theorems.Thm_Schanuel_baker_linear_forms_in_logarithms

/-!
# Baker's theorem, two-logarithm form

The hypothesis `hB` of this library, from Baker's theorem
`Schanuel.baker_linear_forms_in_logarithms` (Waldschmidt, *Diophantine Approximation on Linear
Algebraic Groups*, Th. 1.6) with `n = 2`, `l = (x, y)` and `b = (a, b)`. If `ax + by` were algebraic,
then `b₀ = -(ax + by)` would be algebraic and `b₀ + ax + by = 0`, with `(a, b) ≠ 0`.
-/

theorem solution : ∀ x y a b : ℂ,
    IsAlgebraic ℚ (Complex.exp x) → IsAlgebraic ℚ (Complex.exp y) →
    (∀ p q : ℚ, (p : ℂ) * x + (q : ℂ) * y = 0 → p = 0 ∧ q = 0) →
    IsAlgebraic ℚ a → IsAlgebraic ℚ b → ¬(a = 0 ∧ b = 0) →
    Transcendental ℚ (a * x + b * y) := by
  intro x y a b hx hy hind ha hb hab halg
  have hl : LinearIndependent ℚ ![x, y] :=
    LinearIndependent.pair_iff.2 fun s t h => hind s t (by simpa [Rat.smul_def] using h)
  refine Schanuel.baker_linear_forms_in_logarithms 2 ![x, y] hl ?_ (-(a * x + b * y)) ![a, b]
    halg.neg ?_ ?_ ?_
  · intro i
    fin_cases i <;> simpa
  · intro i
    fin_cases i <;> simpa
  · by_cases ha0 : a = 0
    · exact Or.inr ⟨1, by simpa using fun hb0 => hab ⟨ha0, hb0⟩⟩
    · exact Or.inr ⟨0, by simpa using ha0⟩
  · simp [Fin.sum_univ_two]
