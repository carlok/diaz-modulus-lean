# Entry 10, strategy: citations

## Target, as restated by the searcher

Work in Q̄(u) with the semilinear involution that conjugates coefficients and sends u to s²/u, where s is real algebraic and s² = uū. H₀ = Q̄+Q̄u+Q̄ū. Part (a): let g be such that 1,u,ū,g,ug are free and ḡ ∈ Q̄+Q̄u+Q̄ug. Then V = H₀+Q̄g+Q̄ug contains the product ⟨1,u⟩·⟨1,ū,g⟩, is a degree-one 2×3 configuration space, and is conjugation-stable. The claim is that every such V is a real pencil space (the explicit family named in the blueprint). Part (b): with f = u²/s²+s²/u² and W = span(1,u,ū,f,f/(s+u)), W is conjugation-stable and carries a 2×3 configuration, yet no 4-dimensional H₀+Q̄w ⊂ W carries one, and W contains no progression. A find would have to state (a) or (b), or imply them by a short translation.

## Leads

### Lead 1: analogue only

- **Citation:** G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, J. Théor. Nombres Bordeaux 19 (2007), 373-391 (DOI 10.5802/jtnb.592)
- **Location:** Théorème 7(1), §2.3, p. 390 of the journal pagination (local text: line 943)
- **Quote:** Soient u, v ∈ C avec (1, u, ū) Q-libre et (v, v̄) Q-libre.
- **Link:** https://doi.org/10.5802/jtnb.592
- **Relation:** My own translation, checked by hand. Put v' = g = f/(s+u) and u' = (s+u)/f. Then the six products of (v', v̄') and (1, u', ū') are g, 1, ū/s, ug/s (since v̄' = ug/s), u/s, 1, and they span W. So W's 2×3 configuration has the conjugation-stable shape of Th. 7(1), which excludes such a W from L̃. This gives the transcendence consequence and exhibits the configuration. It does not give the classification (a), the invisibility in (b), or anything about progressions.

### Lead 2: analogue only

- **Citation:** C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's Theorem, Algebraic Combinatorics 1 (2018), 501-521 (arXiv:1709.00087)
- **Location:** Theorem 8.1 (genus 0, combinatorial genus 1 bases) and §9, remark after Theorem 9.2 (conic example)
- **Quote:** equal to a Riemann-Roch space L(P), where P is a place of degree 2
- **Link:** https://doi.org/10.5802/alco.19
- **Relation:** The §9 example is the real form of H₀: a conic over a non-closed field whose base change has basis t⁻¹,1,t. Theorem 8.1 says a 5-dimensional genus-0 space with γ=1 has basis 1,t,t²,t³,(t+α)t⁴ or 1,(t+α)t,…,(t+α)t⁴, so it contains a 4-term progression. W escapes this: I computed dim W² = 11 at s=1, so γ=2. The theorem concerns S² only, not S·T with S≠T. It has no involution and does not imply (a) or (b).

### Lead 3: analogue only

- **Citation:** M. Wessel, On Freiman's Theorem in a function field setting, arXiv:2405.10724 (2024)
- **Location:** Theorem 1.6 and Corollary 1.6.1
- **Quote:** S is contained in a space L(D) with deg(D) ≤ n+1
- **Link:** https://arxiv.org/abs/2405.10724
- **Relation:** For n=5, γ=2, genus 0, the corollary only places W inside some L(D) with deg D ≤ 6, which is weaker than the visible polar divisor of degree 5. It has no 2×3 asymmetry, no conjugation and no invisibility statement.

### Lead 4: analogue only

- **Citation:** A. Couvreur, G. Zémor, Freiman's 3k-4 Theorem for Function Fields, arXiv:2408.00183 (2024)
- **Location:** Abstract / Theorem 1; §6 (non-algebraically-closed K, by base change)
- **Quote:** S is of small codimension inside a Riemann-Roch space of K(S)
- **Link:** https://arxiv.org/abs/2408.00183
- **Relation:** The real form W₀ over Q̄∩R satisfies dim W₀² = 11 = 3k−4, so the theorem applies and says W₀ has small codimension in a Riemann-Roch space, which is already visible. This is a structural statement about squares. It does not classify conjugation-stable spaces carrying a 2×3 product and does not address invisibility.

### Lead 5: analogue only

- **Citation:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. 163 (2017) (arXiv:1501.00602)
- **Location:** Theorems 2 and 3 (local text lines 60-76)
- **Quote:** dimST = dimS + dimT − 1
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** This is the critical case dim ST = dim S + dim T − 1, with geometric progression bases, for prime-degree extensions of finite fields and related settings. The extremal pair corresponds to the 4-dimensional progression case. The target's spaces have dim ST = dim S + dim T, one step above, and lie in a transcendental rational function field with an involution. Nothing here reaches the target.

## Notes

**Verdict: no find.** Nothing I read states the classification (a) or the invisibility example (b), or implies them. All leads are analogues. I stopped at about 16 minutes because the citation trails had closed, not because time ran out. Forward-citation coverage was partial (see limits).

**Two literatures were checked.**

1. *Transcendence side (backward and forward from Diaz).* Diaz 2004 Th. 2, Diaz 2007 Th. 3 and Th. 7, and Waldschmidt's conjugation survey §6 use conjugation only to deduce non-membership in L̃ from Roy's theorem. None of them works with the space spanned by a configuration, or asks which spaces carry one.
   - I found a substitution (Lead 1, my own translation): W's configuration is literally the Th. 7(1) shape, with (v', v̄') = (g, ḡ) and (1, u', ū'), u' = (s+u)/f.
   - So the printed result already gives that W ⊄ L̃. This matches the target's "only invisibility can be new" framing but does not reach it.
   - Known forward citers of Diaz 2004 and 2007 are Waldschmidt's surveys, Butler, and a density-of-rational-points paper; I judged these by title, and none looks relevant.

2. *Linear additive combinatorics.* This is the natural home for 2×3 products in a function field: Hou-Leung-Xiang, Bachoc-Serra-Zémor, Bachoc-Couvreur-Zémor, Wessel, Couvreur-Zémor, Tanısalı-Wessel (Sept 2026, before the 5 Oct date but probably unknown to the target's authors). As far as I read, this line treats S² rather than S·T with S≠T at one above the minimum. Base change to non-closed K is its only touch of a real form (BCZ §9, CZ §6). No paper classifies involution-stable product spaces.

**Computation (own, exact rational arithmetic, s=1 after rescaling u).**
- W·u²(1+u) is a hyperplane in polynomials of degree ≤5, with annihilator (−1,−1,1,−1,1,1) on coefficients. I checked this by hand on all five basis elements.
- dim W² = 11, so the combinatorial genus is γ = 2. BCZ Th. 8.1 therefore does not apply.
- The 4×3 Hankel matrix of this form has rank 3, so no quadratic p has p·(cubics) ⊂ W. Hence W contains no 4-term degree-one progression a·(1,t,t²,t³) with deg t = 1 and a of polar degree 2 relative to D (Sylvester apolarity). Larger deg t does not fit in polar degree 5.

**A point for the authors to check.** target.md does not define "progression". The source line says the polar divisor having degree 5 implies no progression. That inference is valid for a 5-term progression, whose span has polar degree 4. It is not valid for a 4-term one: BCZ Th. 8.1 type (i), 1,t,t²,t³,(t+α)t⁴, has polar degree 5 and contains a 4-term progression. If the blueprint means 4 terms, the reason given needs the apolarity check above. The statement itself survives for this W.

**Translation I did not find in print.** A 2×3 configuration with x₂/x₁ of degree one corresponds to a rational curve lying as a section on a cubic scroll S(1,2) in P⁴, with conjugation as a real structure. I searched this classical wording once and found only the class D+4F computation for quintics on scrolls, with no real-structure classification. One search is thin coverage, so a classical treatment of real rational quintics on real scrolls remains the most plausible place for an undiscovered statement.

**Limits.** OpenAlex and the arXiv API were rate-limited for most of the run, and zbMATH reference search was unavailable. Forward citations therefore rest on Semantic Scholar and OpenCitations, which are thin for French JTNB papers and returned nothing for the Waldschmidt conjugation survey. I found nothing relevant dated after 5 Oct 2026 in the arXiv and zbMATH listings I could reach, judged by title. The arXiv full-text search for the conjugation queries returned 0 results. The Waldschmidt book and the Roy 1995 and Roy 2001 papers were not reread for this target.

## Read

- Diaz 2007, Produits et quotients (local copy) — https://doi.org/10.5802/jtnb.592: §1.2 conjectures (grep), §2 Th. 3 and Cor. 1, Th. 7 and the closing §2.4, references
- Diaz 2004, Utilisation de la conjugaison complexe (local copy) — https://doi.org/10.5802/jtnb.459: Théorème 2 and its proof; theorem list by grep
- Waldschmidt, The role of complex conjugation in transcendental number theory (local copy): §6: Theorems 6.1, 6.2, Cor. 6.3
- Bachoc-Couvreur-Zémor 2018 — https://arxiv.org/abs/1709.00087: §1, §2, Prop. 6.2, §6.2, Theorem 8.1, end of §9
- Wessel 2024 — https://arxiv.org/abs/2405.10724: Introduction, Theorem 1.4, Theorem 1.6, Cor. 1.6.1
- Couvreur-Zémor 2024 — https://arxiv.org/abs/2408.00183: Abstract, §1 opening, §3.1, start of §6
- Bachoc-Serra-Zémor 2017 (local copy) — https://arxiv.org/abs/1501.00602: Introduction, Theorems 1-3 statements
- Draisma 2006, small maximal spaces (local copy) — https://arxiv.org/abs/math/0407240: Passage on the Kronecker-Weierstrass theory of pencils, Prop. 7

## Screened only

- Tanısalı-Wessel, High dimensional Riemann-Roch spaces in linear spaces with small squares, arXiv:2609.06822 (Sept 2026) — https://arxiv.org/abs/2609.06822
- Bachoc-Serra-Zémor, Revisiting Kneser's theorem for field extensions (Combinatorica 2018), zbMATH 1413.11115
- Hou, On a vector space analogue of Kneser's theorem (2007), zbMATH 1132.12003
- Butler, A Diophantine approach to the three and four exponentials conjectures (Ramanujan J. 2017), DOI 10.1007/s11139-015-9728-2, citer of Diaz 2004
- Density of rational points on commutative group varieties and small transcendence degree, arXiv:1011.3368, citer of Diaz 2004 — https://arxiv.org/abs/1011.3368
- Waldschmidt, Variations on the six exponentials theorem (2005); Further variations (2005); The four exponentials problem and Schanuel's conjecture (2023): titles and matrix statements by grep in local copies
- Waldschmidt, Transcendence of periods: the state of the art (2006); On Ramachandra's contributions (2003): citers of Diaz 2004, by title only
- Eisenbud-Harris 1988, Vector spaces of matrices of low rank (local copy, grep only)
- Diaz, Roy 1992 forward citers from Semantic Scholar 2018-2022 (Leopoldt/Katz p-adic L-function papers, e.g. arXiv:2201.08203, 1907.09422, 2202.07286): unrelated, by title
- arXiv listings, newest first, for 'six exponentials', 'four exponentials', 'logarithms of algebraic numbers', 'Vosper', 'Freiman Riemann-Roch': entries after 5 Oct 2026 (e.g. 2610.41600 Pańkowski, 2610.10469, 2611.01170, 2610.17258) are unrelated by title
- zbMATH Open: cc:11J81 & py:2026 listing, 25 items: none on the topic, by title
- Web search hits on rational quintics on cubic scrolls and on rational functions on the unit circle: background only, nothing on the setup

## Inaccessible

- zbMATH 'cited by' for Diaz 2004/2007, Waldschmidt 2008, BCZ, BSZ: rf: search returned 404 in the API and 403 in the HTML interface, so zbMATH forward citations were not obtained
- OpenAlex forward citations: Rate-limited (HTTP 429) for most of the run, and a late cites: query returned no rows; title searches failed too
- arXiv API (export.arxiv.org): HTTP 429 throughout; I used the arxiv.org/search HTML listings instead, which rejected some boolean queries (HTTP 400)
- Semantic Scholar citations of Waldschmidt, Role of complex conjugation, and of the two Variations papers: Rate-limited (HTTP 429); only Diaz 2004 and 2007 and BCZ/Wessel lists came back
- Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (Springer 2000), ch. 11: Not in the local library in a form I opened, and paywalled; not checked directly

## Queries

- product of subspaces rational function field dim 5 contains product of 2- and 3-dimensional subspaces genus zero classification involution conjugation
- Diaz conjecture modulus algebraic exp(u) algebraic |u| algebraic 2x3 matrix linear forms in logarithms conjugation stable space
- Bachoc Couvreur Zémor function field Freiman cited: product of spaces dim ST small rational function field genus 0 critical pair 2024 2025 2026
- transcendence conjugation logarithms matrix rank two 2x3 |u| algebraic e^u strong six exponentials Roy Waldschmidt 2026 arXiv
- rational quintic curves in P^4 on cubic scroll S(1,2) real structure conjugation invariant subspace
- product of two spaces of trigonometric polynomials dimension 2 and 3 in 5-dimensional conjugation-invariant space; involution u -> s^2/u
- zbMATH: ai:diaz.guy; ti:six exponentials; ti:four exponentials; strong six exponentials; complex conjugation & cc:11J81; linear forms in logarithms & conjugation; Schanuel & complex conjugation; cc:11J81 & py:2026; function field & Freiman & subspaces; Kneser & field extensions & subspaces; Vosper & extension
- Semantic Scholar citers of: DOI 10.5802/jtnb.459, jtnb.592, alco.19, arXiv 2405.10724, Roy 1992
- OpenCitations citers of jtnb.592, jtnb.459
- arXiv listings newest first: six exponentials, strong six exponentials, four exponentials, logarithms of algebraic numbers, Vosper/combinatorial genus, Freiman Riemann-Roch function field squares, Schanuel complex conjugation
