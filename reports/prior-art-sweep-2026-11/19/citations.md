# Entry 19, strategy: citations

## Target, as restated by the searcher

Strong five exponentials hypothesis: if x1,x2 are Q-linearly independent, y1,y2 are Q-linearly independent, gamma is non-zero, and beta_ij, delta are algebraic with exp(x_i y_j - beta_ij) and exp(gamma x2/x1 - delta) all algebraic, then all five exponents vanish. Claim sought in print: this hypothesis alone implies that no non-zero u has both |u| and e^u algebraic. Equivalently, a non-zero logarithm of an algebraic number never has algebraic modulus. The point is the weaker hypothesis: the same conclusion from the strong FOUR exponentials conjecture is already printed.

## Leads

### Lead 1: analogue only

- **Citation:** M. Waldschmidt, On the transcendence methods of Gel'fond and Schneider in several variables, in New Advances in Transcendence Theory (A. Baker, ed.), Cambridge Univ. Press, 1988
- **Location:** Remark after Corollary 2.2, p. 379
- **Quote:** it contains non trivial open problems
- **Link:** local library: waldschmidt/Durham1986TMGSSV.txt
- **Relation:** Originates the conjecture and deduces (log a)(log b) != log c from it. With log a=u, log b=conj(u) this does not reach the target: u*conj(u)=rho is algebraic and non-zero, so by Hermite-Lindemann rho is never a log c, and the printed statement is vacuous here. Reaching the target needs a new choice of parameters (beta_22=rho), which is the target's own one line and is not printed.

### Lead 2: analogue only

- **Citation:** M. Waldschmidt, Hopf algebras and transcendental numbers, in Zeta Functions, Topology and Quantum Physics (2003 conference volume; publication details from memory, not checked)
- **Location:** Conjecture 1.5 and the discussion after it, sec. 1.1
- **Quote:** we deduce from Conjecture 1.5 the transcendence of
- **Link:** https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/ztq2003.pdf
- **Relation:** Same conjecture under the name 'sharp five exponentials'. Printed instance: x1=y1=gamma=1, x2=y2=lambda gives e^(lambda^2) transcendental. Replacing y2=lambda by conj(lambda), beta_22=|lambda|^2, proves the target, but that substitution is my translation. The paper states no modulus or conjugate case.

### Lead 3: analogue only

- **Citation:** M. Waldschmidt, Open Diophantine problems, Mosc. Math. J. 4 (2004), 245-305
- **Location:** Conjecture 3.5 and the following paragraph, about pp. 269-270
- **Quote:** A consequence of Conjecture 3.5 is the solution of the open problem
- **Link:** https://arxiv.org/abs/math/0312440
- **Relation:** Names only e^(pi^2) and alpha^(log alpha)=e^(lambda^2) as consequences. Modulus not mentioned in this passage. Also calls the conjecture a special case of strong four, so the direction is the unhelpful one.

### Lead 4: analogue only

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000
- **Location:** p. 399 after Conjecture 11.17 (modulus from strong four, credited to Diaz); pp. 437-438 (strong five as weaker)
- **Quote:** A weaker statement is the so-called Strong Five Exponentials Conjecture
- **Link:** local library: waldschmidt/dalag.txt
- **Relation:** The two facts run the wrong way: strong four => modulus statement, and strong four => strong five. Together they do not give strong five => modulus. Named-nearby source, not stated more strongly than the target file says; listed because it fixes the exact gap.

### Lead 5: analogue only

- **Citation:** G. Warner, The Exponential World, arXiv:2105.05809 (2021), expository
- **Location:** sec. 45, items 9 and 11 ('Admit S4EC')
- **Quote:** If λ ∈ L is nonzero, then |λ| is transcendental
- **Link:** https://arxiv.org/abs/2105.05809
- **Relation:** Repeats modulus and C(|u|) under strong four only. The only 'five' hits a keyword scan found in the text are the five exponentials theorem, with no strong or sharp five conjecture, so the target's hypothesis does not appear. The scan was by keyword, not a full read.

## Notes

**Result: no lead reaches the part not found.** The "not found" stands in everything I could check, but the forward-citation walk is incomplete (see Limits).

**Restated gap.** Printed: strong four exponentials => modulus statement (DALAG p. 399, crediting Diaz 1997; Diaz 2007 sec. 1.2 via PQ and P2; Waldschmidt, Role of complex conjugation, sec. 5). Also printed: strong four => strong five (Wal04 calls it a special case; DALAG p. 437 calls it weaker). These do not compose into strong five => modulus.

**Closest material.** Waldschmidt has printed the same style of instantiation twice from this hypothesis:
- 1988: (log a)(log b) != log c.
- Hopf algebras paper and Wal04: e^(lambda^2) transcendental.

Neither reaches the target.
- The 1988 statement is vacuous at b = conj(a), because u*conj(u) is non-zero algebraic and so not a logarithm, by Hermite-Lindemann.
- The e^(lambda^2) instance uses y2 = lambda, not conj(lambda).
- So all are analogues, despite the proof being one substitution away.

**My check of the target's one line (translation, not a source).** Take x=(1, conj u), y=(1, u), beta_11=1, beta_12=beta_21=0, beta_22=rho=u*conj(u), gamma=1, delta=0. Independence of 1,u and of 1,conj u comes from Lindemann. All five exponentials are algebraic, and the conclusion forces u=0. This confirms the "routine" class: the result is an easy exercise that apparently nobody printed, not a deep gap.

**What each source says about modulus and strong five.**
- Diaz 2004 sec. 5.1 derives C(|u|) from Schanuel and notes it is a special case of strong four. No strong five.
- Diaz 1997 Theorem 5 treats the four exponentials form with e^|log alpha|. OCR is poor. The '[Di 1997a]' credit for strong four => modulus comes via DALAG; I did not verify that Diaz 1997 states it in that form.
- Diaz 2007 sec. 1.2 gives PQ and M from strong four. The only 'five' it mentions is the five exponentials theorem (sec. 2.2). Theorem 4 there is a sufficient condition for strong four, unconditional, and needs x2/x1 in L-tilde: not this target.
- DALAG p. 15 derives e^|lambda| transcendental from plain four exponentials: a different conclusion.
- DALAG Exercise 15.16(c): e^|lambda| or algebraic independence. Different again.
- Warner sec. 45 repeats the strong four derivations; his sec. 44 item 12 is about |w|^2 rational and exp(2 pi i w), under four exponentials. Neither uses strong five.
- Variations 2005, Role of conjugation, the Legacy of Ramanujan text and the Four Exponentials survey never tie strong five to modulus. Keyword scans found no 'five' in Role, and only the five exponentials theorem in Legacy and the survey.

**After 5 October 2026.** The arXiv API listings showed only unrelated papers dated after that date (2610.10469, 2610.41600, 2611.00456, 2611.01711), judged by title, plus the 2611.00456 abstract. The listings returned few and noisy matches: 16 for "four exponentials", 6 for "five exponentials". They are weak evidence of absence. The zbMATH and citation-index checks of recent items did not work.

**Limits, stated plainly.**
- The citation strategy was largely blocked. OpenAlex was rate-limited or unavailable, Semantic Scholar mostly 429, zbMATH web 403.
- Forward citations were obtained only for Dia07, with one citing paper from Semantic Scholar. Wal04, DALAG, Roy92 and the 1988 paper were not walked.
- The session's WebSearch budget ran out after four queries succeeded; a fifth was refused with an instruction to continue from what was already gathered. I therefore stopped discovery searching, including further scholarly-index queries, at about 5 minutes of the 30-minute box. After that I only read items already in hand.
- The work most likely to change the answer is a walk of the papers citing Wal04 and of Waldschmidt's lecture notes. The notes the search surfaced (Wien-ESI, AWS Lectures 5, Sarrebruck, Bangalore, DION2005 Beamer) were not opened. A follow-up session with fresh search budget could do that.
- Local files were read through text layers. Formulas in the Durham OCR and Diaz 1997 are garbled; the quoted Durham remark is legible, but its parameter list should be checked on the page if it matters.
- Page numbers for Wal04 are approximate, and publication details of the Hopf algebras paper are from memory.
- Roy92's references and text were keyword-scanned only ('five', 'strong', Waldschmidt conjecture); that scan's output did not show anything relevant.

## Read

- G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques, JTNB 19 (2007), 373-391 — local library: diaz/diaz-2007-produits-quotients.txt: Introduction, sec. 1.1-1.2 (CF4E, PQ, P, Q, M, C(|u|)), start of sec. 2.2 (Theorem 4). Keyword scan of the rest for 'five/cinq'.
- G. Diaz, Utilisation de la conjugaison complexe, JTNB 16 (2004), 535-553 — local library: diaz/diaz-2004-conjugaison-complexe.txt: Introduction, sec. 2 opening, sec. 5.1-5.2 (C(|u|) from Schanuel and strong four)
- G. Diaz, La conjecture des quatre exponentielles et les conjectures de D. Bertrand, JTNB 9 (1997), 229-245 — local library: diaz/diaz-1997-quatre-exponentielles-bertrand.txt: Theorem 5 and Lemma 6 (OCR is badly garbled in the formulas)
- M. Waldschmidt, Open Diophantine problems (2004) — local library: waldschmidt/ODP-MoscowMathJ.txt: Conjectures 3.4-3.7; Diaz references
- M. Waldschmidt, DALAG (2000) — local library: waldschmidt/dalag.txt: Remark in sec. 1.3 (p. 15), sec. 11.3.3 (five exponentials), sec. 11.6.1 (p. 399), pp. 437-438, Exercises 11.8 and 15.16, index entries
- M. Waldschmidt, On the transcendence methods of Gel'fond and Schneider in several variables (1988) — local library: waldschmidt/Durham1986TMGSSV.txt: Corollary 2.2 and the Remark on strong five
- M. Waldschmidt, Hopf algebras and transcendental numbers — local library: waldschmidt/ztq2003.txt: sec. 1.1, Conjecture 1.5 and consequences
- M. Waldschmidt, The role of complex conjugation in transcendental number theory (DION 2005 proceedings) — local library: waldschmidt-2005-role-of-complex-conjugation.txt: sec. 1 through sec. 5, Conjecture 5.2; keyword scan for 'five' found none
- M. Waldschmidt, Variations on the six exponentials theorem (2005) — local library: waldschmidt-2005-variations-six-exponentials.txt: sec. 1 (Conjecture 1.5, Consequences 1.6-1.11), Theorem 2.1, Corollary 2.7
- M. Waldschmidt, Four exponentials problem and Schanuel's conjecture (survey) — local library: waldschmidt-four-exponentials-problem-schanuel.txt: sec. 6-7
- M. Waldschmidt, Legacy of Ramanujan 2013 text — local library: waldschmidt/LegacyRamanujan2013Text.txt: sec. 3 (five exponentials, strong four)
- G. Warner, The Exponential World, arXiv:2105.05809 — https://arxiv.org/abs/2105.05809: sec. 44 item 12, sec. 45 opening through item 6; items 9, 11 seen in keyword hits; keyword scan of the rest

## Screened only

- M. Waldschmidt, Transcendence of Periods and Mahdia periods lecture: passages naming 'five exponentials' conjectures only (keyword context) — local library: waldschmidt/TranscendencePeriods.txt
- Waldschmidt, Linear independence of logarithms (LIL) and Isao 1986 notes: five exponentials theorem only (keyword context) — local library: waldschmidt/LIL.txt
- zbMATH review by Waldschmidt of Diaz 2007: restates strong four and the partial results, no strong five — https://zbmath.org/5302780
- H. Massold, Transcendence degrees of fields generated by exponentials of products, arXiv:2506.01123. Keyword scan printed no hits for five exponentials, strong four, modulus or Diaz. — https://arxiv.org/abs/2506.01123
- A. Cano, N. Gusevskii, M. López-Flores, Spectral Fields and Unitary Descent, arXiv:2611.00456 (30 Oct 2026). Abstract only, unrelated. — https://arxiv.org/abs/2611.00456
- Variations on Schanuel's Conjecture for elliptic and quasi-elliptic functions I, arXiv:2504.14048 (title only) — https://arxiv.org/abs/2504.14048
- Semi-abelian analogues of Schanuel Conjecture and applications, arXiv:2010.15170 (title only) — https://arxiv.org/abs/2010.15170
- An abelian analogue of Schanuel's conjecture and applications, arXiv:1811.05167 (title only) — https://arxiv.org/abs/1811.05167
- Irrationality measures for Gamma(1/4) and Gamma(1/3), arXiv:2611.01711 (1 Nov 2026), title only, unrelated — https://arxiv.org/abs/2611.01711
- Wikipedia, Six exponentials theorem (secondary; search snippets only) — https://en.wikipedia.org/wiki/Six_exponentials_theorem

## Inaccessible

- OpenAlex forward citations of Dia07, Dia04, Wal04, Wal00, Roy92: API returned 429 and 503 throughout. It did return one record for Dia07 (cited_by_count 0, not credible). The DOI I guessed for Dia04 resolved to an unrelated paper, so nothing from it is used.
- Semantic Scholar citation lists beyond Dia07 — https://api.semanticscholar.org/graph/v1/paper/DOI:10.5802/jtnb.592/citations: Search endpoint returned 429. The Dia07 citations call worked and listed only Waldschmidt, Role of complex conjugation. Wal04, Wal00 and Roy92 were not walked.
- zbMATH Open web interface and phrase search for 'strong five exponentials': Web page returned 403. The API phrase query returned 404, which may mean no results or a malformed query; I did not settle which. A loose API query returned only a few records.
- M. Waldschmidt 1990 (cited in the local survey for the strong six exponentials corollary) and C. Bertolin, Périodes de 1-motifs et transcendance (J. Number Theory 2002): Not opened: not found in the local library listing I saw, and the search budget ended before I could look for them.

## Queries

- WebSearch: strong five exponentials conjecture implies modulus of logarithm of algebraic number transcendental Diaz conjecture
- WebSearch: sharp/strong five exponentials conjecture consequence modulus logarithm complex conjugation
- WebSearch: Diaz conjecture C(|u|) |u| algebraic then e^u transcendental four exponentials 2025 2026 arXiv
- WebSearch: Diaz 'Produits et quotients...' cited, conjecture modulus logarithm
- WebSearch (refused, budget exhausted): Waldschmidt five exponentials (log a)(log b) transcendental e^{lambda bar lambda}
- arXiv API, newest first: all:"four exponentials", all:"six exponentials", all:"five exponentials"; abs: Schanuel+modulus, logarithms of algebraic numbers+product, complex conjugation+transcendence, Diaz+transcendence, strong four exponentials, Waldschmidt+conjecture+exponentials
- OpenAlex: title searches for Dia07, Dia04, Wal04 and others (503/429); DOI lookups; cites: filter (429)
- Semantic Scholar: paper search (429); DOI:10.5802/jtnb.592/citations
- zbMATH API: "strong five exponentials" (404); exponentials strong conjecture logarithms
- Local library regex scan: strong five, five exponentials, cinq exponentielles, C(|u|), modulus, across all sources except n3-lit
