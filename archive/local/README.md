# Diaz work never published on Prove2Me

Proofs written for the Diaz mission that exist nowhere public except here. Kept so
that nothing lives only on one machine. They are **not** part of the Lean library,
are not built by this repository, and have not been through the platform's checker.

## Status of each file

Every file here was built on 2026-09-12 or 2026-09-13 in the Prove2Me workspace — Lean
v4.33.1, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` — with no errors. None contains
`sorry` of its own; where a build reports one, it comes from an Open node the file imports,
and the table says so.

| File | What it proves | Depends on |
|---|---|---|
| `DZ_Transfer_check.lean` | A ring homomorphism of `ℂ` fixing `Q̄` pointwise preserves `Q̄`-linear independence, in both directions (`indep_transfer`). It carries a six-exponentials template at `u` to one at `Φ u`. | the mission definitions |
| `DZ_Sol_freering.lean` | A no-go theorem about a free polynomial ring in the two-variable cut-down `K[X, T]`. Pure polynomial algebra: it makes no claim about `ℂ`, about the conjecture, or about candidates. | Mathlib |
| `DZ_LEAFSPLIT_core.lean` | Elementary period split of the irrational-angle leaf, and the degeneracy of the same split on the real-generic leaf. Its own header says nothing in it is new. | the mission definitions |
| `DZ_ALIGNED_core.lean` | Splits the period-aligned leaf at the four-exponentials boundary, with an explicit witness `wC` on the norm-free side. | `DZ_LEAFSPLIT_core` |
| `DZ_FREE_core.lean` | On the period-aligned norm-free half, no admissible matrix exists, so the four-exponentials route is unavailable there (`no_admissible_matrix`, `fourExp_hypotheses_unsatisfiable`). | `DZ_LEAFSPLIT_core`, `DZ_ALIGNED_core` |
| `DZ_TRDEG_core.lean` | The transcendence-degree-one certificate for the period-aligned `norm_rat_mult` half. | `DZ_LEAFSPLIT_core`, `DZ_ALIGNED_core` |
| `DZ_TRDEG_solution.lean` | The period-aligned `norm_rat_mult` half, **from** four exponentials in transcendence degree one. | the Open node `DiazModulus.four_exponentials_trdeg_one` |
| `DZ_SPLITS_core.lean` | Splits (S) — no non-zero algebraic `γ` has `γ/(iπ)` a logarithm of an algebraic number — along the two coordinate axes of `γ`. | the mission definitions |
| `DZ_SPLITS_sub.lean` | The same split as a reduction: `recip_pi_not_log` from its real and imaginary halves. | the Open nodes `recip_pi_not_log_real_gamma`, `recip_pi_not_log_imag_gamma` |
| `DZ_Sol_offaxes_split.lean` | The off-axes leaf split on whether `Im u / π` is rational. | the mission definitions |
| `DZ_Sub_irrpi_reduction.lean` | The same split as a reduction to its two children. | the Open nodes `diaz_of_exp_real_generic`, `diaz_of_exp_not_real_irrational_angle` |
| `DZ_PIT_core.lean` | The residual leaf `…_period_free_pi_im_transcendental` is subsumed by the conjugate-pair crux. | `DZ_LEAFSPLIT_core` |
| `DZ_Sol_struct.lean` | The one genuine case split of the conjecture — whether `exp u` is real — and a reduction through reciprocals. | the mission definitions |
| `DZ_Sol_realgeneric.lean` | The real-generic leaf in arithmetic normal form. | the mission definitions |
| `DZ_LEAF2_normalform.lean` | A second, independently derived normal form of the same leaf. | `DZ_Sol_realgeneric`, `DZH_Sol_hermite_lindemann_holds` |
| `DZ_XCHECK_normalforms.lean` | Cross-check that the two normal forms agree. Evidence, not a result. | `DZ_LEAFSPLIT_core`, `DZ_LEAF2_normalform` |
| `DZH_Sol_hermite_lindemann_holds.lean` | The local copy of the Hermite–Lindemann proof, archived because `DZ_LEAF2_normalform` imports it. The library has its own port in `Diaz/HermiteLindemann.lean`. | the mission definitions |

Two of these need a word.

**`DZ_TRDEG_solution.lean` is conditional.** It imports the statement of
`DiazModulus.four_exponentials_trdeg_one`, which is Open on the platform, and its
`#print axioms` includes `sorryAx` for that reason alone: the file has no `sorry` of
its own. It proves that half *given* that theorem — a theorem of the literature,
due to Brownawell and Waldschmidt, that has never been formalised.

**`DZ_FREE_core.lean` proves a node held open on purpose.** A wrapper stating
`DiazModulus.aligned_norm_free_no_rational_log_matrix` verbatim and applying
`DiazFree.no_admissible_matrix` compiled on 2026-09-13 with axioms `propext`,
`Classical.choice`, `Quot.sound`. The two statements differ only in packaging: four
matrix entries against a `Fin 2 → Fin 2 → ℂ` matrix, and a named predicate `MemL3`
against its unfolding. Whether to submit it, and so close the node, is a decision that
has not been taken.

**`DZ_SPLITS_sub.lean` and `DZ_Sub_irrpi_reduction.lean` are reductions.** They prove a
parent from its children, and the children are Open; that is where their `sorryAx` comes
from. They close nothing until the children are proved.

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

## Everything else from the working folder

On 2026-09-13 every remaining Lean file from the working folder, 177 of them, was added
here, sorted by comparing each file's code with comments and whitespace removed against
`archive/prove2me/`, and then cleared the same day:

- 171 were removed as redundant: 122 were identical to an accepted platform submission,
  17 were near-copies of one (checked to hold no declaration the submission lacks), and
  32 were statement stubs, axiom audits and probes.
- `DZ_TRDEG_submission.lean` was removed too: its inlined form is already the accepted
  sketch of `DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_rat_mult`.
- The other five went to Prove2Me and are archived in `archive/prove2me/`: two alternative
  reductions (of `DiazModulus.diaz_of_exp_not_real` and `DiazModulus.recip_pi_not_log`,
  both accepted as sketches) and three new Proved nodes,
  `DiazModulus.transfer_breaks_exactly`, `DiazModulus.recip_pi_exp_axis_shape` and
  `DiazModulus.period_free_split_nondegenerate`.

The removed files remain in this repository's history, in the commit that added them.
