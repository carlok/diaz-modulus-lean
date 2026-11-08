# Entry 17, strategy: own-field

## Target, as restated by the searcher

Three linked statements. (a) If t0, t1 are real with e^{t0}, e^{t1} algebraic and t0²+π², t1²+π² both rational, then t1 = ±t0. (b) In particular (log 2)²+π² and (log 3)²+π², the squared moduli of log(-2) and log(-3), are not both rational. (c) If t is real and non-zero with e^t algebraic and t²+π² rational, then e^{iγ/π} is transcendental for every non-zero rational γ. So "t²+π² rational" and "i γ/π is a logarithm of an algebraic number" cannot hold together.

## Leads

### Lead 1: implies

- **Citation:** D. Roy, M. Waldschmidt, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. Sci. École Norm. Sup. (4) 30 (1997), no. 6, 753-796
- **Location:** Théorème 0.2, p. 755 (checked on the page image: P has rational coefficients, trdeg >= 2); proof in §7, pp. 790-791
- **Quote:** Alors, ou bien (λ1,...,λn) est contenu dans un sous-espace vectoriel de C^n défini sur Q
- **Link:** https://eudml.org/doc/82449 (PDF: https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/ASENS_1997_4_30_6_753_0.pdf)
- **Relation:** My translation; the paper does not state it. Eliminate the constant to homogenise. (a),(b): let r_j = t_j²+π² > 0 and take P = r1 X² - r0 Y² + (r0-r1) Z² at v = (t0, t1, iπ). All coordinates are logarithms, P(v) = 0, and the field is algebraic over Q(π), so trdeg is 1. Th. 0.2 gives a Q-rational subspace U with v in U, inside {P=0}. If r0 ≠ r1, P is non-degenerate in 3 variables, so dim U <= 1. Then t0 = q·iπ with q rational; t0 real forces t0 = 0, so π² = r0 is rational, a contradiction. Hence r0 = r1 and t1 = ±t0; (b) follows since log 2 ≠ ±log 3. (c): suppose w = iγ/π is a logarithm, r = t²+π². Take P = γX² - γY² + rYZ at (t, iπ, w); P(v) = γr - rγ = 0, determinant -γr²/4 ≠ 0, trdeg 1. So U is a line and iγ/π = q·iπ, making π² = γ/q rational, a contradiction.

### Lead 2: implies

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000
- **Location:** Remarks after Theorem 15.30, p. 593 by the text layer (page not checked on an image); also Proposition 12.25, §12.5
- **Quote:** for any nonzero homogeneous polynomial Q ∈ Q[X1,...,Xn] of degree 2
- **Link:** https://doi.org/10.1007/978-3-662-11569-5 (paywalled; read in the local library copy)
- **Relation:** Same homogenisation as the 1997 lead, my translation. This form says Q-linearly independent logarithms in a field of trdeg 1 satisfy no non-zero rational homogeneous quadratic relation. (b): log 2, log 3, iπ are Q-independent, and r1 X² - r0 Y² + (r0-r1) Z² vanishes there, is non-zero since r0, r1 > 0. (c): t, iπ, iγ/π are Q-independent (t real non-zero; the two imaginary ones are dependent only if π² is rational), and γX² - γY² + rYZ vanishes there. (a): if t0, t1, iπ are Q-dependent, then since t0, t1 are real and iπ is imaginary, t1 = q t0 or t0 = 0. Rationality of t0²+π² and t1²+π² then forces q = ±1 or π² rational. The next sentences in the book call the non-homogeneous case an open extension, e.g. e^{π²}.

### Lead 3: implies

- **Citation:** D. Roy, M. Waldschmidt, Quadratic relations between logarithms of algebraic numbers, Proc. Japan Acad. Ser. A 71 (1995), no. 7, 151-153
- **Location:** Theorem 2, p. 151 (announced, proof sketched; zbMATH Zbl 0860.11040)
- **Quote:** by any homogeneous polynomial of degree 2
- **Link:** https://projecteuclid.org/download/pdf_1/euclid.pja/1195510604
- **Relation:** Earlier announcement of the 1997 Th. 0.2, so the same homogenisation applies. Caveat: the two-column text layer garbles the statement of Theorem 2 and the zbMATH review omits 'homogeneous'; the paper's introduction states it. Use the 1997 statement as the citable one.

### Lead 4: analogue only

- **Citation:** D. Roy, M. Waldschmidt, Ann. Sci. ENS 30 (1997), as above
- **Location:** Corollaires 7.3 and 7.4, pp. 791-792
- **Quote:** le nombre exp(√((log 2)² + π²)) est transcendant
- **Link:** https://eudml.org/doc/82449
- **Relation:** The same number appears: if log 2 and π are algebraically dependent, then exp of the modulus of log(-2) is transcendental. This is conditional, about the exponential of the modulus, and says nothing on rationality of the squared modulus or on a pair. It shows the authors looked at this number but did not print the target. Not a find on its own. The quote is normalised from a garbled text layer.

### Lead 5: analogue only

- **Citation:** G. Diaz, Produits, quotients, inverses de logarithmes de nombres algébriques, J. Théor. Nombres Bordeaux 19 (2007)
- **Location:** §1, Conjectures (P3), (Q3), (M), pp. 375-376
- **Quote:** Pour λ ∈ L̃\Q on a λ² ∉ L̃ et |λ|² ∉ L̃
- **Link:** Local library copy: diaz/diaz-2007-produits-quotients.txt
- **Relation:** Conjecturally, each squared modulus is outside L̃, hence irrational. This is far stronger than (b) but only a conjecture; (Q3) covers e^{i/π} conjecturally too. It proves nothing unconditional about the target. Quote normalised from the text layer.

## Notes

**Result.** I found no printed statement of the pair (log 2)²+π², (log 3)²+π², nor of (a) or (c), but the "not found" is thin. All three follow in a few lines from a printed theorem the target does not list as nearby: Roy-Waldschmidt 1997, Théorème 0.2, also in DALAG after Theorem 15.30. The derivation is mine, so this is "implies", not "same".

**The one idea.** Th. 0.2 is homogeneous, and the authors say removing homogeneity would be very interesting. A single relation t²+π² = r is inhomogeneous and stays out of reach. Two inhomogeneous relations have a homogeneous combination, because the constant can be eliminated:

- For (a),(b): r1(X²-Z²) - r0(Y²-Z²) at (t0, t1, iπ).
- For (c): the relation Y·Z = -γ supplies the second constant, giving γ(X²-Y²) + rYZ at (t, iπ, iγ/π).

Checks done by hand:

- P(v) = 0 in both cases.
- Both forms are non-degenerate in three variables (first case when r0 ≠ r1), so a rational isotropic subspace has dimension at most 1.
- The transcendence degree is 1, since everything is algebraic over Q(π).
- No hypothesis beyond those stated in the target is used.

For (c) the hypothesis t ≠ 0 is automatic, since t = 0 would make π² rational.

**How much this changes the entry.** The target's own route is Brownawell Cor. 7 and Cor. 5, and RW97 says Th. 0.1 at d = l = 2 is the Brownawell/Waldschmidt case. Th. 0.2 is proved from Th. 7.1, a far stronger result than needed here. So the lead does not make the target deeper or shallower; it agrees with the "routine" class. It does show the statement is a direct specialisation of a published theorem beyond the named inputs. If the entry stays in chapter 14, I would suggest "not found stated, but a two-line specialisation of RW97 Th. 0.2" over a source line naming only Bro74. That decision is the authors'.

**What I checked against the page.** Th. 0.2 on p. 755 from the page image: coefficients in Q with no bar (Conj. 0.3 on the same page does carry the bar), subspace defined over Q, conclusion trdeg >= 2. The other sources I read from text layers only. The DALAG page number comes from a running header in the text layer, and the §12.5 reference from a passage naming that section.

**Could not settle.**

- The target says the two "open boundary statements" cannot both fail, but does not define them. I reached the formal statement recip_pi_log_of_torsion_rational_modulus and assume that is what the gloss means.
- RW95 Theorem 2's wording is garbled in the text layer, and the zbMATH review omits "homogeneous". The non-homogeneous reading would give e^{π²}, which is open, so I treat it as homogeneous and rely on RW97 instead.
- Absence of an explicit statement is only as good as my search. Full-text search for formulas is weak: regexes over OCR miss garbled formulas, and web search does not index formulas. Not opened: Roy's 1990s papers beyond a keyword check, and Diaz 2004 beyond theorem headings. zbMATH was not swept, and OpenAlex returned 429.

**Near misses.** RW97 Cor. 7.4 uses exactly the number √((log 2)²+π²), only for the transcendence of its exponential, conditionally on dependence of log 2 and π. Diaz 2007 (P3),(Q3),(M) are conjectures containing the pair and e^{i/π}.

**Time.** The clock read about 4 minutes between the start and the last timed check, well inside the box. I stopped because the decisive source was found and further exact-pair searches returned nothing.

Independence: RW97, RW95 and DALAG all predate the excluded work and do not cite it.

## Read

- Roy-Waldschmidt 1997, Ann. Sci. ENS 30 — https://eudml.org/doc/82449: Introduction, Th. 0.1, 0.2, Conj. 0.3 (page image of p. 755); Cor. 1.2; §7 through Cor. 7.5, including the remark on non-homogeneity
- Roy-Waldschmidt 1995, Proc. Japan Acad. 71 — https://projecteuclid.org/download/pdf_1/euclid.pja/1195510604: §1 statements (garbled two-column text layer)
- Brownawell 1974, J. Number Theory 6, 22-31 — https://doi.org/10.1016/0022-314X(74)90005-5: Theorem, Corollaries 1-7. Named by the target; no explicit log/π statement beyond the corollaries
- Waldschmidt 1973, J. Number Theory 5, 191-202: Theorem, Corollaries 1-4 and the remark after Cor. 4 on e^{π^r}. Named input; no modulus statement
- Waldschmidt, DALAG (2000): §12.5 intro, Prop. 12.25, Lemma 12.26, Theorem 15.30 and remarks after it
- Diaz 2007, Produits, quotients, inverses: Introduction, §1 conjectures through (M)
- Waldschmidt 2005, The role of complex conjugation: §5 end, Conjecture 5.2, start of §6
- Waldschmidt 2005, Variations on the six exponentials theorem: Consequence 1.10 and the structural-rank passage after it

## Screened only

- Diaz 2004, conjugaison complexe (local) — Theorem headings and keyword search only
- Diaz 1997, quatre exponentielles et Bertrand (local) — Keyword search only
- Roy 1997, Simultaneous approximation and algebraic independence, Ramanujan J. 1, 379-430 (local copy) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/xq22667638726378.pdf
- Roy local set (1992 JNT, 1995 Acta, 2001, 2002, 2004) — Keyword search for π² only, no hit
- Waldschmidt local corpus including LNM 402 and survey files — Regex for log² + π² forms: only an unrelated height bound in DALAG, line 17104
- Waldschmidt, The Four Exponentials Problem and Schanuel's Conjecture (local) — Keyword search only
- G. Warner, The Exponential World — https://arxiv.org/abs/2105.05809
- Ranks of matrices of logarithms of algebraic numbers I — https://arxiv.org/abs/2303.02037
- arXiv API listing for four/six exponentials, 25 recent entries; nothing relevant — https://export.arxiv.org/api/query
- zbMATH review Zbl 0860.11040 — https://zbmath.org/897674
- Wikipedia, Four exponentials conjecture (secondary, screening only) — https://en.wikipedia.org/wiki/Four_exponentials_conjecture

## Inaccessible

- OpenAlex search: HTTP 429 on the one attempt; not retried
- zbMATH API by direct script: TLS certificate error in the sandbox; I did not disable verification. One query through ctx_fetch_and_index worked, and I only inspected its Roy-Waldschmidt 1995 record, so zbMATH was not swept
- DALAG on the publisher site — https://doi.org/10.1007/978-3-662-11569-5: Paywalled; the local library copy was read instead

## Queries

- transcendence "\log^2 2 + \pi^2" irrational OR rational modulus of logarithm of algebraic number |log(-2)|^2
- Diaz "module" logarithme nombre algébrique transcendant conjecture |u| algébrique e^u algébrique Michel Waldschmidt exponentielles
- Brownawell 1974 algebraic independence related by the exponential function corollary square of logarithm plus pi squared
- quadratic relations between logarithms of algebraic numbers transcendence degree one "\pi^2" rational sum of squares log α Roy Waldschmidt corollary
- "exp(i/\pi)" OR "e^{i/\pi}" transcendental four exponentials conjecture open problem e^{\pi^2}
- Shmelev algebraic independence logarithms "ln" π relation quadratic Gelfond small transcendence degree square of logarithm rational
- "Conjecture C(|u|)" OR "|u| algebraic" e^u transcendental Diaz conjecture modulus logarithm rational squared modulus
- modules de logarithmes de nombres algébriques transcendance rationnel carré du module Diaz Waldschmidt quatre exponentielles fortes conjugaison complexe
- "four exponentials" transcendence degree one application "log 2" "log 3" "\pi^2" not both rational
- Roy Waldschmidt "Simultaneous approximation and algebraic independence" Ramanujan Journal 1997
- zbMATH: any:"produits de logarithmes" | any:"module d'un logarithme" | any:"quadratic relations between logarithms"
- arXiv API: abs "four exponentials" OR "six exponentials" OR ("logarithms of algebraic numbers" AND quadratic)
- Local library regex: log²+π² forms, quadratic relation/relation quadratique, inhomogeneous, e^{i/π}
