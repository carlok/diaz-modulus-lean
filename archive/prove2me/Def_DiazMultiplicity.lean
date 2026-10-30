import Mathlib
import Definitions.Def_DiazHilbertBox

/-! # The group `𝔾ₐ^{A₀} × 𝔾ₘ^{A₁}`, its invariant derivations, translations, zero sets and stabilisers

The vocabulary of the multiplicity side of the elementary multiplicity estimate (DALAG Ch. 8, §8.3 and §8.4.1,
at finite level). Everything lives in the model `R = K[X, Y, Z] = MvPolynomial (A₀ ⊕ (A₁ × Bool)) K` of
`Def_DiazHilbertBox` (`Y_i = inr (i, true)`, `Z_i = inr (i, false)`), with `J₀ = torusIdeal K A₀ A₁`.

* `TorusGroup K A₀ A₁`: `G = 𝔾ₐ^{A₀} × 𝔾ₘ^{A₁}`, written multiplicatively; `torusPt g = (x, y, y⁻¹)`.
* `torusDeriv w`: the invariant derivation `D_w` (DALAG Lemma 8.11), `w = (ξ, η)`, lifted to `R`;
  `torusDerivList l = D_{w₁} ∘ ⋯ ∘ D_{w_t}` for a list `l = [w₁, …, w_t]`.
* `torusTransl g`: the translation `f ↦ f ∘ τ_g`, with `eval_torusTransl`.
* `torusVanishing S`, `torusZero I`: the ideal `I(S)` of a set of points and the zero set `Z_G(I)` of an ideal.
* `torusStab I = {g : Z(I) · g ⊆ Z(I)}`: the stabiliser of the zero set, as a set.
* `torusMono φ = Y^{φ⁺} Z^{φ⁻}`, `linForm a = Σ a_h X_h`, `standardSet V φ = V × T_φ`.
* `sectionIdeal ℓ ψ = J₀ + (Σ_h ℓ_k h X_h)_k + (Y^{ψ_k⁺}Z^{ψ_k⁻} − 1)_k`.
* `vanishOrd J W t`: vanishing to order `> t` along `W`, relative to the ideal `J`.
* `hmePoint u a s = g_s = (Σ_j s_j u_j, Π_j a_j^{s_j})`, and `obstructionSpan`: with `V = {1}` it spans the
  descent ideal `I_r` over `J₀`, with `V = Z(𝔭)` the ideal `A` of DALAG §8.4.1.

Only definitions and structural lemmas (each a few lines) live here. -/

namespace DiazModulus

open MvPolynomial

/-- The group `G = 𝔾ₐ^{A₀} × 𝔾ₘ^{A₁}` over `K`, written multiplicatively. -/
abbrev TorusGroup (K A₀ A₁ : Type*) [Field K] := Multiplicative (A₀ → K) × (A₁ → Kˣ)

/-- The point `(x, y, y⁻¹)` of `K^{A₀ ⊕ (A₁ × Bool)}` over `g = (x, y) ∈ G`. -/
def torusPt {K A₀ A₁ : Type*} [Field K] (g : TorusGroup K A₀ A₁) : A₀ ⊕ (A₁ × Bool) → K :=
  torusPoint (Multiplicative.toAdd g.1) g.2

/-- DALAG's invariant derivation `D_w` (Lemma 8.11), lifted to `K[X, Y, Z]`:
`Σ_h ξ_h ∂/∂X_h + Σ_i η_i (Y_i ∂/∂Y_i − Z_i ∂/∂Z_i)` for `w = (ξ, η)`. -/
noncomputable def torusDeriv {K A₀ A₁ : Type*} [Field K] (w : (A₀ → K) × (A₁ → K)) :
    Derivation K (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :=
  mkDerivation K (Sum.elim (fun h => C (w.1 h)) fun p : A₁ × Bool =>
    if p.2 then C (w.2 p.1) * X (Sum.inr p) else -(C (w.2 p.1) * X (Sum.inr p)))

/-- `D_{w₁} ∘ ⋯ ∘ D_{w_t}` for the list `[w₁, …, w_t]`. -/
noncomputable def torusDerivList {K A₀ A₁ : Type*} [Field K]
    (l : List ((A₀ → K) × (A₁ → K))) : Module.End K (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :=
  (l.map fun w => (torusDeriv w).toLinearMap).prod

/-- Translation `f ↦ f ∘ τ_g` (`X ↦ X + x`, `Y ↦ y Y`, `Z ↦ y⁻¹ Z`); an `AlgEquiv` by `DiazModulus.exists_translation_algEquiv`. -/
noncomputable def torusTransl {K A₀ A₁ : Type*} [Field K] (g : TorusGroup K A₀ A₁) :
    MvPolynomial (A₀ ⊕ (A₁ × Bool)) K →ₐ[K] MvPolynomial (A₀ ⊕ (A₁ × Bool)) K :=
  aeval (Sum.elim (fun h => X (Sum.inl h) + C (Multiplicative.toAdd g.1 h))
    (fun p => C (torusPt g (Sum.inr p)) * X (Sum.inr p)))

/-- The ideal `I(S)` of a set of points of `G`, in `K[X, Y, Z]`. -/
noncomputable def torusVanishing {K A₀ A₁ : Type*} [Field K] (S : Set (TorusGroup K A₀ A₁)) :
    Ideal (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :=
  ⨅ g ∈ S, RingHom.ker (eval (torusPt g))

/-- The zero set `Z_G(I)` in `G` of an ideal of `K[X, Y, Z]`. -/
def torusZero {K A₀ A₁ : Type*} [Field K] (I : Ideal (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K)) :
    Set (TorusGroup K A₀ A₁) :=
  {g | ∀ f ∈ I, eval (torusPt g) f = 0}

/-- The stabiliser `{g ∈ G : Z(I) · g ⊆ Z(I)}` of the zero set of `I` (DALAG §8.4.1, "as in §5.4"). -/
def torusStab {K A₀ A₁ : Type*} [Field K] (I : Ideal (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K)) :
    Set (TorusGroup K A₀ A₁) :=
  {g | ∀ z ∈ torusZero I, z * g ∈ torusZero I}

/-- The Laurent monomial `Y^{φ⁺} Z^{φ⁻}` (the character `y^φ` on `G`). -/
noncomputable def torusMono {K A₀ A₁ : Type*} [Field K] [Fintype A₁] (φ : A₁ → ℤ) :
    MvPolynomial (A₀ ⊕ (A₁ × Bool)) K :=
  ∏ i, X (Sum.inr (i, true)) ^ (φ i).toNat * X (Sum.inr (i, false)) ^ (-φ i).toNat

/-- The linear form `Σ_h a_h X_h`. -/
noncomputable def linForm {K A₀ A₁ : Type*} [Field K] [Fintype A₀] (a : A₀ → K) :
    MvPolynomial (A₀ ⊕ (A₁ × Bool)) K :=
  ∑ h, C (a h) * X (Sum.inl h)

/-- The algebraic subgroup `V × T_φ` of `G`, with `T_φ = {y : y^{φ k} = 1 for all k}`. -/
def standardSet {K A₀ A₁ : Type*} [Field K] [Fintype A₁] (V : Submodule K (A₀ → K)) {ι : Type*}
    (φ : ι → A₁ → ℤ) : Set (TorusGroup K A₀ A₁) :=
  {g | Multiplicative.toAdd g.1 ∈ V ∧ ∀ k, ∏ i, g.2 i ^ φ k i = 1}

/-- The section ideal `𝔞 = J₀ + (Σ_h ℓ_k h X_h)_k + (Y^{ψ_k⁺} Z^{ψ_k⁻} − 1)_k`. -/
noncomputable def sectionIdeal {K A₀ A₁ ι κ : Type*} [Field K] [Fintype A₀] [Fintype A₁]
    (ℓ : ι → A₀ → K) (ψ : κ → A₁ → ℤ) : Ideal (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :=
  torusIdeal K A₀ A₁ ⊔ Ideal.span (Set.range fun k => linForm (A₁ := A₁) (ℓ k))
    ⊔ Ideal.span (Set.range fun k => torusMono (A₀ := A₀) (ψ k) - 1)

/-- Vanishing to order `> t` along `W`, relative to the ideal `J`: every `D_{w₁}⋯D_{w_s} Q` with
`s ≤ t`, `wᵢ ∈ W`, lies in `J` (for `J = I(S)`: `Q` vanishes to order `> t` along `W` on `S`). -/
def vanishOrd {K A₀ A₁ : Type*} [Field K]
    (J : Ideal (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K)) (W : Submodule K ((A₀ → K) × (A₁ → K)))
    (t : ℕ) : Set (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :=
  {Q | ∀ l : List ((A₀ → K) × (A₁ → K)), l.length ≤ t → (∀ w ∈ l, w ∈ W) →
    torusDerivList l Q ∈ J}

/-- The point `g_s = (Σ_j s_j u_j, Π_j a_j^{s_j})` of the multiplicity estimate. -/
noncomputable def hmePoint {K A₀ A₁ B₁ : Type*} [Field K] [Fintype B₁] (u : B₁ → A₀ → K)
    (a : B₁ → A₁ → Kˣ) (s : B₁ → ℤ) : TorusGroup K A₀ A₁ :=
  (Multiplicative.ofAdd (∑ j, (s j : K) • u j), fun i => ∏ j, a j i ^ s j)

/-- The span of §8.4.1's family: `(D_{w₁}⋯D_{w_t} P) ∘ τ_{g_s · v}` for `|s_j| ≤ m`, `v ∈ V`,
`t ≤ n`, `wᵢ ∈ W`. With `V = {1}`, `m = r M₁`, `n = r M₀` it spans `I_r` over `J₀` (0-based, so
`I_0 = J₀ + (P)`); with `V = Z(𝔭)` it spans the ideal `A`. -/
noncomputable def obstructionSpan {K A₀ A₁ B₁ : Type*} [Field K] [Fintype B₁]
    (P : MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) (W : Submodule K ((A₀ → K) × (A₁ → K)))
    (u : B₁ → A₀ → K) (a : B₁ → A₁ → Kˣ) (m n : ℕ) (V : Set (TorusGroup K A₀ A₁)) :
    Submodule K (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :=
  Submodule.span K {Q | ∃ s : B₁ → ℤ, (∀ j, |s j| ≤ (m : ℤ)) ∧ ∃ v ∈ V,
    ∃ l : List ((A₀ → K) × (A₁ → K)), l.length ≤ n ∧ (∀ w ∈ l, w ∈ W) ∧
      Q = torusTransl (hmePoint u a s * v) (torusDerivList l P)}

/-! Structural lemmas (each a few lines). -/

@[simp] theorem torusDeriv_X_inl {K A₀ A₁ : Type*} [Field K] (w : (A₀ → K) × (A₁ → K)) (h : A₀) :
    torusDeriv w (X (Sum.inl h) : MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) = C (w.1 h) := by
  simp [torusDeriv, mkDerivation_X]

@[simp] theorem torusDeriv_X_inr {K A₀ A₁ : Type*} [Field K] (w : (A₀ → K) × (A₁ → K)) (i : A₁)
    (b : Bool) :
    torusDeriv w (X (Sum.inr (i, b)) : MvPolynomial (A₀ ⊕ (A₁ × Bool)) K)
      = if b then C (w.2 i) * X (Sum.inr (i, b)) else -(C (w.2 i) * X (Sum.inr (i, b))) := by
  simp [torusDeriv, mkDerivation_X]

@[simp] theorem torusDerivList_nil {K A₀ A₁ : Type*} [Field K] :
    torusDerivList ([] : List ((A₀ → K) × (A₁ → K))) = 1 := rfl

theorem mem_torusZero {K A₀ A₁ : Type*} [Field K] {I : Ideal (MvPolynomial (A₀ ⊕ (A₁ × Bool)) K)}
    {g : TorusGroup K A₀ A₁} : g ∈ torusZero I ↔ ∀ f ∈ I, eval (torusPt g) f = 0 := Iff.rfl

theorem eval_torusTransl {K A₀ A₁ : Type*} [Field K] (g h : TorusGroup K A₀ A₁)
    (f : MvPolynomial (A₀ ⊕ (A₁ × Bool)) K) :
    eval (torusPt h) (torusTransl g f) = eval (torusPt (h * g)) f := by
  induction f using MvPolynomial.induction_on with
  | C a => simp [torusTransl]
  | add p q hp hq => simp only [map_add, hp, hq]
  | mul_X p v hp =>
    rw [map_mul, map_mul, hp, map_mul]
    congr 1
    rcases v with i | ⟨i, b⟩
    · simp [torusTransl, torusPt, torusPoint, toAdd_mul, add_comm]
    · cases b <;> simp [torusTransl, torusPt, torusPoint, mul_comm]

end DiazModulus
