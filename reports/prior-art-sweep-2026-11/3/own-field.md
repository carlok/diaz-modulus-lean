# Entry 3, strategy: own-field

## Target, as restated by the searcher

Setting: u is non-algebraic with uū algebraic, s² = uū with s algebraic, and v = u/s, so v̄ = 1/v. Everything then lies in the field Q̄(v), with the involution v ↦ 1/v that conjugates coefficients. Take z, a Laurent polynomial in v with algebraic coefficients (equivalently, a polynomial in u and ū), and form its conjugation hull W = Q̄ + Q̄u + Q̄ū + Q̄z + Q̄z̄. The question: when does W contain all products x_i y_j, with x_1, x_2 Q̄-independent and y_1, y_2, y_3 Q̄-independent?

The part not found is the "only if" classification. This holds exactly when dim W = 5 and W lies in one of three classes:
- (P): W contains a nonzero Q̄-combination of u² and u³.
- (Q): an explicit involution family built from v̄² + ev² and βv̄³ + ζv² + ev³, with |e| = |β| = 1 and ζ = −βe²ζ̄.
- (R): real pencil spaces, spanned by H₀ together with g and ḡ, where g = G(v) + κ·conj(vG(v)), |κ| = 1, G(0) = 0, deg G ≥ 2.

If some exponent of z has absolute value ≥ 4, only (R) survives. For z ≡ Aū³ + Bū² + Cu² + Du³ modulo H₀, with N = |A|² − |D|² and Δ = AC̄ − BD̄, the criterion is NΔ(|Δ|² − |u|²N²) = 0. The configurations themselves are printed and do not count. What is sought is the shape list, the two-sided pinch and the pencil analysis, or any printed statement that implies the classification.

## Leads

### Lead 1: analogue only

- **Citation:** S. Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, Acta Arith. 100 (2001), no. 2
- **Location:** §6, Lemma 6.1 and Theorem 6.2, pp. 184-185
- **Quote:** in geometric progression with transcendental ratio. Then q ≤ 3.
- **Link:** https://www.impan.pl/shop/publication/transaction/download/product/82899?download.pdf
- **Relation:** Elements of L̃ in geometric progression with transcendental ratio number at most 3; Theorem 6.2 restricts k-th powers of linear forms with coefficients in L̃. The lemma is an earlier print of Dia07 Th. 7(2), with extra hypotheses (nonzero terms, transcendental ratio). It gives the (P)-type exclusion only: no conjugation, no hull, no converse. It does not reach the classification. Worth noting only as an earlier source for the configuration.

### Lead 2: analogue only

- **Citation:** M. Waldschmidt, Variations on the six exponentials theorem, in Algebra and Number Theory (Hyderabad 2003), Hindustan Book Agency, 2005, 338-355
- **Location:** Corollary 2.13, pp. 346-347
- **Quote:** using the complex conjugation à la Diaz we can reduce from 4 to 2
- **Link:** https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Hyderabad.pdf
- **Relation:** Conjugation doubles the columns of a 2×3 matrix into a 2×5 one, excluding determinants from L̃. This is a sufficient condition using conjugation stability, with a hypothesis that some entries lie in R ∪ iR. It has no space W, no list of shapes and no converse.

### Lead 3: analogue only

- **Citation:** G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, J. Théor. Nombres Bordeaux 19 (2007), 373-391
- **Location:** Théorème 6(1), p. 389 (not among the printed results the target names)
- **Quote:** (1, u, ū) Q̄-liée. Alors : {v, vu, vu²} ⊄ L̃
- **Link:** https://www.numdam.org/item/JTNB_2007__19_2_373_0/
- **Relation:** This is a further family of exclusions, for the case where 1, u, ū are dependent, so H₀ has dimension at most 2. The target's hull has dim H₀ = 3, a different regime. Diaz offers these as sufficient conditions, says explicitly that they do not claim to be the only ones, and proves no necessity. It does not reach the part not found.

## Notes

**Result: no lead reaches the part not found.** Within transcendence and linear forms in logarithms, I found no printed classification, shape list, necessity statement or criterion like NΔ(|Δ|² − |u|²N²) = 0. The three leads returned are analogues and are labelled as such. Nothing here should cost a verifier much: none of them is claimed to imply the target.

**Time used.** About 12 minutes of the 30-minute box (10:41 to 10:53 by `date`). I stopped because own-field searches were returning the same documents, not because time ran out.

**What each main source does relative to the target**

- **Diaz 2004 and 2007.** All the statements are one-way: apply Roy's strong six exponentials theorem to a chosen pair of families and read off an exclusion. Diaz 2007 §2.3 presents the sufficient conditions as not claiming to be the only ones, and calls Th. 7 "deux exemples" of neighbouring families. His §2.4 says that within the strong six exponentials framework one cannot hope to go very far. No hull is defined and no converse is asked. There is no question of which spaces carry a configuration. Th. 6(1) is the only thing here not on the target's nearby list, and it covers the regime where 1, u, ū are dependent, so it does not bear on the hull.
- **Waldschmidt, DION and Hyderabad papers.** These survey Diaz and add Cor. 2.13 (conjugation doubling on a 2×3 matrix), which is again one-way. DALAG Conj. 11.17 and Exercise 15.16 state the modulus question and give nothing structural.
- **Fischler 2001.** The closest in spirit, because it has a real structural conclusion: Lemma 6.1 limits geometric progressions in L̃, and Theorem 6.2 describes k-th powers of linear forms with L̃ coefficients. It concerns a different variety, with no conjugation. Lemma 6.1 is a slightly earlier print, with extra hypotheses, of the fact in Dia07 Th. 7(2). The target's source line for class (P) could mention it, but that is a remark on the "if" half only.
- **Roy 1992 and 1995.** These are the engine (Cor. 2) and the conjectural framework (rank-one matrices with entries in L̃, Q̄-rational subspaces on varieties). Roy's framework says when rank-one points should not exist. It does not classify which hulls contain a rank-one pattern.
- **Momot 2011.** Develops Diaz's conjugation idea through Weil restriction, but the corollaries concern elliptic functions, group varieties and specific transcendence statements, not polynomial hulls. I judged this from corollary titles and the Diaz passages, not a full read.
- **Dasgupta, Dasgupta-Kakde.** Structural rank and the matrix coefficient conjecture. Analogue at most, judged from abstract and excerpts.

**Why own-field silence is plausible.** Once v̄ = 1/v, the classification is pure linear algebra in Q̄(v) with an involution: no transcendence input is needed. Transcendence authors would need it only if they wanted to know the limit of the Roy-plus-conjugation method, and I found no one posing that question. This is my inference, not a statement from any source. If the "only if" half has a printed counterpart, it more likely lies outside this strategy's field: products of subspaces in function fields (the [BSZ17] family), or spaces of low-rank matrices and rational curves on Segre varieties. I did not search those, as they belong to other strategies.

**Forward-citation evidence is thin and incomplete**

- Crossref counts: Diaz 2007 has 0, Diaz 2004 has 2.
- OpenCitations: Diaz 2004 is cited by Diaz 2007 and Butler.
- Semantic Scholar: Diaz 2007 is cited by Waldschmidt's survey.
- OpenAlex reports 0 for Diaz 2007.

Momot visibly cites Diaz 2004 yet is not in those lists, so these counts undercount. Forward lists from zbMATH and MathSciNet were not obtained. A post-2007 paper citing Diaz could therefore have been missed if it also escapes web search and zbMATH keyword queries. The zbMATH keyword queries did work and returned no such paper. The zbMATH Diaz listing shows no Diaz paper on this topic after 2007.

**Not settled**

- Date-sorted arXiv listings were unavailable (HTTP 429), so a recent arXiv preprint could be missed.
- Waldschmidt's "Further variations" was judged only through its Theorem 1.2 as quoted in the DION survey, since the local text layer is unreadable.
- Roy's 1987-88 Paris seminar paper was seen only as a search excerpt.

**Text-layer caveat.** Overlines are lost in the Diaz 2007 text layer and the Diaz 2004 layer is badly garbled. Quotes and statements I rely on were reconstructed against the surrounding proofs, not checked against page images. The Diaz 2007 quote restores the overlines and tildes, so it should be checked against the page if it is reused. None of this affects the no-lead conclusion.

No repository, blueprint, Lean source or page citing them was used as a find.

## Read

- Diaz 2007, JTNB 19, 373-391 (local copy) — https://www.numdam.org/item/JTNB_2007__19_2_373_0/: Th. 4-7 and proofs, Cor. 4-5, examples, §2.4 bilan and references. Cor. 1-3 by statement lines only.
- Diaz 2004, JTNB 16, 535-553 (local copy; poor text layer) — https://www.numdam.org/item/JTNB_2004__16_3_535_0: Th. 2 and 3 with proofs, §5.1 C(|u|), §5.2 C(u1,u2), Th. 6 statement
- Waldschmidt, The role of complex conjugation in transcendental number theory (DION 2005), local copy — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf: §§4-6: Th. 4.1, Cor. 4.2, Th. 5.1, Conj. 5.2, Th. 6.1, 6.2, Cor. 6.3
- Waldschmidt, Variations on the six exponentials theorem (2005), local copy — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Hyderabad.pdf: §1 end, §2: Th. 2.1, Cor. 2.2-2.7, 2.13, 2.14
- Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (2000), local copy: Conj. 11.17 with Diaz's remark, Exercises 11.10 and 15.16; exercise headings 11.1-11.11 only
- Fischler 2001, Acta Arith. 100 (local copy) — https://www.impan.pl/shop/publication/transaction/download/product/82899?download.pdf: Introduction, Th. 2.3, §6 opening: Lemma 6.1, Th. 6.2, Cor. 6.3 and start of the proof
- Roy 1992, Matrices whose coefficients are linear forms in logarithms, JNT 41, 22-47 (local copy): §4 Cor. 1 and Cor. 2 with proofs
- Roy 1995, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, Acta Math. 175 (local copy): §2 passage on skew-symmetric 4×4 matrices and the four exponentials conjecture only
- Habsieger, A few remarks related to the four exponentials conjecture, Publ. Math. Debrecen 70 (2007), 179-194 — https://publi.math.unideb.hu/paper/1156/download/10_5486_PMD_2007_3505.pdf: Abstract and introduction, keyword check for conjugation and logarithms
- Momot, Density of rational points on commutative group varieties and small transcendence degree, arXiv:1011.3368 — https://arxiv.org/pdf/1011.3368: Abstract, §1.2 passages on Diaz, list of §7 corollaries by title. The only post-2007 work found that develops Diaz's conjugation idea, through Weil restriction.

## Screened only

- Waldschmidt, Further variations on the six exponentials theorem, Hardy-Ramanujan J. 28 (2005). Judged from its Theorem 1.2 as quoted in the DION survey and from the zbMATH listing; the local text layer is unreadable and I did not read page images. — https://hal.science/hal-00411308
- Waldschmidt, The Four Exponentials Problem and Schanuel's Conjecture (2023 survey): keyword check, no mention of Diaz or conjugation — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf
- Waldschmidt, On Ramachandra's contributions to transcendental number theory (2013): passage citing Diaz only — https://hal.science/hal-01112588
- Waldschmidt, Six exponentials theorem, irrationality (2021/2022, French and English): keyword check for conjugation, no hits — https://hal.science/hal-03664120
- Warner, The Exponential World, arXiv:2105.05809: expository, reproduces the strong six exponentials and Diaz's four-exponentials case — https://arxiv.org/pdf/2105.05809
- Butler, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. (2015 online): title and citation record only — https://doi.org/10.1007/s11139-015-9728-2
- Dasgupta, Ranks of matrices of logarithms I, arXiv:2303.02037, and Dasgupta-Kakde II, arXiv:2408.08178: structural rank and matrix coefficient conjectures, from abstract and search excerpts — https://arxiv.org/pdf/2303.02037
- Ferreira-Ribas, Arithmetic properties of arguments of algebraic numbers on the unit circle, arXiv:2602.23597: abstract only; arguments of unit-circle algebraic numbers, no products of subspaces — https://arxiv.org/pdf/2602.23597
- Roy-Waldschmidt 1997, Ann. Sci. ENS 30: Th. 0.1 and 0.2 from the local README and search excerpt; rank and quadrics in transcendence degree one, no configuration lists
- Roy, Matrices dont les coefficients sont des formes linéaires (Sém. Théorie des Nombres Paris 1987-88): search excerpt only — https://link.springer.com/content/pdf/10.1007%2F978-1-4612-3460-9_13.pdf
- Roy, Summer school 2008 lecture 5: title only — https://mysite.science.uottawa.ca/droy/summer-school-2008/droy_lecture5.pdf
- Kühne, Logarithms of algebraic numbers, JTNB 27 (2015): title and search excerpt — https://www.numdam.org/item/JTNB_2015__27_2_499_0
- Murty-Murty, Transcendental values of class group L-functions I, II (2011, 2012), and Waldschmidt, From highly composite numbers to transcendental number theory (2013): titles from zbMATH hits for the exponentials queries
- Li, Four exponentials conjecture of Drinfeld modules (2021): title from zbMATH
- zbMATH list for Guy Diaz (20 documents): no Diaz paper in the 2004-or-later listing beyond 2004 and 2007

## Inaccessible

- arXiv API listing for six and four exponentials and related phrases: HTTP 429 on every attempt, including after waits. arXiv coverage therefore comes from web search restricted to arxiv.org, and date-sorted listings were not seen.
- OpenAlex search and forward-citation lists: HTTP 429 on search; a single DOI lookup worked and gave cited_by_count 0 for Diaz 2007, which is clearly incomplete.
- zbMATH cited-by search (rf: queries): The API returned 404 for rf: queries and the web interface returned 403, so zbMATH forward citations were not obtained.
- MathSciNet and Google Scholar forward citations of Diaz 2004 and 2007: MathSciNet needs a login; Google Scholar was not used.
- Murty-Rath, Transcendental Numbers (Springer, 2014) — zbMATH 1297.11001: Paywalled book, title only.

## Queries

- Diaz "conjugaison complexe" transcendance exponentielle module logarithme produits combinaisons linéaires de logarithmes
- linear combination of logarithms algebraic modulus complex conjugation strong six exponentials polynomial in u and conjugate transcendence |u| algebraic e^u algebraic
- subspace of complex numbers containing products of 2-dimensional and 3-dimensional subspaces over algebraic numbers, matrices with entries linear combinations of logarithms rank one transcendence
- Diaz conjecture module logarithme nombre algébrique "strong four exponentials" complex conjugation modulus of logarithm partial result
- "six exponentials" "complex conjugation" new results transcendence products of logarithms arXiv Diaz Waldschmidt generalization 2015..2026
- "logarithmes de nombres algébriques" module carré produit conjugué "exponentielles" conjecture résultats partiels transcendance thèse
- algebraic independence Roy structural rank matrix logarithms vector space K-subspace multiplication two-dimensional three-dimensional x_i y_j space of dimension 5 strong six exponentials corollary classification
- "strong six exponentials" theorem application "complex conjugate" products of linear forms in logarithms 2010..2026 Murty Gun Rath Marques
- transcendence of the modulus of a logarithm, Diaz conjecture |u| algebraic implies e^u transcendental, polynomial in u and ū, not a linear combination of logarithms (extended)
- "Diaz curve" OR "courbe de Diaz" e^{2 i pi z} |z|=1 transcendence results four exponentials
- matrices dont les coefficients sont des combinaisons linéaires de logarithmes rang transcendance conjugaison sous-espace stable produit de sous-espaces
- which numbers are provably not in Q-bar-span of 1 and logarithms: squares and cubes of a logarithm, {u,u^2,u^3} not all in L-tilde
- strong four exponentials conjecture special cases new theorem logarithms algebraic numbers (arxiv.org only)
- transcendance exponentielle "six exponentielles" conjugaison complexe nouveaux résultats module (numdam, centre-mersenne, HAL, EuDML only)
- "six exponentials" OR "four exponentials" rank of matrix logarithms "stable under complex conjugation" vector space classification configurations (extended)
- "A few remarks related to the four exponentials conjecture"
- espace vectoriel 1, u, ū module algébrique exp(u) algébrique Diaz "C(|u|)" résultats partiels polynôme en u
- Hermite-Lindemann refinement algebraic absolute value e^u transcendental conjecture Diaz recent progress algebraic modulus
- zbMATH API: ai:diaz.guy; "six exponentials"; "four exponentials"; "strong four exponentials"; "six exponentielles"; "quatre exponentielles"; "complex conjugation" & cc:11J81; "conjugaison complexe" & cc:11J81; "matrices of logarithms"; "logarithms of algebraic numbers" & "rank" & cc:11J81; Schanuel & logarithms & conjugat*
- HAL API: "six exponentielles"; "quatre exponentielles"; "six exponentials"; "four exponentials"; "strong six exponentials"; "strong four exponentials"; "logarithmes de nombres algébriques" conjugaison; transcendance "produits de logarithmes"
- Crossref and OpenCitations forward citations of 10.5802/jtnb.592 and 10.5802/jtnb.459; Semantic Scholar citations of 10.5802/jtnb.592
