# Prior-art sweep of chapter 14, November 2026

A desk search that tried to break each "not found" in chapter 14. The sweep itself edited nothing; changes to the blueprint, the companion note and the ranking are the author's calls, and this report marks the ones applied so far.

## Result

Of the 20 entries, **5 are `found`, 5 are `found in part` and 10 are `not found by this sweep`**. None is `lead unverified`.

**No statement was found printed as it stands in the library.** Every `found` is a printed theorem plus a derivation written by a verifier. That is what the brief means by "implies", but it's weaker than finding the result in a paper.

Decisions taken by the author on 8 November 2026:

1. **Theorem B leaves the "not routine" list.** Its key step is in print under another name, and it takes two lines by gcds. Applied to chapter 14 and the node's source line. The other three entries (2, 3, 4) survived and move up to ranks 1–3.
2. **Entries 6, 9, 14 are `found in part`.** See "How the verdicts were set".

3. **The Li₂(1/2) wording changes.** "Still open" is gone from the blueprint, the README and the note. They now say two unrefereed 2026 preprints report it proved. See "The Li₂(1/2) line" below.

Entries 6, 8, 9, 14, 16, 17, 18 confirm "routine": each follows quickly from a theorem that is in print, usually one already cited. Nearly all stay "not printed", so their source lines need a route added, not a retraction.

## Verdicts

| # | Entry | Class in ch. 14 | Verdict | Sources | What is and isn't in print |
|---|---|---|---|---|---|
| 1 | Theorem B | not routine, rank 1 (moved to routine, 8 Nov) | **found**, as a translation | Park, Trans. AMS 377 (2024), Th. 1.2(2); Park–Sim, Math. Nachr. 298 (2025), Th. 1.1; Arbarello–Harris, Compositio 43 (1981), §2, pp. 157–158; Kadıköylü, Ann. Inst. Fourier 69 (2019), Lemma 2.2 | The Möbius step, in the language of rank-3 quadrics through a curve. The list u², ū², 1/(u−a) needs partial fractions, and BSZ17 is still needed. Never printed as a statement about configurations. |
| 2 | Involution spaces | not routine, rank 2 | not found by this sweep | | Analogues only; verifiers demoted the leads. |
| 3 | Theorem E | not routine, rank 3 | not found by this sweep | | No lead reached a verifier. |
| 4 | Theorem F, NF | not routine, rank 4 | not found by this sweep | | Analogues only, with the extra agent on scrolls and one-generic matrices. |
| 5 | Laurent hull, sumset | routine | not found by this sweep | | Analogues only. |
| 6 | Separation, Theorem A | routine | found in part | Waldschmidt 2000, Prop. 12.4, p. 422; Eisenbud–Harris, Adv. Math. 70 (1988), p. 136; de Seguins Pazzis, arXiv:1507.05375, Prop. 2.3 | Separation with K ⊊ F is not printed. Also a correction: Prop. 12.2 and the Remark on p. 424 hold for any k, not only V₀ = K = Q̄. |
| 7 | 2 × 2 normal form | routine | found in part | Beauville, Michigan Math. J. 48 (2000), Prop. 3.3; Ishitsuka, arXiv:1512.05167, Prop. 6.1; Waldschmidt 2000, p. 431 | The one-orbit clause only. Not the logarithm clause, the norm-form relation or the constant-term statement beyond a direct computation. |
| 8 | Conjugate pair spaces | routine | **found**, by a short derivation | Bachoc–Serra–Zémor, arXiv:1501.00602v2, Th. 2 and Th. 33; Castelnuovo's lemma; Green's K_{p,1} theorem | Invisibility follows with a pole count. Not printed; the source has no u, H₀ or conjugation. |
| 9 | Two poles | routine | found in part | Bachoc–Serra–Zémor, Th. 2 and Th. 33 | Same route as 8, but verifiers marked the source alone as not covering it. |
| 10 | Real pencil spaces | routine | not found by this sweep | | Verifiers demoted both leads. |
| 11 | Laurent cubic, two-orbit | routine | not found by this sweep | | Analogues only. |
| 12 | Conjugation-swapped, cyclic | routine | not found by this sweep | | Analogue only. |
| 13 | Polynomial hulls, Roy + circle point | routine | not found by this sweep | | Verifiers demoted all three leads. |
| 14 | Degree-one spaces | routine | found in part | Bachoc–Serra–Zémor, Th. 2 and Th. 33 | The criterion u·R(u)·g follows by a derivation. Not printed; verifiers marked the source alone as not covering it. |
| 15 | Theorem D, barrier | routine | not found by this sweep | | Analogues only. |
| 16 | (Qr2), pair rigidity, trdeg 1 | routine | **found**, by a short derivation | Roy–Waldschmidt, Ann. Sci. ENS 30 (1997), Th. 0.2, p. 755; Waldschmidt 2000, §15.3.4, p. 593 | A second route beside Brownawell Cors. 5 and 7, already named. Neither statement is printed; (Qr2) isn't mentioned. |
| 17 | (log 2)² + π² | routine | **found**, by a short derivation | Roy–Waldschmidt 1997, Th. 0.2 and Cor. 7.3; Roy–Waldschmidt, Proc. Japan Acad. 71A (1995), Th. 2; Waldschmidt 2000, p. 593 | This pair of numbers isn't printed; p. 792 of the 1997 paper treats a different number. One substitution. |
| 18 | Li₂(1/2) dichotomy | routine | **found**, by a short derivation; **source line out of date** | Waldschmidt, J. Number Theory 5 (1973), Cor. 4; Waldschmidt, LNM 402 (1974), remark after Cor. 7.4.3; Roy–Waldschmidt 1997, Th. 0.2. Irrationality: Tan–Zhang, arXiv:2611.01066, Th. 1.3; Lai, arXiv:2610.06838, p. 2 | The dichotomy isn't printed. Separately, Li₂(1/2) is reported irrational, so "still open" needs a look. See below. |
| 19 | Strong five ⇒ Diaz | routine | found in part | Waldschmidt 2000, §11.6.1, p. 399 | The same substitution from the stronger Conjecture 11.17. That doesn't imply the target, since strong five is the weaker hypothesis. |
| 20 | Weak Schanuel | routine | not found by this sweep | | Analogues only. |

Each entry's folder holds `target.md`, the searchers' reports and one file per verification. A `.md` and a `.json` carry the same content.

### How the verdicts were set

- `found`: a verifier opened the source, confirmed the statement at the cited place, and found relation "same" or "implies" with a derivation reaching the whole part not found.
- `found in part`: a verified special case, generalization, or part of the target; or a derivation that the verifiers marked as not covered by the source alone.
- A named nearby result doesn't count by itself, per each `target.md`.

**Entries 6, 9, 14.** Verifiers filled `covers_part_not_found` unevenly. They set it true on entry 8, and false on 9 and 14 for the same kind of derivation from Bachoc–Serra–Zémor, because the source alone doesn't state the target. On entry 6, one of seven set it true. The author settled 6, 9 and 14 as `found in part`, following the flag. Entry 8 stays `found`, so its verdict differs from 9 and 14 only by that flag.

I checked by hand the algebra for entries 1, 17, 18 and 19 (the gcd argument, the vanishing of each quadric, ℚ-independence, the five-exponentials substitution). The other derivations have only their verifiers behind them, though several verifiers worked independently on most of them.

## The Li₂(1/2) line

The source line of entry 18 says irrationality of Li₂(1/2) is open, with only q ≥ 6 and q ≤ −5 known. The sweep found:

- H. Tan, Y. Zhang, arXiv:2611.01066v1, Th. 1.3 and Table 1: Li₂(1/q) irrational for all q ≥ 1, crediting a Lean development for part of it.
- Li Lai, arXiv:2610.06838v2, p. 2: reports a Lean 4 proof for Li₂(1/n). Version 1 also credited Zudilin with the result earlier; version 2 drops that remark.
- Public Lean repositories named by Tan–Zhang: `dtq1997/li2-half-irrationality` and `siqiliu-tsinghua/Li2Rational`. A verifier read their READMEs and main files. **Nobody built them.**

The preprints are unrefereed, and a September preprint (arXiv:2609.06895, snippet only, not opened) still lists s = 2 as unresolved. If the result stands, the dichotomy's first horn is true, so the dichotomy says nothing about e^{iγ/π}. The general form with arbitrary a, b, c, t is unaffected. Lai's preprint has no mention of this repository; the Tan–Zhang check didn't record one either way.

## Proposed source-line changes

Applied on 8 November 2026: the Theorem B change, in the wording of chapter 14, and the "still open" part of entry 18. The author declined the rest, including the added routes for entry 18. New citation keys would also need entries in `blueprint/nodes/99-references.toml`. BSZ theorem numbers are arXiv v2 numbers: check them against the journal before use.

**Entry 1.** Nodes: `circle_point_extension_two_by_three_configuration_iff` (14-not-found-in-the-sources.toml); `two_by_three_configuration_forces_progression` (14-not-found-in-the-sources.toml). Replace "Not found in the sources read, and not routine" with: "The classification was not found in this form. Its key step, that u is a Möbius function of the progression's ratio, is the structure of rank-3 quadrics through a rational normal curve: \cite[Theorem 1.2(2)]{Par24}, \cite[Theorem 1.1]{PS25}, \cite[\S2]{AH81}, with \cite[Lemma 4]{BSZ17}." Whether "not routine" and rank 1 stand is the author's call. The step is also two lines by gcds: writing 1, u, ū as b·p₀, b·p₁, b·p₂ gives p₁p₂ = ρp₀²; dividing by the gcd leaves coprime forms whose product is a square, so they are squares; parity forces the gcd to have degree 1.

**Entry 6.** Nodes: `rank_one_config_separation` (14-not-found-in-the-sources.toml); `generic_circle_point_config_is_two_by_two` (14-not-found-in-the-sources.toml); `generic_circle_point_no_two_by_three_configuration` (14-not-found-in-the-sources.toml); `generic_period_never_enters` (14-not-found-in-the-sources.toml). Change "Its case V₀ = K = Q̄ follows from" to say that \cite[Propositions 12.2 and 12.4]{Wal00} hold for arbitrary k, and add: "Separation with K ⊊ F is a short corollary of \cite[Proposition 12.4]{Wal00} or of the classical description of rank-one spaces \cite[p.~136]{EH88}." Keep "not found in this form".

**Entry 7.** Nodes: `circle_point_two_by_two_normal_form` (14-not-found-in-the-sources.toml); `circle_point_config_constant_matrix_det_ne_zero` (14-not-found-in-the-sources.toml); `candidate_two_by_two_config_entry_not_mem_span_logAlg` (14-not-found-in-the-sources.toml); `generic_quadratic_relation_is_norm` (14-not-found-in-the-sources.toml); `no_vanishing_coeff` (14-not-found-in-the-sources.toml); `det_pencil_eq_conic` (14-not-found-in-the-sources.toml). Add to the first node: "The one-orbit clause also follows from the uniqueness of the determinantal representation of a conic with a rational point: \cite[Proposition 3.3]{Bea00}, \cite[Proposition 6.1]{Ish}." The other clauses stay not found.

**Entries 8, 9, 14.** Nodes: `circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions` (14-not-found-in-the-sources.toml); `conj_stable_circle_point_extension_no_two_by_three_configuration` (14-not-found-in-the-sources.toml); `candidate_div_sq_sub_not_mem_logAlgTilde` (14-not-found-in-the-sources.toml); `circle_point_two_pole_configuration_invisible_to_four_dimensional_extensions` (14-not-found-in-the-sources.toml); `degree_one_space_visible_to_four_dimensional_extensions_iff_cubic_over_quadratic` (14-not-found-in-the-sources.toml); `rational_pencil_space_visible_to_four_dimensional_extensions_iff_natDegree_le` (14-not-found-in-the-sources.toml). Add: "It follows from \cite[Theorems 2 and 33]{BSZ17} and a pole count." For entry 8 also: "or from Castelnuovo's lemma". These stay routine and not printed. BSZ17 is already in the bibliography, so this only names the route.

**Entry 16.** Nodes: `diaz_2007_qr2_of_trdeg_one` (14-not-found-in-the-sources.toml); `log_pair_rigid_of_trdeg_one` (14-not-found-in-the-sources.toml). Add: "Both also follow from \cite[Théorème 0.2]{RW97}; see \cite[\S15.3.4]{Wal00}."

**Entry 17.** Nodes: `torsion_rational_modulus_unique` (14-not-found-in-the-sources.toml); `log_two_log_three_not_both_rational` (14-not-found-in-the-sources.toml); `recip_pi_log_of_torsion_rational_modulus` (14-not-found-in-the-sources.toml). Add: "All three also follow from \cite[Théorème 0.2]{RW97}." The rank-3 form for the pair is bX² − aY² + (a−b)Z² at (t₀, t₁, iπ).

**Entry 18.** Nodes: `dilog_half_irrational_or_exp_i_div_pi_transcendental` (14-not-found-in-the-sources.toml); `recip_pi_log_of_rational_quadratic_relation` (14-not-found-in-the-sources.toml). Replace "is still open: \cite{Hat93,RV05,CDT24} cover Li₂(1/q) only for q ≥ 6 and q ≤ −5" with wording that reflects the reports below, after the author has checked them. Add: "The dichotomy and the general form also follow from \cite[Corollaire 4]{Wal73}, \cite[Chapter 7]{Wal74} or \cite[Théorème 0.2]{RW97}." `Wal74` would be a new key.

**Entry 19.** Nodes: `diaz_of_strong_five_exponentials` (14-not-found-in-the-sources.toml). Add: "The same substitution appears at \cite[\S11.6.1, p.~399]{Wal00} under Conjecture 11.17." Stays not found for strong five.

## Sources

Counts are after de-duplication by arXiv id, DOI, or first author and year, against `blueprint/nodes/99-references.toml` and all of `tex/*.tex`. That matching is mechanical: it can merge two papers by one author in one year, and can miss a reference spelled differently. Treat the counts as close, not exact.

- **171 sources read**, of which **138 are new** to the references and companion notes and 33 were already there.
- **311 new sources screened only**, by abstract or snippet.
- **104 sources inaccessible** and not read through another copy.

<details><summary>New sources read (138)</summary>

- Buczyński, Ilten, Ventura, arXiv:1905.11860v3 (https://arxiv.org/abs/1905.11860) [entries 1]
- Cantón, Fernández-Jambrina, Vázquez-Gallo, arXiv:2507.23485v3 (https://arxiv.org/abs/2507.23485) [entries 1]
- Rydell, Sundelius, arXiv:2404.03063v2 (https://arxiv.org/abs/2404.03063) [entries 1]
- Di Gennaro, Rapagnetta, Sabatino, arXiv:2610.25065v2 (https://arxiv.org/abs/2610.25065) [entries 1, 4, 7]
- Ilten and coauthor, Khovanskii-finite rational curves of arithmetic genus 2, arXiv:2101.09410 (https://arxiv.org/abs/2101.09410) [entries 1]
- Tanisali, Wessel, High dimensional Riemann-Roch spaces in linear spaces with small squares, arXiv:2609.06822 (6 Sep 2026) (https://arxiv.org/abs/2609.06822) [entries 1, 4, 7]
- Arbarello-Harris 1981 (https://www.numdam.org/item/CM_1981__43_2_145_0.pdf) [entries 1]
- Snyder 1907, Amer. J. Math. 29 (https://archive.org/details/jstor-2370139) [entries 1]
- Park, arXiv:2208.12481 (https://arxiv.org/abs/2208.12481) [entries 1]
- Park-Sim, arXiv:2412.16983 (https://arxiv.org/abs/2412.16983) [entries 1]
- Grace-Young 1903 (https://archive.org/details/algebraofinvaria00graciala) [entries 1]
- Snyder-Sisam, Analytic Geometry of Space, 1914 (https://archive.org/details/analyticgeometry00snyd) [entries 1]
- Baker, Principles of Geometry III, 1922 (https://archive.org/details/principlesofgeom03bake) [entries 1]
- Salmon, Analytic Geometry of Three Dimensions, 1882 edition (https://archive.org/details/treatiseonanalyt00salm) [entries 1]
- Dahl-style CAGD paper on implicit rational cubic Bézier curves, arXiv:1605.08669 (author not recorded) (https://arxiv.org/abs/1605.08669) [entries 1]
- G. Warner, The Exponential World, arXiv:2105.05809 (https://arxiv.org/abs/2105.05809) [entries 1, 8, 15, 19, 20]
- Park 2024, On rank 3 quadratic equations of projective varieties (arXiv v2) (https://arxiv.org/abs/2208.12481) [entries 1]
- Park-Sim 2025, rank 3 quadratic equations of Veronese embeddings (arXiv v1) (https://arxiv.org/abs/2412.16983) [entries 1]
- Kadıköylü 2019, Ann. Inst. Fourier (journal PDF) (https://aif.centre-mersenne.org/article/AIF_2019__69_4_1879_0.pdf) [entries 1]
- Terasoma 2010 (arXiv) (https://arxiv.org/abs/1001.4846) [entries 1]
- Martello 2021 (arXiv) (https://arxiv.org/abs/2107.04107) [entries 1]
- Ballico-Bernardi 2011 (arXiv) (https://arxiv.org/abs/0912.4834) [entries 1]
- Ball-Lavrauw, Arcs in finite projective spaces, EMS Surv. Math. Sci. 6 (arXiv) (https://arxiv.org/abs/1908.10772) [entries 1]
- Bachoc-Couvreur-Zémor 2018 (arXiv) (https://arxiv.org/abs/1709.00087) [entries 1, 3, 10, 12, 14, 15]
- Mirandola-Zémor 2015 (arXiv) (https://arxiv.org/abs/1501.06419) [entries 1, 3]
- Hamilton, On 'gauche' curves of the third degree (collected paper XL) (https://rcin.org.pl//Content/190090/PDF/WA35_223316_11536-3_art-40.pdf) [entries 1]
- Edge 1986, invariant of degree 4 of the binary quintic (https://webhomes.maths.ed.ac.uk/cheltsov/seminar/pdf/1986a.pdf) [entries 1]
- Wikipedia, Twisted cubic (https://en.wikipedia.org/wiki/Twisted_cubic) [entries 1]
- Elkies, Shimura curve computations (https://arxiv.org/abs/math/0005160) [entries 2]
- Nguyen, Projective line revisited (https://arxiv.org/abs/1804.00639) [entries 2]
- Tanisali, Wessel, High dimensional Riemann-Roch spaces in linear spaces with small squares (Sept 2026) (https://arxiv.org/abs/2609.06822) [entries 2]
- Habsieger 2007, A few remarks related to the four exponentials conjecture, Publ. Math. Debrecen 70, 179-194 (https://publi.math.unideb.hu/paper/1156/download/10_5486_PMD_2007_3505.pdf) [entries 2, 3, 5]
- Nguyen, A Generalization of Desargues' Involution Theorem, arXiv:1912.12200 (https://arxiv.org/abs/1912.12200) [entries 2]
- Bachoc, Serra, Zémor, An analogue of Vosper's theorem for extension fields (arXiv version) (https://arxiv.org/abs/1501.00602) [entries 2, 5, 8, 9, 14]
- Wessel, On Freiman's Theorem in a function field setting (https://arxiv.org/abs/2405.10724) [entries 2]
- Couvreur, Zémor, Freiman's 3k-4 Theorem for Function Fields (https://arxiv.org/abs/2408.00183) [entries 2, 5]
- Hofmann, The ideal of curves of genus 2 on rational normal scrolls (https://arxiv.org/abs/1102.3156) [entries 2]
- Aprodu, Bruno, Sernesi, A characterization of bielliptic curves via syzygy schemes (https://arxiv.org/abs/1708.08056) [entries 2]
- Jung, Moon, Park, On the rank index of projective curves of almost minimal degree (https://arxiv.org/abs/2411.17494) [entries 2]
- Mirandola, Zémor, Critical pairs for the Product Singleton Bound (https://arxiv.org/abs/1501.06419) [entries 2, 8]
- Abdesselam, Chipalkatti, Quadratic involutions on binary forms (https://arxiv.org/abs/1008.3117) [entries 2]
- zbMATH review of Diaz 2007 by M. Waldschmidt (Zbl 1163.11055) (https://zbmath.org/?q=an:1163.11055) [entries 3, 8, 11, 12]
- Momot, Density of rational points on commutative group varieties and small transcendence degree, arXiv:1011.3368 (https://arxiv.org/pdf/1011.3368) [entries 3, 4, 14, 15, 20]
- Waldschmidt, The role of complex conjugation in transcendental number theory (local copy) (https://hal.science/hal-00411402) [entries 3, 4, 6, 7, 10, 14, 15, 16, 17, 18, 19, 20]
- Cox-Iarrobino 2015 (https://arxiv.org/abs/1408.2816) [entries 3]
- Couvreur-Zémor 2024 (https://arxiv.org/abs/2408.00183) [entries 3, 10, 15]
- Tanisali-Wessel 2026 (https://arxiv.org/abs/2609.06822) [entries 3]
- Jung-Moon-Park 2024 (https://arxiv.org/abs/2411.17494) [entries 3]
- Franciosi 2018 (https://arxiv.org/abs/1811.09690) [entries 3, 4]
- Kustin-Polini-Ulrich, Rational normal scrolls and the defining equations of Rees algebras (https://arxiv.org/abs/0812.4963) [entries 3]
- Kirby, Variants of Schanuel's conjecture (local copy) (https://arxiv.org/abs/1801.08765) [entries 3, 15, 16]
- Harris–Roth–Starr, arXiv:math/0202067 (https://arxiv.org/abs/math/0202067) [entries 4, 10]
- von Bothmer, arXiv:math/0202133 (https://arxiv.org/abs/math/0202133) [entries 4]
- von Bothmer, Last syzygies of 1-generic spaces, arXiv:math/0307361 (https://arxiv.org/abs/math/0307361) [entries 4]
- M. Waldschmidt, The four exponentials problem and Schanuel's conjecture, survey (Zbl 1543.11060; local) (https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf) [entries 4]
- Eisenbud-Harris 1987, On varieties of minimal degree (https://eisenbud.github.io/papers/pdfs/1987-001.pdf) [entries 4]
- Eisenbud-Harris 1988, Vector spaces of matrices of low rank (local copy, sources/n3-lit) [entries 4, 6, 11]
- Eisenbud-Koh-Stillman 1988 with Harris appendix (https://eisenbud.github.io/papers/pdfs/1988-002.pdf) [entries 4]
- Buczyński-Ilten-Ventura 2020 (https://arxiv.org/abs/1905.11860) [entries 4]
- Ilten-Mokhtar 2023 (https://arxiv.org/abs/2101.09410) [entries 4]
- Harris-Roth-Starr, Curves of small degree on cubic threefolds (https://arxiv.org/abs/math/0202067) [entries 4]
- Alzati-Re, Irreducible components of Hilbert schemes of rational curves (https://arxiv.org/abs/1502.02521) [entries 4]
- Bernardi-Gimigliano-Idà, On parameterizations of plane rational curves and their syzygies (https://arxiv.org/abs/1507.02227) [entries 4]
- Tanisali–Wessel 2026 (https://arxiv.org/abs/2609.06822) [entries 4]
- Randriambololona, quadratic hull (https://arxiv.org/abs/1912.06627) [entries 4]
- Hofmann 2011 (https://arxiv.org/abs/1102.3156) [entries 4]
- Cox–Iarrobino 2015 (https://arxiv.org/abs/1408.2816) [entries 4]
- Park, hyperquadrics (https://arxiv.org/abs/1909.04859) [entries 4, 8]
- Lee–Park, On curves lying on a rational normal surface scroll (https://arxiv.org/abs/1808.03038) [entries 4]
- Jung, Moon, Park, On the rank index of projective curves of almost minimal degree (arXiv 2024) (https://arxiv.org/abs/2411.17494) [entries 5]
- Dasgupta, Ranks of matrices of logarithms I (arXiv 2303.02037) (https://arxiv.org/abs/2303.02037) [entries 5]
- Roth, Raviv, Tamo, Construction of Sidon Spaces With Applications to Coding (https://arxiv.org/abs/1705.04560) [entries 5]
- Castello, On generalized Sidon spaces (https://arxiv.org/abs/2312.12245) [entries 5]
- L'vovsky, On number of hypersurfaces containing projective curves (preprint of the Math. Ann. paper) (https://arxiv.org/abs/alg-geom/9504002) [entries 5]
- Fischler, Orbits under algebraic groups and logarithms of algebraic numbers (local copy; named as nearby) [entries 5, 7]
- M. Waldschmidt, An introduction to the strategy of transcendence proofs, arXiv:2610.39810 (29 Oct 2026) (https://arxiv.org/abs/2610.39810) [entries 6, 20]
- Waldschmidt, The Four Exponentials Problem and Schanuel's Conjecture (2022) [entries 6, 15]
- Waldschmidt, Transcendental numbers and functions of several variables (Proc. CNTA 1991; Zbl 0791.11032) (https://zbmath.org/0791.11032) [entries 6]
- Dasgupta–Kakde, Ranks of matrices of logarithms II: the matrix coefficient conjecture (https://zbmath.org/1586.11077) [entries 6]
- Waldschmidt's zbMATH review of Roy 1990 (https://zbmath.org/0712.11042) [entries 6]
- Warner, The Exponential World (2021), §50 (https://arxiv.org/abs/2105.05809) [entries 6]
- de Seguins Pazzis, arXiv:1507.05375 (https://arxiv.org/abs/1507.05375) [entries 6]
- Moon, Park, On the rank index of some quadratic varieties, arXiv:2206.08586 (https://arxiv.org/abs/2206.08586) [entries 6]
- Bachoc–Serra–Zémor 2017, Lemmas 4–5, Theorem 33, opening of §5 on quadratic forms (https://arxiv.org/abs/1501.00602) [entries 7]
- Roy–Waldschmidt, Ann. Sci. ENS 30 (1997) (local roy-waldschmidt-1997 text) [entries 7]
- Dasgupta-Kakde 2024, Ranks of matrices of logarithms II (local copy and ar5iv HTML, used to confirm the bars in Q and Qbar) (https://arxiv.org/abs/2408.08178) [entries 7]
- Waldschmidt, Proc. CNTA 1991 (local copy) [entries 7]
- Ishitsuka, A positive proportion of cubic curves over Q admit LDRs (arXiv:1512.05167) (https://arxiv.org/abs/1512.05167) [entries 7]
- Beauville, Determinantal hypersurfaces (author's copy of the Michigan Math. J. version) (https://math.unice.fr/~beauvill/pubs/det.pdf) [entries 7]
- Ishitsuka, Linear determinantal representations of smooth plane cubics over finite fields (arXiv:1604.00115) (https://arxiv.org/abs/1604.00115) [entries 7]
- Ishitsuka, Ito, Local-global principle for symmetric determinantal representations (arXiv:1412.8336) (https://arxiv.org/abs/1412.8336) [entries 7]
- Roy, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, Acta Math. 175 (local copy) [entries 7, 15]
- Sidman, Smith, Linear determinantal equations for all projective schemes (arXiv:0910.2424) (https://arxiv.org/abs/0910.2424) [entries 7]
- Jagiełła, Jelisiejew (arXiv:2409.06025) (https://arxiv.org/abs/2409.06025) [entries 7]
- Kim, Moon, Park, Some remarks on the K_{p,1} theorem (https://arxiv.org/abs/2404.03293) [entries 8]
- Sidman, Smith, Linear determinantal equations for all projective schemes (https://arxiv.org/abs/0910.2424) [entries 8]
- von Bothmer, Last syzygies of 1-generic spaces (https://arxiv.org/abs/math/0307361) [entries 8]
- Draisma 2006, small maximal spaces (local copy) (https://arxiv.org/abs/math/0407240) [entries 10]
- Laurent 1991, Sur quelques résultats récents de transcendance, Astérisque 198–200 (local copy) [entries 10]
- Target file, entry 10 [entries 10]
- Jung, Moon, Park, arXiv:2411.17494 (https://arxiv.org/abs/2411.17494) [entries 10, 11]
- Reznick, arXiv:1007.5485 (https://arxiv.org/abs/1007.5485) [entries 10]
- Comas, Seiguer, On the rank of a binary form, arXiv:math/0112311 (https://arxiv.org/abs/math/0112311) [entries 10]
- Comon, Ottaviani, On the typical rank of real binary forms, arXiv:0909.4865 (https://arxiv.org/abs/0909.4865) [entries 10]
- Blekherman, Chen, Jung, Sums of squares, Hankel index and almost real rank, arXiv:2108.06635 (https://arxiv.org/abs/2108.06635) [entries 10]
- Alzati-Re, arXiv:1502.02521 (https://arxiv.org/abs/1502.02521) [entries 11]
- Reid, Chapters on algebraic surfaces, alg-geom/9602006, local copy (https://arxiv.org/abs/alg-geom/9602006) [entries 11]
- Bachoc-Serra-Zémor, Vosper analogue (arXiv and local copy) (https://arxiv.org/abs/1501.00602) [entries 12, 14]
- Couvreur-Zémor, Freiman's 3k-4 theorem for function fields (local copy) (https://arxiv.org/abs/2408.00183) [entries 12]
- Alzati-Re 2015 (https://arxiv.org/abs/1405.2753) [entries 12]
- Jung-Moon-Park (https://arxiv.org/abs/2411.17494) [entries 12]
- Gimigliano-Idà (https://arxiv.org/abs/1507.02227) [entries 12]
- Bays-Kirby, Pseudo-exponential maps, variants, and quasiminimality (arXiv:1512.04262) (https://arxiv.org/abs/1512.04262) [entries 15]
- Mantova, A pseudoexponential-like structure on the algebraic numbers (arXiv:1202.4022) (https://arxiv.org/abs/1202.4022) [entries 15]
- Kirby, Finitely presented exponential fields (arXiv:0912.4019) (https://arxiv.org/abs/0912.4019) [entries 15, 20]
- Kirby, Exponential algebraicity in exponential fields (arXiv:0810.4285) (https://arxiv.org/abs/0810.4285) [entries 15]
- Roy, Interpolation formulas and auxiliary functions, JNT 2002 (local copy) (https://doi.org/10.1006/jnth.2001.2708) [entries 15]
- Dasgupta-Kakde et al., Ranks of matrices of logarithms II (local copy) (https://doi.org/10.1016/j.aim.2025.110753) [entries 15]
- Bays-Kirby, Pseudo-exponential maps, variants, and quasiminimality (https://arxiv.org/pdf/1512.04262) [entries 15]
- Mantova, Involutions on Zilber fields (https://arxiv.org/pdf/1109.6155) [entries 15]
- Dasgupta, Ranks of matrices of logarithms I (local library copy) [entries 15]
- Lai, arXiv:2610.06838v2 (https://arxiv.org/abs/2610.06838) [entries 18]
- Tan-Zhang, arXiv:2611.01066v1 (https://arxiv.org/abs/2611.01066) [entries 18]
- Prellberg, arXiv:2609.06895v1 (https://arxiv.org/abs/2609.06895) [entries 18]
- Giraudin, arXiv:2611.01708v1 (https://arxiv.org/abs/2611.01708) [entries 18]
- Persiflage (Calegari), zeta(5) is irrational, blog post, 24 Sep 2026 (https://galoisrepresentations.org/2026/09/24/zeta5-is-irrational/) [entries 18]
- M. Waldschmidt, Legacy of Ramanujan 2013 text (local library: waldschmidt/LegacyRamanujan2013Text.txt) [entries 19]
- Waldschmidt, Arizona Winter School 2008 Lecture 5 notes (https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/AWSLecture5.pdf) [entries 19]
- Waldschmidt talk slides: Wien-ESI; Bangalore 2003; NCTS 2003; Sarrebruck 2003 (https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Wien-ESI.pdf) [entries 19]
- Waldschmidt 2007, The role of complex conjugation in transcendental number theory (local text) (https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf) [entries 19]
- Bertolin, Philippon, Saha, Saha, arXiv:2010.15170 (https://arxiv.org/abs/2010.15170) [entries 20]
- M. Bays, SEAC from EAC modulo Schanuel, arXiv:2610.27963 (20 Oct 2026) (https://arxiv.org/abs/2610.27963) [entries 20]
- Kirby and Zilber, Exponentially closed fields and the conjecture on intersections with tori, arXiv:1108.1075 (https://arxiv.org/abs/1108.1075) [entries 20]
- Berarducci and Gallinaro, On the elementary theory of the real exponential field, arXiv:2603.08365v3 (https://arxiv.org/abs/2603.08365) [entries 20]
- Bertolin and Waldschmidt, Variations on Schanuel's Conjecture for elliptic and quasi-elliptic functions I, arXiv:2504.14048 (https://arxiv.org/abs/2504.14048) [entries 20]
- C. Bertolin, A conjecture in Schanuel style for 1-motives, arXiv:2509.08700v3 (https://arxiv.org/abs/2509.08700) [entries 20]
- Kirby, Macintyre and Onshuus, The algebraic numbers definable in various exponential fields, arXiv:1101.4224 (https://arxiv.org/abs/1101.4224) [entries 20]
- Waldschmidt, Colloquium De Giorgi Schanuel survey (2014), local copy [entries 20]

</details>

<details><summary>Screened only (311)</summary>

- Aliabadi et al., Extremal Chowla sets and their linear analogues, arXiv:2607.24847 (cites BSZ17; grep hits only, Chowla subspaces, unrelated) (https://arxiv.org/abs/2607.24847) [entries 1, 3, 4, 7]
- OpenAlex citers of Fischler 2001 (2) and Semantic Scholar citers (3): Multiplicity estimates and degeneration; From highly composite numbers to transcendental number theory [entries 1, 5]
- OpenAlex citers of Roy 1992 (21) by title: Iwasawa and p-adic L-function papers, Waldschmidt surveys, Roy-Waldschmidt 1997, Maksoud; none after 5 Oct 2026 [entries 1]
- OpenAlex citers of Diaz 2007 (0); Semantic Scholar (1: Waldschmidt, Role of complex conjugation); the Diaz 2004 DOI I guessed returned unrelated cubic-field papers on Semantic Scholar, so that list does not count as a citation check of Diaz [entries 1]
- OpenAlex citers of Bachoc-Couvreur-Zémor (3), Semantic Scholar (9), and of Mirandola-Zémor (42) by title: coding theory, non-GRS MDS codes, Schur products, analogues at most [entries 1]
- OpenAlex listings from 2026-05-01 on terms for logarithms of algebraic numbers, complex conjugation and transcendence, Vosper, Kneser, Freiman function fields; titles include arXiv:2611.00456 and arXiv:2610.28079, neither relevant by title. [entries 1, 3, 9, 19]
- J. Meyer, Projections of the twisted cubic, The Teaching of Mathematics X (2007) 51-62: abstract and grep; shows every rational cubic is a projection, and does not state the conic exclusion (https://teaching.matf.bg.ac.rs/vol/tm1014.pdf) [entries 1]
- Ning 2025, On subcodes of the generalized Reed-Solomon codes, arXiv:2507.04689: search summary only; codimension-1 subcodes of GRS codes, no Möbius relation, a coding-theory analogue at most (https://arxiv.org/abs/2507.04689) [entries 1]
- MaRDI record of Wang and Wang 1992, review text only: necessary and sufficient conditions for conics in rational cubic form, over the reals (https://portal.mardi4nfdi.de/wiki/Item:Q1195752) [entries 1]
- Semple-Kneebone, Algebraic Projective Geometry, 1952, Ch. XII (snippets: net of quadrics through the cubic; no cone statement surfaced) (https://archive.org/details/algebraicproject0000jgse) [entries 1]
- Semple-Roth, Introduction to Algebraic Geometry (snippets only; nothing relevant surfaced) (https://archive.org/details/introductiontoal0000semp) [entries 1]
- Maxwell, General Homogeneous Coordinates in Space of Three Dimensions, Twisted cubic §5 'The quadrics through the curve' (snippet only) (https://archive.org/details/bwb_O7-BNV-315) [entries 1]
- Telling, The Rational Quartic Curve, 1936 (snippet: quadric cones through the quartic; analogue) (https://archive.org/details/rationalquarticc0000tell) [entries 1]
- Brusotti, Sulla curva razionale normale, Annali di Mat. c.1904 (snippet: quadrics containing the curve and cones; analogue, volume unverified) (https://archive.org/details/annalidimatemat16unkngoog) [entries 1]
- Hartshorne, Algebraic Geometry, 1977 (snippet: quadric cone and a family of lines cutting a linear system on a curve; analogue, exact location unverified) (https://archive.org/details/algebraicgeometr0052hart) [entries 1]
- Bertini, Introduzione alla geometria proiettiva degli iperspazi, 1907 (OCR grep on coni quadrici; no matching statement) (https://archive.org/details/introduzioneall00bertgoog) [entries 1]
- Reye, Geometrie der Lage II, 1877 (OCR grep: projecting cones from points of the cubic; no 'only' statement found) (https://archive.org/details/geoderlagevon02reyerich) [entries 1]
- Farouki, History of mathematics and PH curves, slides (author's page; restates Kubota, lecture material) (https://faculty.engineering.ucdavis.edu/farouki/wp-content/uploads/sites/41/2013/02/History-of-mathematics-and-PH-curves.pdf) [entries 1]
- Wang-Wang, The rational cubic Bézier representation of conics, CAGD 1992 (review text only) (https://portal.mardi4nfdi.de/wiki/Item:Q1195752) [entries 1]
- L. Butler, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. 42 (2017): keyword search (https://doi.org/10.1007/s11139-015-9728-2) [entries 1, 2, 3, 4, 7, 8, 10, 11, 12, 14, 16]
- A. Momot, Density of rational points on commutative group varieties and small transcendence degree: abstract, keyword search (https://arxiv.org/abs/1011.3368) [entries 1, 10, 16]
- Citation lists of Diaz 2004, Roy 1992, Roy 1995, Diaz 1997, Fischler 2001, Variations, Further variations (OpenAlex; Semantic Scholar for Diaz 2004 and 2007): titles [entries 1, 8, 10]
- Regex scan of 117 local text files for Moebius or homographic terms, degree-count phrasing, 1/(u-a) forms and progression terms: the only 1/(u-a) form was Diaz 2007 Cor. 5(4), and Moebius or homographic terms gave no hits [entries 1]
- High dimensional Riemann-Roch spaces in linear spaces with small squares (keyword search only) (https://arxiv.org/abs/2609.06822) [entries 1, 12]
- Stratified and strong maximal rank conjecture in P³ and P⁴, Lemma 3.1 excerpt (rank-3 quadrics and pencils) (https://arxiv.org/abs/2605.24612) [entries 1]
- Han-Lee-Moon-Park, Rank 3 quadratic generators of Veronese embeddings, Compositio 157 (2021) (https://arxiv.org/abs/2001.06687) [entries 1]
- Rydell-Sundelius, Conic multiview varieties (keyword search only) (https://arxiv.org/abs/2404.03063) [entries 1]
- Kapustka-Kapustka-Ranestad, Variety of apolar schemes to powers of quadrics (keyword search only) (https://arxiv.org/abs/2409.13352) [entries 1]
- Edge 1980, A special polyhedral net of quadrics (keyword search only) (https://webhomes.maths.ed.ac.uk/cheltsov/seminar/pdf/1980a.pdf) [entries 1]
- Havlicek, The Betten-Walker spread and Cayley's ruled cubic surface (keyword search only) (https://arxiv.org/abs/1304.0231) [entries 1]
- Variations on Pascal's theorem (keyword search only) (https://arxiv.org/abs/2411.07638) [entries 1]
- Reid, Chapters on algebraic surfaces, and Eisenbud-Harris 1988, Vector spaces of matrices of low rank (local copies, keyword search only) [entries 1]
- Davydov, Marcugini, Pambianco, Twisted cubic and plane-line incidence matrix in PG(3,q) (keyword search only) (https://arxiv.org/abs/2103.11248) [entries 1]
- Baker, Symbolical algebra and the quadrics containing a rational curve (no cone or vertex hits; text layer poor) [entries 1]
- Aliabadi et al., Extremal Chowla sets and their linear analogues (2026): abstract and BSZ citation context (https://arxiv.org/abs/2607.24847) [entries 2, 4, 5, 13]
- Wang, Tang, A generalization of Vosper's theorem, Chin. Ann. Math. B 45 (2024) (https://doi.org/10.1007/s11401-024-0038-0) [entries 2, 8, 9]
- Beck, Lecouvey, Additive combinatorics methods in associative algebras, Confluentes Math. 9 (2017) (https://doi.org/10.5802/cml.34) [entries 2, 5, 9]
- Mirandola, Zémor, Critical pairs for the product Singleton bound, IEEE Trans. IT (2015) (https://doi.org/10.1109/tit.2015.2450207) [entries 2]
- Randriambololona, The quadratic hull of a code (2021) (https://arxiv.org/abs/1912.06627) [entries 2]
- Lin, Zémor, Kneser's theorem for codes and ℓ-divisible set families, Finite Fields Appl. 111 (2026) (https://arxiv.org/abs/2504.19304) [entries 2]
- About 25 Sidon-space and cyclic subspace code papers citing BSZ17 (Zhang-Tang-Cao, Castello-Polverino-Zullo, Feng-Wang, Niu-Yue-Wu, Roth-Raviv-Tamo line etc.), by title from zbMATH and OpenCitations; finite-field coding, not relevant [entries 2]
- Cano, Gusevskii, López-Flores, Spectral fields and unitary descent (30 Oct 2026): abstract only, unrelated (https://arxiv.org/abs/2611.00456) [entries 2]
- Pańkowski, Joint universality of the Riemann zeta-function (30 Oct 2026): abstract only, uses six exponentials only (https://arxiv.org/abs/2610.41600) [entries 2, 13]
- Neroli, Iterated graph systems II (7 Oct 2026): abstract only, unrelated (https://arxiv.org/abs/2610.10469) [entries 2]
- Milnor, Remarks on quadratic rational maps: grep for involution; no deck-involution statement located in the arXiv text (https://arxiv.org/abs/math/9209221) [entries 2]
- Reis, Invariant rational functions, linear fractional transformations and irreducible polynomials over finite fields: snippet only (https://arxiv.org/abs/2105.11247) [entries 2]
- Ollivier, Sadik, A simple and constructive proof to a generalization of Lüroth's theorem, Turk. J. Math. 46 (2022): title only (https://arxiv.org/abs/2201.11733) [entries 2]
- Betina, Maksoud, Pozzi, The eigencurve at crystalline points (2026): title, citer of Waldschmidt 2005 (https://arxiv.org/abs/2502.00876) [entries 2]
- Local library grep for involution, Möbius, homographie: only unrelated hits (Reid, Draisma, Waldschmidt adtn, ztq2003, Roy small value estimates) [entries 2, 15, 17]
- Massold 2025, Transcendence degrees of fields generated by exponentials of products, arXiv:2506.01123 (abstract, keyword search) (https://arxiv.org/abs/2506.01123) [entries 2, 4, 16, 19]
- zbMATH Open result lists (titles only) for 11J81 with logarithms, exponentials, matrices, conjugation, Schanuel, Kneser, Lüroth, and author lists for Diaz and Roy [entries 2, 5, 7, 10, 13, 14, 16]
- Other arXiv papers from the Desargues search, seen as snippets only: 1804.00639, 2011.03811, nlin/0203011 [entries 2]
- Moon, Park, On the rank index of some quadratic varieties (https://arxiv.org/abs/2206.08586) [entries 2]
- Beck, Lecouvey, Additive combinatorics methods in associative algebras (https://arxiv.org/abs/1504.02287) [entries 2, 5, 10]
- Hassett, Classical and minimal models of the moduli space of curves of genus two (https://arxiv.org/abs/math/0408338) [entries 2]
- Eisenbud, Harris, Vector spaces of matrices of low rank (local copy, keyword search only) [entries 2, 4, 8, 10, 12]
- Ginensky, A generalization of the Clifford index and determinantal equations for curves and their secant varieties (https://arxiv.org/abs/1002.2023) [entries 2, 4]
- Buczyński, Ginensky, Landsberg, Determinantal equations for secant varieties and the Eisenbud-Koh-Stillman conjecture (https://arxiv.org/abs/1007.0192) [entries 2]
- Graf von Bothmer, Generic syzygy schemes (https://arxiv.org/abs/math/0403432) [entries 2]
- Bopp, Hoff, Resolutions of general canonical curves on rational normal scrolls (https://arxiv.org/abs/1505.07235) [entries 2]
- Bays, Kirby, Wilkie, A Schanuel property for exponentially transcendental powers (https://ueaeprints.uea.ac.uk/34966/) [entries 2, 6, 15]
- Ranks of matrices of logarithms of algebraic numbers I (Structural Rank background) (https://arxiv.org/abs/2303.02037) [entries 2, 17, 19]
- Castelnuovo's last higher geometry lectures 1922-23 (search listing) (https://arxiv.org/abs/1505.03009) [entries 2]
- Explicit bases of the Riemann-Roch spaces on divisors on hyperelliptic curves (https://arxiv.org/abs/2012.08870) [entries 2]
- Local library keyword search for involution and Lüroth: only unrelated hits (Draisma 2006, Reid's Chapters, Waldschmidt notes) [entries 2]
- Pańkowski, Joint universality of the Riemann zeta-function..., arXiv:2610.41600, 30 Oct 2026 (search snippet; uses a six exponentials variant, unrelated) (https://arxiv.org/abs/2610.41600) [entries 3, 10, 11, 12, 15]
- Neroli, Iterated Graph Systems (II), arXiv:2610.10469, 7 Oct 2026 (search snippet; uses six exponentials for scale commensurability, unrelated) (https://arxiv.org/abs/2610.10469) [entries 3, 11, 12]
- Diaz author listing on the MaRDI portal and zbMATH (no later paper on this subject seen; the MaRDI list says it is not complete) (https://portal.mardi4nfdi.de/wiki/Guy_Diaz) [entries 3]
- Bernardi, Gimigliano, plane rational curves and syzygies, arXiv:1507.02227 (search summary only; curves on scrolls in P^4) (https://ar5iv.arxiv.org/html/1507.02227) [entries 3, 14]
- Forward citation list of BSZ17 on Semantic Scholar, about 50 titles: Sidon spaces, cyclic subspace codes, linear sets, Kneser and Freiman analogues. None concerns transcendence or conjugation [entries 3]
- Forward citation lists on Semantic Scholar for Diaz 2004 (8 titles), Diaz 2007 (1 title), Roy 1992 (partly seen; no relevant title in what displayed), Waldschmidt role of conjugation (1 title, unrelated) [entries 3]
- Waldschmidt, Six exponentials theorem, irrationality (2021/2022, French and English): keyword check for conjugation, no hits (https://hal.science/hal-03664120) [entries 3, 4, 11, 12]
- Butler, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. (2015 online): title and citation record only (https://doi.org/10.1007/s11139-015-9728-2) [entries 3, 6, 9]
- Ferreira-Ribas, Arithmetic properties of arguments of algebraic numbers on the unit circle, arXiv:2602.23597: abstract only; arguments of unit-circle algebraic numbers, no products of subspaces (https://arxiv.org/pdf/2602.23597) [entries 3, 8]
- Roy, Summer school 2008 lecture 5: title only (https://mysite.science.uottawa.ca/droy/summer-school-2008/droy_lecture5.pdf) [entries 3]
- Kühne, Logarithms of algebraic numbers, JTNB 27 (2015): title and search excerpt (https://www.numdam.org/item/JTNB_2015__27_2_499_0) [entries 3, 4, 5, 8]
- Murty-Murty, Transcendental values of class group L-functions I, II (2011, 2012), and Waldschmidt, From highly composite numbers to transcendental number theory (2013): titles from zbMATH hits for the exponentials queries [entries 3]
- Li, Four exponentials conjecture of Drinfeld modules (2021): title from zbMATH [entries 3, 7]
- zbMATH list for Guy Diaz (20 documents): no Diaz paper in the 2004-or-later listing beyond 2004 and 2007 [entries 3]
- Coskun-Riedl? no: Alzati-Re, Irreducible components of Hilbert schemes of rational curves with given normal bundle (Zbl 1369.14066), title only [entries 3]
- Brodmann-Schenzel, Arithmetic properties of projective varieties of almost minimal degree, snippet (https://arxiv.org/abs/math/0506277) [entries 3]
- Brodmann-Park-Schenzel, On varieties of almost minimal degree II and III, abstracts [entries 3]
- Lee-Park, Projective curves of degree=codimension+2 II, abstract (degree r+1 only) [entries 3]
- Han-Park, Secant rank and syzygies of projections of elliptic normal curves, title and abstract (https://arxiv.org/abs/2604.02046) [entries 3]
- Cortadellas Benítez-Cox-D'Andrea, The Rees algebra of parametric curves via liftings, title (https://arxiv.org/abs/1810.02077) [entries 3, 4]
- Madsen, on Rees algebras of height two ideals in k[x0,x1], snippet (https://arxiv.org/abs/1511.04073) [entries 3, 4]
- Coppens-Huisman, Pencils on real curves: real pencil vocabulary only, snippet (https://arxiv.org/abs/1107.4998) [entries 3]
- Uchimura, Discriminants of a class of self-inversive polynomials and real binary forms, abstract (https://arxiv.org/abs/1704.00463) [entries 3]
- Georgiou-Lindquist, Fejér-Riesz factorizations of generalized trigonometric polynomials, snippet (positivity, not subspace products) (https://arxiv.org/abs/2005.11920) [entries 3]
- Bachoc-Serra-Zémor, Revisiting Kneser's theorem for field extensions, Combinatorica 2018, title (Zbl 1413.11115) [entries 3, 10]
- Clubs and their applications (Zbl 1548.51004), title [entries 3]
- Rational curves of degree 10 and 11 on a general quintic threefold, snippets (https://arxiv.org/abs/0711.2758) [entries 3]
- Lüroth and rational function decomposition papers (arXiv:1701.03529, arXiv:1004.5285): decomposition, not subspace products; snippets [entries 3]
- Mirandola, On products of linear error correcting codes (thesis, Leiden 2017), table of contents and keyword search: Kneser, Vosper and PMDS pairs in K^n; no scroll content (https://ir.cwi.nl/pub/27113/mirandola.pdf) [entries 4]
- Randriambololona, The quadratic hull of a code, arXiv:1912.06627, keyword search only (https://arxiv.org/abs/1912.06627) [entries 4, 7]
- Aliabadi–Losonczy, Matchings and product growth, arXiv:2608.18340, abstract (https://arxiv.org/abs/2608.18340) [entries 4, 9]
- Aliabadi et al., Conditions for matchability II, arXiv:2309.14664, search snippet (Chowla subspaces conjecture) (https://arxiv.org/abs/2309.14664) [entries 4, 7, 11]
- Hamidoune, On Minkowski product size: the Vosper's property, arXiv:1004.3010, abstract (groups only) (https://arxiv.org/abs/1004.3010) [entries 4]
- Banks–Ramkumar, Varieties of minimal degree in weighted projective space, arXiv:2604.17735, abstract and Kronecker–Weierstrass passage (https://arxiv.org/abs/2604.17735) [entries 4]
- Chau–Kummini, Maximal minors of 1-generic matrices, arXiv:2506.08385, abstract (https://arxiv.org/abs/2506.08385) [entries 4, 11]
- OpenCitations citers of Roy 1992 (17 DOIs, not resolved one by one) and Semantic Scholar citers of Roy 1992 (19 titles): transcendence surveys and Iwasawa theory, no classification [entries 4, 7, 9]
- Grep of the local library missions/diaz/sources: 'scroll', '1-generic', 'Kronecker pencil' hit only Reid; 'Vosper', 'Freiman' hit only the four papers already named by the target [entries 4]
- Maroni/double-cover hits, by snippet: alg-geom/9710015, 1505.04323, 2010.09243, math/0306058, 2604.04709: bundle splitting of covers, no spaces of this kind [entries 4]
- Rational matrix minimal-index hits, by snippet: arXiv:2505.00699, 2601.08522: Kronecker indices only [entries 4]
- D. Roy and M. Waldschmidt, Autour du théorème du sous-groupe algébrique, Canad. Math. Bull. 36 (1993) 358–367 (abstract) (https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/CanadianMathBull36-1993-358--367.pdf) [entries 4]
- M.-S. Li, Four exponentials conjecture of Drinfeld modules (2021), Zbl 1472.11209 (title) [entries 4]
- M. R. Murty and P. Rath, Transcendental Numbers, Springer 2014 (title) [entries 4]
- Lee-Park, On curves lying on a rational normal surface scroll, JPAA 223 (2019): Betti tables of divisors on scrolls (https://arxiv.org/abs/1808.03038) [entries 4]
- Kustin-Polini-Ulrich, Rational normal scrolls and the defining equations of Rees algebras, Crelle 2011 (https://arxiv.org/abs/0812.4963) [entries 4]
- Lara-Marchesi-Vidal Martins, canonical models and scrolls (https://arxiv.org/abs/1502.07556) [entries 4]
- Huizenga, Restrictions of Steiner bundles: multiplication on P^1, generic series (https://arxiv.org/abs/1102.5580) [entries 4]
- On linear versions of some addition theorems: Hopf-type bound only (https://arxiv.org/abs/0802.3523) [entries 4, 9, 13, 16, 19]
- Eisenbud-Schreyer 2024, Hyperelliptic curves and Ulrich sheaves (title only) (https://eisenbud.github.io/papers/pdfs/2024-001.pdf) [entries 4]
- Harris–Roth–Starr, Curves of small degree on cubic threefolds (§6, smooth quartic with pencil on a cubic scroll, class 2D+2F) (https://arxiv.org/abs/math/0202067) [entries 4]
- Alzati–Re, PGL(2) actions on Grassmannians, JPAA 2015 (splitting types, vertex projection) (https://arxiv.org/abs/1405.2753) [entries 4]
- Jung–Moon–Park, On the rank index of projective curves of almost minimal degree (degree r+1 only) (https://arxiv.org/abs/2411.17494) [entries 4]
- Han–Moon–Park et al., On the rank index of some quadratic varieties (https://arxiv.org/abs/2206.08586) [entries 4]
- Han–Park, Secant rank and syzygies of projections of elliptic normal curves, 2026 (https://arxiv.org/abs/2604.02046) [entries 4]
- Determinantal ideals of secant varieties, 2025 (https://arxiv.org/abs/2510.01895) [entries 4]
- Bachoc–Serra–Zémor, Revisiting Kneser's theorem for field extensions (https://arxiv.org/abs/1510.01354) [entries 4]
- Mirandola–Zémor, Critical pairs for the product Singleton bound (https://arxiv.org/abs/1501.06419) [entries 4]
- Márquez-Corbella–Pellikaan, MDS codes with an error-correcting pair (https://arxiv.org/abs/1508.02187) [entries 4]
- Csajbók et al., minimum size linear sets (Prop. on T=⟨1,μ⟩) (https://arxiv.org/abs/2201.02003) [entries 4]
- Alvarenga–Kaur–Moço, Hecke modifications of vector bundles (types over P¹) (https://arxiv.org/abs/2501.03422) [entries 4]
- Alvarenga, On graphs of Hecke operators, Example 5.2 (https://arxiv.org/abs/1709.09243) [entries 4]
- Lorscheid, Graphs of Hecke operators (https://arxiv.org/abs/1012.3513) [entries 4]
- Stevens, Rolling factors deformations (https://arxiv.org/abs/math/0006189) [entries 4]
- Lara–Marchesi–Martins, Curves with canonical models on scrolls (https://arxiv.org/abs/1502.07556) [entries 4]
- Lara–Martins–Souza, On gonality, scrolls and canonical models of non-Gorenstein curves (https://arxiv.org/abs/1803.10899) [entries 4]
- Pflueger, Weierstrass semigroups on Castelnuovo curves (https://arxiv.org/abs/1608.08178) [entries 4]
- Eisenbud–Green–Hulek–Popescu, Small schemes and varieties of minimal degree (https://arxiv.org/abs/math/0404517) [entries 4]
- Schicho–Schreyer–Weimann, Computational aspects of gonal maps (https://arxiv.org/abs/1304.2551) [entries 4]
- Kemeny, The geometric syzygy conjecture in even genus (https://arxiv.org/abs/1907.07553) [entries 4]
- Schenck–Stillman, High rank linear syzygies on low rank quadrics (https://arxiv.org/abs/1012.0933) [entries 4]
- Lecouvey, Plünnecke and Kneser type theorems for dimension estimates: keyword scan, dimension bounds only (https://arxiv.org/abs/1109.0134) [entries 5, 10]
- Kaveh, Khovanskii, Mixed volume and an extension of intersection theory of divisors (MMJ 2010): keyword scan; monomial spaces L_A as motivation only (https://www.math.utoronto.ca/~askold/kaveh-khovanskii-MMJ-2010.pdf) [entries 5]
- Chaudhary, Khandelwal, Sumsets regularity versus Castelnuovo-Mumford regularity for monomial curves (2026-10-16): abstract and keyword scan; regularity, not products (https://arxiv.org/abs/2610.24121) [entries 5]
- Gimenez, González-Sánchez, Castelnuovo-Mumford regularity of projective monomial curves via sumsets: search snippet (https://arxiv.org/abs/2304.10989) [entries 5]
- Waldschmidt, An introduction to the strategy of transcendence proofs (2026-10-29): keyword scan, no Diaz, Fischler or configuration content (https://arxiv.org/abs/2610.39810) [entries 5, 14]
- Losonczy-type matching paper, Matching subspaces in a field extension: keyword scan (https://arxiv.org/abs/1208.2792) [entries 5]
- Cyclic triorthogonal codes in prime dimension (2026-10-06): title and abstract hit only; cyclic-code analogue at most (https://arxiv.org/abs/2610.08012) [entries 5]
- Jindal, Zalar, Operator Fejér-Riesz theorems with gaps and degree bounds (2026-11-02): abstract; unrelated (https://arxiv.org/abs/2611.02967) [entries 5]
- Semantic Scholar citations: Diaz 2007 (1), Fischler 2001 (3), Couvreur-Zémor (1), Eliahou-Kervaire-Lecouvey JNT paper (4). Nothing relevant by title [entries 5, 16]
- zbMATH Open queries: ti:'six exponentials'; sumset & subspaces & field; cc:11J81 py:2026 (first 50 results). Nothing relevant [entries 5, 10, 18]
- Reference lists of BSZ17 and BCZ18, judged by title [entries 5]
- Local-library grep only (geometric progression, sumset, powers of, rank one, hankel, lacunary, k[x], ux^2), own-field files: all of waldschmidt/ (163 files including LN402, ODP, Bourbaki 824), roy/, diaz/ (1989, 1996, 1997, 2004), Laurent 1 [entries 5]
- Prasad, Some questions in Diophantine approximation (arXiv 2505.15744): grep; structural rank only (https://arxiv.org/abs/2505.15744) [entries 5, 6, 11]
- Jensen-Marques, arXiv 0901.1335: off topic (https://arxiv.org/abs/0901.1335) [entries 5]
- Hančl, Transcendental sequences, Math. Slovaca 46 (1996): title page only; off topic [entries 5]
- OpenAlex citers of Diaz 2004, Fischler 2001, Roy 1992 (titles); Diaz 2007 shows zero citers there, and Semantic Scholar shows only Waldschmidt 2005 [entries 5]
- Beck-Lecouvey 2017 and Bachoc-Couvreur-Zémor 2018 appeared in searches: additive-combinatorics side, outside this strategy, titles only [entries 5]
- Eliahou, Lecouvey, On linear versions of some addition theorems (no valuations, no monomials) (https://arxiv.org/abs/0802.3523) [entries 5, 6, 10]
- Lecouvey, Plünnecke and Kneser type theorems for dimension estimates, Combinatorica 34 (2014) (keyword search of the arXiv version) (https://arxiv.org/abs/1109.0134) [entries 5]
- Hou, Leung, Xiang, A generalization of an addition theorem of Kneser, J. Number Theory 2002 (https://doi.org/10.1006/jnth.2002.2793) [entries 5]
- Elias, Sumsets and projective curves, Mediterr. J. Math. 2022 (monomial curve to sumset, Hilbert function only; keyword search) (https://arxiv.org/abs/2202.00590) [entries 5]
- Colarte-Gómez, Elias, Miró-Roig, Sumsets and Veronese varieties (https://arxiv.org/abs/2202.01114) [entries 5]
- Barile, on monomial curves and 2-minors of a 2x3 monomial matrix (entries not linear forms) (https://arxiv.org/abs/math/0511291) [entries 5]
- Deopurkar, Patel, Orbits of linear series on the projective line (keyword search) (https://arxiv.org/abs/2211.16603) [entries 5]
- Zullo, Multi-orbit cyclic subspace codes and linear sets (keyword search) (https://arxiv.org/abs/2112.08781) [entries 5]
- Trautmann, Manganiello, Braun, Rosenthal, Cyclic orbit codes (difference multisets run over all elements of U, not over a monomial basis; keyword search) (https://arxiv.org/abs/1112.1238) [entries 5]
- Gluesing-Luerssen, Morrison, Troha, Cyclic orbit codes and stabilizer subfields (keyword search) (https://arxiv.org/abs/1403.1218) [entries 5]
- Ben-Sasson, Etzion, Gabizon, Raviv, Subspace polynomials and cyclic subspace codes (keyword search) (https://arxiv.org/abs/1404.7739) [entries 5]
- Bodur et al., The Schur product of evaluation codes (exponent Minkowski sum, if-direction only; keyword search) (https://arxiv.org/abs/2505.10068) [entries 5]
- Grundmeier, Lebl, Initial monomial invariants of holomorphic maps (keyword search) (https://arxiv.org/abs/1502.03434) [entries 5]
- Arithmetic circuit lower bounds from sumset expansion (2026; abstract: monomial maps, iterated sumsets, different question) (https://arxiv.org/abs/2607.15848) [entries 5]
- Zannier, Composite rational functions expressible with few terms (title and snippet only) (https://doi.org/10.4171/JEMS/299) [entries 5]
- Borwein, Erdélyi, products of Müntz spaces (search snippet: Remez-type inequalities, no sumset structure) [entries 5]
- de Guzmán, Hefez, On value sets of fractional ideals (search snippet only) (https://arxiv.org/abs/1912.02112) [entries 5]
- Fischler-Nakamaye, Multiplicity estimates and degeneration (2014): title only [entries 6, 13]
- Burungale-Skinner-Wan, arXiv:2603.20886: title only, off topic [entries 6]
- Aslanyan, Modular Existential Closedness, arXiv:2610.35409: title only, off topic [entries 6, 20]
- OpenCitations citers of Roy 1990 (2), Roy 1992 (17), Roy 1995 (9) by title; of Wal00 (162) by title with a keyword and 2025+ filter: no candidate. 35 of the 162 titles did not resolve [entries 6]
- Roy–Waldschmidt, Quadratic relations between logarithms of algebraic numbers, 1995 (keyword scan) (https://zbmath.org/0860.11040) [entries 6]
- Laurent, Rang p-adique d'unités: un point de vue torique, 1990 (title only) (https://zbmath.org/0733.11040) [entries 6]
- Prasad, Some questions on Diophantine approximation, real and p-adics, 2026 (title in zbMATH only) [entries 6, 9, 16]
- Murty–Rath, Transcendental numbers, 2014 (title only) (https://zbmath.org/1297.11001) [entries 6]
- Baker–Wüstholz, Logarithmic forms and Diophantine geometry, 2007 (title only) (https://zbmath.org/1145.11004) [entries 6]
- Last syzygies of 1-generic spaces (https://arxiv.org/abs/math/0307361) [entries 6, 13]
- Generic syzygy schemes (https://arxiv.org/abs/math/0403432) [entries 6]
- Murota's layered mixed matrices, via search results and arXiv:1712.02582 (https://arxiv.org/abs/1712.02582) [entries 6]
- Tsimerman, Ax-Schanuel sketch (https://www.math.utoronto.ca/~jacobt/ASsketch.pdf) [entries 6]
- Rank weights for arbitrary finite field extensions (https://arxiv.org/abs/1902.00733) [entries 6, 19]
- Mirandola–Zémor 2015 (Theorem 1.2 and Remark 2.3 seen; main theorem seen via lines and search snippets) (https://arxiv.org/abs/1501.06419) [entries 7]
- Bachoc–Couvreur–Zémor, Towards a function field version of Freiman's theorem, Algebraic Combinatorics 2018 (intro and K(x) example, S=T only) (https://arxiv.org/abs/1709.00087) [entries 7]
- Couvreur–Zémor, Freiman's 3k−4 theorem for function fields (abstract, intro, S=T) (https://arxiv.org/abs/2408.00183) [entries 7]
- Astore–Borello–Couvreur–Salizzoni, q-analogue of the rational normal curve, arXiv:2606.13246 (abstract) (https://arxiv.org/abs/2606.13246) [entries 7]
- Full Semantic Scholar citation lists: 55 for BSZ17, 9 for BCZ18, 1 for Couvreur–Zémor; top 25 of 50 for Mirandola–Zémor (titles only: Sidon spaces, MDS codes, subspace codes) [entries 7]
- Huhtanen, The product of matrix subspaces, arXiv:1111.7143 (snippet) (https://arxiv.org/abs/1111.7143) [entries 7]
- Massold 2025, Transcendence degrees of fields generated by exponentials of products (abstract) (https://arxiv.org/abs/2506.01123) [entries 7]
- Roy 1990, Matrices dont les coefficients sont des formes lineaires, judged from the zbMATH review Zbl 0712.11042 only (normal form (A B; C 0) for algebraically independent generators; full text inaccessible) [entries 7]
- Momot 2010, Density of rational points on commutative group varieties and small transcendence degree (title) (https://arxiv.org/abs/1011.3368) [entries 7, 11, 12]
- Waldschmidt 1993, Transcendental numbers and functions of several variables (title) [entries 7]
- Semantic Scholar citers of Diaz 2004 and Diaz 2007: Butler, Momot, Waldschmidt surveys only, nothing on the 2x2 classification [entries 7, 14, 15]
- Mirandola, Zémor, Critical pairs for the Product Singleton Bound (arXiv:1501.06419): Reed-Solomon pairs with common evaluation points, an analogue in codes (https://arxiv.org/abs/1501.06419) [entries 7, 11]
- Ishitsuka, Ito, symmetric representations in characteristic two (arXiv:1412.8343): snippet says at most one symmetric class for a conic (https://arxiv.org/abs/1412.8343) [entries 7]
- arXiv:1507.03329, Knörrer periodicity and Bott periodicity: matrix factorisations and Clifford modules background (https://arxiv.org/abs/1507.03329) [entries 7]
- Lavrauw, Sheekey, 2×3×3 tensor classification (arXiv:1411.5910): different format (https://arxiv.org/abs/1411.5910) [entries 7]
- Agostini, Kummer, Park, Ulrich sheaves and determinantal representations for higher secant varieties of curves (arXiv:2607.22247): snippet only (https://arxiv.org/abs/2607.22247) [entries 7]
- D'Aquino, Fornasiero, Terzo (arXiv:1909.10241) on generic points under Schanuel: no link to the conic (https://arxiv.org/abs/1909.10241) [entries 7]
- M. Waldschmidt, Transcendence of periods: the state of the art (2006) and On Ramachandra's contributions (2003): citers of Dia04, Diaz passages only, no such spaces [entries 8, 10, 11, 12]
- S2 citers of Roy92 by title: Dimitrov-Betina 2019, Maksoud 2022, Iwasawa-theory items, Laurent, Roy-Waldschmidt 1997, Roy 1995, Baker-Wüstholz (via zbMATH). None on this question from title. [entries 8]
- zbMATH citers of BSZ 2017 (Zullo; Zhang-Tang; Napolitano-Polverino; Castello-Polverino; Castello): titles only, finite-field Sidon spaces and linear sets, off target [entries 8]
- C. Bertolin, Algebraic independence of the exponential and Weierstrass p-functions, arXiv:2609.15294: title only (https://arxiv.org/abs/2609.15294) [entries 8, 16]
- zbMATH Open title and abstract lists: six exponentials, four exponentials, exponentielles, complex conjugation, conjugaison, logarithms 11J81 from 2005, author Diaz, Schanuel 11J81 from 2005: titles only [entries 8]
- HAL search lists: six/quatre exponentielles, six/four exponentials, strong six exponentials: titles only [entries 8]
- Han, Lee, Moon, Park, Rank 3 quadratic generators of Veronese embeddings (https://arxiv.org/abs/2001.06687) [entries 8, 9, 16]
- Domínguez, Lam, Nonsingular bilinear maps revisited (polynomial multiplication; no classification over algebraically closed fields) (https://arxiv.org/abs/1811.03200) [entries 8]
- Edge, Symbolical algebra and the quadrics containing a rational curve, Proc. Edinburgh Math. Soc. (title and snippet only; classical apolarity approach) (https://www.cambridge.org/core/journals/proceedings-of-the-edinburgh-mathematical-society/article/symbolical-algebra-and-the-quadrics-containing-a-rational-curve/D0696AF376A204DF151CB07C79717629) [entries 8]
- Local keyword grep over DALAG, Open Diophantine Problems, and the Roy and Diaz folders for Vosper, Kneser, Cauchy-Davenport, twisted cubic, rational normal, geometric progression: only Roy 2004 hits, on convex bodies, unrelated [entries 9, 15]
- Butler, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. (title only; OpenCitations citer of Diaz 2004) (https://doi.org/10.1007/s11139-015-9728-2) [entries 9, 15, 20]
- OpenCitations citers of Bachoc-Serra-Zémor, 36 works (DOI list; 16 titles looked up via Crossref, all coding theory, Sidon spaces or linear sets except Wang-Tang above; the rest unchecked) [entries 9]
- Dasgupta, Kakde, Ranks of matrices of logarithms of algebraic numbers II, Adv. Math. (2026) (title only) [entries 9, 11, 13]
- Betina-Dimitrov, arXiv 1907.09422 (abstract: uses Roy's theorem for L-invariants) (https://arxiv.org/abs/1907.09422) [entries 9]
- A shorter proof of Martens' theorem (Hopf lemma usage; no equality classification seen) (https://arxiv.org/abs/1606.03652) [entries 9]
- Hou, On a vector space analogue of Kneser's theorem (2007), zbMATH 1132.12003 [entries 10]
- Butler, A Diophantine approach to the three and four exponentials conjectures (Ramanujan J. 2017), DOI 10.1007/s11139-015-9728-2, citer of Diaz 2004 [entries 10]
- Web search hits on rational quintics on cubic scrolls and on rational functions on the unit circle: background only, nothing on the setup [entries 10, 14]
- Murty and Murty, Transcendental values of class group L-functions I, II (titles in zbMATH) [entries 10, 13, 16]
- Comaschi, Pfaffian representations of cubic threefolds (https://arxiv.org/abs/2005.06593) [entries 10]
- Brodmann, Park, On varieties of almost minimal degree I (https://arxiv.org/abs/0808.0090) [entries 10]
- Fritzsche, Kirstein, Lasarow, An extension of the associated rational functions on the unit circle (para-conjugate, self-reciprocal) (https://arxiv.org/abs/0911.1657) [entries 10]
- Blekherman, Typical real ranks of binary forms (https://arxiv.org/abs/1205.3257) [entries 10]
- Scrolls containing binary curves (https://arxiv.org/abs/1811.09690) [entries 10]
- Sidman, Smith / Buczyński, Ginensky, Landsberg on the Eisenbud-Koh-Stillman conjecture (arXiv:1002.2023, 2510.01895, 0910.2424) [entries 10]
- L. Maksoud, On the rank of Leopoldt's and Gross's regulator maps (cites Roy 1992): title and search excerpt (https://arxiv.org/abs/2201.08203) [entries 11]
- Betina, Dimitrov, Geometry of the eigencurve at CM points and trivial zeros of Katz p-adic L-functions (uses Roy's theorem): abstract (https://arxiv.org/abs/1907.09422) [entries 11]
- Semantic Scholar forward list of Roy 1992 (19 items, latest 2022): titles only; none on this topic [entries 11, 14]
- arXiv:2503.20345, Zeros of E-functions and of exponential polynomials: title only (https://arxiv.org/abs/2503.20345) [entries 11]
- HAL listing for four/six exponentials (9 records, latest 2022, all Waldschmidt apart from one physics record): titles only [entries 11]
- Local n3-lit copies of Eisenbud-Harris 1988, Draisma 2006, Fortin-Reutenauer 2004: titles only; low-rank matrix spaces, analogues at most [entries 11]
- M. Ram Murty, P. Rath, Transcendental Numbers (Springer 2014). zbMATH hit only [entries 11]
- Bachoc-Serra-Zémor, Revisiting Kneser's theorem for field extensions, arXiv:1510.01354 (https://arxiv.org/abs/1510.01354) [entries 11]
- Lee-Park, On curves lying on a rational normal surface scroll, arXiv:1808.03038 (Betti tables only) (https://arxiv.org/abs/1808.03038) [entries 11]
- von Bothmer, Generic syzygy schemes, math/0403432 (https://arxiv.org/abs/math/0403432) [entries 11]
- Aprodu et al., The second syzygy schemes of curves of large degree, arXiv:2409.11855 (https://arxiv.org/abs/2409.11855) [entries 11]
- Kaveh-Khovanskii, Note on the Grothendieck group of subspaces of rational functions, arXiv:1302.2402 (https://arxiv.org/abs/1302.2402) [entries 11]
- E. Ha, A variation of Eichler's proof of the Baker-Campbell-Hausdorff formula, arXiv:2608.05053: title only, unrelated (https://arxiv.org/abs/2608.05053) [entries 12]
- Bustos-Gajardo, Fokkink, Cobham's theorem for the Gaussian integers, arXiv:2510.01440: title only, unrelated (https://arxiv.org/abs/2510.01440) [entries 12]
- De Koninck, Luca, On the index of friability (2025; Zbl 1583.11072): title only, unrelated [entries 12]
- Transcendence of Periods: The State of the Art, PAMQ 2 (2006) (cites Diaz 2004): title only (https://doi.org/10.4310/PAMQ.2006.V2.N2.A3) [entries 12]
- Murty, Rath, Transcendental numbers (2014; Zbl 1297.11001): zbMATH title hit only [entries 12]
- Butler, A Diophantine approach to the three and four exponentials conjectures (2017), zbMATH 1437.03130: title and snippet [entries 12]
- Mirandola-Zémor, Critical pairs for the product Singleton bound (https://arxiv.org/abs/1501.06419) [entries 12, 13]
- Beck-Lecouvey, Additive combinatorics methods in associative algebras (https://cml.centre-mersenne.org/articles/10.5802/cml.34) [entries 12]
- Han-Lee-Moon-Park, Rank 3 quadratic generators of Veronese embeddings (https://arxiv.org/abs/2001.06687) [entries 12]
- Eisenbud-Popescu, Last syzygies of 1-generic spaces (https://arxiv.org/abs/math/0307361) [entries 12]
- Rational-curve and cubic-scroll lemma in Curves of small degree on cubic threefolds (https://arxiv.org/abs/math/0202067) [entries 12]
- Cox et al., Strata of rational space curves (https://ar5iv.arxiv.org/html/1408.2816) [entries 12]
- The Exponential World (https://arxiv.org/abs/2105.05809) [entries 12]
- Tanısalı-Wessel, High dimensional Riemann-Roch spaces in linear spaces with small squares, 6 Sep 2026 (abstract; theorem lines by grep). Squares only, cites BSZ (https://arxiv.org/abs/2609.06822) [entries 13]
- Bachoc-Couvreur-Zémor, Towards a function field version of Freiman's theorem (search summary; squares) (https://arxiv.org/abs/1709.00087) [entries 13]
- Wang-Tang 2024, A generalization of Vosper's theorem (title) (https://doi.org/10.1007/s11401-024-0038-0) [entries 13]
- Aliabadi, Conditions for matchability in groups and field extensions II (title) (https://arxiv.org/abs/2309.14664) [entries 13]
- Sidon space and cyclic subspace code papers citing BSZ, 2020-2026 (titles; coding theory) [entries 13]
- Roy 1992 citers from OpenCitations: Waldschmidt 1996, 2013, 2022; Maksoud 2025; Betina-Dimitrov 2021; Calegari-Mazur 2008; Trans. AMS 10.1090/tran/9131 (titles; Iwasawa theory or surveys) [entries 13]
- arXiv listings after 5 Oct 2026: 'six exponentials' (5 hits in all), 'four exponentials' (16 hits), abstract 'logarithms of algebraic numbers' (first page, 25 of 42): nothing on target. Sakharova 2610.17258 and Kaggwa 2611.01170 are off top [entries 13]
- G. Warner, The Exponential World: abstract only (https://arxiv.org/abs/2105.05809) [entries 13, 17]
- Prasad, Some questions on Diophantine approximation, real and p-adics: zbMATH abstract, not relevant (https://arxiv.org/abs/2505.15744) [entries 13]
- Revisiting Kneser's theorem for field extensions (Bachoc-Serra-Zémor) (https://arxiv.org/abs/1510.01354) [entries 13]
- On the product of vector spaces in a field extension, arXiv:0802.3523 (https://arxiv.org/abs/0802.3523) [entries 13, 14]
- Márquez-Corbella-Pellikaan, A characterization of MDS codes that have an error correcting pair (https://arxiv.org/abs/1508.02187) [entries 13]
- Variety of singular quadrics containing a projective curve (https://arxiv.org/abs/1604.04425) [entries 13]
- Maximal minors of 1-generic matrices have rational singularities (https://arxiv.org/abs/2506.08385) [entries 13]
- Generalizations of self-reciprocal polynomials (https://arxiv.org/abs/1609.07677) [entries 13]
- Submodular functions in additive combinatorics..., arXiv:2210.08845 (abstract; group actions and representations) (https://arxiv.org/abs/2210.08845) [entries 14]
- zbMATH Open: au:Diaz & cc:11J81; 'six exponentials' 2007+; 'four exponentials' 2008+; 'logarithms of algebraic numbers' 2008+ & cc:11J81. Fetched and keyword-searched; only parts of the records seen [entries 14, 19]
- Pattern grep for geometric-progression families across the local Diaz, Roy, Waldschmidt, Dasgupta-Kakde and others folders. Hits outside Diaz 2007 and Bachoc-Serra-Zémor were coincidental, apart from Roy 2004's points in geometric progressi [entries 14]
- Beck, Lecouvey, Additive combinatorics methods in associative algebras, Confluentes Math. 9 (2017), arXiv:1504.02287 (keyword scan: no Vosper or Riemann-Roch statement) (https://arxiv.org/abs/1504.02287) [entries 14]
- On the product of vector spaces in a commutative field extension, arXiv:0802.4186 (keyword scan: nothing relevant) (https://arxiv.org/abs/0802.4186) [entries 14]
- Galois subspaces for the rational normal curve, arXiv:1809.02635 (title and snippet only) (https://arxiv.org/abs/1809.02635) [entries 14]
- Haykazyan-Kirby, Existentially closed exponential fields, Israel J. Math. 2021; abstract only, no Baker-type closure (https://arxiv.org/abs/1812.08271) [entries 15]
- Kirby-Macintyre-Onshuus, The algebraic numbers definable in various exponential fields, JIMJ 2012; summary only (https://arxiv.org/abs/1101.4224) [entries 15]
- Viale, Forcing the truth of a weak form of Schanuel's conjecture, Confluentes Math. 8 (2016); abstract only, not a barrier (https://www.numdam.org/articles/10.5802/cml.33) [entries 15]
- Aslanyan et al., Independence relations for exponential fields (2023); Algebraic types in Zilber's exponential field (2025); D'Aquino et al., A weak version of the strong exponential closure (2021); Macintyre, Turing meets Schanuel (2016) ( [entries 15]
- Krapp, Schanuel's Conjecture and Exponential Fields, dissertation (appeared in search only) (http://www.math.uni-konstanz.de/~krapp/research/Schanuels_Conjecture_and_Exponential_Fields.pdf) [entries 15]
- M. Viale, Forcing the truth of a weak form of Schanuel's conjecture (Newton preprint NI15087) (https://api.newton.ac.uk/website/v0/events/preprints/NI15087) [entries 15, 20]
- Pila-type four exponentials paper, Publ. Math. Debrecen 2008 (Schneider's method, conjectural non-example) (https://publi.math.unideb.hu/paper/1328/download/10_5486_PMD_2008_4212.pdf) [entries 15]
- arXiv 2611.01711, Irrationality measures for Gamma(1/4) and Gamma(1/3) (title only; post-5 October citer of Roy-Waldschmidt 1997) (https://arxiv.org/abs/2611.01711) [entries 16, 18, 19]
- Waldschmidt, Transcendance de périodes: état des connaissances, arXiv math/0502582 (abstract) (https://arxiv.org/abs/math/0502582) [entries 16, 20]
- Semantic Scholar and OpenCitations citer lists of Brownawell 1974, Diaz 2004, Diaz 2007, Roy-Waldschmidt 1995 and 1997 (titles only) [entries 16, 17]
- Local keyword search (conjugation, purely imaginary, trdeg one): Waldschmidt 1971, Waldschmidt 1973, LN402 chapters 6 and 7, Laurent 1991, Roy 1992, Roy 1995, Fischler 2001, Waldschmidt 2005 Variations and Further variations, Waldschmidt Fo [entries 16]
- Full local Diaz sources tree (pattern search for π² plus a square, exp(1/π), rational modulus): no statement of the pair; only a height bound in DALAG and exp(1/π) in Diaz 2007 [entries 17]
- Semantic Scholar citers of Roy-Waldschmidt 1997 (25 titles), including Irrationality measures for Γ(1/4) and Γ(1/3) (2026-11-01, title only, apparently unrelated; its abstract lookup did not complete) (https://arxiv.org/abs/2611.01711) [entries 17]
- Semantic Scholar citers of Roy-Waldschmidt 1995 (9 titles) and Diaz 2007 (1 title): nothing after 2017 on this topic [entries 17]
- Laurent-Roy 1999 and 2001, Philippon 1997, Diaz 1997, Butler 2017 (titles in the citer lists only; bodies not read) [entries 17]
- zbMATH review Zbl 0860.11040 (https://zbmath.org/897674) [entries 17]
- Calegari-Mazur, Nearly ordinary Galois deformations, Conj. 3.9, weak Schanuel in logarithmic form (search summary only) (https://arxiv.org/pdf/0708.2451) [entries 17]
- Q. Tang, li2-half-irrationality: README, NOTICE, Challenge.lean only. Lean repository, out of scope as a find; opened to confirm the printed reports. Not built, proof not read. (https://github.com/dtq1997/li2-half-irrationality) [entries 18]
- S.-Q. Liu, Li2Rational: README only. Lean repository, same caveat. States Li_2(1/k) irrational for k >= 2 and Li_2(-1/k) for k >= 1. (https://github.com/siqiliu-tsinghua/Li2Rational) [entries 18]
- Forward citations of Brownawell 1974 (Semantic Scholar, 24 listed; titles only), including Roy 1995 Acta, Diaz 1997, Nesterenko-type 'On the numbers e^e...' 1998, Tubbs 1987, Waldschmidt 1979, Bhagwat-type 'A Diophantine approach to the thr [entries 18]
- Web search snippets: arXiv:2509.07598, arXiv:2506.10206, arXiv:2608.23792, arXiv:2603.00836, MathWorld on zeta(5), Waldschmidt talk notes; none relevant to the dichotomy [entries 18]
- Local library grep for 1/pi, exp(pi^2), (log 2)^2, Li_2, algebraically dependent with log 2: Diaz 1989, Diaz 1996 AFST, Diaz 1997, Diaz 2004, Laurent 1991, Roy-Waldschmidt 1995, Waldschmidt 2005 (three papers), MahdiaPeriodes, Transcendence [entries 18]
- LN402 Chapter 5 (pointer to Brownawell, Gel'fond's method); LN402 bibliography [entries 18]
- A. A. Shmelev, The algebraic independence of certain transcendental numbers, Mat. Zametki 3 (1968), 51-58 (abstract from search listing) (https://geodesic.mathdoc.fr/item/MZM_1968_3_1_a6) [entries 18]
- G. V. Chudnovskii, Algebraic independence of some values of the exponential function, Mat. Zametki 15 (1974) (index record only) (https://portal.mardi4nfdi.de/wiki/Item:Q1212967) [entries 18]
- Rhin-Viola, The permutation group method for the dilogarithm (zbMATH summary) (https://eudml.org/doc/84565) [entries 18]
- Brownawell, Algebraic independence of certain exponential functions, Canad. J. Math. 28 (1976) (title and snippet) (https://cambridge.org/core/journals/canadian-journal-of-mathematics/article/algebraic-independence-of-certain-exponential-functions/1250D3A9560C412092E1DD588C4B5FBF) [entries 18]
- An abelian analogue of Schanuel's conjecture and applications, arXiv:1811.05167 (title only) (https://arxiv.org/abs/1811.05167) [entries 19, 20]
- Delaygue, A Lindemann-Weierstrass theorem (arXiv:2210.12046); keyword check, no hits (https://arxiv.org/abs/2210.12046) [entries 19]
- arXiv:1004.1668, Some transcendental functions with an empty exceptional set; keyword check, no hits (https://arxiv.org/abs/1004.1668) [entries 19]
- Fischler, Pondicherry 2000 notes; keyword check, no hits (https://www.imo.universite-paris-saclay.fr/~stephane.fischler/inde/inde_fischlerpondichery.pdf) [entries 19]
- Kirby-Zilber line, Fields with pseudo-exponentiation (Zilber) (https://arxiv.org/pdf/math/0012023) [entries 19]
- J. Kirby, A Schanuel property for exponentially transcendental powers, arXiv:0810.4457 (keyword search found nothing) (https://arxiv.org/abs/0810.4457) [entries 20]
- Pila, conjecture equivalent to Schanuel plus multiplicative Zilber-Pink, Rend. Lincei 36 (2025): zbMATH summary (https://doi.org/10.4171/rlm/1086) [entries 20]
- zbMATH Open, any:Schanuel py:2024-2026, 100 records: indexed search for modulus, conjugate, kernel and Diaz returned nothing relevant [entries 20]
- zbMATH Open, any:'weak Schanuel': returned Kirby 2010 and others [entries 20]
- Waldschmidt, On Schanuel's Conjecture, elliptic and quasi-elliptic functions (January 2025), and arXiv:2504.14041: keyword search found nothing [entries 20]
- Marques and Sondow, Schanuel's conjecture and algebraic powers, arXiv:1010.6216; Cheng et al., Some consequences of Schanuel's Conjecture, arXiv:0804.3550: keyword search for Diaz, conjugation and kernel found nothing [entries 20]
- Keyword scan of the local Diaz library (135 text files; Roy, Waldschmidt, Diaz 1989/1997, Laurent, Fischler and others) for weak Schanuel, Kirby, π² with log², modulus of a logarithm, 2πiQ [entries 20]
- Karimov et al., Algorithmic Applications of Schanuel's Conjecture (keyword scan, no relevant hits) (https://people.mpi-sws.org/~mvahanwa/publications/schanuel-survey.pdf) [entries 20]
- Local library, about 135 text files in missions/diaz/sources, including Roy, Waldschmidt, Diaz 1997/2007 and Brownawell 1974: grep only, for weak Schanuel, Kirby, Schanuel near kernel, conjugation or modulus, rational multiple of π, and mul [entries 20]

</details>

<details><summary>Inaccessible, worth getting through a library (104)</summary>

- J. Harris, Algebraic Geometry: A First Course, Springer 1992 [entries 1] Why: Paywalled book, not opened. It is the likely textbook home of the twisted-cubic projection fact and is cited by both Fischler 2001 [4] and Roy 1995 [11], but no
- J.B. Little, The many lives of the twisted cubic, Amer. Math. Monthly 126 (2019) 579-592 (https://mathcs.holycross.edu/~little/TwistedMonthly.pdf) [entries 1] Why: The author's host timed out on all three attempts, so projection content is unread; not a paywall
- G.-J. Wang, G.-Z. Wang, The rational cubic Bézier representation of conics, CAGD 9 (1992) 447-455 [entries 1] Why: Publisher paywall; only a review text was seen
- J. Sánchez-Reyes, Conics in rational cubic Bézier form made simple, CAGD 108 (2024) 102266 [entries 1] Why: Publisher paywall; the AMiner page gave no content; abstract and keywords (which include base point) were seen only through search extracts
- zbMATH cited-by lists for Diaz 2007 and Diaz 2004 [entries 1] Why: The zbmath.org web query returned HTTP 403 and the API query with rf: returned 404; direct Python access failed TLS verification, which I did not bypass. So the
- Fang, A rational quartic Bézier representation for conics (uni-lj.si copy) [entries 1] Why: Direct download failed TLS verification; the indexed fetch returned the raw PDF stream only, so it is unread
- Semantic Scholar and OpenAlex, partly [entries 1, 5, 8, 9, 10, 11, 14, 15, 16, 18, 19] Why: HTTP 429 rate limits late in the run blocked some lookups and retries, including the BSZ17 arXiv-id citer list and later title searches
- K. K. Kubota, Pythagorean triples in unique factorization domains, Amer. Math. Monthly 79 (1972), 503-505 [entries 1] Why: Paywalled (JSTOR); seen only through citations and Farouki-Sakkalis snippets
- D. Eisenbud, The Geometry of Syzygies, 2005, Prop. 6.10 (cited by Park-Sim) [entries 1, 4, 7, 8] Why: Paywalled; not opened
- Dolgachev, Classical Algebraic Geometry [entries 1, 7] Why: Author-page PDF URLs failed (DNS error and 404); third-party uploads not used
- Hirschfeld 1985, Semple-Roth, Semple-Kneebone, Maxwell (archive.org lending copies) [entries 1] Why: Lending only; per-book search returned 403, so only public full-text-search snippets were seen
- Sturmfels, Algorithms in Invariant Theory [entries 1] Why: Not reached in the time used; not opened
- zbMATH Open API [entries 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19] Why: TLS certificate failure from Python and HTTP 400 through the fetch tool; not worked around, so no zbMATH search was done
- D. Roy, Sur la conjecture de Schanuel pour les logarithmes de nombres algebriques, Groupe d'etude sur les problemes diophantiens 1988/89, Publ. Math. Univ. Paris VI 90 [entries 1, 5, 6, 7, 13, 15] Why: No online copy found by search. This is the most useful unread item, because of its Proposition 2 as cited by Fischler.
- D. Roy, Matrices dont les coefficients sont des formes lineaires, Sem. Theorie des Nombres Paris 1987-88, Progr. Math. 81 (1990), 273-281 (title from memory; the local reference lists show only the pages) [entries 1, 2, 5, 6, 7, 13, 15] Why: Publisher volume, assumed paywalled; not attempted.
- G. Diaz, Transcendance et independance algebrique: liens entre les points de vue elliptique et modulaire, Ramanujan J. (2000) (https://doi.org/10.1023/a:1009879120323) [entries 1, 8] Why: Assumed paywalled from the publisher; title seen only, not attempted.
- Harris, Algebraic Geometry: A First Course; Semple-Roth; Baker, Principles of Geometry [entries 1] Why: Paywalled print books. These likely hold the classical statement, but nothing about them is verified here.
- Hirschfeld, Finite Projective Spaces of Three Dimensions, ch. 21; Bruen-Hirschfeld 1978 [entries 1] Why: Paywalled
- Ellingsrud-Piene-Strømme, nets of quadrics defining twisted cubics [entries 1] Why: Paywalled, not opened
- Freire, UFPB thesis on nets of quadrics containing twisted cubics (https://repositorio.ufpb.br/jspui/handle/tede/9275) [entries 1] Why: TLS certificate verification failed from the sandbox
- A compactification of the space of twisted cubics, Math. Scand. (https://tidsskrift.dk/math/article/view/14387) [entries 1] Why: TLS failure in Python, HTTP 404 through the fetch tool; title seen only
- On the Twisted Cubic of PG(3,q), J. Algebraic Combin. 18 (https://emis.univie.ac.at/journals/JACO/Volume18_3/q743n443u3306828.html) [entries 1] Why: HTTP 503
- Little, TwistedMonthly.pdf (Holy Cross) (https://mathcs.holycross.edu/~little/TwistedMonthly.pdf) [entries 1] Why: Timed out
- OpenAlex cites filter (forward citations of BSZ17, Diaz 2004, Diaz 2007) [entries 2, 3, 12, 19, 20] Why: HTTP 429 on every attempt during the run; metadata lookups worked. It reports 47 citers of BSZ17, against 36 on zbMATH and on OpenCitations, so up to about 11 w
- arXiv API (export.arxiv.org) [entries 2, 3, 4, 7, 8, 9, 10, 11, 12, 14, 15, 19] Why: HTTP 429; the arxiv.org search pages worked intermittently and were used instead, so recent listings cover only the six queries that ran.
- Classical textbooks on the Desargues involution (Semple-Kneebone, Veblen-Young, Todd, Coxeter) [entries 2] Why: Not opened: no open copy located in the time box, and no paywalls were tried. They probably hold the classical core of the (c) correspondence.
- Printed LNCS 1423 version of Elkies (https://doi.org/10.1007/BFb0054850) [entries 2] Why: Not opened; I read the arXiv version only, and that DOI and the printed page range are from memory and were not verified.
- Forward citations of Diaz 2004 [entries 2, 4, 11] Why: The DOI I guessed resolved to an unrelated paper, so its citations were not traced.
- Hyeon, Lee, Stability of tri-canonical curves of genus two, Math. Ann. 337 (2007) 479-488 (10.1007/s00208-006-0046-2) [entries 2] Why: Publisher copy, not opened as paywalled; no arXiv version found. Could describe the singular tricanonical curves, including two-nodal rational ones, so it is th
- Bolza, On binary sextics with linear transformations into themselves (1887) (zbMATH JFM 19.0119.04) [entries 2] Why: Only the index record seen; I did not try to open a full copy.
- Di Gennaro, On curves on rational normal scrolls (2001) (Zbl 1083.14053) [entries 2] Why: Title only from zbMATH; not opened.
- MathSciNet citation lists (MR2394892) (https://mathscinet.ams.org/mathscinet-getitem?mr=2394892) [entries 3] Why: Subscription service, not attempted
- OpenCitations for Diaz 2007 (https://api.opencitations.net/index/v2/citations/doi:10.5802/jtnb.592) [entries 3] Why: Reachable, but returned an empty list, which gives no information
- OpenAlex search and forward-citation lists [entries 3, 4, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19] Why: HTTP 429 on search; a single DOI lookup worked and gave cited_by_count 0 for Diaz 2007, which is clearly incomplete.
- MathSciNet and Google Scholar forward citations of Diaz 2004 and 2007 [entries 3] Why: MathSciNet needs a login; Google Scholar was not used.
- Murty-Rath, Transcendental Numbers (Springer, 2014) (zbMATH 1297.11001) [entries 3, 5] Why: Paywalled book, title only.
- Citation lists for Diaz 2004 and Diaz 2007 (10.5802/jtnb.459, 10.5802/jtnb.592) [entries 3, 13] Why: OpenAlex and Semantic Scholar returned 429 throughout. Semantic Scholar answered once for Diaz 2007 with one citing paper (Waldschmidt 2008); it failed for Diaz
- Iarrobino, Ancestor ideals of vector spaces of forms, and level algebras, J. Algebra (2004) [entries 3] Why: Located only through the Cox-Iarrobino bibliography reference [I2]; web search did not surface it and it was not opened. Most likely source for the dual (W^⊥) l
- Eisenbud, Linear sections of determinantal varieties; Eisenbud-Koh-Stillman, Determinantal equations for curves of high degree; Schreyer and von Bothmer on scrollar syzygies [entries 3, 4] Why: Not opened in the time box. Known to me from memory as general theory of 1-generic matrices and scrollar syzygies, with no reason to expect a classification of 
- Eisenbud–Harris, On varieties of minimal degree (a centennial account), Proc. Sympos. Pure Math. 46 (1987) (10.1090/pspum/046.1/927946) [entries 4] Why: The AMS URL I tried did not return a readable PDF, and no open copy surfaced. The target's flagged weak point therefore stays unchecked by this search.
- Wang–Tang, A generalization of Vosper's theorem, Chin. Ann. Math. Ser. B 45 (2024) (10.1007/s11401-024-0038-0) [entries 4] Why: Paywalled. Keywords are sumsets and Kemperman, which suggests the additive setting, but I could not confirm this from the text.
- 'Linear analogue of additive theorems' (2017, Semantic Scholar record citing BSZ17) [entries 4] Why: Could not resolve author or text; the lookup was rate-limited.
- D. Roy, Matrices dont les coefficients sont des formes linéaires, Sém. Théorie des Nombres Paris 1987–88, Progr. Math. 81 (1990) 273–281 (https://doi.org/10.1007/978-1-4612-3460-9_13) [entries 4, 6, 10, 12, 13] Why: Springer paywall. Only the zbMATH review was read: it concerns the dimension bound for V ∩ L^d, nothing on function-field spaces.
- D. Eisenbud and J. Harris, On varieties of minimal degree (a centennial account), Proc. Symp. Pure Math. 46 (1987) 3–13 [entries 4, 8, 9, 12] Why: One web search found no free copy. It is the target's stated weak point but lies outside this own-field strategy, so it remains unread here.
- F.-O. Schreyer, Syzygies of canonical curves and special linear series, Math. Ann. 275 (1986), 105-138 [entries 4] Why: Only a bibliographic record found; no open PDF. Known to treat canonical curves, so unlikely to bear on the target.
- E. Park, Projective curves of degree=codimension+2, Math. Z. 256 (2007); Lee–Park part II, IJAC 2016 [entries 4, 10] Why: Paywalled; no preprint found. These are the most promising unread sources for line-projection centres
- Eisenbud–Koh–Stillman, Determinantal equations for curves of high degree, Amer. J. Math. 1988; Eisenbud, Linear sections of determinantal varieties, 1988 [entries 4] Why: Paywalled, seen only through citing papers
- Schreyer, Syzygies of canonical curves and special linear series, Math. Ann. 1986; Green, Koszul cohomology, JDG 1984; Ehbauer 1994 [entries 4] Why: Not openly found; known only through citations
- Catanese, Pluricanonical Gorenstein curves, 1982; Kustin–Polini–Ulrich, Rational normal scrolls and Rees algebras, 2011 [entries 4] Why: Not opened: Catanese not openly found, Kustin–Polini–Ulrich seen only through Cox–Iarrobino
- D. Roy, Sur la conjecture de Schanuel pour les logarithmes de nombres algébriques, Publ. Math. Univ. Paris VI 90 (1989) [entries 5, 13] Why: No open copy found; a seminar publication. Proposition 2 is known here only through Fischler's remark and is worth checking in print.
- D. Mirandola, On products of linear error correcting codes (thesis, Leiden, 2017) (https://scholarlypublications.universiteitleiden.nl/access/item%3A2949236/view) [entries 5] Why: The repository link returned no usable PDF text.
- Eliahou, Kervaire, Lecouvey, On the product of vector spaces in a commutative field extension (JNT, 2009) (https://doi.org/10.1016/j.jnt.2008.06.004) [entries 5] Why: Publisher page not opened; judged from title and citation context only.
- C. Castello, Algebraic and geometric perspectives on Sidon spaces and cyclic subspace codes (2026 thesis) (https://iris.unicampania.it/handle/11591/582704) [entries 5] Why: A search summary reported the repository record has an abstract but no file. I did not open the record myself. The thesis is the most likely place for a monomia
- Gelbord-Meshulam, Spaces of p-vectors of bounded rank, Israel J. Math. (2001), which cites Roy 1995 (https://doi.org/10.1007/BF02784151) [entries 6] Why: Not opened; web search did not give the abstract or a full text. Volume number conflicts across citations (121 vs 126).
- Roy's Ottawa publications page (https://mysite.science.uottawa.ca/droy/publications.html) [entries 6] Why: HTTP 404
- Semantic Scholar citations of Diaz 2004, Diaz 2007, Waldschmidt 2005 and Roy–Waldschmidt 1995 [entries 7, 14] Why: HTTP 429 on title lookup. Its DOI lookup for Roy 1995 also returned an unrelated paper's citers. Diaz 2004 and Roy 1995 were covered through OpenCitations inste
- Vinnikov, Complete description of determinantal representations of smooth irreducible curves, Linear Algebra Appl. 125 (1989), 103-140 (Ishitsuka's Example 6.3 points to it) (https://www.sciencedirect.com/science/article/pii/0024379589900344) [entries 7] Why: ScienceDirect returned HTTP 403 to the fetch
- Buchweitz, Eisenbud, Herzog, Cohen-Macaulay modules on quadrics, LNM 1273 (1987). The Clifford-module route (isotropic ternary form, even Clifford algebra M2(K)) should give the same uniqueness [entries 7] Why: Paywalled; the route was not checked against the primary source
- Published J. Ramanujan Math. Soc. text of Ishitsuka 2017 [entries 7] Why: Not opened; the journal reference comes from a Kyushu University faculty listing, and the numbering comes from arXiv
- BSZ 2017, published version in Math. Proc. Camb. Philos. Soc. (https://doi.org/10.1017/S0305004116000888) [entries 8] Why: Publisher copy not opened, so theorem numbers come from arXiv v2.
- M. Green, Koszul cohomology and the geometry of projective varieties, J. Differential Geom. 19 (1984) [entries 8] Why: Not opened in the time used; statement read through Kim-Moon-Park
- Mumford, Varieties defined by quadratic equations (1970), Theorem 6 [entries 9] Why: Not opened; known only as quoted in Bachoc-Couvreur-Zémor Theorem 6.1.
- Citing works of Diaz 2007 (https://doi.org/10.5802/jtnb.592) [entries 9] Why: OpenCitations lists 0 citers and Crossref a count of 0, so forward citations of the most relevant paper are effectively unchecked. Citers I could list are for D
- zbMATH 'cited by' for Diaz 2004/2007, Waldschmidt 2008, BCZ, BSZ [entries 10] Why: rf: search returned 404 in the API and 403 in the HTML interface, so zbMATH forward citations were not obtained
- Citers of Waldschmidt's role-of-conjugation paper [entries 10] Why: Semantic Scholar returned HTTP 429, so this list was not obtained.
- W. Lee, E. Park, Projective curves of degree=codimension+2 II, IJAC 26 (2016) (https://scholar.korea.ac.kr/handle/2021.sw.korea/89678) [entries 10] Why: Paywalled; abstract record only
- J. A. Todd, 1944, and W. L. Edge, 1986, on the geometry of the binary quintic (https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/geometry-of-the-binary-quintic-form/6DC0E0B49A8BC35F74CB32F5ADD77B6C) [entries 10] Why: Paywalled at Cambridge; classical projection to P⁴ not read
- OpenAlex forward citations of Roy 1992 and of the Waldschmidt papers; date-filtered OpenAlex searches [entries 11] Why: HTTP 429 on repeated tries. Only the counts came through: Dia07 cited_by 0, Roy 1992 cited_by 21
- Semantic Scholar forward citations of Waldschmidt 2005 [entries 11] Why: HTTP 429
- Google Scholar-style full-text citation search [entries 11] Why: No free API; web search returned only Dia07's own pages for its quoted title
- Citing-work list from OpenAlex for Dia07 and Dia04 (https://api.openalex.org/works/doi:10.5802/jtnb.592) [entries 11] Why: HTTP 429 on every cites query, so citation tracing rests on zbMATH, OpenCitations and Semantic Scholar. OpenAlex reports 0 citers for Dia07 and 9 for Dia04; the
- L. Butler, Ramanujan J. 42 (2017), full text (10.1007/s11139-015-9728-2) [entries 11] Why: Publisher copy not opened; no arXiv version found. Abstract only.
- Eisenbud-Harris, The Practice of Algebraic Curves; Eisenbud, The Geometry of Syzygies; Harris, Curves in Projective Space [entries 11] Why: Books not opened here; I saw only a zbMATH review of the first. Any scroll exercises in them are unchecked
- Further web searches [entries 12, 17] Why: The shared WebSearch budget for this turn ran out, so the last planned query, on 'strong six exponentials' citing Diaz 2007, was not run. A follow-up message co
- Forward-citation lists from zbMATH, and arXiv API listings [entries 12] Why: zbmath.org front end returned 403 and the arXiv API returned 429 throughout, so arXiv was covered only through WebSearch restricted to arxiv.org. The zbMATH API
- Forward citations of Dia04 (Semantic Scholar, OpenAlex) [entries 13] Why: HTTP 429 on every attempt. Dia04 forward citations were not obtained, apart from what the Roy 1992 citer list shows.
- M. R. Murty, P. Rath, Transcendental Numbers, Springer 2014, chapter on six exponentials (https://mast.queensu.ca/~murty/tbook.pdf) [entries 13, 16, 19] Why: The PDF on Murty's page downloaded but pdftotext failed; not read.
- K. Ramachandra, Contributions to the theory of transcendental numbers I, Acta Arith. 14 (1968) [entries 13] Why: Not opened. Waldschmidt credits it with the real-part and imaginary-part idea, an analogue for (b) at best.
- Forward citations of Dia07, Dia04 and Roy 1992 [entries 13] Why: OpenAlex and Semantic Scholar returned HTTP 429 throughout. Semantic Scholar answered once for Dia07, with one citing paper (Waldschmidt, role of conjugation). 
- OpenAlex forward citations (filter=cites) for Diaz 2007, Roy 1992 and others [entries 14, 16] Why: Every filter or search call returned HTTP 429 throughout the run; only single-record lookups worked
- Author copy of the same paper on the Bordeaux site (https://www.math.u-bordeaux.fr/~cbachocb/articles/Vosper.pdf) [entries 14] Why: Download failed on an SSL certificate error; I did not bypass verification.
- Forward citations of Roy-Waldschmidt 1997 and of Roy 2002 beyond 2022 (10.1016/S0012-9593(97)89938-1) [entries 15] Why: OpenCitations has no usable record: zero citers for this DOI, and the DOI I tried for Roy 2002 (10.1006/jnth.2001.2757) also returned none. No zbMATH citation-g
- core.ac.uk copy of Kirby 2013 (https://core.ac.uk/download/77029254.pdf) [entries 15] Why: HTTP 403; the arXiv version was read instead
- arXiv API listing for math.NT, abstracts mentioning four exponentials, after 5 October 2026 [entries 16] Why: HTTP 429. An earlier quoted-phrase query returned irrelevant results. The post-5-October check therefore rests on Crossref title searches, Semantic Scholar cite
- Fel'dman, Nesterenko, Number Theory IV: Transcendental Numbers (1998) [entries 16] Why: Paywalled book; not opened
- Nesterenko, Philippon (eds), Introduction to Algebraic Independence Theory, LNM 1752 (2001) [entries 16] Why: Only chapter 14 is available locally; the other chapters were not opened
- Tijdeman 1971 (Indag.); Waldschmidt 1970 (Solution d'un problème de Schneider, Zbl 0206.05703) [entries 16] Why: Early proofs of the same trdeg-one theorem; not located in open access in this run
- Nesterenko-Philippon (eds), Introduction to Algebraic Independence Theory, LNM 1752, Ch. 13; Tubbs, Algebraic groups and small transcendence degree I, II, J. Number Theory [entries 16] Why: Not opened; publisher versions not attempted. Not expected to treat conjugation, but unverified.
- DALAG on the publisher site (https://doi.org/10.1007/978-3-662-11569-5) [entries 17] Why: Paywalled; the local library copy was read instead
- A. Fauzan, zeta(5) is irrational, Zenodo preprint (https://doi.org/10.5281/zenodo.22826419) [entries 18] Why: Not opened; the Zenodo API returned 403 from this environment. It is the method's source and is not about Li_2.
- Discussion thread named in Tang's README (https://chaoli.club/index.php/12296) [entries 18] Why: Not opened: a forum, not printed literature.
- W. D. Brownawell, Some transcendence results for the exponential function; The algebraic independence of certain values of the exponential function, K. Norske Vidensk. Selsk. Skr. (1972) [entries 18] Why: Not opened in this time box; no free copy located. These are likely earlier printings of the same family of statements.
- Tijdeman, On the algebraic independence of certain numbers, Indag. Math. 33 (1971), 146–162 [entries 18] Why: Not opened in the time used; no open copy found by the search.
- Brownawell, Gel'fond's method for algebraic independence, Trans. AMS (1975), and the 1971 announcements cited in LN 402 [entries 18] Why: Not opened; could hold the two-logarithm form earlier than LN 402.
- Python urllib calls to zbMATH API [entries 18] Why: TLS certificate failure in the sandbox; one zbMATH query went through the fetch tool instead, so the zbMATH coverage is thin.
- M. Waldschmidt 1990 (cited in the local survey for the strong six exponentials corollary) and C. Bertolin, Périodes de 1-motifs et transcendance (J. Number Theory 2002) [entries 19] Why: Not opened: not found in the local library listing I saw, and the search budget ended before I could look for them.
- UFPB repository item 20501, surfaced by a search on Diaz-type conjectures (https://repositorio.ufpb.br/jspui/handle/123456789/20501) [entries 19] Why: The server returned HTTP 500, so the content was never seen.
- Diaz, Transcendance et indépendance algébrique: liens entre les points de vue elliptique et modulaire (cited as [Di2] in ODP) [entries 19] Why: Not opened in this run; it concerns the modular setting and is unlikely to be relevant.
- Later web searches, including Habsieger's text and post-2010 papers [entries 19] Why: The session's shared WebSearch budget ran out after five of my queries, and I did not work around it. The user can continue with a follow-up or raise the limit.
- zbMATH citing-works query for Zbl 1071.11046 [entries 20] Why: the rf: query returned HTTP 404 through the fetch tool; the direct API call failed certificate verification and I did not bypass it
- D. Roy, summer school 2008 lecture 5 PDF (https://mysite.science.uottawa.ca/droy/summer-school-2008/droy_lecture5.pdf) [entries 20] Why: HTTP 404
- Viale full text via Numdam (https://www.numdam.org/articles/10.5802/cml.33) [entries 20] Why: the URL served a page rather than a PDF, so no text was extracted; the abstract was enough to judge it off target
- All external index and web search (WebSearch, OpenAlex) [entries 20] Why: The session's WebSearch budget was exhausted on my first calls (shared limit of 200). The tool notice said to continue with what was already gathered and not to
- D'Aquino, Macintyre, Terzo; Terzo; Kirby-Macintyre-Onshuus (papers on consequences of Schanuel in exponential fields, named from memory) [entries 20] Why: Not opened. I had no verified links and could not search for them. Two arXiv ids I tried from memory, 1510.03241 and 1109.1283, turned out to be unrelated physi

</details>

## Method

The search ran as a multi-agent workflow of Claude agents: 62 searchers and 76 verifiers, 138 in all. Reported use was about 17M tokens; the part of entries 6–13 that ran before a pause isn't counted, so the true figure is higher.

- **Searchers.** Three per entry, working independently: own field, translation into other fields, and citations forward and backward. Entry 1 and entry 4 had one extra agent each (classical geometry; scrolls and one-generic matrices). Searches used web search and free indexes, including in French.
- **Verifiers.** Every lead claiming same, implies, special case or generalization went to a fresh verifier, who saw only the target statement, the citation and the location. A source it couldn't open never counted as verified.
- **Independence.** A find had to exclude this repository, its blueprint site, Prove2Me pages and anything citing or copying them. Work ran under the rule that no agent was to open the local folder of external projects.

Departures from the brief:

- Agents returned everything as structured output, and a script wrote the files, since the harness can refuse subagent report writes.
- Quotes are capped at 15 words per source, tighter than the brief's two sentences.
- The brief names `tex/diaz-modulus.tex` as the companion note. The attributions are in `tex/diaz_prove2me.tex` and `tex/diaz-theorem-c.tex`, so I de-duplicated against all of `tex/`.
- After the pilot, the brief to agents was tightened: "implies" must reach the part not found, Wikipedia counts as screened only, and translation searchers got the quadric dictionary from Theorem B. Entry 1 ran before that, so it has a Wikipedia verification, which isn't used.
- A usage limit stopped 20 agents during entries 14–20; they were re-run and all finished. Entries 6–13 were stopped once for a pause and resumed. No result was lost.

## What was not checked

- **Derivations.** Apart from the four algebra checks above, verifiers' derivations have had no independent referee. This matters most for entries 1, 6, 8, 9, 14.
- **Journal versions.** Bachoc–Serra–Zémor numbering is from arXiv v2. Park and Park–Sim locations are from arXiv, with journal data from Crossref.
- **Paywalled and print-only sources**, listed above. A "not found" says only that these sources didn't turn it up: an older paper or a thesis could still have any of them.
- **Depth on the ten `not found` entries.** Each had three searchers. That is a real attempt, and it isn't exhaustive.
- **The Lean developments on Li₂.** Read, not built.
- **Forward effects.** I didn't trace what a re-ranking of Theorem B would change in the blueprint's chapter 14 graph.
