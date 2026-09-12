# Diaz work never published on Prove2Me

Proofs written for the Diaz mission that exist nowhere public except here. Kept so
that nothing lives only on one machine. They are **not** part of the Lean library,
are not built by this repository, and have not been through the platform's checker.

## Status of each file

All seven were built on 2026-09-12 in the Prove2Me workspace — Lean v4.33.1,
Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` — with no errors. None contains
`sorry`.

| File | What it proves | Depends on |
|---|---|---|
| `DZ_Transfer_check.lean` | A ring homomorphism of `ℂ` fixing `Q̄` pointwise preserves `Q̄`-linear independence, in both directions (`indep_transfer`). It carries a six-exponentials template at `u` to one at `Φ u`. | the mission definitions |
| `DZ_Sol_freering.lean` | A no-go theorem about a free polynomial ring in the two-variable cut-down `K[X, T]`. Pure polynomial algebra: it makes no claim about `ℂ`, about the conjecture, or about candidates. | Mathlib |
| `DZ_LEAFSPLIT_core.lean` | Elementary period split of the irrational-angle leaf, and the degeneracy of the same split on the real-generic leaf. Its own header says nothing in it is new. | the mission definitions |
| `DZ_ALIGNED_core.lean` | Splits the period-aligned leaf at the four-exponentials boundary, with an explicit witness `wC` on the norm-free side. | `DZ_LEAFSPLIT_core` |
| `DZ_FREE_core.lean` | On the period-aligned norm-free half, no admissible matrix exists, so the four-exponentials route is unavailable there (`no_admissible_matrix`, `fourExp_hypotheses_unsatisfiable`). | `DZ_LEAFSPLIT_core`, `DZ_ALIGNED_core` |
| `DZ_TRDEG_core.lean` | The transcendence-degree-one certificate for the period-aligned `norm_rat_mult` half. | `DZ_LEAFSPLIT_core`, `DZ_ALIGNED_core` |
| `DZ_TRDEG_solution.lean` | The period-aligned `norm_rat_mult` half, **from** four exponentials in transcendence degree one. | the Open node `DiazModulus.four_exponentials_trdeg_one` |

Two of these need a word.

**`DZ_TRDEG_solution.lean` is conditional.** It imports the statement of
`DiazModulus.four_exponentials_trdeg_one`, which is Open on the platform, and its
`#print axioms` includes `sorryAx` for that reason alone: the file has no `sorry` of
its own. It proves that half *given* that theorem — a theorem of the literature,
due to Brownawell and Waldschmidt, that has never been formalised.

**`DZ_FREE_core.lean` may prove a node held open on purpose.** Compare it against
`DiazModulus.aligned_norm_free_no_rational_log_matrix` before publishing. If the
statements match, keeping that node open is a decision to revisit, not a gap.

## Building them

They target the platform's workspace, not this repository: they import
`Definitions.Def_DiazModulus` and, in one case, `Theorems.Thm_*`, neither of which
exists here, and they import each other as `Solutions.*`.

```bash
git clone https://github.com/prove2me/prove2me_workspace.git
cd prove2me_workspace
lake exe cache get
cp /path/to/archive/local/*.lean Solutions/
lake build Solutions.DZ_FREE_core
```

The mission definitions file comes from the platform's definition node for the
Diaz mission.

## One deviation from verbatim

`DZ_Sol_freering.lean` cited a private working document by file name in a comment.
That phrase now reads "an unpublished decomposition draft". The Lean code is
unchanged; that was checked mechanically before the file was written.

## What happens to these next

Each should end in one of three states: published on Prove2Me and then mirrored into
the library, ported into the library directly, or removed as having no value. They
are here so that the decision can be made later without anything being lost first.
