import Definitions.Def_DiazModulus

open Complex ComplexConjugate

/-!
# Structural reductions of the modulus conjecture

Two reductions, both fully proved here, supporting an unpublished working note.

1. `diaz_of_real_and_nonReal` — the only genuine *case split* of the conjecture I could find:
   split on whether `exp u` is real.  Both halves are strictly weaker than the parent and
   neither is known.  The reduction itself is a `by_cases`.

2. `diaz_of_recip_not_mem` — the reduction of the conjecture to Diaz's quotient conjecture
   (Q3) restricted to `ℒ`: "for every non-zero logarithm `u` of an algebraic number,
   `u⁻¹ ∉ ℒ̃`".  This is a *strengthening*, not a decomposition: it is closer to the parent
   than `StrongFourExponentials` is, but still strictly above it.

Conjugation-stability of `ℒ` is taken as an explicit hypothesis `hconj`, matching the mission's
existing node `DiazModulus.logAlg_conj_stable`.
-/

namespace DiazStruct

open DiazModulus

/-- The modulus conjecture restricted to `u` with `exp u` real. -/
def DiazRealCase : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
    Transcendental ℚ (Complex.exp u)

/-- The modulus conjecture restricted to `u` with `exp u` non-real. -/
def DiazNonRealCase : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
    Transcendental ℚ (Complex.exp u)

/-- The two halves jointly give the conjecture. -/
theorem diaz_of_real_and_nonReal (hR : DiazRealCase) (hN : DiazNonRealCase) :
    DiazModulusConjecture := by
  intro u hu hmod
  by_cases h : (Complex.exp u).im = 0
  · exact hR u hu hmod h
  · exact hN u hu hmod h

/-- Diaz's conjecture (Q3), restricted to `ℒ`: the reciprocal of a non-zero logarithm of an
algebraic number is never in `ℒ̃`. -/
def RecipNotMem : Prop :=
  ∀ u : ℂ, u ≠ 0 → u ∈ LogAlg → u⁻¹ ∉ LogAlgTilde

/-- `RecipNotMem` implies the modulus conjecture.  For a counterexample `u`, the number
`c = u * conj u = ‖u‖²` is a non-zero algebraic, `conj u ∈ ℒ`, and `u⁻¹ = c⁻¹ * conj u` is
therefore a `Q̄`-multiple of an element of `ℒ`, hence in `ℒ̃`. -/
theorem diaz_of_recip_not_mem
    (hconj : ∀ v : ℂ, v ∈ LogAlg → conj v ∈ LogAlg)
    (hQ : RecipNotMem) : DiazModulusConjecture := by
  intro u hu hmod
  rw [Transcendental]
  intro hexp
  -- `c = u * conj u` is algebraic and non-zero.
  have hnorm : (u * conj u) = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
    rw [Complex.mul_conj]
    norm_cast
    rw [Complex.normSq_eq_norm_sq]
  have hcQ : (u * conj u) ∈ Qbar := by
    rw [hnorm]
    exact pow_mem (DiazModulus.mem_Qbar_iff.mpr hmod) 2
  have hcne : (u * conj u) ≠ 0 := by
    simp only [ne_eq, mul_eq_zero, not_or]
    exact ⟨hu, by simpa using hu⟩
  -- `conj u ∈ ℒ`.
  have hconju : conj u ∈ LogAlg := hconj u hexp
  -- `u⁻¹ = c⁻¹ * conj u ∈ ℒ̃`.
  have hmem : u⁻¹ ∈ LogAlgTilde := by
    have hsub : conj u ∈ LogAlgTilde :=
      Submodule.subset_span (Set.mem_insert_of_mem _ hconju)
    have := Submodule.smul_mem LogAlgTilde
      (⟨(u * conj u)⁻¹, inv_mem hcQ⟩ : Qbar) hsub
    have heq : ((⟨(u * conj u)⁻¹, inv_mem hcQ⟩ : Qbar) : ℂ) • (conj u) = u⁻¹ := by
      show (u * conj u)⁻¹ * conj u = u⁻¹
      have hcu : conj u ≠ 0 := by simpa using hu
      field_simp
    rwa [show ((⟨(u * conj u)⁻¹, inv_mem hcQ⟩ : Qbar)) • (conj u)
        = ((⟨(u * conj u)⁻¹, inv_mem hcQ⟩ : Qbar) : ℂ) • (conj u) from rfl, heq] at this
  exact hQ u hu hexp hmem

end DiazStruct
