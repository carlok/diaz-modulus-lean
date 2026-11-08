# Entry 20, strategy: own-field

## Target, as restated by the searcher

Let u be a nonzero complex number with |u| and e^u algebraic (a "candidate"). Weak hypothesis W2 (Kirby's Weak SC, n=2): if trdeg Q(a,b,e^a,e^b) < 2, then ma+nb lies in 2πiZ for some integers (m,n) not both 0. Claim 1: under W2, every candidate has Re u ≠ 0 and Im u a nonzero rational multiple of π. Claim 2: under W2, "no candidate exists" is equivalent to "t²+π² is transcendental for every real t≠0 with e^t algebraic". Claim 3: if also trdeg Q(π,a,e^a) ≥ 2 for every a outside 2πiQ (n=1 of Schanuel over the kernel), then no candidate exists. The point to find in print is the use of the kernel-blind weak form on the pair (u, ū), its conclusion Im u ∈ πQ, or the reduction to the single relation t²+π². Full Schanuel implying Diaz's conjecture does not count.

## Leads

### Lead 1: analogue only

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000
- **Location:** Exercise 15.16(c), end of Chapter 15 (Diaz 2004 points to p. 614); checked in the local text layer
- **Quote:** either e^|λ| is transcendental, or λ and λ̄ are algebraically independent
- **Link:** https://doi.org/10.1007/978-3-662-11569-5
- **Relation:** Same objects (λ, its conjugate, the modulus), but it concerns e^|λ| for a logarithm λ. It has no weak Schanuel or kernel hypothesis, no Im u ∈ πQ and no t²+π² relation, so it does not reach the target.

### Lead 2: analogue only

- **Citation:** M. Waldschmidt, The Four Exponentials Problem and the Schanuel Conjecture, Festschrift in honor of Catriona Byrne (Springer)
- **Location:** Section on Conjecture 1 (algebraic independence of logarithms), p. 4 of the local preprint
- **Quote:** Conjecture 1 claims that log 2 and π are algebraically independent
- **Link:** https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf
- **Relation:** My translation: the same argument for real t with e^t algebraic gives t and π independent, so t²+π² is transcendental, under independence of logarithms. This is a different hypothesis, and the example is not linked to modulus or to Diaz's conjecture. Nothing reduces Diaz's conjecture to this relation or uses weak Schanuel.

## Notes

**Result: no lead reaches the part not found.** The two listed leads are analogues only. This is partial coverage, not an exhausted search.

**Why the search stopped early.** Eleven web searches ran. The next two were refused: the shared per-turn web search limit (200 calls across all agents) was used up. The refusal said to continue with what was already gathered, so I stopped searching. I did not switch to zbMATH, Semantic Scholar, HAL or arXiv search as a substitute, because that would work around the limit. I only opened documents already in hand or whose URLs had come up in results. Only about 3 minutes of the 30-minute box had passed at the last clock check (16:06:34 to 16:09:21).

**Not done:**
- The citation chase. OpenAlex returned 503 on all six queries. Citations of Diaz 2004 and of Kirby 2018 are the most likely place for a real find.
- zbMATH, HAL, Numdam and EuDML searches.
- Any French search beyond one query.
- Mantova's paper itself, Zilber 2002, Terzo, D'Aquino–Macintyre–Terzo.

A rerun with a fresh budget should start with those. Carlo can ask for a continuation or raise CLAUDE_CODE_MAX_WEB_SEARCHES_PER_SESSION.

**What the read sources say relative to the target**
- **Diaz 2004, Prop. 1:** for u outside R ∪ iR, the pair (u, ū) is Q-free and full Schanuel with n=2 gives a contradiction. For u in R ∪ iR, u is algebraic and Hermite–Lindemann applies. This is the printed template, and it is named as nearby. It never considers the kernel-blind weak form or the residual case u − ū ∈ 2πiQ. It is the same dichotomy with a stronger hypothesis.
- **Kirby:** states Weak SC (Conj. 1.5) and SC over the kernel (Conj. 1.4), with SC ⇒ SC over the kernel ⇒ Weak SC (Prop. 1.6). No mention of Diaz, conjugation or modulus. The n=1 kernel case is not written out, but unwinding δ(a/ker) ≥ 0 gives the target's trdeg Q(π,a,e^a) ≥ 2 for a outside 2πiQ. This is my translation.
- **Diaz 2007:** states C(|u|) and the stronger (M). π appears only in examples such as exp(π²). No t²+π² relation and no weak form.
- **DALAG (Waldschmidt 2000):** the Schanuel and modulus statements are as in lead 1, plus Conj. 11.17 ⇒ Diaz (§11.6.1). Exercise 1.7 is the version with e^{2iπz}, under four exponentials.
- **DION 2005:** restates Conj. 5.2 from Diaz, in the passages I read.
- **Waldschmidt, Four Exponentials:** its "weak Schanuel" is the Calegari–Mazur one (independence of logarithms). That is a different conjecture, as the target's source line warns. It does name log 2 and π as an instance.
- **Brownawell 1974, Cors. 5–7:** trdeg-one transcendence results among exponentials. They are not stated for moduli or under weak Schanuel, and I did not derive anything from them.

**Check of the target (my own derivation, not a find).** The statements do follow in a few lines.
1. For a candidate, ū = ρ/u and e^ū = conj(e^u) is algebraic, so trdeg Q(u,ū,e^u,e^ū) ≤ 1 < 2. W2 gives mu + nū ∈ 2πiZ.
2. Writing u = t + iθ: (m+n)t = 0 and (m−n)θ ∈ 2πZ.
3. If m+n ≠ 0, then t = 0, so u is algebraic, contradicting Hermite–Lindemann.
4. So m = −n ≠ 0 and θ ∈ πQ. Also θ ≠ 0, since otherwise u is real and algebraic.
5. Then e^t = |e^u| is algebraic and |u|² = t² + r²π². Rescaling by 1/r gives the single relation.

This supports the "routine" class. Routine as it is, I did not see it printed in anything I opened.

**Could not settle.** Whether a model-theory paper (Zilber, Bays–Kirby, Mantova) uses this kernel-blind form with conjugation in passing. The sources I scanned there did not, but most of that literature was not opened. The DOI link for DALAG comes from memory and I did not open it; the text was checked in the local copy. Local Diaz 2004 is OCR with garbled formulas, so I reconstructed its formulas in Prop. 1 from context.

## Read

- G. Diaz, Utilisation de la conjugaison complexe..., JTNB 16 (2004), 535-553 (named nearby, not a lead) — https://www.numdam.org/item/JTNB_2004__16_3_535_0: Section 5 (5.1 Conjecture C(|u|), Proposition 1 and proof, p. 550-551; 5.2 Conjecture C(u1,u2), Proposition 2); bibliography. Local OCR, formulas garbled.
- J. Kirby, Variants of Schanuel's conjecture, arXiv:1801.08765 (named nearby, not a lead) — https://arxiv.org/abs/1801.08765: Sections 1-2 in full (Conj. 1.1-1.5, Prop. 1.6, known cases); keyword scan of the rest for conjugation/Diaz
- G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques, JTNB 19 (2007) — https://emis.univie.ac.at/journals/JTNB/2007-2/article04.pdf: Section 1.2 (conjectures (PQ), (M), (Qr), C(|u|)); keyword scan for π and Schanuel elsewhere
- M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (2000), local copy — https://doi.org/10.1007/978-3-662-11569-5: Remark after Conj. 1.13, Conj. 1.14-1.15 pointers, Exercises 1.7-1.8, Section 11.6.1 (Conj. 11.17 and Diaz's consequence), Exercises 15.15-15.16
- M. Waldschmidt, The Four Exponentials Problem and the Schanuel Conjecture — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf: Abstract and the passage around Conjecture 1 (p. 4); keyword scan for modulus/conjugate, no hits
- M. Waldschmidt, The role of complex conjugation in transcendental number theory (DION 2005 proceedings) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf: Passages around Theorem 4.1, Corollary 4.2 and Conjecture 5.2 only (keyword context); local copy scanned for Schanuel
- W. D. Brownawell, The algebraic independence of certain numbers related by the exponential function, J. Number Theory 6 (1974): Corollaries 5-7 and the surrounding remarks

## Screened only

- Keyword scan of the local Diaz library (135 text files; Roy, Waldschmidt, Diaz 1989/1997, Laurent, Fischler and others) for weak Schanuel, Kirby, π² with log², modulus of a logarithm, 2πiQ
- J. Kirby, Finitely presented exponential fields, arXiv:0912.4019 (keyword scan; conjugation hits are about automorphisms only) — https://arxiv.org/abs/0912.4019
- Kirby, Macintyre, Onshuus, The algebraic numbers definable in various exponential fields, arXiv:1101.4224 (keyword scan, no relevant hits) — https://arxiv.org/abs/1101.4224
- V. Mantova, Involutions on Zilber fields, slides (keyword scan; involutions on exponential fields, no transcendence statement of this type) — https://poisson.phc.dm.unipi.it/~mantova/files/slides/node/14/slides.pdf
- M. Waldschmidt, On Schanuel's Conjecture, elliptic and quasi-elliptic functions (VariationsSchanuel, keyword scan, no hits) — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/VariationsSchanuel.pdf
- M. Waldschmidt, Hyderabad 12-03 slides (keyword scan) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Hyderabad-12-03.pdf
- M. Waldschmidt, Transcendance de périodes: état des connaissances, arXiv:math/0502582 (keyword scan) — https://arxiv.org/abs/math/0502582
- Marques, Sondow, Schanuel's conjecture and algebraic powers z^w and w^z, arXiv:1010.6216 (keyword scan, no hits) — https://arxiv.org/abs/1010.6216
- G. Warner, The Exponential World, arXiv:2105.05809 (keyword scan; only the known Diaz real-multiple theorem) — https://arxiv.org/abs/2105.05809
- Karimov et al., Algorithmic Applications of Schanuel's Conjecture (keyword scan, no relevant hits) — https://people.mpi-sws.org/~mvahanwa/publications/schanuel-survey.pdf
- D. Roy, Simultaneous approximation and algebraic independence, Ramanujan J. 1 (1997) (located its Schanuel statement only)
- Maksoud 2023 (weak p-adic Schanuel, local copy, grep hit only; a different conjecture)
- Viale, weak Schanuel paper (search snippet only) — https://iris.unito.it/handle/2318/1635187

## Inaccessible

- OpenAlex citation chase of Diaz 2004, Diaz 2007, Diaz 1997, Kirby 2018, Waldschmidt 2005: API returned HTTP 503 on all six queries; not retried because the web search budget ended right after, see notes

## Queries

- Kirby "Variants of Schanuel's conjecture" weak Schanuel conjecture statement ma+nb in 2 pi i Z
- Diaz conjecture modulus of logarithm of algebraic number transcendental Schanuel weak Schanuel "log" conjugate |log α| transcendental
- transcendance π² + log² α produit de logarithmes module d'un logarithme conjugaison complexe Diaz exponentielle
- "pi^2 + log^2" transcendental algebraic independence pi and log alpha conjecture Schanuel consequence absolute value logarithm negative algebraic number
- Schanuel's conjecture implies if |u| algebraic and e^u algebraic then u=0, complex conjugate, Diaz conjecture proof Schanuel
- is sqrt(pi^2 + log^2 2) transcendental? absolute value of log(-2) algebraic independence mathoverflow
- "Schanuel" "over the kernel" OR "weak Schanuel" complex conjugation exponential field real part imaginary part in pi Q consequence
- "modulus" of logarithm of algebraic number transcendental conjecture "e^u" "|u|" algebraic Diaz Waldschmidt "complex conjugation" conditional results imaginary part rational multiple of pi
- algebraic independence of π and log α conjecture consequence "log 2" and π algebraically independent Waldschmidt conditional kernel Schanuel one variable
- zero estimate conjecture Schanuel exponential field real closed Im π |exp| conjugate pseudo-exponentiation; Kirby Macintyre Onshuus algebraic numbers definable
- weak Schanuel conjecture e^a Zilber Kirby consequences ignores the kernel two variables transcendence degree applications
- REFUSED by budget: Mantova Involutions on Zilber fields
- REFUSED by budget: Diaz conjecture C(|u|) résultats conditionnels 2020-2026
- OpenAlex (503): title lookups plus cites: filter for six papers
