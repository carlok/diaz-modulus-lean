# Entry 1, strategy: classical

## Target, as restated by the searcher

Let K be algebraically closed (here Q̄) and u transcendental over K, with ρ in K nonzero. Suppose a 4-dimensional K-space V = ⟨b, bh, bh², bh³⟩ contains 1, u and ρ/u. Claim: u is a Möbius function of h, and V = ⟨1, u, 1/u, w⟩ with w = u², 1/u² or 1/(u−a), a ≠ 0. Equivalent form: three independent binary cubics p0, p1, p2 with p1·p2 = ρ·p0² (a rank-3 quadric through the twisted cubic in P(V*)) share a linear factor f, and p1 = f s², p2 ∝ f t², p0 ∝ f s t with s, t linear, so u = p1/p0 ∝ s/t. The fourth basis element is then read off from the position of the root of f relative to the roots of s and t.

## Leads

### Lead 1: implies

- **Citation:** E. Arbarello, J. Harris, Canonical curves and quadrics of rank 4, Compositio Math. 43 (1981), no. 2, 145-179
- **Location:** §2, p. 157 (paragraph after Prop. 2.18, formula |2D+F| = |L|); p. 158 (2.19 and §3, naming the twisted cubic X3 with rank-3 locus a plane conic)
- **Quote:** the ruling of Q cuts out on X a pencil of divisors
- **Link:** https://www.numdam.org/item/CM_1981__43_2_145_0.pdf
- **Relation:** My translation. Take X = twisted cubic, L = O(3), and Q = xy − ρz² from u·(ρ/u) = ρ·1. Then 2 deg D + deg F = 3 with a pencil in |D| forces deg D = deg F = 1. So x, y, z = f s², f t², f st, and u = x/z = s/t is Möbius in h. The fourth element then follows by partial fractions (my step, not printed). Checked on page images. §2 is set up for rational normal scrolls of dimension k; §3 lists X3 among them. The passage states the fact without a detailed proof.

### Lead 2: implies

- **Citation:** V. Snyder, Twisted curves whose tangents belong to a linear complex, Amer. J. Math. 29 (1907), 279-288
- **Location:** §1 'Curves on a quadric cone', p. 279
- **Quote:** cut each generator in a other points. Its order is then 2a+b
- **Link:** https://archive.org/details/jstor-2370139
- **Relation:** My translation. A rank-3 quadric is a cone. Order 3 = 2a + b, and a ≥ 1 because the cubic is not a union of generators, so a = b = 1: the curve passes through the vertex once and meets each generator once off it. On xy = ρz² the function u = x/z parametrises the generators, so u has degree 1 on the curve and is Möbius in h. The fourth element is my step. This is the earliest explicit statement I reached; earlier ones (Cayley, Noether, Halphen) were not checked. Read from the OCR text.

### Lead 3: implies

- **Citation:** E. Park, On rank 3 quadratic equations of projective varieties, arXiv:2208.12481v2 (2023); journal reference Trans. AMS 377 (2024) seen only in a third-party bibliography
- **Location:** Theorem 1.2(2), p. 3; Proposition 3.1, p. 10 (char ≠ 2, X locally factorial)
- **Quote:** every rank 3 quadratic polynomial in I(X, L) is contained in W(A, B)
- **Link:** https://arxiv.org/abs/2208.12481
- **Relation:** For X = P¹, L = O(3): L = A²⊗B with h⁰(A) ≥ 2 and h⁰(B) ≥ 1 forces A = B = O(1). The proof of Prop. 3.1 gives Q = xy − z² with x = h s², y = h t², z = h st, so u = s/t. The translation to u is mine. This is a recent restatement and probably not the first; Arbarello-Harris predates it. Park-Sim, arXiv:2412.16983, Theorem 1.1 is the rational normal curve case, with d = 3 giving the single component ℓ = 1 (my specialisation).

### Lead 4: analogue only

- **Citation:** J. W. P. Hirschfeld, Finite Projective Spaces of Three Dimensions, Oxford University Press, 1985
- **Location:** Chapter 21, Lemma 21.1.7(ii), as cited in a later proof of the book; the lemma itself was not seen
- **Quote:** a twisted cubic lying on a cone contains the vertex
- **Link:** https://archive.org/details/finiteprojective0000hirs
- **Relation:** This is the cone-vertex step in the same words, but in PG(3,q), and I saw only a full-text search snippet. Reaching Q̄ needs a transfer argument or the same proof, and the lemma's hypotheses are unread. So I do not claim 'implies'. It is worth a verifier only as the most literal textbook sentence.

### Lead 5: analogue only

- **Citation:** R. T. Farouki, T. Sakkalis, Pythagorean hodographs, IBM J. Res. Develop. 34 (1990), 736-752, stating a theorem of K. K. Kubota, Amer. Math. Monthly 79 (1972), 503-505
- **Location:** Theorem (Kubota) and equation (3), early in the paper; page not determined
- **Quote:** satisfy the Pythagorean condition
- **Link:** https://archive.org/details/bitsavers_ibmIBMJourelopment345ibmrd3405J_1625678
- **Relation:** With x = (p1+p2)/2, y = (p1−p2)/(2i), z = √ρ·p0 the relation p1p2 = ρp0² becomes x² + y² = z², whose solutions are w(u²−v²), 2wuv, w(u²+v²). That is exactly the shape f s², f t², f st. Seen only as a snippet and stated for real polynomials, so it does not apply directly over Q̄. Kubota's paper is said by a secondary source to cover any UFD, which would give 'implies', but it was not read.

### Lead 6: analogue only

- **Citation:** J. H. Grace, A. Young, The Algebra of Invariants, Cambridge University Press, 1903
- **Location:** Ch. XI, §§178-179, pp. 216-220 (exact page of the quoted sentence is between 219 and 221)
- **Quote:** given three independent cubics, there is one form apolar to each of them
- **Link:** https://archive.org/details/algebraofinvaria00graciala
- **Relation:** Gives the net-of-cubics half only. A net is the apolar space of one cubic, and §178 shows a form with a factor of multiplicity r is apolar to forms containing that factor n−r+1 times, so a cube's net has a common factor. It says nothing about a quadratic relation among the three cubics, so it does not reach the not-found step.

## Notes

**Outcome.** The "not found" for the step that forces u to be Möbius is broken, through translations of my own. No printed source states the result in terms of u or the space V. The strongest printed statements are:

- **Arbarello-Harris 1981, p. 157.** A rank-3 quadric through X has a ruling cutting a pencil in |D| with |2D+F| = |L|. Page 158 names the twisted cubic and its conic of rank-3 quadrics. The degree count 2·1 + 1 = 3 is immediate from this.
- **Snyder 1907, p. 279.** A curve on a quadric cone has order 2a+b, where b counts passages through the vertex and a counts points on each generator. For order 3 this gives a = b = 1. This is the earliest explicit form I reached. I did not check Cayley, Noether or Halphen.
- **Park 2023/24, Prop. 3.1.** This is the general theorem, and probably the "recent paper" meant by the brief.

**The part still not found.** I did not find the classification of the fourth basis element (u², 1/u², 1/(u−a)) in print, in any language, including function-space or Riemann-Roch language. It follows from the above by partial fractions: V = (all cubic forms)/(f s t), and the root of f is at the zero of s, the zero of t, or elsewhere.

**An elementary proof, which bears on the "not routine" label.** This is my own observation, not from a source. Since 1 is in V, b lies in K(h), so V = L(D) on P¹ with deg D = 3. If u and 1/u are both in L(D), the zero and pole divisors of u are disjoint and both ≤ D, so 2 deg u ≤ 3 and deg u = 1. Then D = (u)₀ + (u)∞ + P, and the three positions of P give the three values of w. Equivalently, xy = z² in a UFD with coefficients in an algebraically closed field gives x = f s², y = f t², z = f st, and degree parity finishes. The step is three lines long, so chapter 14's "not routine, rank 1" looks hard to sustain for this part. Someone should weigh that. It does not touch the reduction to a progression, which is [BSZ17, Lemma 4], or the use made of the result at a candidate.

**Classical sources.**
- Baker III (pp. 129-130) and Salmon (Art. 335) give the generator count 1 and 2 only for a cubic on a nonsingular quadric.
- Baker, Reye and Hamilton state the converse direction: the cone from a point of the curve is quadric.
- Snyder-Sisam (1914, Art. 183, p. 235) use the same generator-parity argument to exclude a [1,3] quartic from a quadric cone, an analogue. Their Art. 184 Ex. 7 is the projection to a conic.
- Hirschfeld's Lemma 21.1.7(ii) is the most literal sentence, but over finite fields and seen only in a snippet.

**Nets of binary cubics.** Grace-Young §§178-179 gives net = apolar space of one cubic, and a cube gives a common factor. I found no printed statement that a quadratic relation among a net forces a common factor, other than through the rank-3 sources. My own check: the three GL2 orbits of the apolar cubic (x³+y³, x²y, x³) give an injective map S²N → Sym⁶ except for the cube, whose net has the relation x²y·y³ = (xy²)². I did this by hand and it is not from a source.

**Not settled.**
- Harris, Eisenbud, Dolgachev and Sturmfels were not opened, so the "most standard textbook" location remains unverified. No location is claimed for them.
- Kubota is unread; the F-S statement I saw is for real polynomials.
- Snyder's text is OCR. His formula is simple and consistent with the theory, but it was not checked against a page image.
- zbMATH was unusable from here, so an earlier source may exist, for example in Noether 1882 or Halphen 1882, which I did not check.
- The author of arXiv:1605.08669 was not recorded; the label "Dahl-style" in the read list is a guess and should be ignored.

**Time.** I finished about 15 minutes into the 30-minute box, at 11:10. I stopped because further archive.org queries had turned noisy.

## Read

- Arbarello-Harris 1981 — https://www.numdam.org/item/CM_1981__43_2_145_0.pdf: pp. 157-158 from page images; text search of the rest
- Snyder 1907, Amer. J. Math. 29 — https://archive.org/details/jstor-2370139: §1, pp. 279-280, OCR text
- Park, arXiv:2208.12481 — https://arxiv.org/abs/2208.12481: Introduction, Proposition 3.1, references
- Park-Sim, arXiv:2412.16983 — https://arxiv.org/abs/2412.16983: Theorem 1.1 statement only
- Grace-Young 1903 — https://archive.org/details/algebraofinvaria00graciala: Ch. XI apolarity passages, located by text search of OCR
- Snyder-Sisam, Analytic Geometry of Space, 1914 — https://archive.org/details/analyticgeometry00snyd: Arts. 183-184, pp. 235-239 and exercises (Ex. 7: projection from a point on the cubic is a conic)
- Baker, Principles of Geometry III, 1922 — https://archive.org/details/principlesofgeom03bake: cubic curve on a quadric, pp. 129-130; passages on chords and cones
- Salmon, Analytic Geometry of Three Dimensions, 1882 edition — https://archive.org/details/treatiseonanalyt00salm: Art. 335-336, pp. 301-302; text search on cones and cubics
- Bachoc-Serra-Zémor, arXiv:1501.00602 — https://arxiv.org/abs/1501.00602: text search for Lemma 4 and function-field passages only
- Dahl-style CAGD paper on implicit rational cubic Bézier curves, arXiv:1605.08669 (author not recorded) — https://arxiv.org/abs/1605.08669: §4 conic degeneration

## Screened only

- Bachoc-Couvreur-Zémor, Towards a function field version of Freiman's theorem, Algebraic Combinatorics 2018 (text search for L(D), 1/x, inverse: nothing on f and 1/f) — https://alco.centre-mersenne.org/articles/10.5802/alco.19/
- Semple-Kneebone, Algebraic Projective Geometry, 1952, Ch. XII (snippets: net of quadrics through the cubic; no cone statement surfaced) — https://archive.org/details/algebraicproject0000jgse
- Semple-Roth, Introduction to Algebraic Geometry (snippets only; nothing relevant surfaced) — https://archive.org/details/introductiontoal0000semp
- Maxwell, General Homogeneous Coordinates in Space of Three Dimensions, Twisted cubic §5 'The quadrics through the curve' (snippet only) — https://archive.org/details/bwb_O7-BNV-315
- Telling, The Rational Quartic Curve, 1936 (snippet: quadric cones through the quartic; analogue) — https://archive.org/details/rationalquarticc0000tell
- Brusotti, Sulla curva razionale normale, Annali di Mat. c.1904 (snippet: quadrics containing the curve and cones; analogue, volume unverified) — https://archive.org/details/annalidimatemat16unkngoog
- Hartshorne, Algebraic Geometry, 1977 (snippet: quadric cone and a family of lines cutting a linear system on a curve; analogue, exact location unverified) — https://archive.org/details/algebraicgeometr0052hart
- Bertini, Introduzione alla geometria proiettiva degli iperspazi, 1907 (OCR grep on coni quadrici; no matching statement) — https://archive.org/details/introduzioneall00bertgoog
- Reye, Geometrie der Lage II, 1877 (OCR grep: projecting cones from points of the cubic; no 'only' statement found) — https://archive.org/details/geoderlagevon02reyerich
- Farouki, History of mathematics and PH curves, slides (author's page; restates Kubota, lecture material) — https://faculty.engineering.ucdavis.edu/farouki/wp-content/uploads/sites/41/2013/02/History-of-mathematics-and-PH-curves.pdf
- Wang-Wang, The rational cubic Bézier representation of conics, CAGD 1992 (review text only) — https://portal.mardi4nfdi.de/wiki/Item:Q1195752
- Wikipedia, Twisted cubic (screened only) — https://en.wikipedia.org/wiki/Twisted_cubic

## Inaccessible

- K. K. Kubota, Pythagorean triples in unique factorization domains, Amer. Math. Monthly 79 (1972), 503-505: Paywalled (JSTOR); seen only through citations and Farouki-Sakkalis snippets
- J. Harris, Algebraic Geometry: A First Course, 1992: No open copy found, so no location can be reported and no claim is made about it
- D. Eisenbud, The Geometry of Syzygies, 2005, Prop. 6.10 (cited by Park-Sim): Paywalled; not opened
- Dolgachev, Classical Algebraic Geometry: Author-page PDF URLs failed (DNS error and 404); third-party uploads not used
- Hirschfeld 1985, Semple-Roth, Semple-Kneebone, Maxwell (archive.org lending copies): Lending only; per-book search returned 403, so only public full-text-search snippets were seen
- Sturmfels, Algorithms in Invariant Theory: Not reached in the time used; not opened
- zbMATH Open API: TLS certificate failure from Python and HTTP 400 through the fetch tool; not worked around, so no zbMATH search was done
- Hamilton, On gauche curves of the third degree (EMIS copy): 503 at EMIS; the rcin.org.pl copy opened and shows only that a cone with vertex on the curve is quadric, the 'if' direction

## Queries

- every quadric cone containing the twisted cubic has vertex on the curve; rank 3 quadrics containing rational normal curve projection to conic
- rank 3 quadrics in the ideal of a projective curve correspond to decomposition L = A^2(B)
- net of binary cubics common linear factor apolar to perfect cube quadratic relation among three binary cubics
- Riemann-Roch space L(D) contains f and 1/f degree bound rational function field Bachoc Couvreur Zemor
- Harris First Course twisted cubic quadrics rank 3 cone vertex on curve
- Semple Roth twisted cubic quadric cone vertex lies on the curve
- Hartshorne curve on quadric cone degree 2a+1 passes through the vertex
- rational cubic Bezier conic degree elevation common factor
- degree of implicit curve times tracing index Sendra Winkler
- Kubota Pythagorean triples in unique factorization domains
- Farouki Sakkalis Pythagorean hodographs theorem Kubota
- four-dimensional space of rational functions containing 1, x, 1/x classification Riemann-Roch
- Park Shim locus of rank 3 quadratic equations of a rational normal curve
- archive.org full text: "curves on a quadric cone"; "quadric cone" "twisted cubic" vertex "on the curve"; "lying on a cone" within Hirschfeld; "binary cubics" net "common factor"
- archive.org full text in German, Italian, French: kubische Raumkurve Kegel Spitze; cubica sghemba coni quadrici vertice; curva razionale normale quadriche coni; cubique gauche cone sommet
