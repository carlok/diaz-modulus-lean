# Entry 3, strategy: citations

## Target, as restated by the searcher

Let K be the algebraic numbers, u a transcendental complex number with s^2 = u ū in K, and v = u/s, so v̄ = 1/v and K(v) is a rational function field with a semilinear involution. For z a Laurent polynomial in v over K, set W = K + Kv + K/v + Kz + Kz̄. Target: a complete converse. W contains all products x_i y_j of a 2-dimensional space X and a 3-dimensional space Y if and only if dim W = 5 and W lies in one of three explicit classes: (P) some nonzero αu²+βu³ lies in W; (Q) an involution class with exponents up to ±3; (R) a real pencil class, W = H₀+Kg+Kḡ with g = G(v)+κ·conj(vG(v)), |κ|=1, deg G ≥ 2. If z has an exponent of absolute value ≥ 4, only (R) can occur. For z ≡ Aū³+Bū²+Cu²+Du³, the condition is NΔ(|Δ|²−|u|²N²)=0, N=|A|²−|D|², Δ=AC̄−BD̄. The configurations themselves are known. The missing part is the "only if": the list of possible shapes of (X,Y), the two-sided pinch and the pencil analysis.

## Leads

### Lead 1: analogue only

- **Citation:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. 163 (2017), 423-452; arXiv:1501.00602
- **Location:** Theorem 33 (section on infinite extensions, pp. 25-26 of the arXiv version)
- **Quote:** S and T have bases of the form {g, ga, . . . } and {g′, g′a, . . . }
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** Over an algebraically closed base it gives the structure of (X,Y) only when dim XY = dim X + dim Y − 1 = 4. The hard case for the target is dim XY = 5 = dim W. It says nothing on conjugation, on classes (P), (Q), (R), on the exponent bound or on the cubic criterion. The target already names this paper's section 7 and Lemma 4 as method; Theorem 33 is not named there but sits in the same circle.

### Lead 2: analogue only

- **Citation:** C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's Theorem, Algebraic Combinatorics 1 (2018); arXiv:1709.00087
- **Location:** Introduction and main theorems
- **Quote:** dim ST ⩾ dim S + dim T − 1 whenever ST 6= F
- **Link:** https://arxiv.org/abs/1709.00087
- **Relation:** Structure of spaces with small product over an algebraically closed base, mainly the square S² with S = T. Target needs X ≠ Y with dimensions 2 and 3 inside a prescribed conjugation-stable space. No derivation reaches the classification. Local copy: only the abstract, the introduction and pattern hits were read.

### Lead 3: analogue only

- **Citation:** N. Tanısalı, M. Wessel, High dimensional Riemann-Roch spaces in linear spaces with small squares, arXiv:2609.06822 (6 Sep 2026)
- **Location:** Abstract only
- **Quote:** S^2 must contain a Riemann--Roch space of dimension at least 2 dim S − 1 + g
- **Link:** https://arxiv.org/abs/2609.06822
- **Relation:** A recent forward citation of BSZ17. It concerns squares S² and states a conjecture proved in a restricted case. It has no pair (X,Y) with X ≠ Y and no involution, so it does not reach the target. Judged from the abstract alone.

## Notes

**Outcome: no lead reaches the part not found.** The three leads are analogues. This was a desk search with real gaps in forward citation coverage, listed below. Started 10:41, finished about 10:55 on 2026-11-08, well inside the time box; I stopped because the citation routes were exhausted or blocked by rate limits.

**Backward.** The bibliographies of Diaz 2004 and 2007 are short: Roy 1992, Waldschmidt's DALAG and his 2005 papers, Diaz 1997, Laurent 1991, Roy 2001. Every printed statement I read in the Diaz and Waldschmidt papers runs one way: a given family is not contained in ℒ̃. None asks which spaces carry a 2 × 3 configuration, and none has a converse. The scans for réciproque, seuls, classification and caractéris in Diaz, and for classif and "if and only if" in Waldschmidt's conjugation paper, found no converse. The sole "if and only if" there is the rank ≤ 1 factorisation (Remark 2.8). The Diaz 2007 equivalences (Théorèmes 1 and 2) are between conjectures. Section 2.4 of Diaz 2007 explicitly stays with case-by-case applications of Roy's theorem. None of the nearby statements turned out stronger than the target file says.

**Forward, transcendence side.** Semantic Scholar shows 8 works citing Diaz 2004 and 1 citing Diaz 2007. These are surveys by Waldschmidt plus papers judged by title; nothing suggests a study of conjugation hulls. I saw no later Diaz paper on the subject; the MaRDI list is admittedly incomplete. In zbMATH's 11J81 records for 2015-2026 I only keyword-searched titles and found nothing on this topic.

**Forward, product-of-spaces side.** About 50 titles cite BSZ17, mostly coding theory (Sidon spaces, subspace codes), plus the Freiman function field line. BSZ Theorem 33 covers dim XY = 4. The target's hard case is dim XY = 5, which is one above the critical value. A pattern search of the local BSZ for dim S + 2 found nothing, and a web search for a linear Hamidoune-Rødseth statement found none. So I found no printed version of even the unconjugated shape list. That is an absence in what I searched, not proof of absence. Freiman-type work treats S² only, not X ≠ Y, and has no semilinear involution.

**After 5 October 2026.** Six arXiv items surfaced: 2610.10469, 2610.25065, 2610.27963, 2610.41600, 2611.00456 and 2611.01170. All were judged from abstract or snippet and none is relevant. The first four mention six exponentials or Schanuel, or are listed as citing BSZ17. I did not check why Semantic Scholar links 2610.25065 to BSZ17.

**A translation worth recording (my own, unverified).** A 2 × 3 configuration inside W says that the rational curve v ↦ [1 : v : 1/v : z : z̄] in P⁴ lies on a linear section of the Segre P¹ × P², that is, a cubic scroll when dim XY = 5. So the classical literature on curves on rational normal scrolls is the natural place for a hidden version. I found only general statements in search summaries (Harris-Roth-Starr, Bernardi-Gimigliano), with nothing about the 1, v, 1/v shape or a real structure. Their relation is at most analogue, so I did not list them as leads. Another possible view: since W is conjugation stable and |v| = 1, it is the complexification of a real space of trigonometric polynomials. One query on that found nothing, so this angle is barely tested.

**What I could not settle.**
- OpenAlex and zbMATH forward lists were never obtained, so Semantic Scholar is the only citation graph used, and it undercounts French journal papers.
- No full-text search was possible: arXiv search covers metadata only. A paper using Diaz-type configurations in its body without those words in the abstract would be missed.
- The scroll literature was not searched in depth, and it is the most plausible remaining hiding place. A follow-up by someone with MathSciNet access would close the main citation gap.

**Reliability.** Diaz and Waldschmidt statements come from text layers with garbled formulas. I relied on them only for the absence of converse statements, not for exact formulas. Web search summaries were used only to choose what to open, and items known only through them are marked as such in the screened list.

## Read

- G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes..., JTNB 19 (2007), 373-391 (local copy) — https://doi.org/10.5802/jtnb.592: Théorèmes 2 and 4 by keyword hits, Théorème 6 proof, Théorème 7 and its proof, section 2.4 'En forme de bilan', references; keyword scan for converse or classification wording
- G. Diaz, Utilisation de la conjugaison complexe..., JTNB 16 (2004), 535-553 (local copy) — https://emis.univie.ac.at/journals/JTNB/2004-3/pages535-553.pdf: Théorème 2 and start of its proof, bibliography; keyword scan for converse or classification wording
- M. Waldschmidt, The role of complex conjugation in transcendental number theory (DION 2005; local copy) — https://hal.science/hal-00411402v1: All numbered statements (Theorems 1.1 to 6.2, Corollaries, Conjecture 5.2) by extraction; scan for 'polynomial', 'if and only if', 'classif'
- M. Waldschmidt, Variations on the six exponentials theorem (2005; local copy) — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/Hyderabad.pdf: Corollaries 2.12-2.13, the part 'à la Diaz'
- Bachoc, Serra, Zémor 2017 (local copy) — https://arxiv.org/abs/1501.00602: Lemma 4 statement and start of proof; Theorem 33 and proof; Theorem 34 opening; pattern search for dim S + 2 (no hit)
- Bachoc, Couvreur, Zémor 2018 (local copy) — https://arxiv.org/abs/1709.00087: Abstract and introduction passages on dim ST
- zbMATH review of Diaz 2007 by M. Waldschmidt (Zbl 1163.11055) — https://zbmath.org/?q=an:1163.11055: Full review text as far as displayed

## Screened only

- Wessel, On Freiman's Theorem in a function field setting, arXiv:2405.10724 (local copy, abstract, pattern search: no pair statements, no 'pencil') — https://arxiv.org/abs/2405.10724
- Couvreur, Zémor, Freiman's 3k-4 theorem for function fields, arXiv:2408.00183 (local copy, abstract, pattern search) — https://arxiv.org/abs/2408.00183
- Aliabadi et al., Extremal Chowla sets and their linear analogues, arXiv:2607.24847 (abstract; forward citation of BSZ17, unrelated) — https://arxiv.org/abs/2607.24847
- Di Gennaro, Rapagnetta, Sabatino, The genus of a curve on Calabi-Yau threefolds, arXiv:2610.25065, 18 Oct 2026 (abstract; listed as citing BSZ17, about extremal curves, unrelated) — https://arxiv.org/abs/2610.25065
- Bays, SEAC from EAC modulo Schanuel, arXiv:2610.27963, 20 Oct 2026 (abstract; pseudo-exponentiation, unrelated) — https://arxiv.org/abs/2610.27963
- Pańkowski, Joint universality of the Riemann zeta-function..., arXiv:2610.41600, 30 Oct 2026 (search snippet; uses a six exponentials variant, unrelated) — https://arxiv.org/abs/2610.41600
- Neroli, Iterated Graph Systems (II), arXiv:2610.10469, 7 Oct 2026 (search snippet; uses six exponentials for scale commensurability, unrelated) — https://arxiv.org/abs/2610.10469
- Cano, Gusevskii, López-Flores, Spectral Fields and Unitary Descent, arXiv:2611.00456 (abstract; unrelated) — https://arxiv.org/abs/2611.00456
- L. Butler, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. (2017) (title only; cites Diaz 2004 per Semantic Scholar) — https://doi.org/10.1007/s11139-015-9728-2
- Density of rational points on commutative group varieties and small transcendence degree, arXiv:1011.3368 (title only; cites Diaz 2004 per Semantic Scholar) — https://arxiv.org/abs/1011.3368
- Waldschmidt, Transcendence of Periods: the state of the art (local copy; Diaz 2004 cited only for a derivative-free proof)
- Waldschmidt, On Ramachandra's contributions to transcendental number theory (local copy; cites Diaz 1997 and 2004 for the conjugation trick)
- Waldschmidt, The four exponentials problem and Schanuel's conjecture, LNM 2313 (2023) (local copy; no mention of Diaz or conjugation in the pattern scan)
- Waldschmidt, Further variations on the six exponentials theorem (local copy; same pattern scan, no Diaz or conjugation)
- Roy 1992, Matrices whose coefficients are linear forms in logarithms (local copy, pattern scan only: no Diaz, one 'conjugat' hit, not opened)
- Diaz author listing on the MaRDI portal and zbMATH (no later paper on this subject seen; the MaRDI list says it is not complete) — https://portal.mardi4nfdi.de/wiki/Guy_Diaz
- Harris, Roth, Starr, Curves of small degree on cubic threefolds, arXiv:math/0202067 (abstract, plus a search summary of Lemma 6.8 on rational quartics and cubic scrolls; geometric analogue of my own translation, not checked in the paper) — https://arxiv.org/abs/math/0202067
- Bernardi, Gimigliano, plane rational curves and syzygies, arXiv:1507.02227 (search summary only; curves on scrolls in P^4) — https://ar5iv.arxiv.org/html/1507.02227
- Forward citation list of BSZ17 on Semantic Scholar, about 50 titles: Sidon spaces, cyclic subspace codes, linear sets, Kneser and Freiman analogues. None concerns transcendence or conjugation
- Forward citation lists on Semantic Scholar for Diaz 2004 (8 titles), Diaz 2007 (1 title), Roy 1992 (partly seen; no relevant title in what displayed), Waldschmidt role of conjugation (1 title, unrelated)

## Inaccessible

- OpenAlex citing-works lists for Diaz 2004 and Diaz 2007 — https://openalex.org/W2052817373: HTTP 429 on every list or search query through the run; only single-record lookups worked. Records show 9 citations for Diaz 2004 and 0 for Diaz 2007, the latter clearly undercounted
- zbMATH Open 'cited by' lists (rf: queries for Zbl 1163.11055 and 1071.11046) — https://zbmath.org/?q=an:1163.11055: API returned 404 and the web interface 403, so no zbMATH forward list was obtained
- MathSciNet citation lists (MR2394892) — https://mathscinet.ams.org/mathscinet-getitem?mr=2394892: Subscription service, not attempted
- arXiv API — https://export.arxiv.org/api/query: HTTP 429 throughout. The arXiv HTML search worked for metadata-field queries instead, but it does not search full text, so a paper mentioning Diaz only in its body would be missed
- OpenCitations for Diaz 2007 — https://api.opencitations.net/index/v2/citations/doi:10.5802/jtnb.592: Reachable, but returned an empty list, which gives no information
- Diaz 1997 forward citations on Semantic Scholar — https://www.numdam.org/item/JTNB_1997__9_1_229_0.pdf: My guessed DOI 10.5802/jtnb.197 returned 404 and I did not pursue it

## Queries

- zbMATH: ti:Produits et quotients de combinaisons; au:Diaz, G & cc:11J81; six exponentials; strong four exponentials; cc:11J81 & py:2008-2014; cc:11J81 & py:2015-2026 (434 records, keyword search of titles)
- Semantic Scholar citations: arXiv:1501.00602, DOI:10.5802/jtnb.592, DOI:10.5802/jtnb.459, Roy 1992 DOI, Waldschmidt role of conjugation id
- arXiv HTML search, newest first: "six exponentials", "strong six exponentials", "strong four exponentials", "four exponentials", "exponentials conjecture", "logarithms of algebraic numbers", "algebraic modulus" transcendence, Vosper subspaces field, Freiman function field subspaces square, "product of subspaces", self-reciprocal subspace product pencil, cubic scroll rational curves parametrization
- Crossref: "strong six exponentials", "strong four exponentials", "four exponentials" conjugation, "logarithms of algebraic numbers" "complex conjugation" (noise only)
- HAL: exponentials AND conjugation
- Web: Diaz conjecture |u| and e^u algebraic complex conjugation strong six exponentials 2026
- Web: product of subspaces extension field 2×3 classification Vosper Kneser
- Web: "Produits et quotients de combinaisons linéaires de logarithmes" cited strong four exponentials
- Web: strong six exponentials complex conjugation modulus algebraic arXiv 2025 2026
- Web: transcendence e^u |u| algebraic products of linear forms polynomial in u and conjugate
- Web: subspaces of Laurent polynomials product 2 and 3 dimensional self-reciprocal trigonometric pencil net
- Web: rational curves in P^4 on cubic scroll 1, t, 1/t, 2x3 determinantal
- Web: linear analogue Hamidoune-Rødseth dim ST = dim S + dim T
- Web (French): conjugaison complexe transcendance six exponentielles module algébrique classification thèse
- Web: necessary and sufficient condition, Q-bar space contains product of 2-dim and 3-dim subspaces, |u| algebraic
