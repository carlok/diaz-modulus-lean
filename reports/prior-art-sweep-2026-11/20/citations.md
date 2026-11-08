# Entry 20, strategy: citations

## Target, as restated by the searcher

Kirby's Weak Schanuel for n=2: if trdeg_Q Q(a,b,e^a,e^b) < 2, then ma+nb lies in 2πiZ for some integers (m,n) ≠ (0,0). Call u ≠ 0 a candidate if |u| and e^u are both algebraic; Diaz's conjecture says no candidate exists. The target has three parts. (1) Under that n=2 case, every candidate has Re u ≠ 0 and Im u a nonzero rational multiple of π. (2) Under the same hypothesis, Diaz's conjecture is equivalent to one statement: t²+π² is transcendental for every real t ≠ 0 with e^t algebraic. (3) If in addition trdeg_Q Q(π,a,e^a) ≥ 2 for every a outside 2πiQ (Schanuel over the kernel, n=1), then Diaz's conjecture holds. The argument is short. Apply the hypothesis to (u, ū), whose field has trdeg ≤ 1 because ū = ρ/u. This gives (m+n)Re u = 0 and (m−n)Im u ∈ 2πZ. If Re u = 0 or Im u = 0 then u is algebraic, which contradicts Hermite-Lindemann, so m = −n ≠ 0. Rescaling by the rational Im u/π gives the single relation, and u = t+iπ gives the converse.

## Leads

### Lead 1: analogue only

- **Citation:** M. Waldschmidt, The role of complex conjugation in transcendental number theory, Proceedings of DION 2005 (International Conference on Diophantine Analysis and Related Fields), 2005/2006
- **Location:** Section 5, the sentence between Theorem 5.1 and Conjecture 5.2
- **Quote:** the number |λ|² = λλ̄ should be transcendental
- **Link:** https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf
- **Relation:** My own specialisation: λ = t+iπ, a logarithm of −e^t, gives |λ|² = t²+π², so the single relation is one instance of the expected transcendence of |λ|². The source derives this from the strong four exponentials conjecture and never singles out Im λ ∈ πQ. It does not use Kirby's Weak SC, and it does not reduce Diaz's conjecture to that instance. The part not found is not reached.

### Lead 2: analogue only

- **Citation:** C. Bertolin, P. Philippon, B. Saha, E. Saha, Semi-abelian analogues of Schanuel conjecture and applications, arXiv:2010.15170v2
- **Location:** Remark 4.11, following Conjecture 4.10
- **Quote:** This is Schanuel conjecture (up to the transcendency of π).
- **Link:** https://arxiv.org/abs/2010.15170
- **Relation:** With s=1 the inequality is trdeg over Q(2iπ) of Q(2iπ,τ,log τ) ≥ dim of the span of log τ in C/2iπQ. Together with the transcendence of π, this is exactly the target's hypothesis trdeg Q(π,a,e^a) ≥ 2 for a outside 2πiQ (my translation). So it prints the hypothesis of the third part only. It has no link to moduli, conjugation, Weak SC or Diaz's conjecture, so neither reduction is reached.

## Notes

**Result: no printed statement of the part not found.** The two leads are analogues only, and neither reaches it.

**Backward from Diaz 2004.** Proposition 1 of §5 proves C(|u|) from full Schanuel. The proof treats u in R∪iR by Hermite-Lindemann, then applies Schanuel directly to the Q-free pair (u, ū). Diaz never needs a relation modulo 2πi, because full Schanuel sees no kernel. The case the target is about is u−ū ∈ 2πiQ, i.e. e^u real. That case only appears when you weaken to Kirby's form, and it appears nowhere in Diaz 2004, Diaz 2007 or Waldschmidt 2005.

Diaz 2007 goes through (PQ) and (M). Conjecture (M) has hypothesis (λ, λ̄) Q-free, so it covers λ = t+iπ, again without isolating it.

**Backward from Kirby.** Conjecture 1.5 reads as the target quotes it. Proposition 1.6 gives the chain SC ⇒ SC over the kernel ⇒ Weak SC. Kirby's example separating the last two is e and π algebraically dependent, the same kind of obstruction as the target's residual relation, but it is a remark about the conjectures, not about moduli. The note has no number-theoretic application of Weak SC at n=2, and no mention of Diaz or conjugation.

**Forward from Kirby.** Semantic Scholar gives one citing work (arXiv:1609.06025, real exponential hypersurfaces, off target by title). The citation data here is thin. Most use of 'Weak SC' in the logic literature that I could see is about pseudo-exponentiation and the kernel axiom (Kirby-Zilber's SPOK), not transcendence consequences for specific numbers.

**Forward from Diaz 2004.** Semantic Scholar lists eight entries, all at or before 2017, and Waldschmidt's and Diaz's follow-ups are in the local library. I judged Butler et al. only from the title, and Waldschmidt's six-exponentials variation paper likewise, so these two are the weakest parts of the check.

**After 5 October 2026.** The arXiv listings for Schanuel and for math.NT transcendence show nothing relevant. The two nearest are Bays (2610.27963, exponential-algebraic closedness) and Waldschmidt (2610.39810, an expository piece that mentions neither Diaz nor Schanuel). No new Diaz or modulus paper surfaced. This covers arXiv and zbMATH records only; a journal article not on arXiv since October would not be caught.

**Name clash, confirmed.** 'Weak Schanuel' has at least three meanings in print: Kirby's Conjecture 1.5; Calegari-Mazur's algebraic independence of logarithms (via Waldschmidt's four exponentials survey); and Macintyre-Wilkie's (via Berarducci-Gallinaro, Conjecture 13.4). Kirby 2010 has a further 'weak Schanuel property' for exponential dimension. Searches on the phrase are noisy, and only the first meaning matches the target.

**Related but not reaching.** Roy-Waldschmidt 1997 Theorem 0.2 is homogeneous, so t²+π²−a with a ≠ 0 does not fit directly, and I did not find a printed inhomogeneous version covering the rank-2 pair (t, iπ). An unconditional result of that form would make the target's reduction unnecessary, but nothing I read gives one.

**Remark on class.** I rechecked the deduction (see the target field). It is a few lines and uses only Hermite-Lindemann and the parity of (m+n, m−n). That supports the blueprint's 'routine' label, and it makes a stray remark in an unindexed paper or talk harder to rule out by search, since such a remark would not need a title or abstract.

**What I could not settle.**
- OpenAlex was rate-limited throughout (HTTP 429), so forward citations rest on Semantic Scholar, which is known to be incomplete, particularly for arXiv-only notes such as Kirby's.
- Google Scholar-style citing lists were not used.
- Formula strings like 't²+π²' are not searchable in PDFs through the available engines, and the local regex is at the mercy of OCR.
- Keyword searches of PDFs would miss a statement written without the words Diaz, conjugate or kernel.
- Most entries in 'read' are keyword-guided passages, not whole papers, as their section fields say.

**Time.** Started 18:13 CET. The last date check was 18:21, partway through; I stopped within the time box, with OpenAlex still blocked.

## Read

- J. Kirby, Variants of Schanuel's conjecture, arXiv:1801.08765 — https://arxiv.org/abs/1801.08765: Section 1 read, including Conjectures 1.4 and 1.5, Proposition 1.6 and the remark after it. Whole text keyword-searched: no Diaz, no conjugation, no application to moduli.
- G. Diaz, Utilisation de la conjugaison complexe..., JTNB 16 (2004) 535-553 (local copy) — https://www.numdam.org/item/JTNB_2004__16_3_535_0: Section 5: Conjecture C(|u|), Proposition 1 and its proof, Proposition 2. The proof splits u in R∪iR from (u,ū) Q-free and applies full Schanuel. It never considers a relation modulo 2πi.
- G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes..., JTNB 19 (2007) (local copy) — https://doi.org/10.5802/jtnb.592: Passages on C(|u|) and Conjecture (M), and the statement that the conjectures follow from Schanuel. (M) follows from (PQ); no Weak SC, no πQ.
- M. Waldschmidt, The role of complex conjugation in transcendental number theory (local copy) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf: Section 5 around Theorem 5.1 and Conjecture 5.2, and the Schanuel passages
- Roy and Waldschmidt, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. Sci. ENS 30 (1997) (local copy): Introduction: Theorems 0.1 and 0.2, Conjecture 0.3. Theorem 0.2 concerns homogeneous polynomials only, so t²+π²=a with a ≠ 0 is not directly covered.
- Roy and Waldschmidt, Quadratic relations between logarithms of algebraic numbers, Proc. Japan Acad. 71 (1995) (local copy): Section 1 statements, Theorems 1 and 2. OCR is two-column and garbled.
- Bertolin, Philippon, Saha, Saha, arXiv:2010.15170 — https://arxiv.org/abs/2010.15170: Conjecture 4.10 and Remark 4.11 only
- M. Bays, SEAC from EAC modulo Schanuel, arXiv:2610.27963 (20 Oct 2026) — https://arxiv.org/abs/2610.27963: Title, abstract opening and keyword search of the full text. It concerns exponential-algebraic closedness; no Diaz, no modulus.
- M. Waldschmidt, An introduction to the strategy of transcendence proofs, arXiv:2610.39810 (29 Oct 2026) — https://arxiv.org/abs/2610.39810: Keyword search of the full text: no Diaz, no Schanuel; 'conjugates' occurs only in the algebraic sense
- Kirby and Zilber, Exponentially closed fields and the conjecture on intersections with tori, arXiv:1108.1075 — https://arxiv.org/abs/1108.1075: Keyword search and passages on the Schanuel Property over the kernel. Model theory only, no application to moduli.
- Berarducci and Gallinaro, On the elementary theory of the real exponential field, arXiv:2603.08365v3 — https://arxiv.org/abs/2603.08365: Keyword search; Conjecture 13.4 is the Macintyre-Wilkie weak Schanuel, a different statement
- Fischler-type density paper, Density of rational points on commutative group varieties and small transcendence degree, arXiv:1011.3368 (cites Diaz 2004) — https://arxiv.org/abs/1011.3368: Keyword search of the Diaz passages: restriction of scalars and four exponentials. No Weak SC, no kernel relation.
- M. Waldschmidt, Transcendence of Periods: the state of the art (local and author's copy): Keyword search: Diaz is cited only for the derivative-free Hermite-Lindemann proof
- M. Waldschmidt, On Ramachandra's contributions to transcendental number theory (local copy): Keyword search of the Diaz passages: conjugation trick only
- Bertolin and Waldschmidt, Variations on Schanuel's Conjecture for elliptic and quasi-elliptic functions I, arXiv:2504.14048 — https://arxiv.org/abs/2504.14048: Conjecture 2.1 with its exceptional 2πiQ case, by keyword search. Elliptic setting, nothing on moduli.
- C. Bertolin, A conjecture in Schanuel style for 1-motives, arXiv:2509.08700v3 — https://arxiv.org/abs/2509.08700: Keyword search of the 2πiQ and 'unless' clauses: 1-motive setting, nothing on moduli
- G. Warner, The Exponential World, arXiv:2105.05809 — https://arxiv.org/abs/2105.05809: Keyword search: it reproduces Diaz's Theorem on e^{tβ}, lecture notes with nothing new here
- Kirby, Macintyre and Onshuus, The algebraic numbers definable in various exponential fields, arXiv:1101.4224 — https://arxiv.org/abs/1101.4224: Schanuel passages by keyword search: definability only
- J. Kirby, Finitely presented exponential fields, arXiv:0912.4019 — https://arxiv.org/abs/0912.4019: Keyword search: its one use of complex conjugation is an analogue on B_kappa

## Screened only

- arXiv listing, all:Schanuel sorted by date, with all entries from Oct-Nov 2026 by title: 2610.35409, 2610.30025, 2610.28477, 2610.16993, 2610.09714, 2610.06518 — https://arxiv.org/a/search
- arXiv listing, math.NT transcendence and algebraic independence, 15 Sep to 8 Nov 2026, by title; nothing relevant apart from 2610.39810
- J. Kirby, Exponential algebraicity in exponential fields, BLMS 42 (2010), arXiv:0810.4285: its 'weak Schanuel property' concerns the dimension of exponential algebraic closure — https://arxiv.org/abs/0810.4285
- J. Kirby, A Schanuel property for exponentially transcendental powers, arXiv:0810.4457 (keyword search found nothing) — https://arxiv.org/abs/0810.4457
- M. Viale, Forcing the truth of a weak form of Schanuel's conjecture, Confluentes Math.: abstract only — https://www.numdam.org/articles/10.5802/cml.33
- Butler and co-authors, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. (cites Diaz 2004): title only — https://doi.org/10.1007/s11139-015-9728-2
- Waldschmidt, Variations on the six exponentials theorem (cites Diaz 2004): title; the local copy was not opened in detail — https://doi.org/10.1007/978-93-86279-23-1_23
- Waldschmidt, Four exponentials problem and Schanuel's conjecture (local): matched only on the Calegari-Mazur 'weak Schanuel', which the target already separates
- Pila, conjecture equivalent to Schanuel plus multiplicative Zilber-Pink, Rend. Lincei 36 (2025): zbMATH summary — https://doi.org/10.4171/rlm/1086
- zbMATH Open, any:Schanuel py:2024-2026, 100 records: indexed search for modulus, conjugate, kernel and Diaz returned nothing relevant
- zbMATH Open, any:'weak Schanuel': returned Kirby 2010 and others
- Gun, Murty and Saha-type abelian analogue, arXiv:1811.05167: keyword search found nothing — https://arxiv.org/abs/1811.05167
- Waldschmidt, On Schanuel's Conjecture, elliptic and quasi-elliptic functions (January 2025), and arXiv:2504.14041: keyword search found nothing
- Marques and Sondow, Schanuel's conjecture and algebraic powers, arXiv:1010.6216; Cheng et al., Some consequences of Schanuel's Conjecture, arXiv:0804.3550: keyword search for Diaz, conjugation and kernel found nothing

## Inaccessible

- OpenAlex forward citations of Diaz 2004 and of Kirby's note: HTTP 429 on every attempt across the session, including through the index tool. Only the record for Diaz 2004 returned once (9 citing works, not listed).
- zbMATH citing-works query for Zbl 1071.11046: the rf: query returned HTTP 404 through the fetch tool; the direct API call failed certificate verification and I did not bypass it
- D. Roy, summer school 2008 lecture 5 PDF — https://mysite.science.uottawa.ca/droy/summer-school-2008/droy_lecture5.pdf: HTTP 404
- Viale full text via Numdam — https://www.numdam.org/articles/10.5802/cml.33: the URL served a page rather than a PDF, so no text was extracted; the abstract was enough to judge it off target

## Queries

- Semantic Scholar citations and references of ARXIV:1801.08765 (1 citation returned)
- Semantic Scholar citations of DOI:10.5802/jtnb.459 (8 returned)
- zbMATH: any:'weak Schanuel'; any:Schanuel py:2024-2026; ti:'conjugaison complexe' au:Diaz
- arXiv API: all:'Schanuel'; all:'weak Schanuel'; abs:Schanuel AND abs:modulus; abs:Schanuel AND abs:conjugation; abs:Hermite-Lindemann AND abs:modulus; abs:Schanuel AND abs:kernel; abs:'algebraic modulus' AND abs:transcendental; abs:'six exponentials' AND abs:conjugation; math.NT transcendence, latest
- web: weak Schanuel Kirby modulus Diaz conjecture
- web: Diaz conjecture e^u and |u| algebraic; Schanuel implies
- web: weak Schanuel t^2+π^2 conjugate logarithm
- web: Schanuel over the kernel transcendence consequence
- web: transcendence (log α)^2+π^2, log 2 and π
- web: Diaz conjecture |u| cited 2020s
- web: Kirby Variants cited 2024-2026
- web: Weak SC kernel conjugate u ū
- web: Bertolin Waldschmidt trdeg Q(π,a,e^a) ≥ 2
- web: Kirby Macintyre Onshuus conjugation
- web: C(|u|) module algébrique 2025 2026
- web: e^u real, Im u in πQ, |log α|^2
- web: π^2+log^2 transcendental, strong four exponentials
- local library regex: t²+π², e^u réel, Im u ∈, |u| algébrique, Diaz with modulus, across all .txt files except n3-lit and dasgupta-kakde
