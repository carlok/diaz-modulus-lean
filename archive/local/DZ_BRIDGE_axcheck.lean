/-
Axiom check for the bridge work.  The platform nodes that the two submissions import are
replayed here from their own accepted solutions (`Diaz.normal_form`, `Diaz.algebraic_of_axis`,
local files `DZ_P21N_Sol_normal_form.lean` and `DZ_P21N_Sol_algebraic_of_axis.lean`) instead of
being taken from the workspace's `sorry` placeholders, so the axiom report below covers the whole
composite argument and not just the glue.
-/
import Definitions.Def_DiazModulus
import Definitions.Def_Diaz_Instantiation

open Complex ComplexConjugate

private theorem alg_ofReal {x : ℝ} : IsAlgebraic ℚ ((x : ℂ)) ↔ IsAlgebraic ℚ x :=
  isAlgebraic_algebraMap_iff (A := ℂ) (S := ℝ) (R := ℚ) Complex.ofReal_injective

private theorem mul_conj_eq (u : ℂ) : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
  rw [Complex.mul_conj]; norm_cast; rw [Complex.normSq_eq_norm_sq]

/-- Replay of the accepted proof of the platform node `Diaz.normal_form`. -/
private theorem normal_form {u : ℂ} (hu : u ≠ 0) :
    (IsAlgebraic ℚ ‖u‖ ↔ IsAlgebraic ℚ (u * conj u)) ∧
      (IsAlgebraic ℚ (u * conj u) ↔
        ∃ ρ : ℝ, 0 < ρ ∧ IsAlgebraic ℚ ρ ∧ u * conj u = (ρ : ℂ)) := by
  have key : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := mul_conj_eq u
  have hpos : (0 : ℝ) < ‖u‖ ^ 2 := pow_pos (norm_pos_iff.mpr hu) 2
  constructor
  · rw [key]
    exact ⟨fun h => (alg_ofReal.mpr h).pow 2, fun h => alg_ofReal.mp (h.of_pow two_pos)⟩
  · constructor
    · intro h
      refine ⟨‖u‖ ^ 2, hpos, ?_, ?_⟩
      · refine alg_ofReal.mp ?_
        push_cast
        rw [← key]; exact h
      · rw [key]; push_cast; ring
    · rintro ⟨ρ, -, hρ, heq⟩
      rw [heq]; exact alg_ofReal.mpr hρ

/-- Replay of the accepted proof of the platform node `Diaz.algebraic_of_axis`. -/
private theorem algebraic_of_axis {u : ℂ} (hax : conj u = u ∨ conj u = -u)
    (h : IsAlgebraic ℚ ‖u‖) : IsAlgebraic ℚ u := by
  have hc : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) := alg_ofReal.mpr h
  have key : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := mul_conj_eq u
  have h2 : IsAlgebraic ℚ (u ^ 2) := by
    rcases hax with hx | hx
    · have e : u ^ 2 = ((‖u‖ : ℝ) : ℂ) ^ 2 := by rw [← key, hx]; ring
      rw [e]; exact hc.pow 2
    · have e : u ^ 2 = -(((‖u‖ : ℝ) : ℂ) ^ 2) := by rw [← key, hx]; ring
      rw [e]; exact (hc.pow 2).neg
  exact h2.of_pow two_pos

/-- The submitted proof of `DiazModulus.diaz_locus_dictionary`, verbatim. -/
theorem check_dictionary :
    DiazModulus.Qbar = Diaz.Qbar ∧
      ∀ u : ℂ, DiazModulus.IsCandidate u ↔
        (u ≠ 0 ∧ IsAlgebraic ℚ (Complex.exp u) ∧ IsAlgebraic ℚ (u * conj u)) := by
  refine ⟨rfl, fun u => ⟨?_, ?_⟩⟩
  · rintro ⟨hu0, hmod, hexp⟩
    exact ⟨hu0, hexp, (normal_form hu0).1.mp (alg_ofReal.mp hmod)⟩
  · rintro ⟨hu0, hexp, hrho⟩
    exact ⟨hu0, alg_ofReal.mpr ((normal_form hu0).1.mpr hrho), hexp⟩

/-- The submitted proof of `DiazModulus.diaz_on_axes_of_hermite_lindemann`, verbatim. -/
theorem check_on_axes (hHL : DiazModulus.HermiteLindemann) (u : ℂ) (hu : u ≠ 0)
    (hax : u.im = 0 ∨ u.re = 0) (hmod : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ)) :
    Transcendental ℚ (Complex.exp u) := by
  have hcu : conj u = u ∨ conj u = -u := by
    rcases hax with h | h
    · exact Or.inl (Complex.conj_eq_iff_im.mpr h)
    · exact Or.inr (by apply Complex.ext <;> simp [h])
  exact hHL u hu (algebraic_of_axis hcu (alg_ofReal.mp hmod))

#print axioms check_dictionary
#print axioms check_on_axes
