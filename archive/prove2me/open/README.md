# Open statements

Formal statements and write-ups of the **Open** nodes of the four exponentials subtree
(`FourExp.*`) of the Diaz mission. They are copied from the Prove2Me board by
`scripts/refresh_prove2me_archive.py` and regenerated on every refresh. A file disappears once
its node is proved, when the accepted proof lands in `archive/prove2me/`.

These are statements, not proofs: each `.lean` file ends in `sorry`. They are kept because
accepted reductions elsewhere in the archive import them (`import Theorems.Thm_<name>`), and
without them those reductions would point at text that exists only on the platform.

Not built by this repository.

## These four will not close

All four statements here are a documented dead branch. Each was replaced by a corrected node that
is Proved, and each one's `Source` line says so on the platform:

| Here | Replaced by | Why |
| --- | --- | --- |
| `FourExp.construction_core` | `FourExp.construction_core_1973` | fixes `S = ⌊N²√log N⌋`, where the 1973 text has `S = ⌊N²/√log N⌋`; with the published `S` the degree and height ratios are unbounded, so the statement is true only vacuously |
| `FourExp.construction_count` | `FourExp.construction_count_1973` | the same wrong `S`; the inequality holds either way, but only the corrected one is what the construction needs |
| `FourExp.auxiliary_function` | `FourExp.auxiliary_function_alg` | omits the hypothesis that the four `exp (xᵢyⱼ)` are algebraic, without which the `ω`-degree of their powers is unbounded |
| `FourExp.norm_to_polynomial` | `FourExp.norm_to_polynomial_alg` | the same missing hypothesis |

The corrected four are in `archive/prove2me/` and in `Diaz/Mirror/`. Nothing depends on the four
here except two reductions accepted before the defects were found, the first sketches of
`auxiliary_construction` and `construction_core_1973`; both nodes are Proved through their second
sketches.
