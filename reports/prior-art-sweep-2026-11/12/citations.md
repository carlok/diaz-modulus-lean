# Entry 12, strategy: citations

## Target, as restated by the searcher

Let u be a non-algebraic complex number with u·ū = s² algebraic (s real), so ū = s²/u and conjugation acts on the rational function field Q̄(u). Put H₀ = Q̄ + Q̄u + Q̄/u. Take a five-dimensional Q̄-space W with H₀ ⊂ W ⊂ Q̄(u), containing all products of a 2-dimensional and a 3-dimensional subspace (a 2×3 configuration). The sought statement is that no four-dimensional H₀ + Q̄w inside W contains such a configuration ("invisibility"). It is sought for three families: (a) W = H₀ + Q̄g + Q̄ḡ with g = a₁/(u−a) + a₂/(u+a), a₁ ≠ a₂, aā ≠ s², so conjugation swaps the orbits ±a and ±s²/ā of u ↦ −u; (b) the general two-orbit space, and its conjugation-stable case; (c) the cyclic space W = H₀ + Q̄G₁ + Q̄G₂, with G₁, G₂ explicit functions with poles at v = ±1 (v = u/s), on which multiplication by (1, u²) acts modulo H₀ as a Jordan block. For (c) it is also sought that no configuration has ratio x₂/x₁ a Möbius function of u (a factor of degree one). The configurations themselves are printed (Diaz 2007, Théorème 7(1)) and do not count.

## Leads

### Lead 1: analogue only

- **Citation:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. 163(3) (2017); arXiv:1501.00602
- **Location:** Theorem 33 (pp. 25-26 of the copy in the local library)
- **Quote:** S and T have bases of the form
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** My own translation: with F = Q̄ and L = Q̄(u), a 2×3 configuration in a 4-dimensional V has dim XY = 4 (Kneser-type lower bound, equality), so X = g(1,a), Y = g'(1,a,a²) and V = gg'(1,a,a²,a³). This reduces invisibility to the claim that no H₀ + Q̄w ⊂ W is such a progression. It says nothing about the specific spaces W, the swapped orbits, the Jordan block or the Möbius factor, so it does not reach the part not found. It is a possible tool, not a find, and is already in the local library.

## Notes

**Result: no lead reaches the part not found.** The one lead is an analogue or tool. The run took about 15 minutes. It stopped early because the API rate limits and the shared WebSearch budget ran out, not because the time box ended.

**Backward (the target's own references).** Diaz 2007 cites Diaz 1997, Diaz 2004, Roy 1992 and Waldschmidt 2000, 2004 and 2005.
- I read Théorèmes 6 and 7 and §2.4 of Diaz 2007. It proves non-inclusions in ℒ̃ by applying Roy's theorem to chosen families. It never asks which spaces carry a configuration, or whether a subspace of a given space does.
- Waldschmidt's two conjugation-related texts have the same shape: conclusions for matrices and determinants, with no spaces of rational functions.

**Forward (citers of Diaz 2007).**
- OpenCitations lists 0 citers.
- OpenAlex gives cited_by_count 0.
- zbMATH `ci:1163.11055` returns 404, which I read as no results.
- Semantic Scholar lists one citer, Waldschmidt 2005, which predates the paper's publication and appears to come from a preprint citation.

Caveats on this: zbMATH's coverage is partial. The query `ci:0763.11030 & py:2015-2026` also returned 404, although OpenCitations lists citers of Roy 1992 in those years. These indexes also miss citations made only in full text.

**Forward (citers of Diaz 2004).** They are Diaz 2007, Waldschmidt's surveys, Butler 2017, the Density paper (arXiv:1011.3368) and the Periods survey. None concerns the spaces in the target. OpenAlex counts 9 citers, but I saw only Semantic Scholar's 8 listed entries, so one may be unseen.

**After 5 October 2026.** The arXiv metadata query for "six exponentials" and zbMATH's arXiv records gave only 2610.41600 (zeta universality) and 2610.10469 (percolation), both unrelated. "four exponentials" gave nothing newer than 2608.05053. The Semantic Scholar citers of Bachoc-Serra-Zémor include 2610.25065 (Calabi-Yau threefolds), unrelated by its title.

A full-text mention in a new preprint would not appear in these checks.

**The nearest mathematics.** Since ū = s²/u, the target is pure linear algebra in Q̄(u).
- Bachoc-Serra-Zémor Theorem 33 (algebraically closed base field) forces a 2×3 configuration in a four-dimensional space to be a progression gg'(1,a,a²,a³). This translation is my own.
- That reduces invisibility to excluding progressions containing H₀ inside each W. The source does not do that exclusion for any W, and I did not check it myself.
- The theorem has no bearing on the Möbius-factor statement, beyond the observation that a degree-one factor would be a special form of a.
- Bachoc-Couvreur-Zémor treat only S = T.
- A geometric reading is that the curve lies on a cubic scroll S(1,2) in P⁴, and a four-dimensional extension is a projection whose image lies on a twisted cubic. One web search in this language found nothing relevant.

**Not settled.**
- I could not obtain the OpenAlex citer lists for Diaz 2004 or 2007.
- I did not read the full text of the citers screened by title.
- I did not read the books in the neighbourhood, such as Waldschmidt's DALAG Chapter 11 or Murty-Rath.
- I cannot rule out a remark in a paywalled source. Nothing I saw suggests one exists.

**Local library.** Bachoc-Serra-Zémor, Bachoc-Couvreur-Zémor, Butler and Couvreur-Zémor are already in `missions/diaz/sources/`. The analogue lead is therefore not new to the project.

## Read

- G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes..., JTNB 19 (2007) 373-391 (local copy) — https://doi.org/10.5802/jtnb.592: Corollaire 4, Théorèmes 6 and 7 with proofs, §2.4 'En forme de bilan', references. Théorème 7(1) gives only the non-inclusion for (v, v̄)⊗(1,u,ū); nothing on subspaces or on the absence of configurations.
- zbMATH review of Diaz 2007 by Waldschmidt (Zbl 1163.11055) — https://zbmath.org/1163.11055: Full review text. Nothing on the target.
- M. Waldschmidt, The role of complex conjugation in transcendental number theory (2005; local copy) — https://hal.science/hal-00411402v1: §4 (Diaz's Theorem 4.1, Cor. 4.2), end of §5 (Conjecture 5.2), §6 (Thms 6.1, 6.2). Non-inclusion statements only; no rational-function spaces.
- M. Waldschmidt, Variations on the six exponentials theorem (2005; local copy) — https://hal.science/hal-00411315v1: Corollary 2.13 and its proof (conjugation 'à la Diaz'), the passage around it. A determinant conclusion, not the target.
- Bachoc, Serra, Zémor, An analogue of Vosper's theorem for extension fields (2017; local copy) — https://arxiv.org/abs/1501.00602: Introduction, Theorem 3, Theorem 33 with proof.
- Bachoc, Couvreur, Zémor, Towards a function field version of Freiman's theorem, Algebraic Combinatorics 1 (2018; local copy) — https://doi.org/10.5802/alco.19: Introduction, including the K(x) discussion of S² with geometric-progression bases. The S = T case only, and general, not about these spaces.

## Screened only

- G. Diaz, Utilisation de la conjugaison complexe..., JTNB 16 (2004) 535-553 (local copy): theorem list and keyword search only; no hits for dimension, sous-espace, fraction rationnelle or progression — https://doi.org/10.5802/jtnb.459
- M. Waldschmidt, Further variations on the six exponentials theorem (2005; local copy): keyword search only, no hits — https://hal.science/hal-00411308v1
- M. Waldschmidt, The four exponentials problem and Schanuel's conjecture (2023; local copy): keyword search; no mention of Diaz or conjugation — https://doi.org/10.1007/978-3-031-12244-6_39
- J. Butler, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. 42 (2017) (local copy): keyword search; cites Diaz 2004 in passing, no subspace statements — https://doi.org/10.1007/s11139-015-9728-2
- Ł. Pańkowski, Joint universality of the Riemann zeta-function with arbitrary real shift parameters, arXiv:2610.41600 (post 5 Oct 2026): zbMATH summary only; uses Emsalem's six exponentials generalisation, unrelated — https://arxiv.org/abs/2610.41600
- Z. Neroli, Iterated Graph Systems (II), arXiv:2610.10469 (post 5 Oct 2026): title only, unrelated — https://arxiv.org/abs/2610.10469
- E. Ha, A variation of Eichler's proof of the Baker-Campbell-Hausdorff formula, arXiv:2608.05053: title only, unrelated — https://arxiv.org/abs/2608.05053
- Bustos-Gajardo, Fokkink, Cobham's theorem for the Gaussian integers, arXiv:2510.01440: title only, unrelated — https://arxiv.org/abs/2510.01440
- De Koninck, Luca, On the index of friability (2025; Zbl 1583.11072): title only, unrelated
- Density of rational points on commutative group varieties and small transcendence degree, arXiv:1011.3368 (cites Diaz 2004): title only — https://arxiv.org/abs/1011.3368
- Transcendence of Periods: The State of the Art, PAMQ 2 (2006) (cites Diaz 2004): title only — https://doi.org/10.4310/PAMQ.2006.V2.N2.A3
- On Ramachandra's Contributions to Transcendental Number Theory (Waldschmidt; cites Diaz 2004): title only — https://hal.science/hal-01112588v1
- Citers of Roy 1992 from OpenCitations and Semantic Scholar: Maksoud (tran/9131, dm/935), Dasgupta-related Iwasawa and eigencurve papers (2201.08203, 2202.07286, 1907.09422, 1811.05368, 0708.2451): titles only; p-adic regulator applications
- Dasgupta, Kakde, Ranks of matrices of logarithms of algebraic numbers I and II (2023, 2026): titles only; a different question about matrix ranks — https://doi.org/10.1016/j.aim.2025.110753
- Forward citers of Bachoc-Serra-Zémor (Semantic Scholar, 55 entries), e.g. 2609.06822 High dimensional Riemann-Roch spaces in linear spaces with small squares; 2408.00183 Freiman's 3k-4 theorem for function fields; A Generalization of Vosper's Theorem (2024); 2610.25065 The genus of a curve on Calabi-Yau threefolds: titles only; coding, Sidon-space and function-field Freiman topics, none about configurations in H₀-spaces
- Murty, Rath, Transcendental numbers (2014; Zbl 1297.11001): zbMATH title hit only

## Inaccessible

- OpenAlex citing-works lists for Diaz 2004, Diaz 2007 and Bachoc-Couvreur-Zémor — https://api.openalex.org/works/doi:10.5802/jtnb.592: HTTP 429 on list queries throughout the run. Single-record lookups gave cited_by_count 0 for Diaz 2007, 9 for Diaz 2004 and 3 for Bachoc-Couvreur-Zémor; the lists were not seen.
- arXiv API, for abstracts and for targeted queries beyond the two listing queries that succeeded — https://export.arxiv.org/api/query: HTTP 429 on most calls. The two successful queries, all:"six exponentials" and all:"four exponentials", search metadata only, not full text.
- Further web searches: The shared WebSearch budget for this turn ran out, so the last planned query, on 'strong six exponentials' citing Diaz 2007, was not run. A follow-up message could continue the search.

## Queries

- OpenCitations citations of 10.5802/jtnb.592 (Diaz 2007), 10.5802/jtnb.459 (Diaz 2004), 10.1016/0022-314X(92)90081-Y (Roy 1992)
- Semantic Scholar citations of Diaz 2007, Diaz 2004, Roy 1992, Butler 2017, Bachoc-Couvreur-Zémor 2018, Bachoc-Serra-Zémor 2017
- zbMATH ci:1163.11055; ci:1071.11046; ci:0763.11030 & py:2015-2026; ai:diaz.guy
- zbMATH "six exponentials" & py:2023-2026; "four exponentials" & py:2023-2026; "strong six exponentials"; "strong four exponentials"; "logarithms of algebraic numbers" & conjugation; "logarithms of algebraic numbers" & modulus & transcend*; "Schanuel" & conjugation & py:2015-2026; "linear combinations of logarithms" & "algebraic numbers" & py:2015-2026; Vosper & subspaces & "function field*"
- arXiv API all:"six exponentials" and all:"four exponentials", sorted by date
- Crossref query.bibliographic from 2023: six exponentials theorem; four exponentials conjecture; strong six exponentials linear forms in logarithms; logarithms of algebraic numbers complex conjugation transcendence; transcendence modulus logarithm algebraic number conjecture; products of linear combinations of logarithms of algebraic numbers; matrices whose coefficients are linear forms in logarithms rank
- HAL API "six exponentials"; "four exponentials"; "strong six exponentials"
- Web: Diaz 'Produits et quotients' conjecture exp(u), |u| algebraic, 2024-2026
- Web: linear combinations of logarithms, complex conjugate, modulus algebraic, 2×3 matrix
- Web: Vosper theorem function field, product of subspaces, critical pair, rational function field
- Web: transcendence 2026 complex conjugation, strong four exponentials special cases
- Web (arxiv.org): 2026 six or four exponentials
- Web: Bachoc-Serra-Zémor critical pairs over algebraically closed base field, K(x)
- Web: space of rational functions not containing a 2×3 product; rational curve on a cubic scroll, projection to a twisted cubic
- Web: conjecture |u| algebraic implies e^u transcendental, 2×3 matrix, rational function of u, involution u -> -u
