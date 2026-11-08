# Entry 8, strategy: own-field

## Target, as restated by the searcher

Let u be a complex number outside Q̄ with ρ = uū algebraic, so ū = ρ/u and conjugation acts on Q̄(u). Put H₀ = Q̄ + Q̄u + Q̄ū, and let z = u/(u²−a) or u/(u²−a)², with a ∈ Q̄ nonzero, so that W = H₀ + Q̄z + Q̄z̄ has dimension 5. A 2×3 configuration in a Q̄-space V is x₁,x₂ and y₁,y₂,y₃, each family Q̄-independent, with all six products in V. The part not found is: (a) W carries a configuration, but for no w ∈ W∖H₀ does the 4-dimensional space H₀ + Q̄w carry one; (b) in the conjugation-stable case aā = ρ², where z̄ is proportional to z, the 4-dimensional space H₀ + Q̄·u/(u²−a) carries no configuration. The statement is the non-existence (the "invisibility"), a purely linear-algebraic fact about rational functions of u. Its transcendence consequences at a candidate (|u|, e^u algebraic) are already printed and do not count.

## Leads

### Lead 1: analogue only

- **Citation:** G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, J. Théor. Nombres Bordeaux 19 (2007), 373-391
- **Location:** Théorème 7(2), p. 390 (proved from the strong six exponentials theorem applied to (1,u,u²) and (v,vu))
- **Quote:** Soient u ∈ C\Q̄ et v ∈ C\{0}. Alors : {v, vu, vu², vu³} …
- **Link:** https://emis.univie.ac.at/journals/JTNB/2007-2/article04.pdf
- **Relation:** This does not reach the target. By my own translation (not printed, not refereed), a 2×3 configuration in a 4-dimensional space must be v⟨1,t,t²,t³⟩ with t = x₂/x₁: t is transcendental, and dim(B+tB) ≤ 4 with dim B = 3 forces B to be a single t-string. So Th. 7(2) is the printed result covering every 4-dimensional case. Neither Diaz nor anyone I read asks which spaces H₀ + Q̄w have this form, and the invisibility is exactly the claim that none in W do. The theorem concerns the same objects and gives no non-existence statement.

## Notes

**Result: no lead reaches the target.** The "not found" stands for the own-field literature I could reach. The one lead listed is an analogue only.

**Time.** Started 13:16; the last clock check was 13:23, and I stopped soon after. I stopped well inside the 30-minute box because the citation chains closed and queries kept returning the same documents.

**What I tried.**
- Full read of Diaz 2007, and the relevant parts of Diaz 2004.
- Waldschmidt's three 2005 papers on this circle, the relevant book pages, and his 2023 survey.
- Forward citations of Diaz 2004, Diaz 2007 and Roy 1992.
- zbMATH Open and HAL title searches, plus web searches in English and French.
- A keyword grep across the local library.

**What the sources say relative to the target.**

- *Diaz 2004.* The proof of Th. 2 applies Roy's theorem to (x₁,x₂) and (1,y,ȳ). With x = (u,ū), y = s = 1/(u²−a), I checked by partial fractions that all six products lie in W. So the configuration's shape is printed, as the target says. Diaz never considers subspaces of dimension 4 or 5, and never asks whether a smaller space could carry a configuration. His remark after Th. 6 regrets that the hypotheses exclude u₁ = u, u₂ = ū. That is a statement about hypotheses, not about spaces.
- *Diaz 2007.* All results have the form "these numbers are not all in L̃". Cor. 4(4), Cor. 5, Th. 6(3) and Th. 7(1) are the nearby results the target names. Th. 7(2) is the only 4-dimensional family, and it is the lead above. §2.4 says informally that staying with the strong six exponentials theorem will not go far. §2.1 asks how to isolate λ² or |λ|. Both are method remarks with no non-existence statement. He also says the listed sufficient conditions do not claim to exhaust what is possible, which leaves the question open rather than answering it.
- *Waldschmidt, Role and Variations.* These repeat Diaz's conjugation device (Thm 4.1, Cor. 4.2, Cor. 2.7-2.9, Cor. 2.13). No dimension count on spaces of products appears.
- *Waldschmidt, Further variations.* Determinants of 2×3 matrices; a different object. Only pp. 1-3 read.
- *Roy 1992, Waldschmidt 2023, the book.* Rank bounds via structural rank. Rank-one matrices appear only as the x_i y_j reformulation. The book's §11.6 and Exercise 15.16 give the |λ| consequences only.
- *Fischler 2001.* Orbits and Roy's variety formulation. Introduction read; it does not treat rational functions of a circle point.
- *Later citers found.* Butler 2017 and The Exponential World add nothing here. I found no paper continuing Diaz's programme on hulls or on which spaces carry configurations.

**Why a printed find looks unlikely in this field.** The target contains no transcendence: it is a statement about 4-dimensional subspaces of Q̄(u). Transcendence authors have had no reason to record it, since a negative statement about a configuration gives no transcendence result. If it is printed anywhere, the likelier home is algebra: products of subspaces over an algebraically closed field (Kneser and Vosper analogues), or linear systems on P¹ composed with a pencil. That is outside this strategy and I did not search it.

**My own derivations (not sources, not refereed).**
- The single-string argument in the lead.
- s̄ = −(1/ā)(1 + a s) when aā = ρ², which is why (1,s,s̄) becomes dependent and Diaz 2004 Th. 2 fails for that family. This agrees with the target's source line.

**What I could not settle.**
- OpenAlex and Semantic Scholar keyword search were rate-limited, and arXiv phrase search returned noise, so recent preprints are covered mainly by web search and zbMATH.
- Citation data for Diaz 2007 is thin: Crossref shows 0 citers, OpenCitations 0, Semantic Scholar 1. A citer outside these indexes could exist.
- Diaz 2000 (Ramanujan J.) was not obtained.
- Further variations pp. 4-9 were not read.
- Diaz 2004's text layer is noisy OCR. I relied on it only for structure, and I did not check its formulas against page images.

**Rule and tooling notes.** Nothing was opened under external/ or research/, and repository, Lean and prove2.me sources were excluded. Python TLS verification failed for api.zbmath.org. I did not disable verification; I reached zbMATH through the context-mode fetch tool and JavaScript fetch instead.

## Read

- Diaz 2007, J. Théor. Nombres Bordeaux 19, 373-391 — https://emis.univie.ac.at/journals/JTNB/2007-2/article04.pdf: whole paper, including Théorèmes 3-7, Corollaires 1-7, §2.4 (local text layer)
- Diaz 2004, J. Théor. Nombres Bordeaux 16, 535-553 — https://emis.univie.ac.at/journals/JTNB/2004-3/pages535-553.pdf: §1, §2 (Théorèmes 1-3), start of §3, §5 with Théorème 6 and the closing remarks (noisy OCR)
- Waldschmidt, The role of complex conjugation in transcendental number theory (DION 2005) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf: §§2-6
- Waldschmidt, Variations on the six exponentials theorem (Hyderabad 2005) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Hyderabad.pdf: §2, Corollaries 2.2-2.14, pp. 342-347
- Waldschmidt, Further variations on the six exponentials theorem, Hardy-Ramanujan J. 28 (2005) 1-9 — https://hrj.episciences.org/86: pp. 1-3 from page images: Theorems 1.1, 1.2, Corollaries 1.3, 1.4 (remaining pages not read)
- Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (2000): §11.6 pp. 398-399, Exercises 1.7 and 15.16, Exercises 11.1-11.7 (headers and first lines only)
- Waldschmidt, The four exponentials problem and Schanuel's conjecture (2023) — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf: §6, strong six exponentials and structural rank
- Roy, Matrices whose coefficients are linear forms in logarithms, J. Number Theory 41 (1992) 22-47 — https://www.sciencedirect.com/science/article/pii/0022314X9290081Y: introduction only
- Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, Acta Arith. 100 (2001): introduction, up to the list of known cases of Roy's conjectures
- The Exponential World, arXiv:2105.05809 — https://arxiv.org/pdf/2105.05809: §43 (strong six exponentials): the part read reworks Waldschmidt's corollaries and Diaz's quotient lemma, nothing new
- zbMATH review of Diaz 2007 by Waldschmidt, Zbl 1163.11055 — https://api.zbmath.org/v1/document/_search?results_per_page=5&search_string=an%3A1163.11055: full review

## Screened only

- Butler, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. 42 (2017) (cites Diaz 2004): keyword hits and introduction only — https://doi.org/10.1007/s11139-015-9728-2
- Waldschmidt, On Ramachandra's contributions to transcendental number theory: keyword hits only — https://hal.science/hal-01112588v1
- Waldschmidt, Transcendence of periods: the state of the art: keyword hits only
- Waldschmidt, Open Diophantine problems: keyword hits only — https://arxiv.org/pdf/math/0312440
- Waldschmidt, Six exponentials theorem, irrationality (2022) and French version (2021): title and keyword search; concerns irrationality — https://hal.science/hal-04025073v1
- Waldschmidt slides: DION2005 Beamer, NCTS 2003, Wien ESI 2003, Bangalore 2003, Saarbrücken 2003, Hong Kong 2006: keyword hits only — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005Beamer.pdf
- Dasgupta, Ranks of matrices of logarithms I (2023), and Dasgupta-Kakde II: complex conjugation there is a Galois element; different question
- Roy, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, Acta Math. 175 (1995): title and keyword hit only — https://doi.org/10.1007/BF02392486
- Diaz 1997, La conjecture des quatre exponentielles et les conjectures de D. Bertrand: Proposition 3 only — https://www.numdam.org/item/JTNB_1997__9_1_229_0.pdf
- Kühne, Logarithms of algebraic numbers, JTNB 27 (2015): abstract; new proof of Hermite-Lindemann type result — https://www.numdam.org/articles/10.5802/jtnb.912
- arXiv:2602.23597, Arithmetic properties of arguments of algebraic numbers: title and keyword scan, no hit on Diaz or strong six exponentials — https://arxiv.org/pdf/2602.23597
- Citation lists from Semantic Scholar and OpenCitations for Diaz 2004, Diaz 2007, Roy 1992: titles only
- zbMATH Open title and abstract lists: six exponentials, four exponentials, exponentielles, complex conjugation, conjugaison, logarithms 11J81 from 2005, author Diaz, Schanuel 11J81 from 2005: titles only
- HAL search lists: six/quatre exponentielles, six/four exponentials, strong six exponentials: titles only
- Wikipedia pages on the four and six exponentials: secondary, screened only — https://en.wikipedia.org/wiki/Six_exponentials_theorem

## Inaccessible

- Diaz, Transcendance et indépendance algébrique : liens entre les points de vue elliptique et modulaire, Ramanujan J. 4 (2000) 157-199: Not obtained: no open copy turned up and I did not test publisher access. Topic is modular and elliptic, so unlikely to bear on the target.
- OpenAlex API (citation lookup): HTTP 429 on every request in the one attempt; Semantic Scholar and OpenCitations were used instead, so citers of Diaz 2004/2007 are only as complete as those two.
- Semantic Scholar keyword search: HTTP 429 on all four queries; only the citation endpoint worked.
- arXiv API phrase search: Reachable, but the returned results were mostly irrelevant noise (for example astrophysics hits for 'four exponentials', zero for 'strong six exponentials'). I do not treat its empty results as evidence of absence.

## Queries

- Diaz "Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques" conjectures et résultats partiels
- complex conjugation transcendence |u| algebraic e^u algebraic linear forms in logarithms matrix rank one conjugate Diaz conjecture module d'un logarithme
- Diaz conjecture "|u|" algebraic then e^u transcendental strong four exponentials partial results conjugate arXiv
- strong six exponentials theorem corollary complex conjugation 1/λ not in linear forms logarithms quotient λ/(λ²-a) transcendence inverse of linear form in logarithms
- produits de logarithmes de nombres algébriques conjugaison complexe "six exponentielles" module d'un logarithme transcendance nouveau résultat
- "strong four exponentials" conjecture partial result product of linear forms in logarithms absolute value 2020..2026 arXiv transcendence
- "linear combinations of logarithms" OR "linear forms in logarithms" "rank one" matrix proportional families v, vu, vu^2 strong four exponentials special case
- Waldschmidt transcendence of 1/log, log^2, |log|; Diaz complex conjugation six exponentials new consequences (extended)
- "Further variations on the six exponentials theorem" abstract
- limitation six exponentials theorem cannot exclude; subspace containing products x_i y_j, dimension, Kneser, product of subspaces, transcendence
- Diaz conjecture point on circle, exp(2iπ z) |z|=1, rational function of u, transcendence
- note on Diaz conjecture modulus of logarithm; e^{π²} partial results via Roy and conjugation; numbers not in span of 1 and logarithms (extended)
- matrices dont les coefficients sont des formes linéaires en logarithmes rang 1 espace vectoriel dimension produits conjugaison six exponentielles thèse
- zbMATH: ti "six exponentials"; ti "four exponentials"; ti exponentielles & cc 11J; ti "complex conjugation" & cc 11J; ti conjugaison & cc 11J; ti logarithmes & py 2005-2026; au Diaz, Guy; ab "strong six exponentials"; ab "strong four exponentials"
- HAL: "six exponentielles"; "quatre exponentielles"; "six exponentials"; "four exponentials"; "conjugaison complexe" transcendance; "strong six exponentials"
- Citation lookup (Semantic Scholar, OpenCitations): Diaz 2004 doi 10.5802/jtnb.459; Diaz 2007 doi 10.5802/jtnb.592; Roy 1992 doi 10.1016/0022-314x(92)90081-y
- Local library grep across sources/: complex conjugat, familles proportionnelles, v, vu, vu², Diaz, six exponential
