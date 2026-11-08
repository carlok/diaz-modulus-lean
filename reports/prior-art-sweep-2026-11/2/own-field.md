# Entry 2, strategy: own-field

## Target, as restated by the searcher

Work over Q̄ with u in C transcendental. Let H = span(1, u, 1/u), let h = p(u)/q(u) be a non-constant rational function with p, q coprime, let c ≠ 0, and let P = c·span(1, h, h², h³). Suppose W = H + P has dimension 5, so that H ∩ P has dimension 2.

(a) Then W contains u², u⁻² or some 1/(u−b) with b ≠ 0, or W is an involution space. An involution space is the span of 1, u, 1/u and q1^i q2^(3−i)/(u l1 l2) for i = 0..3, where q1, q2 are coprime of degree at most 2, one of degree exactly 2, and l1, l2 are non-zero members of the pencil Q̄q1 + Q̄q2.

(b) The index [Q̄(u):Q̄(h)] = max(deg p, deg q) is at most 2, by the degree formula.

(c) The pencil Q̄q1 + Q̄q2 is the pencil of quadratics vanishing on the orbits of a Möbius involution of the u-line, and it has the normal form above.

(d) If uū is algebraic, every involution space contains a 2×3 configuration, meaning independent x1, x2 and independent y1, y2, y3 with all products in W. No Q̄ + Q̄u + Q̄ū + Q̄w with w in W outside H₀ contains such a configuration.

The nearby [BSZ17, Lemma 4] and the Lüroth degree formula as such do not count.

## Leads

### Lead 1: analogue only

- **Citation:** G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, J. Théor. Nombres Bordeaux 19 (2007), 373-391
- **Location:** Théorème 7 points 1 and 2, p. 390; Corollaire 5 point 4, p. 383; checked against page images
- **Quote:** Soient u ∈ C\Q̄ et v ∈ C\{0}. Alors : {v, vu, vu², vu³} …
- **Link:** http://archive.numdam.org/article/JTNB_2007__19_2_373_0.pdf
- **Relation:** Same objects, no part of the target reached. Th. 7(2) says a four-term progression with ratio outside Q̄ never lies in L̃; Th. 7(1) excludes {v, vu, vū}; Cor. 5(4) excludes {1/λ, 1/(λ+α)}, close to the target's 1/(u−b) branch. These are one-off exclusions from Roy's theorem. Diaz has no 5-dimensional space, no classification by what W contains, no index bound, no involution pencil and no statement about 4-dimensional extensions. My one-line consequence: since h is outside Q̄, Th. 7(2) gives W ⊄ L̃, which fits the target's remark that it excludes nothing new at a candidate.

### Lead 2: generalization

- **Citation:** N. P. Nguyen, A Generalization of Desargues' Involution Theorem, arXiv:1912.12200 (classical Desargues involution theorem behind it). Found outside the assigned own-field strategy.
- **Location:** Introduction, 'Theorem (Generalization of Desargues' Involution Theorem)', p. 2
- **Quote:** the line contains no common zero point for all the quadrics in that pencil
- **Link:** https://arxiv.org/pdf/1912.12200
- **Relation:** Covers only the pencil-to-involution correspondence in part (c), through my translation. Take the ambient projective space to be the u-line and homogenise q1, q2 to degree 2. Coprimality with one degree exactly 2 means no common zero, including at infinity, so the zero pairs of the pencil are conjugate under an involution, and conversely. It does not reach the span form with q1^i q2^(3−i)/(u l1 l2), so the normal form as used in the entry is not established here; nor does it reach (a), (b) or (d). A verifier should decide whether this correspondence is all that (c) means.

## Notes

**Result: no lead reaches (a), (b) or (d), and no transcendence source treats the involution in (c).** Time used: about 15 of the 30 minutes (10:41 start). I stopped early because the own-field sources were covered and the remaining indexes were rate-limited.

**Why the transcendence literature is unlikely to contain this (my own reasoning, not from a source).** Since dim H = 3, dim P = 4 and dim W = 5, the intersection H ∩ P has dimension 2, which forces c into Q̄(u). The statements (a)-(c) therefore live entirely in the function field Q̄(u) and involve no arithmetic of logarithms. The ratio of two elements of H ∩ P has degree at most 2 in u and also lies in Q̄(h), which gives (b) at once from the degree formula. Transcendence authors use 2×3 configurations only as input to Roy's theorem, so they have no reason to classify these spaces.

**What each source says relative to the target.**
- **Diaz 2007** is the closest. It has the progressions v, vu, vu² (Th. 2, 5, 6) and v, vu, vu², vu³ (Th. 7(2)), the conjugate family {v, vu, vū} (Th. 7(1)), and reciprocals {1/λ, 1/(λ+α)} (Cor. 5(4)). All of these are exclusions from L̃, obtained by applying Roy's theorem to one chosen pair of families. None fixes a 5-dimensional space or describes its contents, and none mentions a rational ratio h, an index, an involution or invisibility. Statements were checked on page images pp. 383 and 390.
- **Diaz 2004** gives conjecture C(|u|) and the case of arguments in R ∪ iR. Nothing on spaces. Its text layer is badly garbled, and I did not check page images because no statement there was relevant.
- **Roy 1992** gives the strong six exponentials theorem (Cor. 2) and bounds on dim(U ∩ L̃^d) (Th. 5, 6). The bound is general and is not specific to a rational parametrisation.
- **Roy 1995** has a dim V = 5 case, but it concerns Plücker points of the Grassmannian G(3, V). It matches the target only in the number 5.
- **Waldschmidt, Variations and Further variations** concern 2×2 determinants not lying in L̃ (Th. 2.11, Cor. 2.12-2.14; Th. 1.2). No function-field classification.
- **Role of complex conjugation** restates Diaz. Nothing new for this target.
- **DALAG ch. 11** gives Roy's theorem, the |u| remark and Ex. 11.8-11.9. A full-text search for rational function, progression, involution, pencil, homography and Lüroth returned nothing relevant in ch. 11 (rational-function hits are unrelated).
- **Habsieger 2007** is about alternants and 2^t, 3^t. **Massold 2025** is about transcendence degree bounds. **Dasgupta and Dasgupta-Kakde** are about structural rank and Leopoldt, by their statements. None bears on the target.
- **BSZ17** appears in the local library, including §7 on transcendental extensions. It is excluded as named nearby, and I did not read it beyond a keyword search.

**Part (c).** The correspondence between a coprime pencil of binary quadratics and a Möbius involution is classical (Desargues's involution theorem). Nguyen's arXiv note states it over any field of characteristic other than 2. I reported it because a find is a find, but it came from one search outside my strategy, and the classical primary sources (Coolidge, Semple-Roth, Coxeter) were not read. It reaches the correspondence only, not the span form q1^i q2^(3−i)/(u l1 l2). Dolgachev's Classical Algebraic Geometry was not checked: the URL I tried returned 404.

**What I could not settle.**
- Coverage of very recent arXiv work is weak, because the arXiv API and OpenAlex returned 429 nearly every time. zbMATH and web search showed nothing relevant from 2024-2026 beyond Massold and Dasgupta-Kakde.
- Forward citations of Diaz 2007 returned only Waldschmidt's survey, and OpenAlex reports zero citations, which is probably an index gap. Forward citations of Diaz 2004 were not traced.
- Roy's 1990 Séminaire note and his 1992 Luminy text were not read.
- A statement in an unindexed conference paper cannot be excluded. Nothing I saw points to one.

**Suggestion for the entry.** The "not found" for (a), (b) and (d) survives this own-field search. Part (c) should be read as classical in its pencil-to-involution core, with only the span normal form specific to this work. Whether the function-field statements appear in other literature (linear series on P¹, products of subspaces in function fields) is for the sweeps with other strategies.

## Read

- Diaz 2007, J. Théor. Nombres Bordeaux 19 — http://archive.numdam.org/article/JTNB_2007__19_2_373_0.pdf: §1.3 Th. 2; §2 Th. 3; Cor. 4 and 5 (page image p. 383); Th. 4-7 and §2.4 (page image p. 390)
- Diaz 2004, J. Théor. Nombres Bordeaux 16, 535-553 (local copy, garbled text layer) — https://www.numdam.org/item/JTNB_2004__16_3_535_0.pdf: list of statements; conjecture C(|u|), Prop. 1-2, Th. 6 (formulas partly unreadable in the text layer)
- Roy 1992, Matrices whose coefficients are linear forms in logarithms, J. Number Theory 41, 22-47 (local copy): Cor. 2, §5 Th. 5 and Th. 6; list of statements
- Roy 1995, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, Acta Math. 175 (local copy): Introduction; §2 passages on k=3, dim V=5 (Grassmannian setting, not this one)
- Waldschmidt 2005, Variations on the six exponentials theorem (local copy) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Hyderabad.pdf: §2 Cor. 2.2-2.6 (statement of 2.6 and proofs), Th. 2.11, Cor. 2.12, 2.13
- Waldschmidt 2005, Further variations on the six exponentials theorem, Hardy-Ramanujan J. 28 (local copy): pp. 1-2 from page images: Th. 1.1, opening of Th. 1.2
- Waldschmidt, The role of complex conjugation in transcendental number theory, DION 2005 (local copy) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf: §5 end, §6 opening: Conj. 5.2, Th. 6.1
- Waldschmidt 2000, Diophantine approximation on linear algebraic groups (local text): §11.6 Cor. 11.15-11.16, Conj. 11.17 and the |u| remark; Ex. 11.8, 11.9; keyword search of the whole text
- Habsieger 2007, A few remarks related to the four exponentials conjecture, Publ. Math. Debrecen 70, 179-194 — https://publi.math.unideb.hu/paper/1156/download/10_5486_PMD_2007_3505.pdf: Abstract, §1, keyword search of the full text
- Nguyen, A Generalization of Desargues' Involution Theorem, arXiv:1912.12200 — https://arxiv.org/abs/1912.12200: §1 with the main theorem

## Screened only

- Massold 2025, Transcendence degrees of fields generated by exponentials of products, arXiv:2506.01123 (abstract, keyword search) — https://arxiv.org/abs/2506.01123
- Warner, The Exponential World, arXiv:2105.05809 (the 'Diaz curve' remark only) — https://arxiv.org/abs/2105.05809
- Waldschmidt, The Four Exponentials Problem and Schanuel's Conjecture (list of statements) — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf
- Dasgupta-Kakde, Ranks of matrices of logarithms II, arXiv:2408.08178 (list of statements) — https://arxiv.org/abs/2408.08178
- Dasgupta, Ranks of matrices of logarithms I, arXiv:2303.02037 (search snippet and local keyword search) — https://arxiv.org/abs/2303.02037
- Roy-Waldschmidt 1995, Quadratic relations between logarithms of algebraic numbers, Proc. Japan Acad. 71A (keyword search only)
- Roy-Waldschmidt 1997, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. Sci. ENS 30 (abstract)
- Diaz 1997, La conjecture des quatre exponentielles et les conjectures de D. Bertrand (list of statements only) — http://www.numdam.org/item/JTNB_1997__9_1_229_0.pdf
- Butler 2017, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. (title only)
- Local library at missions/diaz/sources: keyword search of the 135 text files for Lüroth, involution, pencil, geometric progression, homography/Möbius, rational function, dimension 5. No hit touching the target in transcendence texts; the Lüroth and homography/Möbius searches returned nothing at all.
- zbMATH Open result lists (titles only) for 11J81 with logarithms, exponentials, matrices, conjugation, Schanuel, Kneser, Lüroth, and author lists for Diaz and Roy
- Other arXiv papers from the Desargues search, seen as snippets only: 1804.00639, 2011.03811, nlin/0203011

## Inaccessible

- D. Roy, Matrices dont les coefficients sont des formes linéaires, Sém. Théorie des Nombres Paris 1987-88, Progr. Math. 81, 273-281 — 10.1007/978-1-4612-3460-9_13: Paywalled at Springer; only the opening and bibliography appeared in a search result. Probably superseded by Roy 1992.
- D. Roy, Transcendance et questions de répartition dans les groupes algébriques (1992, Luminy proceedings): Seen only as a zbMATH title; no open copy looked for or found.
- arXiv API, OpenAlex and Semantic Scholar search: Almost every call returned HTTP 429, likely because of parallel load. One arXiv abstract query got through and returned nothing relevant. Semantic Scholar citation lookup worked once for Diaz 2007.
- Forward citations of Diaz 2004: The DOI I guessed resolved to an unrelated paper, so its citations were not traced.

## Queries

- Diaz module logarithme nombre algébrique conjecture |u| algébrique e^u produits de logarithmes espace vectoriel
- transcendence rank one matrices logarithms subspace 1, u, 1/u products of vector spaces dimension five geometric progression
- Diaz Sur les modules des logarithmes / modulus of logarithm six exponentials conjugate rational squared modulus
- Habsieger A few remarks related to the four exponentials conjecture
- arXiv 2024-2026 strong four exponentials subspaces conjugation modulus rational function
- Massold Transcendence degrees of fields generated by exponentials of products
- Roy Matrices dont les coefficients sont des formes linéaires
- logarithmes de nombres algébriques espace vectoriel de dimension produit fractions rationnelles conjugaison complexe
- Diaz conjecture |u| algebraic e^u transcendental partial results 2015-2026 circle
- six/four exponentials arXiv 2025-2026 rank one 2×3 linear forms in logarithms vector space products field extension
- transcendance 1/u u^2 logarithmes familles proportionnelles matrices de rang 1 involution homographie
- 1/(λ+α), 1/λ logarithm strong six exponentials reciprocal Diaz corollary extension
- Waldschmidt survey strong four exponentials Diaz |λ| complex conjugation reciprocals squares open problems
- involution of the projective line pencil of binary quadratic forms g^1_2 Desargues normal form
- zbMATH: "products logarithms algebraic numbers", "strong six exponentials", "six exponentielles", "quatre exponentielles", "four exponentials", ti:exponentials & cc:11J81, ti:logarithmes & cc:11J81, ti:matrices & cc:11J81, au:Roy & cc:11J81, au:Diaz & cc:11J81, ti:conjugation & cc:11J81, ti:Schanuel, ab:transcendence & ab:Kneser, ab:transcendence & ab:Lüroth, ab:"products of logarithms"
- Local grep in sources/: Lüroth; involution; geometric progression / progression géométrique; homograph/Möbius; pencil/faisceau; rational function / fraction rationnelle; dimension 5; u^{-1}
- Semantic Scholar citations of Diaz 2007 (10.5802/jtnb.592)
- arXiv API: abs:"four exponentials", abs:"six exponentials", abs:"logarithms of algebraic numbers" with conjugation or rank (only the first query got through)
