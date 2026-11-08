# Entry 19, strategy: own-field

## Target, as restated by the searcher

Let u be a nonzero complex number with |u| algebraic. Assume the strong (also called sharp) five exponentials conjecture: if x1, x2 are Q-independent and y1, y2 are Q-independent, η ≠ 0, the α_ij and β are algebraic, and the numbers exp(x_i y_j − α_ij) and exp(η x2/x1 − β) are algebraic, then all five exponents vanish. The target says that then e^u is transcendental. Equivalently, under that conjecture a nonzero logarithm of an algebraic number never has algebraic modulus. What is wanted is a printed statement that this particular conjecture, not the stronger strong four exponentials conjecture or Schanuel, gives Diaz's C(|u|).

## Leads

### Lead 1: analogue only

- **Citation:** M. Waldschmidt, On the transcendence methods of Gel'fond and Schneider in several variables, in New Advances in Transcendence Theory (A. Baker, ed.), Cambridge Univ. Press, 1988, 375-398 ([W 1988], where the conjecture is first stated)
- **Location:** Remark after Corollary 2.2, p. 379
- **Quote:** still it contains non trivial open problems
- **Link:** https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/Durham1986TMGSSV.pdf
- **Relation:** The printed consequence is (log a)(log b) ≠ log c, using x=(1, log a), y=(1+log b, log b), α11=η=1, other parameters 0. It does not reach the target: for log b = conj(log a) the product is the algebraic ρ=|log a|², and ρ is never a log c by Hermite-Lindemann. Changing the printed choice to α21=α22=ρ does give the target, but that change is my own and is not printed. This is the closest sibling found: same hypothesis, same shape of substitution, different conclusion.

### Lead 2: analogue only

- **Citation:** M. Waldschmidt, Hopf algebras and transcendental numbers, in Zeta Functions, Topology and Quantum Physics, Developments in Math. 14, Springer, 2005 (preprint dated 18 Aug 2004). The same consequence is in Open Diophantine Problems, Mosc. Math. J. 4 (2004), after Conjecture 3.5, and in the Arizona Winter School 2008 Lecture 5 notes, after Conjecture 5.9.
- **Location:** §1, after Conjecture 1.5 (preprint pp. 4-5)
- **Quote:** we deduce from Conjecture 1.5 the transcendence of
- **Link:** https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/ztq2003.pdf
- **Relation:** The printed consequence is that e^{λ²} is transcendental, using x1=y1=γ=1, x2=y2=λ, α=0, β11=1, other β=0. This excludes λ² ∈ L, not λ·conj(λ) ∈ Q̄, and conjugation is not mentioned. Replacing y2=λ by conj(λ) and setting β22=|λ|² gives the target, but that step is my own translation and appears in no source read. The target is not implied by the printed statement.

### Lead 3: analogue only

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000
- **Location:** §11.6.1, after Conjecture 11.17, p. 399; compare §12.4.3, pp. 437-438, for the strong five conjecture
- **Quote:** the strong four exponentials Conjecture implies the following refinement of the Hermite-Lindemann's Theorem
- **Link:** https://doi.org/10.1007/978-3-662-11569-5
- **Relation:** p. 399 derives |λ| transcendental from the strong FOUR conjecture, with x1=1, x2=λ, y1=1, y2=conj(λ). With x1=1 the fifth exponent η x2/x1 is already λ ∈ L, so the same choice proves the target. The book never says so: pp. 437-438 state the strong five conjecture as a weaker statement and do not mention |λ|. Reaching the target means combining the two passages, which is my step. The strong four version is the known nearby result and is weaker than the target, because its hypothesis is stronger.

## Notes

**Verdict: no find.** I found no printed statement that the strong (sharp) five exponentials conjecture implies Diaz's C(|u|). The "not found" stands within the sources I reached. The search was cut short: the shared WebSearch budget ran out and citation chasing failed. It stopped at about 8 minutes of the 30, so this is not an exhaustive sweep.

**What the literature says about the two statements**
- The conjecture appears as "strong five" in Waldschmidt 1988, DALAG and ODP, and as "sharp five" in the 2003-2004 Hopf algebras paper and talks. It is the same statement under both names, up to swapping x1 and x2.
- Its printed consequences are only:
  - (log a)(log b) ≠ log c (Durham, p. 379);
  - e^{π²} and e^{λ²} transcendental (ztq2003, ODP, AWS notes, slides).
- Both are of the form ℓℓ′ ∉ L. Neither reaches an algebraic product, and neither involves conjugation.
- Diaz's C(|u|) is credited everywhere to the strong FOUR conjecture or to Schanuel:
  - Diaz 2004 §5.1 and its closing remarks;
  - Diaz 2007 §1.2, via (PQ), (P2) and (M);
  - DALAG p. 399;
  - DION 2005 after Proposition 3.5 and Conjecture 5.2;
  - Warner, §45.
- Diaz's three papers mention five exponentials only as the theorem, never the conjecture. DION 2005 and the Hyderabad paper have no strong five statement.
- The two streams never meet in anything I read. No page carries both the strong five conjecture and |u|. DALAG comes closest, with p. 399 and pp. 437-438 in separate chapters.

**Why this is close to a miss in print rather than a hard gap**
My own check of the derivation: take x1=1, x2=u, y1=1, y2=ū. These pairs are Q-independent by Hermite-Lindemann, since u ∉ Q̄ if e^u is algebraic. Take α11=1, α12=α21=0, α22=ρ=uū, η=1, β=0. The five exponents are 0, ū, u, 0, u, all with algebraic exponentials. The conclusion forces ū=0, a contradiction.

So DALAG's p. 399 substitution works unchanged, with the fifth condition automatic because x1=1. Anyone comparing DALAG p. 399 with the sharp five example "x1 = y1 = γ = 1" sees it at once. That supports the "routine" class of the entry, but it is not a citation.

The leads are listed as analogues, and I do not claim "implies" for any of them. In each one, the step that reaches the target is mine.

**Checks on the printed statements**
- Durham's example does not cover the target. ρ=|λ|² is algebraic and nonzero, so e^ρ is transcendental and ρ is not a log c. The printed inequality is silent on the target case.
- Sarrebruck 2003 slides label the same statement "Corollary 2 (Strong Five Exponentials Theorem)", with the y3=γ/x1 proof. That proof ignores the case where y1, y2, γ/x1 are dependent. The other 2003 talks and ztq2003 call it a conjecture and flag that case as the difficult one. If read literally, the slide would prove Diaz's conjecture; I treat it as a slip or draft. It does not mention |u|.
- The Durham statement comes from an OCR text layer. I checked the substitution by computing it myself, and the formulas are consistent with the remark, but I did not view the page image.

**What I could not settle**
- Forward citations of Diaz 2004 and 2007 and of Waldschmidt's DION paper were not enumerated. OpenAlex and Semantic Scholar were down or rate limited, and zbMATH's rf: filter returned nothing.
- zbMATH's listing of 11J81 items on four and six exponentials shows no paper aimed at this question, but listing is not reading.
- Post-2010 papers, theses and Murty-Rath remain the unchecked places. The most worthwhile follow-up is forward citations of Diaz 2007 (doi 10.5802/jtnb.592) once OpenAlex responds, plus the UFPB thesis.

## Read

- Waldschmidt, Durham 1986 / New Advances in Transcendence Theory 1988 — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/Durham1986TMGSSV.pdf: §2c, Corollary 2.2 and the strong five exponentials remark, p. 379
- Waldschmidt, Hopf Algebras and Transcendental Numbers (ztq2003) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/ztq2003.pdf: §1, Conjecture 1.5 and consequences, pp. 3-5
- Waldschmidt, Open Diophantine Problems, Mosc. Math. J. 4 (2004) — https://arxiv.org/abs/math/0312440: §3, Conjectures 3.3-3.7; passage on Diaz near Conjecture 3.24
- Waldschmidt, Arizona Winter School 2008 Lecture 5 notes — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/AWSLecture5.pdf: Conjecture 5.9 and its consequence; Diaz mentions (keyword-located passages)
- Waldschmidt, DALAG (2000) — https://doi.org/10.1007/978-3-662-11569-5: Remark after Conjecture 1.13; §11.6.1; §12.4.1-12.4.3; Exercises 12.12 and 15.16
- Diaz, Utilisation de la conjugaison complexe..., JTNB 16 (2004) 535-553 — https://emis.univie.ac.at/journals/JTNB/2004-3/pages535-553.pdf: §5.1, C(|u|), Proposition 1; closing remarks of §5
- Diaz, Produits et quotients..., JTNB 19 (2007) 373-391 — https://emis.univie.ac.at/journals/JTNB/2007-2/article04.pdf: §1.2 (PQ, P, Q, M); §2.1 end; §2.2 Theorem 4 statement
- Diaz, La conjecture des quatre exponentielles et les conjectures de D. Bertrand, JTNB 9 (1997) 229-245 — https://www.numdam.org/item/JTNB_1997__9_1_229_0.pdf: Note in §I; passage around the five exponentials theorem in §IV; keyword check for module and forte
- Waldschmidt, The role of complex conjugation in transcendental number theory, DION 2005 — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf: §3 including Proposition 3.5; §5 including Conjecture 5.2; start of §6
- Waldschmidt talk slides: Wien-ESI; Bangalore 2003; NCTS 2003; Sarrebruck 2003 — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Wien-ESI.pdf: Sharp five exponentials slides and their stated consequence
- Waldschmidt, On Ramachandra's contributions to transcendental number theory (2013) — https://hal.science/hal-01112588v1: §3, five exponentials and strong four exponentials
- Waldschmidt, The four exponentials problem and Schanuel's conjecture (survey) — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf: Theorem 4 and the following discussion; keyword check for Diaz and strong five returned nothing relevant
- G. Warner, The Exponential World, arXiv:2105.05809 — https://arxiv.org/abs/2105.05809: Keyword hits for Diaz, strong four and |λ|, with the context of §44-7 and the §45 hit lines (S4EC ⇒ |λ| transcendental); no strong or sharp five statement found

## Screened only

- Waldschmidt, Variations on the six exponentials theorem (Hyderabad 2005) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Hyderabad.pdf
- Waldschmidt, Further variations on the six exponentials theorem, Hardy-Ramanujan J. 28 (2005); keyword check only, its text layer is noted as poor — https://hal.science/hal-00411308
- Waldschmidt, DION 2005 Beamer slides; keyword hits only (Diaz's conjecture stated) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005Beamer.pdf
- Waldschmidt, Cetraro lectures, Heidelberg 2009 VI, Schanuel 2014 slides and De Giorgi 2014 text; keyword checks for five exponentials and |u| — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Cetraro.pdf
- Waldschmidt, Isao 1986 survey (five exponentials theorem only); LIL 1992 Ch. 13 exercises (theorem only), by keyword — https://webusers.imj-prg.fr/~michel.waldschmidt/
- Roy, Matrices whose coefficients are linear forms in logarithms, JNT 41 (1992); keyword check, named nearby — https://doi.org/10.1016/0022-314X(92)90081-Y
- Delaygue, A Lindemann-Weierstrass theorem (arXiv:2210.12046); keyword check, no hits — https://arxiv.org/abs/2210.12046
- arXiv:1004.1668, Some transcendental functions with an empty exceptional set; keyword check, no hits — https://arxiv.org/abs/1004.1668
- Fischler, Pondicherry 2000 notes; keyword check, no hits — https://www.imo.universite-paris-saclay.fr/~stephane.fischler/inde/inde_fischlerpondichery.pdf
- Habsieger, A few remarks related to the four exponentials conjecture, Publ. Math. Debrecen (2007); zbMATH summary only, about 2^t and 3^t — https://doi.org/10.5486/pmd.2007.3505
- zbMATH API listings for four and six exponentials in 11J81, strong four exponentials, and author Diaz; review of Diaz 2007 by Waldschmidt, Zbl 1163.11055 — https://zbmath.org/1163.11055
- Wikipedia, Six exponentials theorem and Four exponentials conjecture (secondary, search summaries only) — https://en.wikipedia.org/wiki/Six_exponentials_theorem
- Dasgupta, Ranks of matrices of logarithms of algebraic numbers I, arXiv:2303.02037; search listing only — https://arxiv.org/abs/2303.02037

## Inaccessible

- UFPB repository item 20501, surfaced by a search on Diaz-type conjectures — https://repositorio.ufpb.br/jspui/handle/123456789/20501: The server returned HTTP 500, so the content was never seen.
- Murty and Rath, Transcendental Numbers, Springer 2014 — 10.1007/978-1-4939-0832-5: Paywalled book; only the zbMATH review was seen.
- Diaz, Transcendance et indépendance algébrique: liens entre les points de vue elliptique et modulaire (cited as [Di2] in ODP): Not opened in this run; it concerns the modular setting and is unlikely to be relevant.
- OpenAlex and Semantic Scholar citation chasing on Diaz 2004 and 2007 — https://api.openalex.org: The APIs returned 429 or 503 on every attempt, so forward citations were not enumerated. zbMATH's reference filter returned no results.
- Later web searches, including Habsieger's text and post-2010 papers: The session's shared WebSearch budget ran out after five of my queries, and I did not work around it. The user can continue with a follow-up or raise the limit.

## Queries

- Diaz conjecture modulus of logarithm of algebraic number transcendental "strong five exponentials" OR "five exponentials" |log α|
- Diaz "module" logarithme nombre algébrique transcendant conjecture "cinq exponentielles" forte produits de logarithmes
- Waldschmidt sharp five exponentials conjecture consequence transcendence e^{π²} product of logarithms algebraic Diaz conjecture |u| algebraic e^u transcendental
- "if |u| is algebraic" OR "|u| algebraic" "e^u" transcendental conjecture Diaz generalization Hermite-Lindemann complex conjugation
- product of two logarithms of algebraic numbers not algebraic conjecture "five exponentials" Waldschmidt log a log b ≠ log c modulus of logarithm transcendental
- "conjecture" Diaz "C(|u|)" OR "|log α|" transcendental module de log nombres algébriques "quatre exponentielles" thèse transcendance |λ|
- "strong five exponentials" conjecture implies absolute value of logarithm of algebraic number transcendental, x_2/x_1 logarithm, complex conjugate
- zbMATH API: "four exponentials" & cc:11J81; "six exponentials" & cc:11J81; "exponentielles" & cc:11J81; "strong four exponentials"; "logarithms of algebraic numbers" & "exponentials"; Diaz & "exponential" & conjugation; "quadratic relations" & logarithms; au:Diaz, Guy & cc:11J81; rf:1163.11055
- arXiv API: all:"five exponentials", all:"sharp five exponentials", all:"strong five exponentials", all:"strong four exponentials", abs:"four exponentials" AND abs:logarithm, all:"six exponentials" AND all:conjugation
- HAL API: text:"quatre exponentielles", "cinq exponentielles", "five exponentials", "four exponentials"
- Local library grep across sources/: strong five, cinq exponentielles, five exponentials, |u|, C(|u|), modulus, module
