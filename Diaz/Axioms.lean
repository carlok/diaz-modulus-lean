/-
# Imported transcendence results

Nothing in this file is proved here.  Each statement is quoted from the
literature and declared as an `axiom` rather than left as a `sorry`, so
that the assumed surface of the development is visible in one place.

The difference matters when reading the development: a `sorry` says "I
owe you this proof", an `axiom` says "this is deliberately imported".
Running `#print axioms` on any theorem in `Diaz.Closure` lists exactly
which of these it leans on, so the boundary between what is proved and
what is assumed is machine-checkable rather than a matter of trust.
-/
import Mathlib

namespace Diaz

/-- **Hermite–Lindemann.**  If `u ≠ 0` and `exp u` is algebraic, then `u`
is transcendental.

This is the contrapositive of the usual statement, that a non-zero
algebraic number has transcendental exponential.  See A. Baker,
*Transcendental Number Theory*, Cambridge University Press 1975,
Theorem 1.4.

**This will become dischargeable.**  Mathlib master carries only the
analytic half (`NumberTheory/Transcendental/Lindemann/AnalyticalPart`),
but the theorem itself is formalized in the open PR
`leanprover-community/mathlib4#28013`, as

    theorem transcendental_exp {a : ℂ} (a0 : a ≠ 0) (ha : IsAlgebraic ℤ a) :
        Transcendental ℤ (exp a)

which is the contrapositive of this axiom, over `ℤ` rather than `ℚ` --
the same condition in characteristic zero.  When that PR merges, delete
this axiom and derive it; the statement below is shaped to make that a
local change. -/
axiom hermite_lindemann {u : ℂ} (hu : u ≠ 0)
    (hexp : IsAlgebraic ℚ (Complex.exp u)) : Transcendental ℚ u

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
axiom exists_ringHom_of_transcendental {K : Subfield ℂ} {u t : ℂ}
    (hu : Transcendental (↥K) u) (ht : Transcendental (↥K) t) :
    ∃ Φ : ℂ →+* ℂ, (∀ a ∈ K, Φ a = a) ∧ Φ u = t

end Diaz
