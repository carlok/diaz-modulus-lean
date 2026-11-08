# Entry 20, strategy: translation

## Target, as restated by the searcher

Let u be a non-zero complex number with |u| and e^u algebraic (a candidate). Then ū = ρ/u with ρ = |u|² algebraic, and e^ū is the conjugate of e^u, so Q(u, ū, e^u, e^ū) has transcendence degree at most 1. Target (a): the n = 2 case of Kirby's weak Schanuel conjecture says that td Q(a, b, e^a, e^b) < 2 forces ma + nb ∈ 2πiZ for some integers (m,n) ≠ 0. Under it, every candidate has Re u ≠ 0 and Im u ∈ πQ^×. Equivalently, e^u is a real number times a root of unity, with u outside R ∪ iR. Target (b): under the same hypothesis, 'no candidate exists' is equivalent to the single statement that t² + π² is transcendental for every real t ≠ 0 with e^t algebraic. Target (c): adding td Q(π, a, e^a) ≥ 2 for all a ∉ 2πiQ (the n = 1 case of Schanuel over the kernel) gives that no candidate exists. My own check of the short derivation: take (a,b) = (u, ū). Then (m+n) Re u = 0 and (m−n) Im u ∈ 2πZ. Re u = 0 would make u algebraic, contradicting Hermite-Lindemann, so m = −n and Im u ∈ πQ. Im u = 0 is excluded the same way. For (b), put u = t + iπr and rescale t by r. For (c), apply the kernel statement to a = t: π and t are algebraically independent because e^t is algebraic. In the search vocabulary: this is a conditional reduction, with the Ax/Schanuel predimension over ker(exp) applied to the pair (u, ū).

## Leads

### Lead 1: analogue only

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000
- **Location:** Exercise 15.16(c), end of chapter 15 (see also the remark after Conjecture 1.13 and section 11.6)
- **Quote:** either e|λ| is transcendental, or λ and λ are algebraically independent
- **Link:** local library: (local library) waldschmidt/dalag.txt (text layer; the conjugation bar is presumably lost in OCR, not checked against the page)
- **Relation:** Concerns a logarithm and its conjugate, with an unconditional dichotomy. It has no weak Schanuel hypothesis and no conclusion about Im u ∈ πQ. It does not reach the part not found.

### Lead 2: analogue only

- **Citation:** J. Kirby, Variants of Schanuel's conjecture, arXiv:1801.08765 (2018)
- **Location:** Proposition 7.2, p. 9 (Weak SC implies SCP_alg); also Proposition 1.6
- **Quote:** (Weak SC) =⇒ (SCPalg )
- **Link:** https://arxiv.org/abs/1801.08765
- **Relation:** The only printed application of Weak SC I read: it is applied to tuples (α, ρα), and the output is multiplicative dependence. It has the same shape as the target's step but uses no conjugation or modulus, and says nothing about candidates. Kirby's Conjecture 1.4 at n = 1 does contain the target's kernel hypothesis, but that is a statement of the hypothesis and not of the reduction.

### Lead 3: analogue only

- **Citation:** M. Waldschmidt, Four exponentials problem and Schanuel's conjecture (survey; publication details not established, Springer Nature template, MSC 2020)
- **Location:** Section after Conjecture 1 (algebraic independence of logarithms), p. 4
- **Quote:** Conjecture 1 claims that log 2 and π are algebraically independent
- **Link:** local library: (local library) waldschmidt-four-exponentials-problem-schanuel.txt
- **Relation:** With λ1 = t and λ2 = iπ, the logarithms conjecture gives t² + π² transcendental, which is the single relation of (b). The hypothesis is different (logarithms, not the n = 1 kernel statement), and this is the step the entry itself calls standard. It does not touch the weak Schanuel reduction.

## Notes

**Result: no lead, but this search was severely limited and is weak evidence.** The external search did not happen. WebSearch's shared budget ran out on my first call, and the notice told me not to route around it through other search engines. I took that to cover the query endpoints of scholarly indexes as well, even though the task lists them. This is a judgement call and may be stricter than necessary. My OpenAlex batch went out in the same round as the first WebSearch calls, before I saw the notice, and every query failed. After that I only read the local library and fetched specific arXiv papers directly by id. No index or web query returned anything, so the literature outside the local library and the two fetched papers is essentially unsearched. To finish the sweep, send a follow-up message or raise `CLAUDE_CODE_MAX_WEB_SEARCHES_PER_SESSION`. Most of the wall-clock time box was left unused because of this, not because the search was exhausted.

**What the read sources say relative to the target**
- Kirby states Conj 1.4 (SC over the kernel) and Conj 1.5 (Weak SC), with Prop 1.6 giving the implications SC ⇒ kernel ⇒ Weak. His text contains no modulus or conjugation application and no mention of Diaz. The target's two hypotheses are instances of 1.5 at n = 2 and of 1.4 at n = 1. I checked the second by hand: td(a, e^a / πi) ≥ 1 for a ∉ Qπi, and π is transcendental.
- Diaz 2004 Prop 1 applies full Schanuel at n = 2 to (u, ū), with cases u ∈ R ∪ iR and otherwise. It is the known nearby result and has no kernel variant. It also notes derivation from the logarithms conjecture and from the strong four exponentials conjecture.
- Waldschmidt's book (p. 15, p. 399, Ex. 1.7, Ex. 15.16) gives conjugation and modulus consequences of the four exponentials and strong four exponentials conjectures. None is conditional on Kirby's weak form, and none concludes Im u ∈ πQ.
- The Waldschmidt surveys use 'weak Schanuel' for the algebraic independence of logarithms (Calegari-Mazur). A search on that phrase will therefore return false friends. The target's source line already warns of this.
- Roy-Waldschmidt 1995 Theorem 2 handles homogeneous quadratic relations in transcendence degree 1. The relation uū = ρ is inhomogeneous. Homogenising with a third logarithm 2πi needs π algebraic over Q(u) and gives only |u|/π algebraic, not the target's case. It does not apply.

**Translation strategy.** The subspace-product and scroll dictionaries do not fit this entry, which is a conditional reduction with no configuration in it. The only fitting vocabulary is the predimension over ker(exp), i.e. Schanuel, Ax and Zilber-style statements. Kirby sections 1 and 7 are the only place I could check it. Pseudo-exponential papers are the likeliest venue for a remark such as 'e^u real times a root of unity', since they discuss conjugation in the Zilber field, but I could not search them. Bays-Kirby had no term hit.

**Not settled.** Whether any model-theory paper or survey states the (u, ū) application of Weak SC. Search terms worth running next: 'Schanuel over the kernel' with 'complex conjugation'; 'weak Schanuel' with 'modulus'; 'multiplicative dependence' with 'conjugate logarithm'; zbMATH citations of Diaz 2004 and of Kirby 1801.08765.

**Caveats.** Local statements come from text layers and were not checked against page images. The bar in the Ex. 15.16(c) quote is inferred. Publication details of the four-exponentials survey were not established.

## Read

- Kirby, Variants of Schanuel's conjecture, arXiv:1801.08765 — https://arxiv.org/abs/1801.08765: Section 1 in full, the start of section 7 through Prop 7.2; term search of the whole text for modulus, conjugation, Diaz and Waldschmidt found no relevant hit
- G. Diaz, Utilisation de la conjugaison complexe..., JTNB 16 (2004), local copy — https://www.numdam.org/item/JTNB_2004__16_3_535_0.pdf: Introduction and section 5.1 including Prop 1 and its proof. It uses full Schanuel at n = 2 on (u, ū) with no kernel or weak variant; text layer garbled in formulas
- Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (2000), local copy: Pp. 15-18 (Conjectures 1.13-1.15), Exercises 1.7 and 15.16, section 11.6 remark after Conjecture 11.17
- Waldschmidt, The Role of Complex Conjugation in Transcendental Number Theory (2005), local copy: Theorem 1.3 and Conjectures 2.3, 2.4, 3.2; term search for Schanuel
- Waldschmidt, Four exponentials problem and Schanuel's conjecture, local copy: Abstract and the section on Conjecture 1. Its 'weak Schanuel' is the Calegari-Mazur sense, not Kirby's
- Waldschmidt, Colloquium De Giorgi Schanuel survey (2014), local copy: Section on the cases n = 1 and n = 2 and their consequences; term search for kernel and conjugation found nothing
- Roy-Waldschmidt, Quadratic relations between logarithms of algebraic numbers, Proc. Japan Acad. 71 (1995), local copy: Section 1, Theorems 1-2 (homogeneous quadratic relations in transcendence degree 1)

## Screened only

- Local library, about 135 text files in missions/diaz/sources, including Roy, Waldschmidt, Diaz 1997/2007 and Brownawell 1974: grep only, for weak Schanuel, Kirby, Schanuel near kernel, conjugation or modulus, rational multiple of π, and multiplicatively dependent. The files under n3-lit and others/l1 were covered by the grep but not opened
- Marques and Sondow, Schanuel's conjecture and algebraic powers z^w and w^z, arXiv:1010.6216: term search only, no hit for weak Schanuel, over the kernel, conjugation or modulus — https://arxiv.org/abs/1010.6216
- Bays and Kirby, Pseudo-exponential maps, variants, and quasiminimality, arXiv:1512.04262: term search only, same terms, no hit — https://arxiv.org/abs/1512.04262

## Inaccessible

- All external index and web search (WebSearch, OpenAlex): The session's WebSearch budget was exhausted on my first calls (shared limit of 200). The tool notice said to continue with what was already gathered and not to search by other routes, so I did not query zbMATH, arXiv search, Semantic Scholar or HAL. My one OpenAlex batch, sent alongside those first calls, returned HTTP 503 or 429 on every query.
- D'Aquino, Macintyre, Terzo; Terzo; Kirby-Macintyre-Onshuus (papers on consequences of Schanuel in exponential fields, named from memory): Not opened. I had no verified links and could not search for them. Two arXiv ids I tried from memory, 1510.03241 and 1109.1283, turned out to be unrelated physics papers.

## Queries

- WebSearch, blocked by budget, no results: Kirby "weak Schanuel" conjecture consequence transcendence modulus absolute value complex conjugate exponential
- WebSearch, blocked by budget, no results: Diaz conjecture |u| and e^u algebraic Schanuel implies transcendental complex conjugation reduction imaginary part rational multiple of pi
- OpenAlex, all failed with 503/429: weak Schanuel conjecture; variants of Schanuel conjecture; Schanuel conjecture complex conjugation exponential modulus; Schanuel conjecture kernel 2 pi i pi transcendence degree exponential field; Utilisation de la conjugaison complexe transcendance fonction exponentielle; transcendence of modulus and exponential of complex number; algebraic independence pi and e^t real exponential Schanuel consequence t^2+pi^2; Schanuel conjecture two variables a b exp(a) exp(b) transcendence degree at least 2 Q-linear dependence; exponential algebraic closedness weak Schanuel
- Local grep over sources: weak Schanuel | Kirby | Schanuel...kernel; Schanuel near conjug/module/modulus; rational multiple of π; multiplicatively dependent; Schanuel with n=1/n=2; π² with log/alg/transc; Diaz near conjecture
