/-
# Hilbert functions of box filtrations, and the torus model

Mirrored from Prove2Me: the definition `DiazHilbertBox` (theorem id
`7d734b18-096d-492f-9219-32d4489bc1bc`), archived verbatim as
`archive/prove2me/Def_DiazHilbertBox.lean`. Only the import and the namespace were
rewritten (`DiazModulus` to `Diaz`); the definitions and lemmas are the platform's, byte for byte.

It is the vocabulary of round C1.1, the finite-level Hilbert-function layer of the elementary
multiplicity estimate `hME` (`Diaz.MultiplicityEstimate`). `UnmixedHeight` is Macaulay's
unmixedness in the form C1.1 consumes. It is a proposition: nothing in the library proves it,
and the ported C1.1 results that need it take it as the explicit hypothesis `hU`.
-/
import Mathlib

namespace Diaz

/-! # Hilbert functions of box filtrations, and the torus model

The vocabulary of C1.1, the finite-level Hilbert-function layer of the elementary
multiplicity estimate (DALAG Ch. 5 and 8 at finite level, no Hilbert polynomials).

* `boxHilb F I T`: the Hilbert function `h_I(T) = dim_K image(F T → S ⧸ I)` of a filtration
  `F : (B → ℕ) → Submodule K S` of a commutative `K`-algebra `S` (DALAG's `H(I; T)`).
* `blockBox K β T`: for a block map `β : σ → ι`, the span of the monomials of
  `MvPolynomial σ K` whose degree in each block `b` is at most `T b`.
* The model `K[X, Y, Z] = MvPolynomial (A₀ ⊕ (A₁ × Bool)) K`, with `Sum.inr (i, true)` for
  `Y_i` and `Sum.inr (i, false)` for `Z_i`: the per-coordinate box `torusBox`, the torus
  ideal `torusIdeal` = `(Y_i Z_i − 1)_i` and its generators `torusList`, the reduced
  monomials `torusReduced`, hME's multidegree `boxD`, the polynomial `torusCoeffPoly` of a
  coefficient vector on hME's box, and the point `torusPoint x y = (x, y, y⁻¹)`.
* `UnmixedHeight S`: Macaulay's unmixedness (U) in the form the regular chain consumes.

Only definitions and structural lemmas (each a few lines) live here. -/

/-- The finite-level Hilbert function `h_I(T) = dim_K image(F T → S ⧸ I)` of a filtration `F`
(DALAG's `H(I; T)`). -/
noncomputable def boxHilb {K S B : Type*} [Field K] [CommRing S] [Algebra K S]
    (F : (B → ℕ) → Submodule K S) (I : Ideal S) (T : B → ℕ) : ℕ :=
  Module.finrank K ↥((F T).map (Ideal.Quotient.mkₐ K I).toLinearMap)

/-- The block box: monomials of `MvPolynomial σ K` whose degree in each block `b` of the block
map `β : σ → ι` is at most `T b`. -/
noncomputable def blockBox (K : Type*) {σ ι : Type*} [Field K] (β : σ → ι) (T : ι → ℕ) :
    Submodule K (MvPolynomial σ K) :=
  MvPolynomial.restrictSupport K {m : σ →₀ ℕ | ∀ b, m.mapDomain β b ≤ T b}

/-- The per-coordinate box of `K[X, Y, Z] = MvPolynomial (A₀ ⊕ (A₁ × Bool)) K`: `X_h`-degree
`≤ T (inl h)` and `deg Y_i + deg Z_i ≤ T (inr i)`; the block box of `Sum.map id Prod.fst`. -/
noncomputable def torusBox (K A₀ A₁ : Type*) [Field K] (T : A₀ ⊕ A₁ → ℕ) :
    Submodule K (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :=
  blockBox K (Sum.map id Prod.fst) T

/-- The torus ideal `(Y_i Z_i − 1)_i`, the kernel of `K[X, Y, Z] → K[𝔾ₐ^{A₀} × 𝔾ₘ^{A₁}]`. -/
noncomputable def torusIdeal (K A₀ A₁ : Type*) [Field K] :
    Ideal (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :=
  Ideal.span (Set.range fun i : A₁ =>
    (MvPolynomial.X (Sum.inr (i, true)) * MvPolynomial.X (Sum.inr (i, false)) - 1 :
      MvPolynomial (A₀ ⊕ (A₁ × Bool)) K))

/-- The torus generators `(Y_i Z_i − 1)_i` as a list (for `Ideal.ofList`). -/
noncomputable def torusList (K A₀ A₁ : Type*) [Field K] [Fintype A₁] :
    List (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :=
  (Finset.univ : Finset A₁).toList.map fun i =>
    (MvPolynomial.X (Sum.inr (i, true)) * MvPolynomial.X (Sum.inr (i, false)) - 1 :
      MvPolynomial (A₀ ⊕ (A₁ × Bool)) K)

/-- The reduced monomials `X^a Y^b Z^c` of `K[X, Y, Z]`: `min(b_i, c_i) = 0` for every `i`. -/
def torusReduced (A₀ A₁ : Type*) : Set (A₀ ⊕ (A₁ × Bool) →₀ ℕ) :=
  {m | ∀ i, m (Sum.inr (i, true)) = 0 ∨ m (Sum.inr (i, false)) = 0}

/-- hME's multidegree `(D₀, …, D₀; D₁, …, D₁)`. -/
def boxD (A₀ A₁ : Type*) (D₀ D₁ : ℕ) : A₀ ⊕ A₁ → ℕ :=
  Sum.elim (fun _ : A₀ => D₀) (fun _ : A₁ => D₁)

/-- The polynomial `P_c = Σ_l c_l X^τ Π_i Y_i^{(s_i − D₁)₊} Z_i^{(D₁ − s_i)₊}` of a coefficient
vector `c` on hME's box `l = (τ, s) ∈ (A₀ → Fin (D₀ + 1)) × (A₁ → Fin (2 D₁ + 1))`. -/
noncomputable def torusCoeffPoly {K A₀ A₁ : Type*} [Field K] [Fintype A₀] [Fintype A₁]
    [DecidableEq A₀] [DecidableEq A₁] (D₀ D₁ : ℕ)
    (c : (A₀ → Fin (D₀ + 1)) × (A₁ → Fin (2 * D₁ + 1)) → K) :
    MvPolynomial (A₀ ⊕ (A₁ × Bool)) K :=
  ∑ l, c l • ((∏ h, MvPolynomial.X (Sum.inl h) ^ (l.1 h : ℕ)) *
    ∏ i, (MvPolynomial.X (Sum.inr (i, true)) ^ ((l.2 i : ℕ) - D₁) *
      MvPolynomial.X (Sum.inr (i, false)) ^ (D₁ - (l.2 i : ℕ))) :
        MvPolynomial (A₀ ⊕ (A₁ × Bool)) K)

/-- The point `(x, y, y⁻¹)` of `K^{A₀} × K^{A₁} × K^{A₁}` over `(x, y) ∈ K^{A₀} × (K^×)^{A₁}`. -/
def torusPoint {K A₀ A₁ : Type*} [Field K] (x : A₀ → K) (y : A₁ → Kˣ) : A₀ ⊕ (A₁ × Bool) → K :=
  Sum.elim x fun p : A₁ × Bool => if p.2 = true then (y p.1 : K) else (((y p.1)⁻¹ : Kˣ) : K)

/-- Macaulay's unmixedness (U) in the shape C1.1 consumes: every associated prime of the
quotient by a weakly regular list has height at most the length of the list. -/
def UnmixedHeight (S : Type*) [CommRing S] : Prop :=
  ∀ rs : List S, RingTheory.Sequence.IsWeaklyRegular S rs →
    ∀ p ∈ associatedPrimes S (S ⧸ Ideal.ofList rs), p.height ≤ (rs.length : ℕ∞)

@[simp] theorem boxD_inl {A₀ A₁ : Type*} (D₀ D₁ : ℕ) (h : A₀) :
    boxD A₀ A₁ D₀ D₁ (Sum.inl h) = D₀ := rfl

@[simp] theorem boxD_inr {A₀ A₁ : Type*} (D₀ D₁ : ℕ) (i : A₁) :
    boxD A₀ A₁ D₀ D₁ (Sum.inr i) = D₁ := rfl

theorem blockBox_mono (K : Type*) {σ ι : Type*} [Field K] (β : σ → ι) :
    Monotone (blockBox K β) := fun _ _ hT =>
  MvPolynomial.restrictSupport_mono K fun _ hm b => (hm b).trans (hT b)

theorem one_mem_blockBox_zero (K : Type*) {σ ι : Type*} [Field K] (β : σ → ι) :
    (1 : MvPolynomial σ K) ∈ blockBox K β 0 := by
  rw [blockBox, MvPolynomial.mem_restrictSupport_iff, MvPolynomial.support_one]
  intro m hm
  simp_all

theorem torusList_length (K A₀ A₁ : Type*) [Field K] [Fintype A₁] :
    (torusList K A₀ A₁).length = Fintype.card A₁ := by
  simp [torusList, Finset.length_toList]

theorem torusIdeal_eq_ofList (K A₀ A₁ : Type*) [Field K] [Fintype A₁] :
    torusIdeal K A₀ A₁ = Ideal.ofList (torusList K A₀ A₁) := by
  unfold torusIdeal torusList Ideal.ofList
  congr 1
  ext f
  simp

end Diaz
