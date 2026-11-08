# Entry 14, strategy: citations

## Target, as restated by the searcher

Work in C over the algebraically closed subfield Q̄. Let u be non-algebraic with ρ = uū algebraic, so ū = ρ/u and H₀ = Q̄ + Q̄u + Q̄/u. Let g in C be such that 1, u, ū, g, ug are Q̄-independent, and put W = H₀ + Q̄g + Q̄ug. Claim: some w in W outside H₀ makes the 4-dimensional space H₀ + Q̄w contain all products x_i y_j, with (x₁,x₂) and (y₁,y₂,y₃) each independent, if and only if uR(u)g = N(u) for polynomials R ≠ 0 of degree ≤ 2 and N of degree ≤ 3. Pencil consequence: take g = f/(s+λu) with s² = ρ, |λ| = 1, λ algebraic, f = P(u)/Q(u) coprime. Then W is visible if and only if max(deg P, deg Q + 1) ≤ 2 + [Q(0)=0] + [P(-sλ̄)=0]. No such statement need involve divisors. The part sought is this iff criterion and its degree test.

## Leads

### Lead 1: implies

- **Citation:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. 163 (2017), 423-452; arXiv:1501.00602v2
- **Location:** Theorem 33, section 7, pp. 25-26 of arXiv v2, used with Theorem 2 (p. 2, credited to Eliahou-Lecouvey). Numbering checked on arXiv v2 only, not on the journal version.
- **Quote:** Let F be an algebraically closed field and let L/F be a non-trivial extension
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** OWN TRANSLATION; the criterion itself is not printed. Thm 2 gives dim XY = 4, so Thm 33 gives V = H₀+Q̄w = c<1,a,a²,a³>. Put p₀=1/c, p₁=u/c, p₂=1/(uc), cubics in a with p₁p₂=p₀². If u=A/B in lowest terms in a, of degree d, then A|h where p₀=hB, p₁=hA, forcing some p_i to have degree ≥ 2d, so d=1. Hence u is Möbius in a and V = f⁻¹<1,u,u²,u³>. Since 1, u, 1/u lie in V, f = u·f₁ with deg f₁ ≤ 1. Reducing w mod H₀ to (a₀+b₀u)g gives R = f₁·(a₀+b₀u). Converse: factor R over Q̄ as (a₀+b₀u)f₁, set w=(a₀+b₀u)g, f=uf₁; then fV = cubics and the configuration is f⁻¹(1,u) by (1,u,u²). Pencil: with g=P/(Q·(s+λu)), reduce ug to lowest terms; u cancels iff Q(0)=0, s+λu cancels iff P(-sλ̄)=0, and the bounds deg denominator ≤ 2, deg numerator ≤ 3 give the stated inequality.

### Lead 2: analogue only

- **Citation:** G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, J. Théor. Nombres Bordeaux 19 (2007), 2 (journal p. 390 region)
- **Location:** Théorème 7, points 1 and 2 (PDF p. 19 of the local copy)
- **Quote:** (paraphrase, no quotation) For u non-algebraic and v non-zero, v, vu, vu², vu³ are …
- **Link:** https://doi.org/10.5802/jtnb.592
- **Relation:** It prints the family v<1,u,u²,u³>, which by the derivation above is exactly the shape of the visible 4-dimensional spaces, with v = 1/(u f₁(u)). It states no criterion on H₀ + Q̄w, no converse and no degree test, so it does not reach the target.

### Lead 3: analogue only

- **Citation:** C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's theorem, Algebraic Combinatorics 1 (2018); arXiv:1709.00087
- **Location:** Introduction, the remark on an algebraically closed base field
- **Quote:** (paraphrase, no quotation) Over an algebraically closed base, the linear Vosper theorem follows nearly …
- **Link:** https://arxiv.org/abs/1709.00087
- **Relation:** It confirms and credits the engine used in the first lead, and otherwise treats squares S² only. It says nothing about H₀ or degree-one spaces.

## Notes

**Result.** I found no printed statement of the criterion, but one printed theorem implies it through a short derivation of my own. The "not found" stands as a statement. It does not stand as a claim that the result needs new ideas: it is a corollary of Bachoc-Serra-Zémor (BSZ) Theorem 33, which fits the chapter 14 class "routine".

**How the find arose.** The product condition says X·Y lies in a 4-dimensional space with dim X = 2 and dim Y = 3, which is the equality case 4 = 2+3-1 of the linear Cauchy-Davenport bound. I then looked for an inverse theorem and followed citations from there. BSZ Theorem 33 is that inverse theorem over an algebraically closed base. Q̄ is algebraically closed, so it applies directly with L = C. The transcendence literature (Diaz, Roy, Waldschmidt) never uses it: a grep of the local diaz, roy and waldschmidt text files for Bachoc or Vosper returned nothing.

**Derivation, for a verifier.**
- (⇒) Thm 2 gives dim XY ≥ 4, so XY = V := H₀ + Q̄w has dimension exactly 4.
- Thm 33 gives X = g₁<1,a>, Y = g₂<1,a,a²>, hence V = c<1,a,a²,a³>. Here a is transcendental, since a algebraic would collapse the dimensions.
- p₀=1/c, p₁=u/c, p₂=1/(uc) are polynomials in a of degree ≤ 3 with p₁p₂ = p₀².
- Write u = A/B coprime in a, with max degree d ≥ 1. From p₀A = p₁B we get p₀ = hB, p₁ = hA. From Ap₂ = hB² we get A|h. So p₀ = ABh', p₁ = A²h', p₂ = B²h', and some p_i has degree ≥ 2d. Hence 2d ≤ 3 and d = 1.
- So a is Möbius in u, and V = C<1,u,u²,u³> for some C. Put f = 1/C. Then f, fu, f/u are polynomials of degree ≤ 3, so f = u·f₁ with deg f₁ ≤ 1.
- w ∈ W \ H₀ reduces mod H₀ to (a₀+b₀u)g with (a₀,b₀) ≠ 0, which lies in V. So u·f₁·(a₀+b₀u)·g has degree ≤ 3. Take R = f₁(a₀+b₀u).
- (⇐) Factor R over Q̄ as (a₀+b₀u)f₁ with both factors of degree ≤ 1, and set w = (a₀+b₀u)g, f = uf₁. Freeness gives w ∉ H₀ and dim V = 4, and fV lies in the cubics, so V = f⁻¹<1,u>·<1,u,u²>.
- Pencil: W(λ,f) = H₀ + Q̄g + Q̄ug for g = f/(s+λu), since λ ≠ 0. The root of s+λu is -sλ̄, because |λ| = 1. s ≠ 0, so u and s+λu do not cancel each other. Reducing uP/(Q(s+λu)) with ε = [Q(0)=0]+[P(-sλ̄)=0] gives denominator degree deg Q+1-ε and numerator degree deg P+1-ε. Existence of R and N is equivalent to denominator degree ≤ 2 and numerator degree ≤ 3, which is the stated inequality. This matches the blueprint's formula.

I checked this by hand only, not by machine. The translation is mine and no source prints it. A verifier should confirm Theorem 33 against the journal version, since I read arXiv v2.

**Other sources.**
- Diaz 2007 Théorème 7(2) prints the family v<1,u,u²,u³> and proves it is not contained in L̃. It does not ask which spaces contain such a family, so it stays an analogue.
- Bachoc-Couvreur-Zémor confirm the Vosper step is simple over an algebraically closed base. They and the later function-field papers then study squares S², which is a different question.

**After 5 October 2026.** I found nothing relevant. arXiv listings gave no on-topic paper for the exponentials or Vosper terms. The two October 2026 hits for "six exponentials" are about zeta universality and graph percolation, unrelated by title. The newest BSZ citer in Semantic Scholar, 2610.25065, concerns curves on Calabi-Yau threefolds, also judged by title.

**What I could not settle.**
- Forward-citation coverage is partial. OpenAlex filters returned 429 for the whole run, Semantic Scholar was rate limited on many calls, and my zbMATH reverse-citation queries returned 404. So citers of Diaz 2004, of Waldschmidt's Role and Further variations, and of the 2023 survey were not enumerated through an index. This is the main gap.
- The classical geometric route, a 1-generic 2×3 matrix of linear forms giving a twisted cubic, probably yields the same structure step without Vosper. I did not open a primary source, so it is not listed as a lead.
- A BSZ PDF sits in the local sources/others folder. I did not check whether the blueprint already cites it, as the brief forbids reading elsewhere in the repository. If it does, the find is still independent, but the source line should say so.

Time used: about 15 minutes of the 30-minute box (start 15:54 CET, last clock check 15:59).

## Read

- Bachoc-Serra-Zémor, Vosper for extension fields (arXiv v2, local copy) — https://arxiv.org/abs/1501.00602: Introduction, Theorems 1-3, section 7 through Theorem 33 and its proof
- Diaz 2007, Produits et quotients (local copy) — https://doi.org/10.5802/jtnb.592: Théorèmes 4 and 7, section 2.3 headings, section 2.4, grep of the family v, vu, vu²
- Bachoc-Couvreur-Zémor 2018 (ar5iv HTML) — https://ar5iv.arxiv.org/html/1709.00087: Abstract and introduction, including the algebraically closed remark

## Screened only

- Wessel, On Freiman's theorem in a function field setting, arXiv:2405.10724 (abstract; squares only) — https://arxiv.org/abs/2405.10724
- Freiman's 3k-4 theorem for function fields, arXiv:2408.00183 (abstract; squares only) — https://arxiv.org/abs/2408.00183
- High dimensional Riemann-Roch spaces in linear spaces with small squares, arXiv:2609.06822 (abstract; squares, conjectural) — https://arxiv.org/abs/2609.06822
- Submodular functions in additive combinatorics..., arXiv:2210.08845 (abstract; group actions and representations) — https://arxiv.org/abs/2210.08845
- Semantic Scholar citers of Bachoc-Serra-Zémor, 30 most recent by title, including 2610.25065 and 2607.24847 (mostly Sidon spaces and subspace codes; none on topic)
- Semantic Scholar citers of Roy 1992 (19 titles), of Waldschmidt 2005 Variations (7 titles), of Diaz 2007 (1 title, Waldschmidt 2005); no criterion of this kind by title
- zbMATH title searches: six exponentials, four exponentials, conjugaison complexe, Diaz in 11J81, Vosper, Kneser field extensions, Freiman function field
- arXiv title and abstract listings, newest first, for six exponentials, four exponentials, Vosper field extension (no on-topic paper after 5 October 2026)
- Waldschmidt, The role of complex conjugation (DION 2005), survey, judged from search results — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf
- Waldschmidt slide deck of July 2026, Strategies of transcendence proofs (search snippet only) — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/StrategyTrancendence2.pdf
- Web results on twisted cubics as rank-one loci of 2×3 matrices of linear forms (background only; none on product spaces in a field)

## Inaccessible

- Bachoc-Serra-Zémor, journal version in Math. Proc. Cambridge Philos. Soc. — https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/an-analogue-of-vospers-theorem-for-extension-fields/66AB475A5CF8C2DF2BC2BB0CC2AAED9D: Paywalled and not opened; theorem numbers come from arXiv v2
- OpenAlex forward citations (filter=cites) for Diaz 2007, Roy 1992 and others: Every filter or search call returned HTTP 429 throughout the run; only single-record lookups worked
- Semantic Scholar forward citations of Diaz 2004, Waldschmidt 2005 Role and Further variations, Waldschmidt 2023: HTTP 429 on these calls, and the DOI I tried for Diaz 2004 (10.5802/jtnb.460) resolved to an unrelated paper, so its citer list was discarded
- zbMATH reverse citation search: The rf: and references: queries I tried returned 404, so zbMATH gave no forward citations
- Eisenbud, Linear sections of determinantal varieties, Amer. J. Math. 110 (1988): Not opened; named from memory as the classical geometric route, so it is not offered as a lead

## Queries

- WebSearch: Diaz conjecture algebraic modulus exponential e^u algebraic |u| algebraic transcendence complex number logarithm conjugate
- WebSearch: Vosper theorem linear analogue function field algebraically closed dim ST = dim S + dim T - 1 bases geometric progression
- WebSearch: 2×3 matrix products x_i y_j in four-dimensional vector space twisted cubic rational normal curve 1-generic determinantal function field multiplication subspaces
- WebSearch: strong six exponentials theorem new consequence complex conjugation modulus logarithm 2025 2026 arXiv
- WebSearch: Waldschmidt Roy transcendence 2×3 matrix rank one entries Q̄-span logarithms rational function of u polynomial degree 3 configuration classification
- WebSearch: Bachoc Serra Zémor Vosper extension fields algebraically closed base field cited rational functions Hopf lemma equality case
- zbMATH: ti:"six exponentials"; ti:"four exponentials"; ti:"conjugaison complexe"; au:Diaz, G* & cc:11J81; ti:vosper; ti:kneser & ti:"field extensions"; ti:"function field" & ti:Freiman
- Semantic Scholar: citations of DOI 10.5802/jtnb.592, DOI 10.1016/0022-314X(92)90081-Y, DOI 10.5802/alco.19, ARXIV:1501.00602, Variations on the Six Exponentials Theorem
- arXiv search, newest first: "six exponentials"; "four exponentials"; "strong four exponentials"; transcendence complex conjugation logarithms; "linear analogue" Vosper; "Vosper" "field extension"; Schneider eighth problem
- Local library grep: Diaz 2007, Bachoc-Serra-Zémor, Roy, Waldschmidt files for vu², u³, Vosper, twisted cubic
