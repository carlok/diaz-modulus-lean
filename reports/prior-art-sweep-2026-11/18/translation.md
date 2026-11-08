# Entry 18, strategy: translation

## Target, as restated by the searcher

Let t ≠ 0 be real with e^t algebraic, and let a, b, c be rational with a ≠ 0 and a t² + b π² = c. Claim: e^{iγ/π} is transcendental for every rational γ ≠ 0. The case t = log 2 gives the dichotomy: π²/12 − (log 2)²/2 = Li₂(1/2) is irrational, or e^{iγ/π} is transcendental for all rational γ ≠ 0. Restated as a quadratic relation among logarithms: if e^{iγ/π} were algebraic, then t² / (iπ) would lie in L + iπQ ⊂ L, so t·t = (iπ)·L with L a logarithm of an algebraic number. That is a point of the rank-3 quadric cone X₁² = X₂X₃ with coordinates (t, iπ, L) in the Q-space of logarithms, all in a field of transcendence degree one. Equivalently: if log α and π are algebraically dependent, then exp((log α)²/(iπ)) is transcendental.

## Leads

### Lead 1: implies

- **Citation:** M. Waldschmidt, Nombres transcendants, Lecture Notes in Mathematics 402, Springer, 1974.
- **Location:** §7.4, Corollaire 7.4.3 and the example after it, p. 202 (typescript p. 7.20); Théorème 7.4.1 on p. 201
- **Quote:** l'une au moins des deux propriétés suivantes est vraie : (i) ℓ1, ℓ2 sont …
- **Link:** https://doi.org/10.1007/BFb0061579
- **Relation:** Printed for Q-independent logarithms ℓ1, ℓ2: (i) ℓ1, ℓ2 are algebraically independent, or (ii) exp(ℓ1²/ℓ2) is transcendental. Take ℓ1 = t and ℓ2 = iπ; these are Q-independent because t is real and nonzero. The relation a t² + b π² = c makes (i) fail, so exp(t²/(iπ)) is transcendental. My translation from there: t²/(iπ) = −i(c/a)/π + i(b/a)π, and exp(i(b/a)π) is a root of unity, so exp(−i(c/a)/π) is transcendental. In particular c ≠ 0, because c = 0 would make exp(t²/(iπ)) a root of unity. If e^{iγ/π} were algebraic for some rational γ ≠ 0, then exp(−i(c/a)/π), a rational power of it, would be algebraic, a contradiction. For the dichotomy take t = log 2, a = −1/2, b = 1/12, c = Li₂(1/2). This reaches both the general form and the dichotomy; neither log 2 nor Li₂(1/2) is written in the source. Page checked on the scan: the printed substitution reads x = 1 + ℓ2/ℓ1, ℓ = ℓ1, which yields exp(ℓ2²/ℓ1), while (ii) prints ℓ1²/ℓ2. The indices are swapped, which is harmless because the hypothesis is symmetric. Independent of Brownawell's Corollary 5 as a printed statement, though the underlying theorem is the same.

### Lead 2: implies

- **Citation:** M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202.
- **Location:** Corollaire 4, p. 192 (from the Théorème on the same page)
- **Quote:** Alors deux des quatre nombres log α, log β, log γ, exp(log α log …
- **Link:** https://doi.org/10.1016/0022-314X(73)90043-0
- **Relation:** Take α = β = e^t and γ = −1, with log γ = iπ. The hypothesis holds because t and iπ are Q-independent. Then two of t, t, iπ, exp(t²/(iπ)) are algebraically independent. The relation a t² + b π² = c makes t and π algebraically dependent, so exp(t²/(iπ)) is transcendental and even algebraically independent of π. Then proceed as in the LN 402 derivation. Page checked on the scan. Same paper, immediately after Cor. 4: for rational r ≠ 0, 1, one of e^{iπ^r}, e^{iπ^{2−r}} is transcendental. At r = −1 this is a printed statement about e^{i/π} itself (with e^{iπ³}), but it has no link to log 2.

### Lead 3: generalization

- **Citation:** D. Roy and M. Waldschmidt, Quadratic relations between logarithms of algebraic numbers, Proc. Japan Acad. Ser. A 71 (1995), no. 7, 151–153.
- **Location:** Theorem 2, p. 151 (statement announced there; full proof in the 1997 paper below)
- **Quote:** contained in a vector subspace of C^n which is defined over Q and contained …
- **Link:** https://projecteuclid.org/download/pdf_1/euclid.pja/1195510604
- **Relation:** My translation, using the rank-3 quadric dictionary. Suppose e^{iγ/π} is algebraic. Then L := t²/(iπ) is a logarithm of an algebraic number, by the computation above. The point (t, iπ, L) lies on the cone X₁² = X₂X₃, with coordinates logarithms, in a field of transcendence degree 1. Theorem 2 puts the point in a rational subspace contained in the cone. A rank-3 cone in C³ contains no plane, so the subspace is a rational line, which forces t/(iπ) ∈ Q. That is false since t is real and nonzero. So the general form follows. The source treats arbitrary quadratic forms and does not mention π or log 2.

### Lead 4: generalization

- **Citation:** D. Roy and M. Waldschmidt, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. Sci. École Norm. Sup. (4) 30 (1997), 753–796.
- **Location:** Théorème 0.2, p. 755 approx. (introduction); the abstract states the quadratic-form version
- **Quote:** ou bien le corps Q(λ1,…,λn) est de degré de transcendance ≥ 2 sur Q
- **Link:** https://www.numdam.org/item/ASENS_1997_4_30_6_753_0/
- **Relation:** Same derivation as for the 1995 note, now with a published proof. Page number not checked against the scan; the statement was read from the text layer, whose ≥ is garbled as >.

### Lead 5: analogue only

- **Citation:** G. Diaz, La conjecture des quatre exponentielles et les conjectures de D. Bertrand sur la fonction modulaire, J. Théor. Nombres Bordeaux 9 (1997), 229–245.
- **Location:** Proposition 1, p. 241 approx. (just before p. 242)
- **Quote:** Si (log α1)(log α2) et π² sont Q-linéairement dépendants
- **Link:** http://www.numdam.org/item?id=JTNB_1997__9_1_229_0
- **Relation:** This is the homogeneous case c = 0 of the relation, in the two-logarithm form. It concludes algebraic independence of log α1 and log α2. It says nothing about e^{iγ/π}, so it does not reach the part not found. It is close in shape: a printed statement about (log α)² and π². Read from the text layer only.

### Lead 6: analogue only

- **Citation:** G. Diaz, Produits et quotients de logarithmes de nombres algébriques: conjectures et résultats (the 2007 paper in the local library, diaz-2007-produits-quotients).
- **Location:** Remark after Corollaire 1 (PQ), p. 380
- **Quote:** exp(π²) ou exp(1/π) est transcendant
- **Link:** 
- **Relation:** Printed about exp(1/π), obtained from the strong six exponentials theorem at λ = iπ. It has no input from log 2 or (log 2)² and is not the dichotomy. Bibliographic details here are from the file name and page header only, not checked further.

## Notes

**Outcome.** The \"not found\" for the general form breaks. The two-logarithm dichotomy is printed in Waldschmidt's LNM 402 (1974), p. 202: for Q-independent logarithms ℓ1, ℓ2, either they are algebraically independent or exp(ℓ1²/ℓ2) is transcendental. With ℓ1 = t and ℓ2 = iπ, plus a two-line reduction that I wrote, this gives Prop. `recip_pi_log_of_rational_quadratic_relation`, and hence the Li₂(1/2) dichotomy.

The same content is in Waldschmidt 1973, Cor. 4 (p. 192), which also gives algebraic independence from π.

**What was not found.** No source I read writes the specialisation with log 2, with (log 2)² and π², or with Li₂(1/2). So the relation is \"implies\", not \"same\". The explicit dichotomy remains unprinted as far as I can see, but it is a substitution in a textbook statement.

**The reduction, checked by me.**
- t²/(iπ) = −i(c/a)/π + i(b/a)π.
- The second term exponentiates to a root of unity, so exp(−i(c/a)/π) is transcendental.
- This also gives c ≠ 0 automatically.
- Rational powers then spread transcendence to every rational γ ≠ 0.

**Printed oddity in LN 402, p. 202.** The substitution is x = 1 + ℓ2/ℓ1, ℓ = ℓ1, which yields exp(ℓ2²/ℓ1), while (ii) prints exp(ℓ1²/ℓ2). This is a harmless index swap, since the hypothesis is symmetric in ℓ1, ℓ2. Cite with care. I read this on the page image.

**Translation that worked.** Writing e^{iγ/π} algebraic as t·t = (iπ)·L turns the problem into a point of logarithms on a rank-3 quadric cone in transcendence degree one, which is the setting of Roy-Waldschmidt 1995 Theorem 2 and 1997 Théorème 0.2. A rank-3 cone in C³ has no planes, so the rational-subspace conclusion forces t/(iπ) ∈ Q, which is false. This is a second, independent route, with my own derivation; those sources mention neither π nor log 2 here. The other listed vocabularies (Vosper and Kneser linear analogues, scrolls, Kirby) were not useful for this entry. It is a transcendence-degree-one exponential statement, not about configurations.

**Relation to the baseline.** The result is no stronger than Bro74 Cor. 5 mathematically: the theorem behind it is the same one, found independently by Brownawell and Waldschmidt. The value of the leads is that the two-logarithm form is already printed, so \"not found in the sources read\" should be revised. The note's phrase \"Brownawell's Corollary 5 with rational scaling\" could cite LN 402 and W73 alongside. Note that LN 402 and W73 Cor. 4 are in the project's local library but evidently were not cited for this entry.

**A possible correction to the source line.** The target says irrationality is covered only for q ≥ 6 and q ≤ −5. Prellberg's preprint arXiv:2609.06895 (7 Sep 2026) claims Li₂(−1/4), Li₂(1/5), Li₂(−1/3). I read the abstract only and did not check the proof. Li₂(1/2) remains uncovered there, and arXiv:2611.01066 does not reach it either, so the dichotomy is not trivialised.

**Limits of the search.**
- Time used was about 6 minutes by the clock (16:02–16:08), well inside the box. I stopped because the leads settle the question, not because options ran out.
- Earlier appearances of the two-logarithm form were not chased: Tijdeman 1971, Brownawell 1971 and 1975, Gel'fond's book. LN 402 p. 7.21 is a textbook remark and may be derived from these, so an older printed form is possible.
- zbMATH coverage was one query, OpenAlex was down, and Web search returned nothing with log 2 written explicitly.
- Page numbers for RW 1997 and Diaz 1997 are approximate, from the text layer.
- The DOI link given for LN 402 was written from memory and not opened; the content was read from the local copy. The W73 DOI was likewise not opened.
- The Diaz 2007 entry has no link, and its bibliographic details are unverified beyond the file name.

## Read

- Brownawell, J. Number Theory 6 (1974), 22–31: main Theorem and Corollaries 1–7 (baseline) — local: sources/others/brownawell-1974-jnt-algebraic-independence-related-by-exponential.pdf: pp. 22–23
- Waldschmidt, Nombres transcendants, LNM 402 (1974) — local: sources/waldschmidt/LN402_chap7.pdf: §7.3 Cor. 7.3.2–7.3.3, §7.4 pp. 201–203 (pp. 201–202 checked on page images)
- Waldschmidt, J. Number Theory 5 (1973), 191–202 — local: sources/waldschmidt-1973-huitieme-probleme-schneider.pdf: pp. 191–193, p. 192 checked on page image
- Roy-Waldschmidt, Proc. Japan Acad. 71 (1995) — local: sources/roy-waldschmidt-1995-quadratic-relations.pdf: p. 151, checked on page image
- Roy-Waldschmidt, Ann. Sci. ENS 30 (1997) — local: sources/roy-waldschmidt-1997-approximation-diophantienne-logarithmes.pdf: abstract, introduction, Théorème 0.2, remark on Brownawell, Waldschmidt, Gel'fond and Shmelev (text layer)
- Diaz, JTNB 9 (1997) — local: sources/diaz/diaz-1997-quatre-exponentielles-bertrand.pdf: Propositions 1–3 (text layer)
- Diaz 2007, produits et quotients — local: sources/diaz/diaz-2007-produits-quotients.pdf: §2.1, Théorème 3, Corollaire 1 and remark
- Waldschmidt, Open Diophantine problems, Mosc. Math. J. 4 (2004) — local: sources/waldschmidt/ODP-MoscowMathJ.pdf: passage listing Li₂(1/2) as of unknown irrationality
- Prellberg, arXiv:2609.06895 — https://arxiv.org/abs/2609.06895: abstract only

## Screened only

- arXiv:2611.01066, Uniform cubic bounds for irrational values of the dilogarithm (zbMATH summary): threshold q > (4e⁴/27)p³ excludes 1/2 — https://arxiv.org/abs/2611.01066
- Rhin-Viola, The permutation group method for the dilogarithm (zbMATH summary) — https://eudml.org/doc/84565
- Waldschmidt, Schanuel colloquium notes 2014 (local grep: log 2 and 2^{log 2} under Schanuel) — local: sources/waldschmidt/ColloquiumDeGiorgiSchanuelConjecture2014.pdf
- Kirby, variants of Schanuel (local grep only, no match for the quadratic form) — local: sources/others/kirby-variants-schanuel.pdf
- Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (local grep for log 2 with π, Ch. 11 headers) — local: sources/waldschmidt/dalag.pdf
- Waldschmidt, Transcendance et indépendance algébrique des valeurs de fonctions méromorphes, Sém. Delange-Pisot-Poitou 13 (1971-72) (landing page only) — https://numdam.org/item/SDPP_1971-1972__13_1_A4_0/
- Waldschmidt talk slides NCTS 2003 (search snippet only: quadratic relations with (log 2)² posed as open questions; PDF fetched as unparsed binary) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/NCTS-10-2003.pdf
- Brownawell, Algebraic independence of certain exponential functions, Canad. J. Math. 28 (1976) (title and snippet) — https://cambridge.org/core/journals/canadian-journal-of-mathematics/article/algebraic-independence-of-certain-exponential-functions/1250D3A9560C412092E1DD588C4B5FBF
- Shmelev, Mat. Zametki 3 (1968) and 11 (1972) (abstract snippets) — https://mathnet.ru/eng/mzm9831

## Inaccessible

- Tijdeman, On the algebraic independence of certain numbers, Indag. Math. 33 (1971), 146–162: Not opened in the time used; no open copy found by the search.
- Brownawell, Gel'fond's method for algebraic independence, Trans. AMS (1975), and the 1971 announcements cited in LN 402: Not opened; could hold the two-logarithm form earlier than LN 402.
- OpenAlex search: API returned HTTP 503.
- Python urllib calls to zbMATH API: TLS certificate failure in the sandbox; one zbMATH query went through the fetch tool instead, so the zbMATH coverage is thin.

## Queries

- transcendence e^{i/π} OR e^{1/π} algebraic relation π^2 and (log 2)^2 Schanuel irrationality dilogarithm Li_2(1/2)
- Li_2(1/2) irrational unknown π^2 and log^2 2 algebraic independence conditional Gelfond-Schneider dichotomy either transcendental
- quadratic relation logarithms (log 2)^2 = iπ log β algebraic independence log 2 and π, exp(1/π) transcendental
- Brownawell corollary exp(π η) exp(i π η^2) algebraic over Q(π) application exp(1/π) Schneider eighth problem
- Shmelev algebraic independence of powers of algebraic numbers log α Gelfond Mat. Zametki
- log 2, π algebraically independent or exp((log 2)^2/π) transcendental; exp(log^2 α / log β)
- polylogarithm irrationality conditional: Li_2(1/2) irrational if log 2 and π algebraically independent
- Brownawell 1971 / Tijdeman 1971 algebraic independence corollary logarithms, four exponentials transcendence degree one
- exp(π²/log α), (log α)² log β quadratic relations Roy, example with π
- zbMATH: dilogarithm transcendence
- arXiv API: abs "log 2" AND transcendental AND "algebraically independent" (0 results)
- local library grep: Li2, dilog, exp(1/π), e^{i/π}, log α log β / log γ, Shmelev, huitième problème
