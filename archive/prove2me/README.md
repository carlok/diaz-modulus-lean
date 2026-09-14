# Accepted Prove2Me proofs, verbatim

Every accepted submission for every Proved node of the Diaz mission on
[Prove2Me](https://prove2.me), downloaded through the platform's API on
2026-09-12. One file per accepted submission, named
`<theorem_name>__<submission id prefix>.lean`; `manifest.json` records the
theorem and submission ids, who submitted, and when.

Four files come from a different mission. `DiazModulus.six_exponentials` rests on
`SX.six_exponentials_of_numberField`, which rests on `SX.exists_aux_expSum`,
`SX.descent_step` and `SX.eq_zero_of_expSum_vanishes`; their accepted proofs are archived
here too, marked `dependency_of` in the manifest, together with `Def_SX.lean`, the
definitions they are stated in. All four are Proved, so the Diaz result they support is
proved outright.

These files are the platform's record, kept here so that no proof exists only
on the platform. They are **not** part of the Lean library and are not built:
they target the platform's Mathlib revision and import its per-node modules
(`Definitions.Def_*`, `Theorems.Thm_*`), neither of which exists in this
repository. The library under `Diaz/` is where proofs are ported to compile
here; `MIRROR_CHECKLIST.md` at the repository root tracks which have been.

**One deviation from verbatim.** In files whose manifest entry has
`"redacted_comments": true`, comment text naming a private working file or an
internal document label was removed. The Lean code itself is byte-identical to
the platform's copy once comments are stripped; that was checked mechanically
before these files were written.

**Open statements.** `open/` holds the formal statement and write-up of each Open node in the
four exponentials subtree (`FourExp.*`). Accepted reductions in this folder import those
statements, so without them they would point at text that exists only on the platform. The
refresh script regenerates `open/` from the board and removes a file once its node is proved.
