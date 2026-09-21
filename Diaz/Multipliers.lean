/-
# What can multiply a candidate back into the logarithm space

Backup of two nodes published on Prove2Me on 12 September 2026:

* `DiazModulus.candidate_multiplier_module`
  (`69387a9d-5e97-4b55-b6e6-64fa30ba558f`)
* `DiazModulus.candidate_one_log_saturation`
  (`cf5024d1-43b6-47ac-b3dd-5298beba22a4`)

Both are kept in the shape the platform carries them: the transcendence
inputs stay *explicit hypotheses* of each statement, so that each says on its
face what it assumes. The reason is fidelity: these declarations should read
the same here as they read on the platform.

The definitions below (`LogAlg`, `LogAlgTilde`, `IsCandidate`) mirror the
platform's `DiazModulus` preamble. `Qbar` and `mem_Qbar_iff` are the ones
already in `Diaz.Instantiation`.

The first theorem determines, under Roy's strong six exponentials
theorem, the whole set of `z` that carry a candidate `u` back into the
algebraic span of the logarithms:

    { z ∈ ℒ̃ : u z ∈ ℒ̃ }  =  Q̄ + Q̄ / u.

It is the complement of the dimension count in `Diaz.Nodes`: that one
bounds what the three-dimensional hull `span_Q̄ {1, u, ū}` can contain,
this one says what an extension of the hull would have to be — and that
no algebraic operation on `u` supplies one.

The second is Baker saturation at a single logarithm, with the instance
`ℓ = iπ` ruling out candidates of the form `a + bπ`.
-/
import Mathlib
import Diaz.Instantiation

open Complex ComplexConjugate

namespace Diaz

/-! ## The platform preamble, mirrored -/

/-- `ℒ`, the logarithms of algebraic numbers. -/
def LogAlg : Set ℂ := {u : ℂ | IsAlgebraic ℚ (Complex.exp u)}

/-- `ℒ̃`, the `Q̄`-subspace of `ℂ` spanned by `1` together with `ℒ`. -/
noncomputable def LogAlgTilde : Submodule Qbar ℂ :=
  Submodule.span Qbar (insert 1 LogAlg)

/-- A **candidate**: a hypothetical counterexample to Diaz's modulus
conjecture. -/
def IsCandidate (u : ℂ) : Prop :=
  u ≠ 0 ∧ IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) ∧ IsAlgebraic ℚ (Complex.exp u)

/-- **Hermite–Lindemann**, as a `Prop`, so that the theorems below carry it as
a visible hypothesis. It is proved as `hermite_lindemann_holds`. -/
def HermiteLindemannProp : Prop :=
  ∀ a : ℂ, a ≠ 0 → IsAlgebraic ℚ a → Transcendental ℚ (Complex.exp a)

/-- **Roy's strong six exponentials theorem.**  For `Q̄`-linearly
independent `x₁,x₂` and `y₁,y₂,y₃`, at least one of the six products
`xᵢyⱼ` lies outside `ℒ̃`. -/
def StrongSixExponentials : Prop :=
  ∀ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ),
    LinearIndependent (↥Qbar) x → LinearIndependent (↥Qbar) y →
    ¬ (∀ i j, x i * y j ∈ LogAlgTilde)

/-- **Baker's theorem**, inhomogeneous two-logarithm form: a non-zero
`Q̄`-linear combination of two `ℚ`-linearly independent logarithms of
algebraic numbers is transcendental. -/
def BakerTwoLogs : Prop :=
  ∀ x y a b : ℂ,
    IsAlgebraic ℚ (Complex.exp x) → IsAlgebraic ℚ (Complex.exp y) →
    (∀ p q : ℚ, (p : ℂ) * x + (q : ℂ) * y = 0 → p = 0 ∧ q = 0) →
    IsAlgebraic ℚ a → IsAlgebraic ℚ b → ¬(a = 0 ∧ b = 0) →
    Transcendental ℚ (a * x + b * y)

/-! ## Two facts about `ℒ` -/

/-- Algebraicity survives complex conjugation: conjugation is a
`ℚ`-algebra map. -/
theorem isAlgebraic_conj {a : ℂ} (h : IsAlgebraic ℚ a) : IsAlgebraic ℚ (conj a) :=
  h.algHom (Complex.conjAe.restrictScalars ℚ).toAlgHom

/-- `ℒ` is conjugation-stable, since `exp (conj u) = conj (exp u)`. -/
theorem logAlg_conj {u : ℂ} (h : u ∈ LogAlg) : conj u ∈ LogAlg := by
  have he : Complex.exp (conj u) = conj (Complex.exp u) := Complex.exp_conj u
  rw [LogAlg, Set.mem_ofPred_eq, he]
  exact isAlgebraic_conj h

/-- `conj u = |u|² / u`. -/
theorem conj_eq_normSq_div (u : ℂ) : conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 / u := by
  rcases eq_or_ne u 0 with rfl | hu
  · simp
  · rw [eq_div_iff hu, mul_comm, Complex.mul_conj]
    norm_cast
    simp [Complex.normSq_eq_norm_sq]

/-! ## The multiplier module -/

/-- **The multiplier module of a candidate.**  Under the strong six
exponentials theorem and Hermite–Lindemann, the set of `z ∈ ℒ̃` with
`u z ∈ ℒ̃` is exactly `Q̄ + Q̄/u`; consequently `u² ∉ ℒ̃`, and
`1/(u - a) ∉ ℒ̃` for every non-zero algebraic `a`. -/
theorem candidate_multiplier_module (hSSE : StrongSixExponentials)
    (hHL : HermiteLindemannProp) {u : ℂ} (h : IsCandidate u) :
    {z : ℂ | z ∈ LogAlgTilde ∧ u * z ∈ LogAlgTilde}
        = (Submodule.span Qbar ({1, u⁻¹} : Set ℂ) : Set ℂ)
      ∧ u ^ 2 ∉ LogAlgTilde
      ∧ ∀ a : ℂ, a ∈ Qbar → a ≠ 0 → (u - a)⁻¹ ∉ LogAlgTilde := by
  obtain ⟨hu, hnorm, hexp⟩ := h
  have hsmul : ∀ (c : ↥Qbar) (z : ℂ), c • z = (c : ℂ) * z := fun _ _ => rfl
  set lam : ℂ := ((‖u‖ : ℝ) : ℂ) with hlam_def
  have hlam0 : lam ≠ 0 := by simp [hlam_def, hu]
  have hlamQ : lam ∈ Qbar := mem_Qbar_iff.mpr hnorm
  have huQ : u ∉ Qbar := fun hq => hHL u hu (mem_Qbar_iff.mp hq) hexp
  have hone : (1 : ℂ) ∈ LogAlgTilde := Submodule.subset_span (Set.mem_insert _ _)
  have huT : u ∈ LogAlgTilde := Submodule.subset_span (Set.mem_insert_of_mem _ hexp)
  have hconjT : conj u ∈ LogAlgTilde :=
    Submodule.subset_span (Set.mem_insert_of_mem _ (logAlg_conj hexp))
  have hinvT : u⁻¹ ∈ LogAlgTilde := by
    have hrw : u⁻¹ = ((lam ^ 2)⁻¹ : ℂ) * conj u := by
      rw [conj_eq_normSq_div u, ← hlam_def]
      field_simp
    have hmem : ((lam ^ 2)⁻¹ : ℂ) ∈ Qbar :=
      Subfield.inv_mem _ (Subfield.pow_mem _ hlamQ 2)
    have := Submodule.smul_mem LogAlgTilde (⟨((lam ^ 2)⁻¹ : ℂ), hmem⟩ : ↥Qbar) hconjT
    rw [hrw]; simpa [hsmul] using this
  -- no non-trivial quadratic over `Q̄` vanishes at `u`
  have hdeg2 : ∀ c₂ c₁ c₀ : ℂ, c₂ ∈ Qbar → c₁ ∈ Qbar → c₀ ∈ Qbar →
      ¬ (c₂ = 0 ∧ c₁ = 0 ∧ c₀ = 0) → c₂ * u ^ 2 + c₁ * u + c₀ ≠ 0 := by
    intro c₂ c₁ c₀ h2 h1 h0 hne heq
    by_cases hc2 : c₂ = 0
    · by_cases hc1 : c₁ = 0
      · exact hne ⟨hc2, hc1, by simpa [hc2, hc1] using heq⟩
      · refine huQ ?_
        have : u = -c₀ / c₁ := by field_simp; linear_combination heq - u ^ 2 * hc2
        rw [this]
        exact Subfield.div_mem _ (Subfield.neg_mem _ h0) h1
    · refine huQ ?_
      have hw : (2 * c₂ * u + c₁) ^ 2 = c₁ ^ 2 - 4 * c₂ * c₀ := by
        linear_combination (4 * c₂) * heq
      have hwQ : ((2 * c₂ * u + c₁) ^ 2) ∈ Qbar := by
        rw [hw]
        exact Subfield.sub_mem _ (Subfield.pow_mem _ h1 2)
          (Subfield.mul_mem _ (Subfield.mul_mem _ (by
            simpa using Subfield.natCast_mem Qbar 4) h2) h0)
      have hwalg : IsAlgebraic ℚ (2 * c₂ * u + c₁) :=
        IsAlgebraic.of_pow (n := 2) (by norm_num) (mem_Qbar_iff.mp hwQ)
      have hwmem : (2 * c₂ * u + c₁) ∈ Qbar := mem_Qbar_iff.mpr hwalg
      have : u = ((2 * c₂ * u + c₁) - c₁) / (2 * c₂) := by field_simp; ring
      rw [this]
      exact Subfield.div_mem _ (Subfield.sub_mem _ hwmem h1)
        (Subfield.mul_mem _ (by simpa using Subfield.natCast_mem Qbar 2) h2)
  -- the two independence facts, from one reason
  have key : ∀ s t : ↥Qbar, (s : ℂ) * u + (t : ℂ) = 0 → s = 0 ∧ t = 0 := by
    intro s t hst
    by_cases hs : (s : ℂ) = 0
    · have ht : (t : ℂ) = 0 := by rw [hs, zero_mul, zero_add] at hst; exact hst
      exact ⟨Subtype.ext hs, Subtype.ext ht⟩
    · refine absurd ?_ huQ
      have hueq : u = -(t : ℂ) / (s : ℂ) := by field_simp; linear_combination hst
      rw [hueq]
      exact Subfield.div_mem _ (Subfield.neg_mem _ t.2) s.2
  have hx : LinearIndependent (↥Qbar) ![(1 : ℂ), u] := by
    rw [LinearIndependent.pair_iff]
    intro s t hst
    simp only [hsmul, mul_one] at hst
    have h' : (t : ℂ) * u + (s : ℂ) = 0 := by linear_combination hst
    exact ⟨(key t s h').2, (key t s h').1⟩
  have hpair : LinearIndependent (↥Qbar) ![(1 : ℂ), u⁻¹] := by
    rw [LinearIndependent.pair_iff]
    intro s t hst
    simp only [hsmul, mul_one] at hst
    have h' : (s : ℂ) * u + (t : ℂ) = 0 := by field_simp at hst; linear_combination hst
    exact key s t h'
  have htriple : ∀ z : ℂ, z ∉ Submodule.span Qbar ({1, u⁻¹} : Set ℂ) →
      LinearIndependent (↥Qbar) ![z, (1 : ℂ), u⁻¹] := by
    intro z hz
    have hcons : ![z, (1 : ℂ), u⁻¹] = Fin.cons z ![(1 : ℂ), u⁻¹] := by
      funext i; fin_cases i <;> rfl
    rw [hcons, linearIndependent_finCons]
    refine ⟨hpair, ?_⟩
    have hrange : Set.range ![(1 : ℂ), u⁻¹] = ({1, u⁻¹} : Set ℂ) := by
      simp [Matrix.range_cons, Matrix.range_empty, Set.pair_comm]
    rw [hrange]; exact hz
  -- forward inclusion: the strong six exponentials theorem
  have hfwd : ∀ z : ℂ, z ∈ LogAlgTilde → u * z ∈ LogAlgTilde →
      z ∈ Submodule.span Qbar ({1, u⁻¹} : Set ℂ) := by
    intro z hz1 hz2
    by_contra hz
    refine hSSE ![(1 : ℂ), u] ![z, (1 : ℂ), u⁻¹] hx (htriple z hz) ?_
    intro i j
    have hlast : u * u⁻¹ = 1 := mul_inv_cancel₀ hu
    fin_cases i <;> fin_cases j <;> simp <;>
      first
        | exact hz1
        | exact hone
        | exact hinvT
        | exact hz2
        | exact huT
        | (rw [hlast]; exact hone)
  -- reverse inclusion: elementary
  have hspan_le : Submodule.span Qbar ({1, u⁻¹} : Set ℂ) ≤ LogAlgTilde := by
    rw [Submodule.span_le]
    intro w hw
    rcases hw with hw | hw
    · rw [hw]; exact hone
    · rw [Set.mem_singleton_iff] at hw; rw [hw]; exact hinvT
  have hbwd : ∀ z ∈ Submodule.span Qbar ({1, u⁻¹} : Set ℂ),
      z ∈ LogAlgTilde ∧ u * z ∈ LogAlgTilde := by
    intro z hz
    obtain ⟨a, b, hab⟩ := Submodule.mem_span_pair.mp hz
    refine ⟨hspan_le hz, ?_⟩
    have hz' : z = (a : ℂ) + (b : ℂ) * u⁻¹ := by
      rw [← hab]; simp only [hsmul, mul_one]
    have hmul : u * z = (a : ℂ) * u + (b : ℂ) := by
      rw [hz']; field_simp
    rw [hmul]
    exact Submodule.add_mem _
      (by simpa [hsmul] using Submodule.smul_mem LogAlgTilde a huT)
      (by simpa [hsmul] using Submodule.smul_mem LogAlgTilde b hone)
  refine ⟨Set.ext fun z => ⟨fun hz => hfwd z hz.1 hz.2, fun hz => hbwd z hz⟩, ?_, ?_⟩
  · -- squares
    intro hsq
    have hmem := hfwd u huT (by rw [← pow_two]; exact hsq)
    obtain ⟨a, b, hab⟩ := Submodule.mem_span_pair.mp hmem
    have hz' : (a : ℂ) + (b : ℂ) * u⁻¹ = u := by simpa only [hsmul, mul_one] using hab
    refine hdeg2 1 (-(a : ℂ)) (-(b : ℂ)) (one_mem _) (Subfield.neg_mem _ a.2)
      (Subfield.neg_mem _ b.2) (by simp) ?_
    field_simp at hz'
    linear_combination -hz'
  · -- shifted reciprocals
    intro a haQ ha0 hmem
    have hua : u - a ≠ 0 := by
      intro hzero
      exact huQ (by rw [sub_eq_zero.mp hzero]; exact haQ)
    have hz2 : u * (u - a)⁻¹ ∈ LogAlgTilde := by
      have hrw : u * (u - a)⁻¹ = 1 + a * (u - a)⁻¹ := by field_simp; ring
      rw [hrw]
      exact Submodule.add_mem _ hone
        (by simpa [hsmul] using
          Submodule.smul_mem LogAlgTilde (⟨a, haQ⟩ : ↥Qbar) hmem)
    obtain ⟨c, d, hcd⟩ := Submodule.mem_span_pair.mp (hfwd _ hmem hz2)
    have hz' : (c : ℂ) + (d : ℂ) * u⁻¹ = (u - a)⁻¹ := by
      simpa only [hsmul, mul_one] using hcd
    refine hdeg2 (c : ℂ) ((d : ℂ) - (c : ℂ) * a - 1) (-((d : ℂ) * a)) c.2
      (Subfield.sub_mem _ (Subfield.sub_mem _ d.2 (Subfield.mul_mem _ c.2 haQ)) (one_mem _))
      (Subfield.neg_mem _ (Subfield.mul_mem _ d.2 haQ)) ?_ ?_
    · rintro ⟨hc, hd, hda⟩
      rw [hc] at hd
      have hd1 : (d : ℂ) = 1 := by linear_combination hd
      rw [hd1, one_mul, neg_eq_zero] at hda
      exact ha0 hda
    · field_simp at hz'
      linear_combination hz'

/-! ## Saturation at one logarithm -/

/-- **Baker saturation at a single logarithm.**  A candidate lying in
`Q̄ + Q̄ℓ` for one `ℓ ∈ ℒ` lies in `Qℓ`; at `ℓ = iπ` this rules out the
form `a + bπ`.

`hpi` is the transcendence of `π`. On the platform it is discharged by
`DiazModulus.pi_transcendental`; here it is a hypothesis. -/
theorem candidate_one_log_saturation (hB : BakerTwoLogs)
    (hHL : HermiteLindemannProp) (hpi : Transcendental ℚ ((Real.pi : ℝ) : ℂ))
    {u : ℂ} (h : IsCandidate u) :
    (∀ l : ℂ, l ∈ LogAlg → ∀ a b : ℂ, a ∈ Qbar → b ∈ Qbar →
        u = a + b * l → ∃ r : ℚ, u = (r : ℂ) * l)
      ∧ (∀ a b : ℂ, a ∈ Qbar → b ∈ Qbar → u ≠ a + b * ((Real.pi : ℝ) : ℂ)) := by
  obtain ⟨hu, hnorm, hexp⟩ := h
  have huQ : u ∉ Qbar := fun hq => hHL u hu (mem_Qbar_iff.mp hq) hexp
  have sat : ∀ l : ℂ, l ∈ LogAlg → ∀ a b : ℂ, a ∈ Qbar → b ∈ Qbar →
      u = a + b * l → ∃ r : ℚ, u = (r : ℂ) * l := by
    intro l hl a b haQ hbQ heq
    by_cases hdep : ∀ p q : ℚ, (p : ℂ) * u + (q : ℂ) * l = 0 → p = 0 ∧ q = 0
    · have hT := hB u l 1 (-b) hexp hl hdep isAlgebraic_one
        (mem_Qbar_iff.mp (Subfield.neg_mem _ hbQ)) (by simp)
      have hval : (1 : ℂ) * u + (-b) * l = a := by rw [heq]; ring
      rw [hval] at hT
      exact absurd (mem_Qbar_iff.mp haQ) hT
    · push_neg at hdep
      obtain ⟨p, q, hpq, hne⟩ := hdep
      have hp : p ≠ 0 := by
        intro hp0
        rw [hp0] at hpq
        simp only [Rat.cast_zero, zero_mul, zero_add] at hpq
        rcases mul_eq_zero.mp hpq with hq0 | hl0
        · exact hne hp0 (by exact_mod_cast hq0)
        · refine absurd ?_ huQ
          rw [heq, hl0]
          simpa using haQ
      refine ⟨-q / p, ?_⟩
      have hpc : ((p : ℂ)) ≠ 0 := by exact_mod_cast hp
      push_cast
      field_simp
      linear_combination hpq
  refine ⟨sat, ?_⟩
  intro a b haQ hbQ heq
  have hIpi : (((Real.pi : ℝ) : ℂ) * Complex.I) ∈ LogAlg := by
    have hval : Complex.exp (((Real.pi : ℝ) : ℂ) * Complex.I) = -1 := Complex.exp_pi_mul_I
    show IsAlgebraic ℚ (Complex.exp (((Real.pi : ℝ) : ℂ) * Complex.I))
    rw [hval]
    exact isAlgebraic_one.neg
  have hIQ : Complex.I ∈ Qbar := by
    refine mem_Qbar_iff.mpr ⟨Polynomial.X ^ 2 + 1, ?_, ?_⟩
    · intro hc
      have h0 : (Polynomial.X ^ 2 + 1 : Polynomial ℚ).coeff 0 = 1 := by simp
      rw [hc] at h0; simp at h0
    · simp [Complex.I_sq]
  have hbIQ : (-Complex.I * b) ∈ Qbar :=
    Subfield.mul_mem _ (Subfield.neg_mem _ hIQ) hbQ
  obtain ⟨r, hr⟩ := sat _ hIpi a (-Complex.I * b) haQ hbIQ (by
    have hI : Complex.I * Complex.I = -1 := Complex.I_mul_I
    rw [heq]
    linear_combination (b * ((Real.pi : ℝ) : ℂ)) * hI)
  have hrne : r ≠ 0 := by
    intro h0
    rw [h0] at hr
    simp at hr
    exact hu hr
  have hnormu : ((‖u‖ : ℝ) : ℂ) = ((|r| : ℚ) : ℂ) * ((Real.pi : ℝ) : ℂ) := by
    rw [hr]
    simp [abs_of_pos Real.pi_pos]
    norm_cast
  have habs : ((|r| : ℚ) : ℂ) ≠ 0 := by
    simp [abs_eq_zero, hrne]
  have hpiQ : ((Real.pi : ℝ) : ℂ) ∈ Qbar := by
    have h1 : ((‖u‖ : ℝ) : ℂ) ∈ Qbar := mem_Qbar_iff.mpr hnorm
    have h2 : ((Real.pi : ℝ) : ℂ) = ((‖u‖ : ℝ) : ℂ) / ((|r| : ℚ) : ℂ) := by
      rw [hnormu]; field_simp
    rw [h2]
    exact Subfield.div_mem _ h1 (mem_Qbar_iff.mpr (isAlgebraic_ratCast ℚ |r|))
  exact hpi (mem_Qbar_iff.mp hpiQ)

end Diaz
