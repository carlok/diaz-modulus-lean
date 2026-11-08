# Entry 11, strategy: own-field

## Target, as restated by the searcher

Setting: u is a non-algebraic complex number with uū algebraic, so ū = ρ/u and conjugation acts on Q̄(u); H₀ = Q̄+Q̄u+Q̄ū. A p×q configuration in a Q̄-space V is two independent families whose pairwise products all lie in V. A 5-dimensional space is 'invisible' if it carries a 2×3 configuration but no 4-dimensional H₀+Q̄w inside it does. Wanted in print, and independent of the Lean work: (a) for s real with s²=uū and F=u³/s³+u²/s², W₁=H₀+Q̄F+Q̄F̄ has no configuration in any H₀+Q̄w ⊂ W₁, and no configuration in W₁ has a Möbius ratio x₂/x₁ of degree one in u (the configuration of W₁ itself is printed and excluded); (b) the same invisibility for the two-orbit space H₀+Q̄g₁+Q̄g₂, with g₁,g₂ two-pole functions with poles ±a and ±b, where the configuration has factor (1,u²); (c) a degree bound: if 1,u,1/u lie in the span of c,ch,ch²,ck,chk and h=p(u)/q(u), then max(deg p,deg q) ≤ 2; (d) for a conjugation-symmetric Laurent polynomial f of top degree k in u/s and |λ|=1, the space W(λ,f)=H₀+Q̄f+Q̄f/(s+λu) is invisible if its five numbers are free and k≥3, or if k=2 and f(−λ̄)≠0; if k=2 and f(−λ̄)=0, then u²,ū² lie in W(λ,f).

## Leads

(no lead)

## Notes

**Result: no lead.** I found nothing printed that states or implies any part of the target: not (a) invisibility of W₁, nor its no-Möbius-ratio statement; not (b) two-orbit invisibility; not (c) the degree bound; not (d) the Laurent dichotomy.

**Time.** Started 15:33 CET. The last clock reading was 15:36 and the search ran on for some time after that, well inside the 30-minute box. I stopped because returns had dried up.

**Why the field is unlikely to contain it.** Every printed result in this line goes one way. It picks a substitution into Roy's strong six exponentials theorem and reads off a set not contained in L̃. Nobody asks which ambient spaces carry a configuration, or whether a smaller extension would already give the same exclusion. Those are questions about products of subspaces inside Q̄(u), with no transcendence in them, and the transcendence papers have no vocabulary for them.

**What the read sources say relative to the target.**
- **Dia07 §2.3, Théorèmes 5-7:** sufficient conditions on (u,v) for families near {v,vu,vu²}. Théorème 7(1) gives the excluded configuration and no structural statement. The bilan says that staying within strong six exponentials cannot go far, and gives no classification.
- **Dia07 comparisons:** it says Th. 6(1) recovers parts of Cor. 5 and that Th. 5 recovers some §2.1 results. These are the nearest thing to a 'visibility' comparison, but they are single remarks about redundancy, not an analogue worth listing.
- **Waldschmidt, Role of complex conjugation, §4-6:** Diaz's theorems, then determinants and higher rank. Nothing on spaces.
- **Waldschmidt, Variations, Cor. 2.13:** conjugation applied to 2×5 matrices, reducing a four-element set to two. A different kind of statement.
- **Dia04 §5:** asks how to bring |u| into the method. No structural result.
- **DALAG Ex. 15.16:** concerns e^{λb}, e^{λ/b} and e^{|λ|}. Unrelated to the target.

**Citation tracing.**
- zbMATH shows no citer of Dia07 (`ci:1163.11055` returned empty). OpenAlex reports 0.
- Semantic Scholar shows one citer of Dia07, Waldschmidt's survey.
- Dia04's citers in zbMATH, OpenCitations and Semantic Scholar are Dia07, Butler (2015/2017), Momot (2010), and Waldschmidt's surveys. None of them continues in this direction, judged from abstracts and keyword scans.
- Roy 1992's Semantic Scholar citers from 2007 on are Iwasawa-theory papers, Diaz, Waldschmidt, and a Narkiewicz history.

This is a thin citation graph, but it is only as complete as those indexes. OpenAlex's 9 citers of Dia04 were not listed because of HTTP 429.

**One side observation of my own, not a lead.** It is not from any source and does not reach the part not found. In the two-orbit space, take b=ρ/ā, γ=−ᾱ, δ=−β̄. Then conj(u·g₁)=u·g₂−(γ+δ); I checked this by hand and numerically at one point. So at those parameters, rescaling (1,u²)⊗(u⁻¹,g₁,g₂) by u^{∓1} gives Dia07 Th. 7(1)'s configuration at v=u, w=u·g₁, the same way W₁ does, provided (1,w,w̄) and (u,ū) are free. So the printed configuration may cover more than the first theorem, as an instance of the same substitution. The target's nearby-result line could mention this, but the invisibility is untouched. I did not settle how this relates to the other conjugation-stable parameter choice, |a|²=ρ.

**Outside my strategy, not assessed.** Statement (c), and the 2+3−1=4 dimension count behind invisibility, have the shape of linear Kneser/Vosper results for products of subspaces in field extensions. The local library holds Bachoc-Serra-Zémor, which I did not read. That is an analogue at best in the algebra literature, and a search of that field is where a real implication of (c) might appear. It is not transcendence literature.

**Not settled.**
- Keyword coverage in Semantic Scholar and part of arXiv was cut by rate limits.
- Paywalled books (Murty-Rath, Tubbs, Natarajan-Thangadurai) were not read. They are expository, so a new structural statement there is unlikely.
- Local text layers were used as they stand; the formulas in Dia07 are garbled but readable. No statement here depends on the exact form of a formula beyond what I restated, and I did not check any against the page.
- Further Variations has an unreadable local text layer, so it was judged from secondary statements.

## Read

- G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques, JTNB 19 (2007) 373-391 — https://doi.org/10.5802/jtnb.592: §2.1 from Corollaire 3 on, §2.2 opening, §2.3 (Théorèmes 5, 6, 7), §2.4 bilan, references (local text layer)
- M. Waldschmidt, The role of complex conjugation in transcendental number theory (DION 2005 proceedings, 2008) — https://hal.science/hal-00411402v1: §4 Recent results, §5 Products of logarithms, §6 Further results (local text)
- M. Waldschmidt, Variations on the six exponentials theorem (Hyderabad 2005) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Hyderabad.pdf: Corollaries 2.12-2.14, the conjugation passage only (local text)
- G. Diaz, Utilisation de la conjugaison complexe..., JTNB 16 (2004) 535-553 — https://doi.org/10.5802/jtnb.459: §5.1 end and §5.2, the method questions and second conjecture (local text)
- M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (Springer 2000): Exercise 15.16 only (local text)

## Screened only

- M. Waldschmidt, Further variations on the six exponentials theorem, Hardy-Ramanujan J. 28 (2005). Local text layer is garbled; judged from the zbMATH entry and the restatement of Th. 1.2 in the 'Role of complex conjugation' survey — https://hal.science/hal-01110928v1
- M. Waldschmidt, The four exponentials problem and Schanuel's conjecture (2023). Keyword scan of the full text only: Roy's theorem restated, no hit for Diaz or conjugation — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf
- A. Momot, Density of rational points on commutative group varieties and small transcendence degree (2010/2011). Keyword scan: generalises a Diaz 2004 theorem on modulus and conjugation via algebraic groups; no product-space content seen — https://arxiv.org/abs/1011.3368
- D. Roy, Matrices whose coefficients are linear forms in logarithms, JNT 41 (1992). Theorem list scan only — https://doi.org/10.1016/0022-314X(92)90081-Y
- M. Waldschmidt, On Ramachandra's contributions to transcendental number theory (2013). Keyword scan of conjugation hits — https://hal.science/hal-01112588v1
- M. Waldschmidt, Transcendence of periods: the state of the art (2006). Keyword scan of Diaz hits
- L. Butler, A Diophantine approach to the three and four exponentials conjectures, Ramanujan J. 42 (2017). Abstract only: Wilkie's conjecture, real versions — https://doi.org/10.1007/s11139-015-9728-2
- L. Habsieger, A few remarks related to the four exponentials conjecture, Publ. Math. Debrecen 70 (2007). Abstract only: alternants, limits of the method — https://publi.math.unideb.hu/paper/1156
- G. Diaz, La conjecture des quatre exponentielles et les conjectures de D. Bertrand, JTNB 9 (1997). Title and zbMATH entry; Dia07 §2.3 describes its Proposition 3
- S. Dasgupta, M. Kakde, Ranks of matrices of logarithms of algebraic numbers II (2026). Title and zbMATH entry: p-adic matrix coefficient conjecture
- D. Prasad, Some questions on Diophantine approximation, real and p-adics (arXiv 2505.15744). Title and search snippet — https://arxiv.org/abs/2505.15744
- A. Maksoud, On the rank of Leopoldt's and Gross's regulator maps (arXiv 2201.08203). Title and search snippet — https://arxiv.org/abs/2201.08203
- The Exponential World (arXiv 2105.05809). Title and search snippet only — https://arxiv.org/abs/2105.05809
- M. Waldschmidt, Le théorème des six exponentielles restreint à l'irrationalité (2021) and Six Exponentials Theorem - Irrationality (2022). HAL titles: irrationality setting — https://hal.science/hal-04025073v1
- M. Ram Murty, P. Rath, Transcendental Numbers (Springer 2014). zbMATH hit only
- Wikipedia, Six exponentials theorem and Four exponentials conjecture. Secondary, screened only

## Inaccessible

- Citing-work list from OpenAlex for Dia07 and Dia04 — https://api.openalex.org/works/doi:10.5802/jtnb.592: HTTP 429 on every cites query, so citation tracing rests on zbMATH, OpenCitations and Semantic Scholar. OpenAlex reports 0 citers for Dia07 and 9 for Dia04; the 9 were not listed.
- Semantic Scholar keyword search — https://api.semanticscholar.org/graph/v1/paper/search: HTTP 429 on 4 of 5 queries, so little keyword coverage from this index. The citation endpoints did work.
- arXiv API, last query (complex conjugation, transcendence, logarithms) and the products query after it — https://export.arxiv.org/api/query: HTTP 429 stopped the loop at the conjugation query, so the products query never ran. Earlier arXiv abstract queries returned nothing relevant.
- L. Butler, Ramanujan J. 42 (2017), full text — 10.1007/s11139-015-9728-2: Publisher copy not opened; no arXiv version found. Abstract only.

## Queries

- web: Diaz Produits et quotients de combinaisons linéaires de logarithmes
- web: transcendence modulus of logarithm complex conjugation six exponentials rank matrix |log α|
- web: subspace stable under conjugation contains product of 2- and 3-dimensional subspaces over algebraic numbers, logarithms
- web: matrices dont les coefficients sont des logarithmes, rang, conjugaison complexe, module d'un logarithme
- web: théorème fort des six exponentielles, conjugaison, familles {v,vu,vu²}
- web: consequences of strong six exponentials, |u| and e^u algebraic, unit circle, 2020s
- web: strong six exponentials, rational function of u, Laurent polynomial, points on circle
- web (extended): strong four exponentials partial results 2015-2026
- web (extended): Diaz conjecture e^u, |u| algebraic, u² u³ partial results
- web: A few remarks related to the four exponentials conjecture
- web: produits de combinaisons linéaires de logarithmes, sous-espace stable par conjugaison, fractions rationnelles
- web: 2×3 matrix in L-tilde, rational functions of u, family {v,vu,vu²,vu³}
- web (extended): citations of Diaz Produits et quotients 2010-2026
- web: product of logarithms, Diaz, Roy, conjugation, 1/λ not in L-tilde
- web: Butler three and four exponentials
- web: Waldschmidt strong six exponentials corollaries, DALAG exercise
- web: sous-espaces produit dimension 2 et 3 sur Q-barre, six exponentielles, point du cercle
- zbMATH: ci:1163.11055, ci:1071.11046, ci:0763.11030, ci:0887.11030, ci:1198.11068, ci:1116.11054, ci:1176.11033, ci:1543.11060
- zbMATH: au:Diaz, Guy 2003-2026; ti and ab: six/four exponentials, quatre/six exponentielles, strong six/four exponentials, complex conjugation, conjugaison complexe, products of logarithms, produit(s) de logarithmes, linear combinations of logarithms, structural rank, algebraic independence of logarithms
- arXiv API: abs strong six exponentials; six exponentials; four exponentials; strong four exponentials
- OpenCitations and Semantic Scholar citers of 10.5802/jtnb.592 and 10.5802/jtnb.459; Semantic Scholar citers of Roy 1992
- HAL API: text six/four exponentials, six/quatre exponentielles
- Local library grep: conjugat, modulus, Diaz, rational function, dimension, Exercise 15.16
