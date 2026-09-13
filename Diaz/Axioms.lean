/-
# The two transcendence results the development consumes

Both used to be declared here as `axiom`, quoted from the literature, so that
the assumed surface of the development sat visibly in one place. Both are now
proved, under the same names and with the same statements, so nothing that
uses them had to change.

`#print axioms` on any theorem in the library now lists only `propext`,
`Classical.choice` and `Quot.sound`. The file keeps its name so the import graph
and older references stay stable.
-/
import Mathlib
import Diaz.LindemannWeierstrass

open Complex ComplexConjugate
open Finset
open scoped Polynomial
open MvPolynomial.symmetricSubalgebra
open scoped AddMonoidAlgebra
open Complex
open Polynomial
open scoped Nat
open Complex Finset Polynomial
open scoped Cardinal

namespace Diaz

/-- **Hermite–Lindemann.**  If `u ≠ 0` and `exp u` is algebraic, then `u`
is transcendental.

This is the contrapositive of the usual statement, that a non-zero
algebraic number has transcendental exponential.  See A. Baker,
*Transcendental Number Theory*, Cambridge University Press 1975,
Theorem 1.4.

**Proved here.** The Lindemann–Weierstrass development of mathlib PR
`leanprover-community/mathlib4#28013` is ported in `Diaz.LindemannWeierstrass`,
which depends on Mathlib alone; this theorem applies its `linearIndependent_exp'`
to the pair `u, 0`. -/

theorem hermite_lindemann {u : ℂ} (hu : u ≠ 0)
    (hexp : IsAlgebraic ℚ (Complex.exp u)) : Transcendental ℚ u := by
  intro ha
  have h1 : IsIntegral ℚ u := isAlgebraic_iff_isIntegral.mp ha
  have h2 : IsIntegral ℚ (Complex.exp u) := isAlgebraic_iff_isIntegral.mp hexp
  refine by
    simpa [Fin.forall_fin_succ] using
      linearIndependent_exp' ![u, 0] ?_ ?_ ![1, -Complex.exp u] ?_ ?_
  · intro i; fin_cases i
    exacts [h1, isIntegral_zero]
  · intro i j; fin_cases i, j <;> simp [hu.symm, *]
  · intro i; fin_cases i; exacts [isIntegral_one, h2.neg]
  · simp

/-- **Steinitz extension.**  If `u` and `t` are both transcendental over
a subfield `K` of `ℂ`, some ring endomorphism of `ℂ` fixes `K` pointwise
and sends `u` to `t`.

Why it is true: `u ↦ t` is an isomorphism `K(u) → K(t)` fixing `K`,
because both are transcendental, so both are rational function fields
over `K`.  Extend a transcendence basis of `ℂ` over `K(u)` into one over
`K(t)` — both have the cardinality of the continuum — and then extend
algebraically, `ℂ` being algebraically closed.  See Lang, *Algebra*,
3rd ed., Ch. VIII, or Steinitz's theorem in any account of field theory.

The thesis is deliberately weak: a ring *endomorphism*, not an
automorphism, which is all the results below consume, and which is
automatically injective since `ℂ` is a field.  The hypothesis is
necessary — for `u` algebraic over `K` and `t` not, no such map exists.

Mathlib has the ingredients (`IsAlgClosed.equivOfTranscendenceBasis`,
`IsAlgClosed.lift`) but not the assembled statement. -/

theorem exists_ringHom_of_transcendental {K : Subfield ℂ} {u t : ℂ}
    (hu : Transcendental (↥K) u) (ht : Transcendental (↥K) t) :
    ∃ Φ : ℂ →+* ℂ, (∀ a ∈ K, Φ a = a) ∧ Φ u = t := by
  -- Step 1: extend `{u}` and `{t}` to transcendence bases of `ℂ` over `K`.
  have hu' : AlgebraicIndepOn (↥K) id ({u} : Set ℂ) := by
    exact (algebraicIndependent_singleton_iff (R := ↥K)
      (x := fun x : ({u} : Set ℂ) => id (x : ℂ)) ⟨u, rfl⟩).2 hu
  have ht' : AlgebraicIndepOn (↥K) id ({t} : Set ℂ) := by
    exact (algebraicIndependent_singleton_iff (R := ↥K)
      (x := fun x : ({t} : Set ℂ) => id (x : ℂ)) ⟨t, rfl⟩).2 ht
  obtain ⟨B, huB, hB⟩ := exists_isTranscendenceBasis_superset hu'
  obtain ⟨C, htC, hC⟩ := exists_isTranscendenceBasis_superset ht'
  -- Step 2: the two bases are equipotent, and can be matched sending `u` to `t`.
  have hcard : #(↥B) = #(↥C) := hB.cardinalMk_eq hC
  obtain ⟨f⟩ := Cardinal.eq.mp hcard
  set iu : ↥B := ⟨u, huB rfl⟩ with hiu
  set it : ↥C := ⟨t, htC rfl⟩ with hit
  set e : ↥B ≃ ↥C := f.trans (Equiv.swap (f iu) it) with he
  have hei : e iu = it := by simp [he]
  -- Step 3: transport the polynomial presentations of the two bases into each other.
  set v : ↥B → ℂ := ((↑) : ↥B → ℂ) with hvdef
  set w : ↥C → ℂ := ((↑) : ↥C → ℂ) with hwdef
  have i1 : IsAlgClosure (Algebra.adjoin (↥K) (Set.range v)) ℂ :=
    IsAlgClosed.isAlgClosure_of_transcendence_basis v hB
  have i2 : IsAlgClosure (Algebra.adjoin (↥K) (Set.range w)) ℂ :=
    IsAlgClosed.isAlgClosure_of_transcendence_basis w hC
  set ε : Algebra.adjoin (↥K) (Set.range v) ≃ₐ[↥K] Algebra.adjoin (↥K) (Set.range w) :=
    hB.1.aevalEquiv.symm.trans ((MvPolynomial.renameEquiv (↥K) e).trans hC.1.aevalEquiv) with hε
  set Phi : ℂ ≃+* ℂ := IsAlgClosure.equivOfEquiv ℂ ℂ ε.toRingEquiv with hPhi
  refine ⟨Phi.toRingHom, ?_, ?_⟩
  · intro a ha
    have h1 : (a : ℂ) = algebraMap (Algebra.adjoin (↥K) (Set.range v)) ℂ
        (algebraMap (↥K) (Algebra.adjoin (↥K) (Set.range v)) ⟨a, ha⟩) := by
      rw [← IsScalarTower.algebraMap_apply]
      rfl
    rw [RingEquiv.toRingHom_eq_coe, RingHom.coe_coe]
    conv_lhs => rw [h1]
    rw [hPhi, IsAlgClosure.equivOfEquiv_algebraMap]
    show algebraMap (Algebra.adjoin (↥K) (Set.range w)) ℂ
      (ε (algebraMap (↥K) (Algebra.adjoin (↥K) (Set.range v)) ⟨a, ha⟩)) = a
    rw [AlgEquiv.commutes, ← IsScalarTower.algebraMap_apply]
    rfl
  · have h2 : u = algebraMap (Algebra.adjoin (↥K) (Set.range v)) ℂ
        (hB.1.aevalEquiv (MvPolynomial.X iu)) := by
      rw [AlgebraicIndependent.algebraMap_aevalEquiv]
      simp [hvdef, hiu]
    rw [RingEquiv.toRingHom_eq_coe, RingHom.coe_coe]
    conv_lhs => rw [h2]
    rw [hPhi, IsAlgClosure.equivOfEquiv_algebraMap]
    show algebraMap (Algebra.adjoin (↥K) (Set.range w)) ℂ
      (ε (hB.1.aevalEquiv (MvPolynomial.X iu))) = t
    rw [hε]
    simp only [AlgEquiv.trans_apply, AlgEquiv.symm_apply_apply,
      MvPolynomial.renameEquiv_apply, MvPolynomial.rename_X, hei]
    rw [AlgebraicIndependent.algebraMap_aevalEquiv]
    simp [hwdef, hit]

end Diaz
