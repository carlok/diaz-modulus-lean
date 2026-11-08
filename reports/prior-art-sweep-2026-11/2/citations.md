# Entry 2, strategy: citations

## Target, as restated by the searcher

Work over the algebraic numbers Q̄, with u in C transcendental, and h = p(u)/q(u) for coprime p, q in Q̄[X], non-constant, and c ≠ 0. Let A = span(1, u, 1/u) and B = c·span(1, h, h², h³), and suppose W = A + B has dimension 5, so dim(A∩B) = 2. Claims: (b) max(deg p, deg q) = [Q̄(u):Q̄(h)] ≤ 2. (a) If this index is 1 (h Möbius), W contains u², u⁻² or some 1/(u−b) with b ≠ 0. If it is 2, W is an involution space. (c) Index 2 gives a normal form: q1 = p and q2 = q span the base-point-free pencil of binary quadratics vanishing on the orbits of a Möbius involution of the u-line, and W = A + span(q1^i q2^(3−i)/(u l1 l2), i = 0..3), with l1, l2 non-zero members of the pencil. (d) If uū is algebraic, every such W holds a 2×3 configuration (2- and 3-dimensional independent families with all products in W), but no Q̄ + Q̄u + Q̄ū + Q̄w with w in W outside H₀ holds one. The progression itself is a hypothesis, not part of the target.

## Leads

### Lead 1: special case

- **Citation:** N. D. Elkies, Shimura curve computations, Algorithmic Number Theory (ANTS-III), LNCS 1423 (1998), 1-47; arXiv:math/0005160v1
- **Location:** Appendix 'Involutions of P1', p. 44 of the arXiv version
- **Quote:** unique involution of P1 switching the roots of Q1 and also of Q2
- **Link:** https://arxiv.org/abs/math/0005160
- **Relation:** Covers only the correspondence in the parenthesis of (c), through a translation of my own. Coprime q1, q2 of degree ≤ 2, one of degree exactly 2, means the homogenised forms have no common zero, which is Elkies's hypothesis. He gets the involution by moving to XY or Y² under PGL2. My added step: h∘σ has the divisor of h, so h∘σ = κh with κ² = 1, and κ = 1 follows at a fixed point of σ, so every pencil member vanishes on σ-orbits. It does NOT give the normal form of W (the denominator u l1 l2), nor (a), (b) or (d).

### Lead 2: special case

- **Citation:** N. P. Nguyen, Projective line revisited, J. Geom. Graph. 25 (2021), no. 2, 187-195; arXiv:1804.00639v7
- **Location:** Section 3, Proposition 1
- **Quote:** natural bijection between involutions of a projective line and regular pencils of bilinear forms
- **Link:** https://arxiv.org/abs/1804.00639
- **Relation:** Same coverage as the Elkies appendix: only the involution-pencil correspondence in (c), over any field of characteristic ≠ 2. Reading 'regular' as 'no common zero' is my translation: a degenerate line in the space of binary quadratics is tangent to the discriminant conic, so its forms share a root. Nothing about W, the index bound or configurations.

### Lead 3: analogue only

- **Citation:** C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's theorem, Algebr. Comb. 1 (2018), no. 4, 501-521; arXiv:1709.00087
- **Location:** Theorem 8.1 and Proposition 8.2 (Section 8)
- **Quote:** S has a basis of one of the following two types
- **Link:** https://arxiv.org/abs/1709.00087
- **Relation:** A normal-form classification of subspaces of a rational function field, and the proof of Prop. 8.2 uses Laurent polynomial spaces L((n−1)P+Q), the family containing 1, t, 1/t. But the hypothesis is on dim S², with S of genus 0 and combinatorial genus 1. W is not assumed to be a square, and no statement about A + B or a ratio h appears. No derivation reaches the target.

### Lead 4: analogue only

- **Citation:** M. Wessel, On Freiman's theorem in a function field setting, arXiv:2405.10724v1 (2024)
- **Location:** Lemma 2.1 and its proof (Section 2)
- **Quote:** The first statement follows directly from Lüroth's Theorem
- **Link:** https://arxiv.org/abs/2405.10724
- **Relation:** Uses Lüroth on subfields K(S_i) of a rational function field, but only to get genus 0. No degree formula and no index bound on a ratio. It shows the same tool in the same area, not (b).

### Lead 5: analogue only

- **Citation:** G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, J. Théor. Nombres Bordeaux 19 (2007), 373-391
- **Location:** Théorème 7(2) and Corollaire 5(4); checked in pdftotext, formulas garbled by OCR
- **Quote:** {v, vu, vu², vu³} ⊄ L̃ (formula as read from a garbled text layer)
- **Link:** https://doi.org/10.5802/jtnb.592
- **Relation:** The transcendence-side counterpart: a four-term progression of ratio u is excluded from ℒ̃ via the strong six exponentials theorem, and Cor. 5(4) excludes 1/λ and 1/(λ+α) together. These explain why 1/(u−b) and progressions matter, but they say nothing about the dimension-5 linear algebra, ratios in Q̄(u) or involution spaces.

### Lead 6: analogue only

- **Citation:** V. Di Gennaro, A. Rapagnetta, P. Sabatino, The genus of a curve on Calabi-Yau threefolds, arXiv:2610.25065v2 (Oct-Nov 2026)
- **Location:** Section 2, items (v)-(vii), and Step 2 of a later proof
- **Quote:** U V = (ab) · Span(1, f, f², f³, f⁴)
- **Link:** https://arxiv.org/abs/2610.25065
- **Relation:** The only mathematically related citer of BSZ17 I found after 5 October 2026. It applies BSZ17 Theorem 33 plus Hopf to multiplication spaces on a curve, concluding that the linear system gives a rational normal curve. This only supplies a progression, which the target takes as a hypothesis. No fixed space 1, u, 1/u, no index bound, no involution.

## Notes

**Result: no find for (a), (b), (d), or the W normal form in (c).** The only printed statements that reach the target at all cover the classical involution-pencil correspondence behind (c). Everything else is an analogue. Run time was about 20 minutes (10:41 start, last clock check 10:58 CET, a few calls after that).

**Citation trail**
- *Backward from BSZ17.* The reference list is additive combinatorics, association schemes and coding, with no source on 1, u, 1/u or on ratios in a rational function field. Its Lemma 4 is the progression step, and Theorem 33 is the version over algebraically closed fields. Neither goes past the progression, which the target assumes.
- *Forward from BSZ17.* zbMATH gives 36 citers and OpenCitations 36. About 25 are on Sidon spaces and cyclic subspace codes over finite fields. The function-field line is BCZ18, Wessel 2024, Couvreur-Zémor 2024 and Tanisali-Wessel (Sept 2026). All of these concern dim S² and Riemann-Roch containment, with no fixed space and no sum A + B.
- *Forward from Diaz 2004, Diaz 2007 and Waldschmidt 2005.* Citers are few: Diaz 2007 itself, Butler 2017, Waldschmidt 2023, Betina-Maksoud-Pozzi 2026. None treats the linear algebra of H₀ extensions. Semantic Scholar returned no citers of Diaz 2007, and OpenCitations none.

**After 5 October 2026**
- Di Gennaro-Rapagnetta-Sabatino, arXiv:2610.25065, cites BSZ17 Theorem 33 and uses Hopf and Vosper for a 5-dimensional UV on a curve, ending in a rational normal curve. It is an honest citer but only a progression-supplying use.
- Pańkowski (2610.41600) and Neroli (2610.10469) use six exponentials only.
- Cano et al. (2611.00456) is unrelated.
- zbMATH showed nothing later that is relevant. Coverage is limited by the rate limits listed under inaccessible.

**Part (c).** The correspondence between base-point-free pencils of binary quadratics and Möbius involutions is printed: Elkies's appendix and Nguyen's Prop. 1, and surely older textbooks that I did not open. If (c) means only that correspondence, its "not found" should be softened. If (c) means the form of W, with denominator u·l1·l2, I found nothing. From the blueprint statements I read it as the latter, but target.md does not settle this, so someone with the proof should decide. The step from swapping roots to vanishing on orbits (κ = 1) is my own short check, not in those sources.

**Own observation, not a literature find.** (b) has a very short proof, so its "not routine" rating may deserve a second look.
1. dim A = 3 and dim B = 4, so dim W = 5 forces dim(A∩B) = 2.
2. Take independent f1, f2 in A∩B. Then f1/f2 lies in Q̄(h), is non-constant, and has degree ≤ 2 in u, since both have the form (quadratic in u)/u.
3. The tower law gives [Q̄(u):Q̄(h)] ≤ 2.

This does not make (a) or (d) routine. It suggests (b) is likely to be unprinted because it is too small to state, not because it is hard. I did not attempt to re-derive (a) or (d).

**Could not settle**
- Whether classical sources (Salmon, Semple-Kneebone) contain a form of W: unlikely, but unchecked.
- Up to about 11 further BSZ17 citers that OpenAlex counts but zbMATH and OpenCitations do not list; Semantic Scholar was filtered to 2025 onward, so any older ones were not seen by title.
- No Lean repository or excluded source was consulted. Elkies, Nguyen and Di Gennaro et al. were read from arXiv PDFs in temporary folders, since deleted.

## Read

- Bachoc, Serra, Zémor, An analogue of Vosper's theorem for extension fields (2017), local copy — https://arxiv.org/abs/1501.00602: Lemma 4 and proof, Sidon example in Section 5, the infinite-extension section opening with Theorem 33, open questions, full reference list
- Bachoc, Couvreur, Zémor 2018, local copy — https://arxiv.org/abs/1709.00087: Section 2 (motivating examples), Theorem 8.1, Proposition 8.2 and start of its proof; grep for Lüroth, pencil, involution (no hits)
- Wessel 2024, local copy — https://arxiv.org/abs/2405.10724: Lemma 2.1 and proof; grep for involution and pencil (no hits)
- Diaz 2007, local copy — https://doi.org/10.5802/jtnb.592: Théorème 7 and proof, Corollaire 5 statement; grep for matrices and families
- Elkies, Shimura curve computations — https://arxiv.org/abs/math/0005160: Appendix 'Involutions of P1', the part on two quadratics without common zero
- Nguyen, Projective line revisited — https://arxiv.org/abs/1804.00639: Section 3 through Proposition 1 and its proof
- Di Gennaro, Rapagnetta, Sabatino 2026 — https://arxiv.org/abs/2610.25065: Outline, Section 2 items (iv)-(vii), the dim UV = 5 step
- Tanisali, Wessel, High dimensional Riemann-Roch spaces in linear spaces with small squares (Sept 2026) — https://arxiv.org/abs/2609.06822: Abstract, start of introduction; grep for Lüroth, pencil, involution, geometric progression, Vosper (only a mention of Vosper and the BSZ17 citation)

## Screened only

- Couvreur, Zémor, Freiman's 3k-4 theorem for function fields (2024): theorem list and grep only; no pencil or involution, Lüroth not used in the target's sense — https://arxiv.org/abs/2408.00183
- Aliabadi et al., Extremal Chowla sets and their linear analogues (2026): abstract and BSZ citation context — https://arxiv.org/abs/2607.24847
- Wang, Tang, A generalization of Vosper's theorem, Chin. Ann. Math. B 45 (2024) — https://doi.org/10.1007/s11401-024-0038-0
- Beck, Lecouvey, Additive combinatorics methods in associative algebras, Confluentes Math. 9 (2017) — https://doi.org/10.5802/cml.34
- Mirandola, Zémor, Critical pairs for the product Singleton bound, IEEE Trans. IT (2015) — https://doi.org/10.1109/tit.2015.2450207
- Randriambololona, The quadratic hull of a code (2021) — https://arxiv.org/abs/1912.06627
- Lin, Zémor, Kneser's theorem for codes and ℓ-divisible set families, Finite Fields Appl. 111 (2026) — https://arxiv.org/abs/2504.19304
- Bachoc, Serra, Zémor, Revisiting Kneser's theorem for field extensions, Combinatorica 38 (2018) — https://arxiv.org/abs/1510.01354
- About 25 Sidon-space and cyclic subspace code papers citing BSZ17 (Zhang-Tang-Cao, Castello-Polverino-Zullo, Feng-Wang, Niu-Yue-Wu, Roth-Raviv-Tamo line etc.), by title from zbMATH and OpenCitations; finite-field coding, not relevant
- Cano, Gusevskii, López-Flores, Spectral fields and unitary descent (30 Oct 2026): abstract only, unrelated — https://arxiv.org/abs/2611.00456
- Pańkowski, Joint universality of the Riemann zeta-function (30 Oct 2026): abstract only, uses six exponentials only — https://arxiv.org/abs/2610.41600
- Neroli, Iterated graph systems II (7 Oct 2026): abstract only, unrelated — https://arxiv.org/abs/2610.10469
- Abdesselam, Chipalkatti, Quadratic involutions on binary forms: abstract; involutions on d-ics, no pencil statement of this kind — https://arxiv.org/abs/1008.3117
- Milnor, Remarks on quadratic rational maps: grep for involution; no deck-involution statement located in the arXiv text — https://arxiv.org/abs/math/9209221
- Reis, Invariant rational functions, linear fractional transformations and irreducible polynomials over finite fields: snippet only — https://arxiv.org/abs/2105.11247
- Ollivier, Sadik, A simple and constructive proof to a generalization of Lüroth's theorem, Turk. J. Math. 46 (2022): title only — https://arxiv.org/abs/2201.11733
- Butler, A Diophantine approach to the three and four exponentials conjectures (2017): title, citer of Diaz 2004 — https://doi.org/10.1007/s11139-015-9728-2
- Waldschmidt, The four exponentials problem and Schanuel's conjecture (2023): title, citer of Waldschmidt 2005 — https://doi.org/10.1007/978-3-031-12244-6_39
- Betina, Maksoud, Pozzi, The eigencurve at crystalline points (2026): title, citer of Waldschmidt 2005 — https://arxiv.org/abs/2502.00876
- Local library grep for involution, Möbius, homographie: only unrelated hits (Reid, Draisma, Waldschmidt adtn, ztq2003, Roy small value estimates)

## Inaccessible

- OpenAlex cites filter (forward citations of BSZ17, Diaz 2004, Diaz 2007): HTTP 429 on every attempt during the run; metadata lookups worked. It reports 47 citers of BSZ17, against 36 on zbMATH and on OpenCitations, so up to about 11 were not seen by title from those two; Semantic Scholar was only filtered to 2025 onward for BSZ17.
- arXiv API (export.arxiv.org): HTTP 429; the arxiv.org search pages worked intermittently and were used instead, so recent listings cover only the six queries that ran.
- Classical textbooks on the Desargues involution (Semple-Kneebone, Veblen-Young, Todd, Coxeter): Not opened: no open copy located in the time box, and no paywalls were tried. They probably hold the classical core of the (c) correspondence.
- Printed LNCS 1423 version of Elkies — https://doi.org/10.1007/BFb0054850: Not opened; I read the arXiv version only, and that DOI and the printed page range are from memory and were not verified.

## Queries

- zbMATH rf:6797071 (citers of BSZ17), rf:6963902 (citers of BCZ18), rf:5302780, rf:2188530, rf:5679659, rf:5054470, rf:2226145, rf:6914192
- zbMATH ti:Vosper; ab:Vosper & py:2020-2026; ti:Freiman & ti:"function field"; ti:Lüroth & py:2010-2026; ti:"logarithms of algebraic numbers" & py:2020-2026; ti:"Möbius involution"; ti:"six exponentials"; ti:"four exponentials"
- OpenCitations citations of 10.1017/S0305004117000044, 10.5802/jtnb.592, 10.5802/jtnb.459, 10.5802/alco.19, 10.1007/s11139-015-9728-2, 10.1007/978-3-031-12244-6_39, 10.1109/tit.2015.2450207, 10.5802/cml.34
- Semantic Scholar citations of arXiv:1501.00602, DOI:10.5802/jtnb.592, DOI:10.5802/jtnb.459, arXiv:1709.00087, arXiv:2408.00183, arXiv:2405.10724, DOI:10.1007/s00493-016-3529-0
- arXiv search, newest first: Vosper; "six exponentials" OR "four exponentials"; "six exponentials"; "four exponentials"; Freiman "function field"; transcendence "complex conjugation"; Vosper "field extension"; "Schanuel" "logarithms" modulus
- Web: Vosper theorem extension fields product of subspaces geometric progression
- Web: Diaz conjecture logarithms modulus algebraic e^u point of circle 2x3 rank one Möbius involution
- Web: "Vosper" OR "Freiman" linear analogue function field 2026
- Web: transcendence absolute value of logarithm of algebraic number conjecture 2026 Diaz
- Web: every involution of the projective line pencil of binary quadratic forms g^1_2 Desargues normal form
- Web: subspaces of K(u) containing 1, u, 1/u dimension five geometric progression Lüroth classification
- Web: Couvreur Zémor Freiman function field Riemann-Roch citing 2025 2026
- Web: transcendence algebraic modulus logarithm u ū six exponentials 2025 2026
- Web: Milnor quadratic rational maps involution f∘I = f
- Web: involution on P^1 pencil binary forms degree 2 g^1_2 Dolgachev apolar
- Web (extended): linear span in K(t) containing 1, t, 1/t and c, ch, ch², ch³ with ratio of degree at most two; quadratic rational function pencil involution
