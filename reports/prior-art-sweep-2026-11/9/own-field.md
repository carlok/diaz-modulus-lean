# Entry 9, strategy: own-field

## Target, as restated by the searcher

Let u be a complex number that is not algebraic, with ρ = uū algebraic, so ū = ρ/u and u is transcendental. Let a1 ≠ a2 be non-zero algebraic numbers and z_i = u/(u²−a_i). Let W be the 5-dimensional Q̄-space spanned by 1, u, ū, z1, z2. Claim: (a) W contains all six products x_i y_j of some Q̄-independent x1, x2 and Q̄-independent y1, y2, y3; (b) for every w in W outside H0 = Q̄+Q̄u+Q̄ū, the 4-dimensional space H0+Q̄w contains no such 2×3 product family. No relation between a2 and the conjugate of a1 is assumed. Everything lives in the rational function field Q̄(u), so this is linear algebra there, with no transcendence input beyond u being transcendental.

## Leads

### Lead 1: analogue only

- **Citation:** G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, J. Théor. Nombres Bordeaux 19 (2007), 373-391
- **Location:** Cor. 5(4), pp. 383-384; also Cor. 1(3), p. 380, and Théorème 7(2), p. 390
- **Quote:** Pour tout α ∈ Q\{0} on a : {1/λ, 1/(λ + α)} ⊄ L̃ (text-layer rendering; Q is Q̄)
- **Link:** https://doi.org/10.5802/jtnb.592
- **Relation:** Diaz applies Roy's theorem to explicit families. Cor. 5(4) uses (λ, λ+α) and (1, 1/λ, 1/(λ+α)), a 2×3 configuration in the 4-dimensional span of 1, λ, 1/λ, 1/(λ+α). Cor. 1(3) gives the shape {λ², 1/λ}. Th. 7(2) uses (v, vu) and (1, u, u²), giving {v, vu, vu², vu³} ⊄ L̃. My translation: Th. 7(2)'s families with u→u² and v→u/(u²(u²−a1)(u²−a2)) give part (a), the carrying half, since v times 1, t, t², t³ (t=u²) spans the odd part of W. Nothing in Diaz states part (b), the absence of a configuration in the 4-dimensional subspaces, nor any classification of 4-dimensional spaces carrying one. Diaz's one-pole families are in fact the visible cases that (b) excludes from W.

### Lead 2: analogue only

- **Citation:** M. Waldschmidt, Variations on the six exponentials theorem, in Algebra and Number Theory (R. Tandon, ed.), Hindustan Book Agency, 2005, 338-355
- **Location:** Cor. 2.2-2.6 and their proof matrices, pp. 343-344; Cor. 2.7-2.9 for conjugation
- **Quote:** one at least of the two numbers 1/Λ1, Λ2/Λ1 is not in L̃
- **Link:** https://doi.org/10.1007/978-93-86279-23-1_23
- **Relation:** These corollaries come from explicit rank-one 2×3 matrices with entries in L̃, some of them with quotients. They exhibit configurations and draw non-membership conclusions. They never compare a 5-dimensional space with its 4-dimensional subspaces, and rational functions of u with paired poles do not appear. They do not reach part (b).

## Notes

## Result
No same or implying source in the transcendence literature I could open. The "not found" survives this strategy, with the coverage gaps below. Part (b), which is the actual content, appears nowhere I read.

## Closest printed material
Diaz 2007 Cor. 5(4), Cor. 1(3) and Th. 7(2), and Waldschmidt 2005 Cor. 2.2-2.6, build 2×3 configurations out of rational expressions in a logarithm. All apply Roy's theorem in one direction: here is a configuration, so something is not in L̃. None asks which spaces carry no configuration. The word and idea of invisibility is absent, and so are paired poles u/(u²−a). Diaz 2007 §2.4 only asks how to keep |λ| alone.

Part (a) is recoverable from Diaz Th. 7(2) by substitution (my translation, in the lead). It also yields a corollary I did not find printed: if 1, u, ū are all in L̃, then z1 and z2 are not both in L̃. That is an immediate consequence of Roy's theorem.

## Why (b) is routine: my own derivation, not from any source
Not machine-checked and not compared with the blueprint proof.

1. Suppose x1, x2 and y1, y2, y3 have all products in a 4-dimensional V ⊂ Q̄(u). Then g = x2/x1 and all y_j/y_1 lie in Q̄(u).
2. Over algebraically closed Q̄, no combination s·x1 + t·x2 vanishes, so every member of the pencil span(y) → V is injective. Kronecker's normal form then leaves a single block of size 3×4. Hence y = y1·(1, g, g²) and V = f·⟨1, g, g², g³⟩.
3. If V contains 1 and u, then u ∈ Q̄(g), so g is a Möbius function of u. Thus V = (1/P)·{polynomials of degree ≤3}, with P a polynomial of degree ≤3.
4. 1/u ∈ V forces u | P, and u ∈ V forces deg P ≤ 2. So P is u, u² or u(u−b) with b ≠ 0.
5. Therefore H0+Q̄w carries a configuration exactly when w ≡ u², 1/u² or 1/(u−b) modulo H0, up to scalar. These have at most one finite non-zero pole.
6. Any w in W outside H0 has a non-zero multiple of some z_i, hence simple poles at both ±√a_i. So no w in W qualifies. This uses only a_i ≠ 0, a1 ≠ a2, and no conjugation condition.

Step 5 is a complete classification, also not found in print. Diaz's one-pole family and his λ² family are exactly its visible shapes, though he states no converse.

Kronecker's 1890 pencil theorem therefore gives (b) in a few lines of my own, but I do not count it as "implies": it is a general tool, and the content is the computation above. Vosper-type results for field extensions (Bachoc-Serra-Zémor 2017; Bachoc-Couvreur-Zémor 2018, in the local library) give the same progression structure. They belong to the other strategy and were only grepped here, so I did not check their hypotheses. Neither is about these spaces.

## Coverage limits
- zbMATH never answered; OpenAlex and Semantic Scholar were rate-limited throughout; the arXiv API was only partly available.
- Forward citations of Diaz 2007 are unchecked: OpenCitations and Crossref list none, which is not credible as a true count. Post-2007 work citing it is the main remaining place a find could hide.
- Statements from Diaz 2007 come from a text layer. Cor. 5(4) reads cleanly and I rechecked it against the proof given in the same text, not against the page image.
- Waldschmidt's Further variations has a garbled local text layer and was only screened.

## Time
Clock read 15:33 at the start and 15:37 at the last check, with a few more calls after that. I stopped well inside the 30-minute box, because the remaining free indexes were throttled and further web queries were returning the same small set of papers.

## Read

- Diaz 2007, JTNB 19 (local text layer) — https://doi.org/10.5802/jtnb.592: §1 by grep; §2.1 Th. 3 and Cor. 1; Cor. 4 and 5 with examples; Th. 4; Cor. 6; §2.3 Th. 6 and 7; §2.4
- Waldschmidt 2005, Variations on the six exponentials theorem (local) — https://doi.org/10.1007/978-93-86279-23-1_23: §2, Cor. 2.2-2.9 and proof matrices; theorem list of the rest
- Waldschmidt 2005, The role of complex conjugation in transcendental number theory (local, DION 2005) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf: §2.7-§3 (Cor. 2.7, Remark 2.8, Th. 3.1, Conj. 3.2-3.4, Prop. 3.5), Th. 6.1
- Roy 1992, Matrices whose coefficients are linear forms in logarithms, JNT 41 (local): Cor. 1 and 2, §4-5 opening
- Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (2000) (local): §11.6.1, Cor. 11.16 through Conj. 11.17 and Diaz's modulus consequence

## Screened only

- Diaz 2004, Utilisation de la conjugaison complexe, JTNB 16 (statement list and Th. 6 only) — https://doi.org/10.5802/jtnb.459
- Diaz 1997, quatre exponentielles / Bertrand (local, keyword grep only)
- Roy 1995, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, Acta Math. (local, statement list)
- Roy-Waldschmidt 1997, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. ENS (keyword grep only) — https://www.numdam.org/item/ASENS_1997_4_30_6_753_0
- Waldschmidt 2005, Further variations on the six exponentials theorem, Hardy-Ramanujan J. 28 (local text layer garbled; judged from abstract) — https://doi.org/10.46298/hrj.2005.86
- Waldschmidt 2022, The four exponentials problem and Schanuel's conjecture (local version, keyword grep only) — https://doi.org/10.1007/978-3-031-12244-6_39
- Waldschmidt 2013, On Ramachandra's contributions to transcendental number theory (title, citer of Further variations) — https://doi.org/10.46298/hrj.2013.174
- Butler et al. 2015, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. (title, citer of Diaz 2004) — https://doi.org/10.1007/s11139-015-9728-2
- Roy 1990, Matrices dont les coefficients sont des formes linéaires, Sém. Théorie des Nombres Paris 1987-88 (search snippet only) — https://link.springer.com/content/pdf/10.1007%2F978-1-4612-3460-9_13.pdf
- Betina-Dimitrov, arXiv 1907.09422 (abstract: uses Roy's theorem for L-invariants) — https://arxiv.org/abs/1907.09422
- Dasgupta 2023 and Dasgupta-Kakde 2024, ranks of matrices of logarithms (title and abstract) — https://www.arxiv.org/abs/2303.02037
- Wikipedia, Six exponentials theorem (secondary, screened only) — https://en.wikipedia.org/wiki/Six_exponentials_theorem
- Bachoc-Serra-Zémor 2017 and Bachoc-Couvreur-Zémor 2018 (local, grep of statements; outside this strategy, see notes)

## Inaccessible

- zbMATH Open (web and API): Web page returned HTTP 403; my API query returned 404; direct Python call failed certificate verification. I did not bypass verification, so no zbMATH search was done.
- OpenAlex and Semantic Scholar: HTTP 429 on every attempt. Citation chasing fell back to OpenCitations and Crossref.
- Citing works of Diaz 2007 — https://doi.org/10.5802/jtnb.592: OpenCitations lists 0 citers and Crossref a count of 0, so forward citations of the most relevant paper are effectively unchecked. Citers I could list are for Diaz 2004, Variations and Further variations.
- arXiv API, second batch of targeted queries: HTTP 429. One broad query (21 results) and one abstract query (1 result) did run.

## Queries

- Diaz "produits de deux logarithmes" module d'un logarithme conjecture transcendance matrice rang un exponentielles
- rank one matrices with entries in Q-bar linear span of 1, u, conjugate of u; 2x3 matrix logarithms algebraic modulus strong five exponentials complex conjugation
- Diaz Utilisation de la conjugaison complexe transcendance fonction exponentielle; strong four exponentials u ū rational function pole partial results
- "logarithmes" "matrices dont les coefficients" formes linéaires rang transcendance conjugaison complexe Roy Waldschmidt espace vectoriel engendré produit de deux sous-espaces
- transcendence logarithms "x_i y_j" products of two subspaces of complex numbers Q-bar space contains product 2 by 3 strong six exponentials five exponentials vector space structure
- Diaz "Produits et quotients de combinaisons linéaires de logarithmes" cited; strong four exponentials quotient 1/λ not in L̃ new results product of logarithms arXiv (extended)
- "strong six exponentials" theorem corollary rational functions of a logarithm 1/λ and 1/(λ+α) not both in linear combinations of logarithms, algebraic modulus |λ|
- transcendance "module" logarithme "|log" algébrique Diaz conjecture nombre u tel que |u| et e^u algébriques aucun exemple "exponentielles" résultat 2020..2026
- Waldschmidt Hyderabad "strong four exponentials" consequences "1/Λ" quotient products Roy Diaz "complex conjugation" sharp five exponentials rational expressions in a logarithm
- "exponentielles" "logarithmes" transcendance inverse d'un logarithme "1/λ" fractions rationnelles en λ théorème fort des six exponentielles conjugué algébrique |λ|² article
- Waldschmidt "Further variations on the six exponentials theorem" Hardy-Ramanujan Journal 2005
- arXiv API: all:"six exponentials" OR all:"four exponentials"; abs:"strong four exponentials" OR abs:"strong six exponentials" OR (abs:"linear forms in logarithms" AND abs:rank AND abs:matrices)
- HAL API: exponentielles AND logarithmes AND transcendance
- Local library grep over Diaz, Roy, Waldschmidt texts: 1/(λ+, homograph, geometric progression, progression géométrique, partial fraction, éléments simples, Kronecker pencil, faisceau
- OpenCitations: citers of 10.5802/jtnb.592, 10.5802/jtnb.459, 10.1007/978-93-86279-23-1_23, 10.46298/hrj.2005.86, Roy 1992
