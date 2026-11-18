[← README](../README.md)

## The companion note

`tex/diaz_prove2me.tex` (and its PDF) is the mathematical account of what the
mirrored nodes say: the ceiling, the quantisation of the imaginary part, the
precise open boundary, two barriers and the branch that returns to its start,
and the exclusions that come from leaving the candidate's three-dimensional
hull. Every numbered statement in it carries a row in its Appendix A naming
the formal identifier, so a reader can check any claim against this repository
or against the platform rather than take it.

It is a published copy: the working copy lives elsewhere and is copied here
after a script re-checks each appendix row against the live board.

**Stable version 1.0** (2026-09-21) is tagged `note-v1.0`, with the PDF attached to
the matching GitHub release. It records the end of the case analysis: every branch
of the conjecture is closed or reduced to one of three open statements, named in its
last section; version 1.26 (14 October 2026) reduces every branch to two. The older
`tex/diaz-modulus.tex` is a different and earlier note, about the model and the
negative result, and is not superseded by it.

`tex/diaz-roy-rank-three.tex` (2 November 2026, written by Claude) is a separate
research note and is not formal: none of it is in the Lean library. It shows that
Roy's rank bound at rank at most three cannot exclude u⁴ or u⁴ + cu³ through their
hulls. That is a barrier on one method, not progress on the conjecture. Its rank-three
and hull theorems are computer-assisted, with the scripts in `scripts/roy_rank/`. Its
statements were not found in the sources read, and the note lists what those were.

