# Entry 17, strategy: citations

## Target, as restated by the searcher

Let t0, t1 be real with e^{t0}, e^{t1} algebraic. If t0²+π² and t1²+π² are both rational, then t1 = ±t0. In particular (log 2)²+π² and (log 3)²+π² are not both rational. Separately, if t ≠ 0 is real with e^t algebraic and t²+π² rational, then e^{iγ/π} is transcendental for every non-zero rational γ. So a logarithm t+iπ of a negative algebraic number with rational squared modulus, and an algebraic e^{iγ/π}, cannot coexist.

## Leads

### Lead 1: implies

- **Citation:** D. Roy, M. Waldschmidt, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. Sci. ENS (4) 30 (1997), 753-796
- **Location:** §7, Corollaire 7.3, p. 791 (statement checked on the page image; proof pp. 791-792)
- **Quote:** un élément de L qui n'est ni réel ni imaginaire pur
- **Link:** https://eudml.org/doc/82449
- **Relation:** My translation; the corollary does not mention these numbers. It says: for q a binary quadratic form with non-zero discriminant and λ in L neither real nor purely imaginary with λ, λ̄ algebraically dependent, exp(√q(λ,λ̄)) is transcendental. Suppose r0 = t0²+π² and r1 = t1²+π² are rational with t1² ≠ t0². Both t's are non-zero since π² is irrational. Put λ = t0+iπ, c = r1/r0 (rational, ≠ 0, 1), q(X,Y) = cXY + (X−Y)²/4. The discriminant is c²−c ≠ 0, and λλ̄ = r0 gives the dependence. Then q(λ,λ̄) = r1−π² = t1², so exp(√q) = e^{±t1} is algebraic, a contradiction. Hence t1 = ±t0, and t0 = log 2, t1 = log 3 gives the pair. This reaches parts 1 and 2 of the target, not the e^{iγ/π} statement.

### Lead 2: implies

- **Citation:** D. Roy, M. Waldschmidt, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. Sci. ENS (4) 30 (1997), 753-796
- **Location:** Théorème 0.2, p. 755; proof from Théorème 7.1 at p. 791
- **Quote:** (no quote, one quote per response kept for the lead above) Paraphrase: a point …
- **Link:** https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/ASENS_1997_4_30_6_753_0.pdf
- **Relation:** My translation; reaches all three parts. Boundary statement: suppose t ≠ 0 real, e^t algebraic, t²+π² = r in Q, and w = iγ/π in L with γ ≠ 0 rational. Since w·iπ = −γ, the point (t, iπ, w) satisfies X² − Y² + (r/γ)WY = 0, a rank 3 form over Q. The field is algebraic over Q(π), so has transcendence degree 1. A non-degenerate quadric in 3 variables contains no plane, so the subspace is a line over Q̄ and t/(iπ) is algebraic. Gelfond-Schneider then makes t and iπ Q-dependent, impossible for t real non-zero. Uniqueness: r1 X² − r0 Z² − (r1−r0) Y² vanishes at (t0, t1, iπ) with the same conclusion when r1 ≠ r0.

### Lead 3: implies

- **Citation:** D. Roy, M. Waldschmidt, Quadratic relations between logarithms of algebraic numbers, Proc. Japan Acad. Ser. A 71 (1995), 151-153
- **Location:** Theorem 2, p. 151 (checked on the page image); stated without full proof, the proof deferred to the 1997 paper
- **Quote:** (no quote) Paraphrase: same statement as Théorème 0.2 of the 1997 paper, for transcendence …
- **Link:** https://projecteuclid.org/download/pdf_1/euclid.pja/1195510604
- **Relation:** Same two quadratic forms and the same linear-subspace argument as for Théorème 0.2 above; my translation. This is the earliest printed statement I found that implies the target, as an announcement only.

### Lead 4: analogue only

- **Citation:** D. Roy, M. Waldschmidt, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. Sci. ENS (4) 30 (1997), 753-796
- **Location:** Corollaire 7.4 and the example after it, p. 792 (read in the text layer, not checked on the page image)
- **Quote:** (no quote) Paraphrase: if log 2 and π are algebraically dependent, the exponential of …
- **Link:** https://eudml.org/doc/82449
- **Relation:** The only printed appearance of the number (log 2)²+π² I found. If that number is rational, the example's conclusion is already Hermite-Lindemann and says nothing about log 3. It does not imply the target by itself; Corollaire 7.3, one step earlier, does.

## Notes

**Result.** I found no printed statement of the pair, of the uniqueness, or of the boundary statement. The "not found" still weakens: Roy-Waldschmidt 1997 prints a corollary from which the first two parts follow in one substitution, and its Théorème 0.2 reaches all three parts. The substitutions are mine; neither the pair nor the uniqueness is printed there.

**Strongest lead: RW97 Corollaire 7.3 (p. 791).**
- It says: q a binary quadratic form with non-zero discriminant, λ in L neither real nor purely imaginary, λ and λ̄ algebraically dependent. Then exp(√q(λ,λ̄)) is transcendental.
- Take λ = t0+iπ, c = r1/r0, q = cXY + (X−Y)²/4.
- The discriminant is c²−c. It is non-zero exactly when r1 ≠ r0.
- Then q(λ,λ̄) = r1 − π² = t1², so the exponential is e^{±t1}, which is algebraic. That is the contradiction.
- With t0 = log 2 and t1 = log 3, r1 = r0 is impossible, so the pair is settled.

**Boundary statement, via Th. 0.2.**
- The relation w·iπ = −γ turns t²−(iπ)² = r into the homogeneous rank 3 relation X²−Y²+(r/γ)WY = 0 at (t, iπ, w).
- The cone contains no plane, so t/(iπ) would be algebraic, against Gelfond-Schneider.
- This also shows that rationality of r and γ is not essential on this route: algebraic r and γ give a form over Q̄ just as well. This remark is my own observation, not printed, and the verifier should check it. The target's route needs rationality to keep the matrix entries in L.

**Relation to the named inputs.** The target's route goes through Bro74 Corollaries 5 and 7, which I confirmed are the right shape.
- Uniqueness: r1(t0−iπ)(t0+iπ) = r0(t1−iπ)(t1+iπ) is a vanishing 2×2 determinant with entries in L, in transcendence degree 1.
- Boundary: I checked Corollary 5 at η = t/π. It gives −exp(ir/π), since t²/π = r/π − π. Its statement is garbled in the OCR, so I reconstructed it from the printed choice of parameters.

RW97 is not named in the target as nearby, so I list it as a lead. It is, however, a strengthening of an input already known to this project. The entry stays "routine", and this does not bear on any novelty beyond that. The verifier should decide whether a one-line derivation from RW97 counts as a find, or only as a better source line for the entry. My suggestion is a citation note rather than a retraction of the routine class: "follows at once from RW97 Cor. 7.3 / Th. 0.2".

**Other sources read.**
- RW97 Cor. 7.4's example prints the number (log 2)²+π² under a conditional. It is an analogue only.
- RW95 Theorem 2 is the same statement as Th. 0.2, announced with no full proof there.
- Diaz 2004 Th. 6 has hypotheses that exclude conjugate pairs, by his own remark.
- Diaz 2007 §1.3 says he has no example illustrating the modulus case (c) of the Théorème 2 family. It contains no rational-modulus uniqueness. Its conjectures (M), (P3) and (C4) are conjectural versions in the same area.
- Waldschmidt's DALAG §11.6.1 and his 2005 paper state only the conjecture on moduli.

**Coverage limits.**
- The forward citation check is incomplete. Semantic Scholar worked; OpenAlex returned 429 or 503 throughout.
- zbMATH produced nothing before the timeout.
- WebSearch was cut off by the shared budget after three completed searches and one refusal.
- Post-5 October 2026 coverage therefore rests on Semantic Scholar citer lists and noisy arXiv listings. The only post-date citer of the sources checked is arXiv 2611.01711, by title only, with no sign of relevance.
- I do not claim absence of newer work beyond this.
- I worked about 10 minutes of wall clock, stopping because the search tools ran out rather than the time box. I did not read RW97's own reference [21] or Roy-Waldschmidt's companion [23], where more explicit examples might appear.

**Verification checks.**
- Cor. 7.3's statement was read on the page image at 90 dpi. The coefficient field in its q ∈ Q[X,Y] looks like Q or Q̄, and the argument works either way since my q is rational.
- The algebra for q and the rank 3 forms was done by hand and not machine-checked.
- Local temporary page images are in (temp path)

## Read

- Roy-Waldschmidt 1997, Ann. Sci. ENS 30 — https://eudml.org/doc/82449: Introduction, Théorèmes 0.1-0.2, Conjecture 0.3 (pp. 753-755); §7 through Corollaire 7.4 (pp. 790-792). Pages 790-791 checked as images.
- Roy-Waldschmidt 1995, Proc. Japan Acad. 71A — https://projecteuclid.org/download/pdf_1/euclid.pja/1195510604: p. 151, Theorems 1-2, checked as an image; text layer of the start of p. 152
- Brownawell 1974, J. Number Theory 6, 22-31: Main theorem and Corollaries 1-7 (pp. 22-23), local copy
- Diaz 2004, J. Théor. Nombres Bordeaux 16, 535-553: §1, start of §2 (Théorème 1), §5.1, Théorème 6, local copy, garbled text layer
- Diaz 2007, J. Théor. Nombres Bordeaux 19, 373-391: §1 (conjectures PQ, P, Q, M, Théorème 2), Corollaires 4-6, Théorèmes 4, 6, 7, §2.4, local copy
- Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (2000): §11.6.1 passage on Diaz's modulus conjecture; pattern searches only elsewhere, local copy
- Waldschmidt, The four exponentials problem and Schanuel's conjecture (survey) — https://webusers.imj-prg.fr/%7Emichel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf: Passage on transcendence degree one and Roy-Waldschmidt 1995, local copy

## Screened only

- Waldschmidt 2005, The role of complex conjugation in transcendental number theory (pattern search for moduli, Conjecture 5.2 seen)
- Fischler 2001, Orbits under algebraic groups and logarithms of algebraic numbers, Acta Arith. 100 (pattern search for quadratic and conjugation terms, no hits) — https://doi.org/10.4064/AA100-2-4
- Full local Diaz sources tree (pattern search for π² plus a square, exp(1/π), rational modulus): no statement of the pair; only a height bound in DALAG and exp(1/π) in Diaz 2007
- Semantic Scholar citers of Brownawell 1974 (24 titles), including Algebraic independence of values of Weierstrass elliptic and zeta functions (2026-06-17, before the last check) — https://doi.org/10.1017/S001309152610145X
- Semantic Scholar citers of Roy-Waldschmidt 1997 (25 titles), including Irrationality measures for Γ(1/4) and Γ(1/3) (2026-11-01, title only, apparently unrelated; its abstract lookup did not complete) — https://arxiv.org/abs/2611.01711
- Semantic Scholar citers of Roy-Waldschmidt 1995 (9 titles) and Diaz 2007 (1 title): nothing after 2017 on this topic
- Laurent-Roy 1999 and 2001, Philippon 1997, Diaz 1997, Butler 2017 (titles in the citer lists only; bodies not read)
- arXiv listings for four exponentials, six exponentials, logarithms of algebraic numbers, quadratic relations (the query matched loosely, mostly noise; titles dated after 5 October 2026 looked unrelated)
- Waldschmidt lecture PDFs returned by web search (NCTS 2003, Hyderabad, Hanoi 2021, ColloquiumDeGiorgi 2014): snippets only, no statement of the pair

## Inaccessible

- OpenAlex citation and date-filtered queries: HTTP 429 and 503 on every citation and date-filtered call in three attempts. Only the first DOI lookup worked, and two of its DOIs resolved to unrelated works.
- zbMATH Open API keyword queries: The script timed out at 240 s before any zbMATH result was printed. Not retried.
- Further WebSearch: The shared WebSearch budget for this turn ran out after my third query, so the search stopped there. Keyword searching was not continued through other routes. A follow-up run could continue it.
- Waldschmidt 1973 corollaries: Not opened or read in this run, although a local copy exists. It is a named input, so it was not treated as a lead.

## Queries

- "(log 2)^2 + π^2" rational transcendence Brownawell Waldschmidt
- modulus of logarithm |log(-2)|^2 = log^2 2 + π^2 at least one four exponentials corollary
- quadratic relations logarithms transcendence degree one π^2 sum of squares not both rational Roy Waldschmidt application
- Semantic Scholar citations of Bro74, RW97, RW95, Diaz 2007
- OpenAlex cites filters for Bro74, RW97, RW95, Diaz 2007 (failed: 429/503)
- arXiv API: "four exponentials", "six exponentials", "logarithms of algebraic numbers" in math.NT, "quadratic relations" with logarithms
- Local library patterns: π² plus a square, exp(1/π), rational modulus, quadratic form, RW97 citers
