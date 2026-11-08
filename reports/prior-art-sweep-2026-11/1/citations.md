# Entry 1, strategy: citations

## Target, as restated by the searcher

Let K be the algebraic numbers, u a complex number not in K with uū = ρ in K, so ū = ρ/u, and H₀ = K + Ku + Kū. Let z not lie in H₀ and put V = H₀ + Kz, of dimension 4. The target is the converse: if V contains all six products x_i y_j of K-independent x₁,x₂ and K-independent y₁,y₂,y₃, then V = H₀ + Kw with w = u², ū² or 1/(u−a), a in K non-zero. By the known progression lemma this reduces to the following. If a 4-dimensional K-space b·⟨1,h,h²,h³⟩ (h transcendental) contains 1, u, ρ/u, then u is a Möbius function of h, and V has one of those three shapes. In polynomial terms: if p,q,r are polynomials in h of degree at most 3 with 1/b = p(h), u/b = q(h), ū/b = r(h), then qr = ρp² must force a common linear factor g, with p,q,r equal to g times AB, A², B² up to constants, for linear forms A, B.

## Leads

### Lead 1: implies

- **Citation:** J. Buczyński, N. Ilten, E. Ventura, Singular curves of low degree and multifiltrations from osculating spaces, arXiv:1905.11860v3 (2020); journal version in IMRN, from memory, volume and pages not checked
- **Location:** Section 6.1, Lemma 6.1(3) and Lemma 6.2 (pp. 27-28 of the arXiv version); the setup at the start of Section 6.1 covers any smooth curve with a very ample line bundle
- **Quote:** φ is birational onto its image if and only if P(L) intersects only finitely
- **Link:** https://arxiv.org/abs/1905.11860
- **Relation:** Implies the step not found, not the classification as stated. Take X = twisted cubic, d = 3, genus 0, ℓ = 1, so 2ℓ < d and n = 2 (Theorem 1.2 assumes n > 2, but the two lemmas do not). If p,q,r have no common root, (p:q:r) is birational onto a plane curve of degree 3, which cannot lie on the conic YZ = ρX². So W = ⟨p,q,r⟩ = g·(all quadratics) and u = q/p has degree one in h. Then V = (u·g(u))⁻¹·(cubics in u), and g = 1, u, u−a give u², ū², 1/(u−a). With BSZ17 Lemma 4 this is the whole converse. The joining argument is mine; no paper states it.

### Lead 2: implies

- **Citation:** Wikipedia, Twisted cubic (classical facts; the page has no inline citations and lists J. Harris, Algebraic Geometry: A First Course, Springer 1992, in its bibliography)
- **Location:** Section Properties, bullets on projection from a point on a tangent line, on a secant line, and on C, and the bullet on secants and tangents filling P³
- **Quote:** The projection from a point on C yields a conic section.
- **Link:** https://en.wikipedia.org/wiki/Twisted_cubic
- **Relation:** A tertiary source for the same fact. Tangents and secants fill P³, so a centre off the curve gives a nodal or cuspidal cubic and never a conic. Hence the hyperplane W corresponds to a centre on the curve, i.e. p,q,r share a linear factor, and the rest follows as in the previous lead. The bullets were seen through search-engine extracts and a partial index hit, so the wording should be checked on the page. I could not open Harris to find a printed location.

### Lead 3: implies

- **Citation:** F. Rydell, I. Sundelius, Conic multiview varieties (listed in search results as Projections of Curves and Conic Multiview Varieties), arXiv:2404.03063v2 (2 Nov 2026)
- **Location:** Section 2.2, Twisted cubics
- **Quote:** These image cubics are singular
- **Link:** https://arxiv.org/abs/2404.03063
- **Relation:** Weak form. It says the projected twisted cubic is an irreducible singular plane cubic, which gives the conic exclusion needed above. It does not state the centre-on-curve case, and it treats camera centres without spelling out that exclusion. It predates and is unrelated to this work apart from the listing date of v2.

### Lead 4: analogue only

- **Citation:** A. Cantón, L. Fernández-Jambrina, M.J. Vázquez-Gallo, Rational complex Bézier curves, arXiv:2507.23485v3 (Dec 2025); it cites G.-J. Wang, G.-Z. Wang, The rational cubic Bézier representation of conics, CAGD 9 (1992) 447-455, and J. Sánchez-Reyes, Conics in rational cubic Bézier form made simple, CAGD 108 (2024) 102266
- **Location:** Theorem 3 and the paragraph before it
- **Quote:** rational parametrisations of degree two are expressed as formal cubics through degree elevation
- **Link:** https://arxiv.org/abs/2507.23485
- **Relation:** The same algebraic phenomenon in computer-aided design: a cubic parametrisation of a conic is a quadratic one times a linear factor, tested by a resultant. It is set for real-parameter plane curves, not over an algebraically closed field, so it does not literally imply the step. I did not verify their 'if and only if' in the complex-weight generality.

### Lead 5: analogue only

- **Citation:** C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's theorem, Algebraic Combinatorics 1 (2018) 501-521; arXiv:1709.00087
- **Location:** Theorem 5.3 and the remark after it (combinatorial genus 0 means aL(nP∞) in genus 0); Proposition 8.2, whose proof uses the Laurent space L((n−1)P+Q); Theorem 8.1
- **Quote:** S has a basis in geometric progression
- **Link:** https://arxiv.org/abs/1709.00087
- **Relation:** Their framework covers both spaces separately: W = u⁻¹⟨1,u,u²⟩ and V each have combinatorial genus 0. Nothing there compares K(u) and K(h) when W lies in V, which is exactly the target's step. Proposition 8.2 and Theorem 8.1 classify codimension-1 subspaces of Riemann-Roch spaces of combinatorial genus 1, the opposite question.

### Lead 6: analogue only

- **Citation:** V. Di Gennaro, A. Rapagnetta, P. Sabatino, The genus of a curve on Calabi-Yau threefolds, arXiv:2610.25065v2 (3 Nov 2026)
- **Location:** Section 2 items (vi)-(vii) and the proof of Theorem 1.4
- **Quote:** would map Σ to a rational normal curve
- **Link:** https://arxiv.org/abs/2610.25065
- **Relation:** The only work citing BSZ17 after 5 October 2026 that I found. It uses BSZ17 Theorem 33 to turn a critical product into a rational normal curve. That is the same dictionary between progressions and rational normal curves, but it makes no statement about spaces containing 1, u, 1/u.

## Notes

**Outcome.** I did not find the classification printed as stated: no paper says that a 4-dimensional extension of ⟨1,u,ρ/u⟩ carrying a 2×3 configuration must contain u², ū² or 1/(u−a). But the named step, "the degree count forcing u to be a Möbius function of the ratio", is implied by a printed general lemma and is a classical fact about the twisted cubic. So "not found" survives only for the assembled statement. In my judgment the label "not routine" is hard to defend, and I suggest the referees re-examine it. This is a reading of the mathematics, not a published opinion.

**Key derivation (mine; no paper joins these pieces).**
1. Normalise V = b·⟨1,h,h²,h³⟩ with h transcendental, and identify V with binary cubics in h.
2. Then W = ⟨1,u,ū⟩ gives cubics p,q,r with qr = ρp², so φ = (p:q:r) is a projection of the twisted cubic with image on the irreducible conic YZ = ρX².
3. If φ has no base point, then 3 = deg φ · deg(image), which is impossible when the image is a conic. BIV Lemmas 6.1 and 6.2 (d=3, ℓ=1, genus 0) give this directly: birational onto a degree-3 curve.
4. So p,q,r share a linear factor g, W = g·(all quadratics), and the reduced map is an isomorphism onto the conic. Hence u is degree one in h.
5. Rewriting in the coordinate u gives V = (u·g(u))⁻¹·(cubics in u). Taking g = 1, u, u−a gives V = ⟨1/u,1,u,u²⟩, ⟨1/u²,1/u,1,u⟩, ⟨1/u,1,u,1/(u−a)⟩, the three shapes of Theorem B.

I checked this by hand; sympy was not installed, so there is no machine check. An independent referee should confirm the application of Lemma 6.2. Theorem 1.2 there assumes n > 2, but the lemmas themselves carry no such hypothesis, and I read their proofs. For d = 3 the content is the elementary fact that a point off the curve lies on one secant or tangent.

**Backward citations.** Fischler 2001 and Roy 1995 both cite Harris's book, though not for this fact. So the textbook source sat in the reference lists of the nearby transcendence papers. None of Diaz 2004, Diaz 2007, Roy 1992 or Fischler 2001 has a converse classification:
- Diaz 2007 Théorème 7(2) and Fischler Lemma 6.1 use only the progression, in the 'if' direction.
- Corollaire 5(1),(4) are exclusions at elements of the space ℒ̃.
- Diaz's interest in 1/λ, 1/(λ+α) matches the 1/(u−a) branch, but he does not ask whether the list is complete.

BSZ17 Theorem 33 is a slightly stronger form of what the target cites (same ratio for any dimensions over an algebraically closed base). It does not touch the converse.

**Forward citations, with attention after 5 Oct 2026.** Only one new citer of BSZ17 appeared, Di Gennaro-Rapagnetta-Sabatino (analogue). Diaz 2007 has essentially no indexed citers, and Fischler 2001 and Roy 1992 have nothing new. The function-field Freiman line (BCZ18, Couvreur-Zémor 2024, Wessel 2024, Tanisali-Wessel Sep 2026) is the nearest active literature. It treats one space at a time, and I found no comparison of K(u) with K(h) when a critical space sits inside a critical space. My reading of Couvreur-Zémor and Tanisali-Wessel was partial, keyed to grep hits. A stronger statement could sit elsewhere in those papers.

**Other leads, honestly graded.**
- Computer-aided-design literature (Wang-Wang 1992, Sánchez-Reyes 2024, Cantón et al. 2025) has essentially this step for real plane curves: conics in rational cubic form are degree-elevated quadratics. It is an analogue only, since the field differs, and the first two are paywalled.
- The circle uū = ρ matches these authors' complex formulation closely, which is worth a look if access is available.
- Wikipedia states the full trichotomy but has no inline citations.

**Not settled.**
- A printed textbook location for the twisted-cubic trichotomy. Harris and Hartshorne were not opened, and Little's Monthly article was unreachable.
- zbMATH forward citations were blocked (403, 404, TLS failure I did not bypass).
- Semantic Scholar and OpenAlex rate-limited late in the run, so some cross-checks are incomplete.
- Citation indexes under-report French transcendence papers, so an uncited-looking Diaz 2007 is weak evidence.

**Time.** Started 10:23:49, last clock check 10:37:20, well inside the box. I stopped because further queries were returning repeats.

## Read

- Bachoc, Serra, Zémor 2017, An analogue of Vosper's theorem for extension fields (local copy) — https://arxiv.org/abs/1501.00602: Lemmas 4 and 5, Theorem 33, concluding comments; grep for uniqueness or homography of the ratio (nothing relevant)
- Fischler 2001, Orbits under algebraic groups and logarithms of algebraic numbers (local copy) — https://doi.org/10.4064/aa100-2-4: Lemma 6.1 and surrounding text, reference list; grep for Harris citations (Lectures 2 and 6 only)
- Diaz 2007, Produits et quotients de combinaisons linéaires de logarithmes (local full text) — https://doi.org/10.5802/jtnb.592: Corollaires 4 and 5, Théorème 7, Section 2.4, references
- Diaz 2004, Utilisation de la conjugaison complexe (local copy): Théorème 2 and its proof
- Waldschmidt 2005, The role of complex conjugation in transcendental number theory (local copy) — https://hal.science/hal-00411402/document: Sections 1-2 only, passages on Diaz and the six exponentials
- Buczyński, Ilten, Ventura, arXiv:1905.11860v3 — https://arxiv.org/abs/1905.11860: Abstract, Section 1.2 excerpts, Section 6.1 setup, Lemmas 6.1 and 6.2 with proofs
- Bachoc, Couvreur, Zémor, arXiv:1709.00087 — https://arxiv.org/abs/1709.00087: Lemma 5.2, Theorem 5.3 and remark, Theorem 8.1 statement and start of proof, Proposition 8.2 with proof
- Cantón, Fernández-Jambrina, Vázquez-Gallo, arXiv:2507.23485v3 — https://arxiv.org/abs/2507.23485: Passage on conics in rational cubic form, Theorem 3 (two-column text layer, formula garbled), reference list
- Rydell, Sundelius, arXiv:2404.03063v2 — https://arxiv.org/abs/2404.03063: Section 2.2 Twisted cubics
- Di Gennaro, Rapagnetta, Sabatino, arXiv:2610.25065v2 — https://arxiv.org/abs/2610.25065: Abstract, Section 2 items (v)-(vii), passages of the proof of Theorem 1.4 using Vosper
- Ilten and coauthor, Khovanskii-finite rational curves of arithmetic genus 2, arXiv:2101.09410 — https://arxiv.org/abs/2101.09410: Section 2.1 passage restating BIV Lemmas 6.1 and 6.2 for projections of rational normal curves (this pointed me to BIV)
- Wessel 2024, On Freiman's Theorem in a function field setting, arXiv:2405.10724 — https://arxiv.org/abs/2405.10724: Abstract, Theorem 1.4 excerpt, notation
- Couvreur, Zémor 2024, Freiman's 3k−4 theorem for function fields, arXiv:2408.00183 — https://arxiv.org/abs/2408.00183: Abstract, introduction excerpts, Section 3 setup excerpts
- Tanisali, Wessel, High dimensional Riemann-Roch spaces in linear spaces with small squares, arXiv:2609.06822 (6 Sep 2026) — https://arxiv.org/abs/2609.06822: Abstract, introduction excerpts, Section 2 excerpts

## Screened only

- Aliabadi et al., Extremal Chowla sets and their linear analogues, arXiv:2607.24847 (cites BSZ17; grep hits only, Chowla subspaces, unrelated) — https://arxiv.org/abs/2607.24847
- All 47 OpenAlex citers of BSZ17 by title: mostly Sidon spaces and cyclic subspace codes; none after 5 Oct 2026. Includes Bachoc-Serra-Zémor, Revisiting Kneser's theorem; A generalization of Vosper's theorem (2024); Conditions for matchability II; Clubs and their applications; Constructions and equivalence of Sidon spaces; Mirandola-Zémor, Critical pairs for the product Singleton bound
- Semantic Scholar citers of BSZ17 (55 returned, top 12 by date viewed); only 2610.25065 is after 5 Oct 2026
- OpenAlex citers of Fischler 2001 (2) and Semantic Scholar citers (3): Multiplicity estimates and degeneration; From highly composite numbers to transcendental number theory
- OpenAlex citers of Roy 1992 (21) by title: Iwasawa and p-adic L-function papers, Waldschmidt surveys, Roy-Waldschmidt 1997, Maksoud; none after 5 Oct 2026
- OpenAlex citers of Diaz 2007 (0); Semantic Scholar (1: Waldschmidt, Role of complex conjugation); the Diaz 2004 DOI I guessed returned unrelated cubic-field papers on Semantic Scholar, so that list does not count as a citation check of Diaz 2004
- OpenAlex citers of Bachoc-Couvreur-Zémor (3), Semantic Scholar (9), and of Mirandola-Zémor (42) by title: coding theory, non-GRS MDS codes, Schur products, analogues at most
- OpenAlex listings from 2026-05-01 on terms for logarithms of algebraic numbers, complex conjugation and transcendence, Vosper, Kneser, Freiman function fields; titles include arXiv:2611.00456 and arXiv:2610.28079, neither relevant by title. The 'six exponentials' and 'four exponentials' searches returned only noise
- arXiv API, newest first, for six exponentials, four exponentials, strong six exponentials, Vosper, geometric progression subspace, combinatorial genus: nothing relevant after 5 Oct 2026
- J. Meyer, Projections of the twisted cubic, The Teaching of Mathematics X (2007) 51-62: abstract and grep; shows every rational cubic is a projection, and does not state the conic exclusion — https://teaching.matf.bg.ac.rs/vol/tm1014.pdf
- Ning 2025, On subcodes of the generalized Reed-Solomon codes, arXiv:2507.04689: search summary only; codimension-1 subcodes of GRS codes, no Möbius relation, a coding-theory analogue at most — https://arxiv.org/abs/2507.04689
- MaRDI record of Wang and Wang 1992, review text only: necessary and sufficient conditions for conics in rational cubic form, over the reals — https://portal.mardi4nfdi.de/wiki/Item:Q1195752
- zbMATH API record of Diaz 2007 (Zbl 1163.11055), Waldschmidt's review: no classification statement mentioned

## Inaccessible

- J. Harris, Algebraic Geometry: A First Course, Springer 1992: Paywalled book, not opened. It is the likely textbook home of the twisted-cubic projection fact and is cited by both Fischler 2001 [4] and Roy 1995 [11], but no location is verified
- J.B. Little, The many lives of the twisted cubic, Amer. Math. Monthly 126 (2019) 579-592 — https://mathcs.holycross.edu/~little/TwistedMonthly.pdf: The author's host timed out on all three attempts, so projection content is unread; not a paywall
- G.-J. Wang, G.-Z. Wang, The rational cubic Bézier representation of conics, CAGD 9 (1992) 447-455: Publisher paywall; only a review text was seen
- J. Sánchez-Reyes, Conics in rational cubic Bézier form made simple, CAGD 108 (2024) 102266: Publisher paywall; the AMiner page gave no content; abstract and keywords (which include base point) were seen only through search extracts
- zbMATH cited-by lists for Diaz 2007 and Diaz 2004: The zbmath.org web query returned HTTP 403 and the API query with rf: returned 404; direct Python access failed TLS verification, which I did not bypass. So there is no zbMATH forward-citation check
- Fang, A rational quartic Bézier representation for conics (uni-lj.si copy): Direct download failed TLS verification; the indexed fetch returned the raw PDF stream only, so it is unread
- Semantic Scholar and OpenAlex, partly: HTTP 429 rate limits late in the run blocked some lookups and retries, including the BSZ17 arXiv-id citer list and later title searches

## Queries

- subspaces of function field containing 1, f, 1/f geometric progression Vosper analogue classification product of subspaces dimension 2 and 3 in dimension 4 algebraically closed
- Diaz conjecture |u| algebraic e^u algebraic logarithm modulus transcendence strong six exponentials 2x3 matrix linear forms 1, u, ū, u² 1/(u-a)
- OpenAlex cites: BSZ17, Fis01, Dia07, Roy92, BCZ18, Mirandola-Zémor, Diaz 1997 (the last a mistaken title match)
- Semantic Scholar citations: BSZ17, Dia07, Dia04, Fis01, BCZ18, Roy92
- OpenAlex from 2026-05-01: six exponentials; four exponentials conjecture; logarithms of algebraic numbers transcendence modulus; complex conjugation transcendence exponential function; Vosper theorem field extension subspaces; product of subspaces field extension geometric progression basis; Kneser theorem field extension linear analogue; Freiman theorem function field subspaces; strong six exponentials
- arXiv API newest first: six exponentials; four exponentials; strong six exponentials; Vosper and subspaces; geometric progression subspace field extension; logarithms of algebraic numbers transcendence; linear analogue Kneser; Riemann-Roch combinatorial genus
- projection of twisted cubic from a point not on the curve is a nodal or cuspidal plane cubic; from a point on the curve is a conic
- Riemann-Roch space L(D) genus 0 containing 1, f, 1/f classification; net of binary cubics with conic image
- linear series g^r_d with d < 2r birational onto image, birationally very ample, composed with involution d >= m r
- nondegenerate morphism curve to P^r degree d < 2r is birational onto its image
- subcode of generalized Reed-Solomon code that is itself GRS, evaluation points related by Möbius transformation
- Harris Algebraic Geometry A First Course twisted cubic projection exercise; rational normal curve projection from a point on the curve
- rational cubic Bézier curve representing a conic must be degree-elevated rational quadratic, common factor
- Wang Wang 1992 rational cubic conic; improperly parametrized rational curves Sederberg
- Sánchez-Reyes Conics in rational cubic Bézier form made simple
- Diaz 2007 Produits et quotients cited, new results 2025 2026
- vector space of rational functions containing 1, x, 1/x, product of 2- and 3-dimensional subspaces, geometric progression, extension of critical subspace by one element
- Little The many lives of the twisted cubic
