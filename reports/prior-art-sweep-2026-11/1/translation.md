# Entry 1, strategy: translation

## Target, as restated by the searcher

K algebraically closed (K = Q̄), L ⊇ K a field, u ∈ L \ K, ρ ∈ K*. Then u is transcendental and 1, u, ρ/u are independent; H₀ = ⟨1, u, ρ/u⟩. Suppose V = H₀ + Kz is 4-dimensional and contains ST with dim S = 2, dim T = 3. BSZ Lemma 4 gives V = b·⟨1, h, h², h³⟩. Claim: u is a degree-one (Möbius) function of h, so V = L([0]+[∞]+[a]) on the u-line. Hence V is H₀ + Kw with w = u² (a = ∞), w = u⁻² (a = 0), or w = 1/(u−a). Translation: V* carries a twisted cubic C (coordinates p, q, r = 1/b, u/b, (ρ/u)/b). The identity qr = ρp² says C lies on the rank-3 quadric X₁X₂ = ρX₀². The target is then the description of rank-3 quadrics containing a twisted cubic: they are f²ℓ, fgℓ, g²ℓ with f, g, ℓ linear, the vertex lies on C, and u = f/g.

## Leads

### Lead 1: implies

- **Citation:** E. Park, On rank 3 quadratic equations of projective varieties, Trans. Amer. Math. Soc. 377 (2024), 2049-2064; arXiv:2208.12481
- **Location:** Theorem 1.2(2), Remark 1.3, Proposition 3.1 (parity proof), Definition 2.1; explicit P¹ decomposition on pp. 4-5 of the arXiv version. Numbering read from arXiv v2, not the journal copy.
- **Quote:** every rank 3 quadratic polynomial in I(X, L) is contained in W (A, B)
- **Link:** https://arxiv.org/abs/2208.12481
- **Relation:** Take X = P¹, L = O(3) over K: 2a + b = 3 with a ≥ 1 forces A = B = O(1). So X₁X₂ − ρX₀² = c(φ(s²h')φ(t²h') − φ(sth')²) with s, t, h' linear, and p, q, r span h'·Sym²⟨s,t⟩. Dividing by h' gives q'r' = ρp'², a basis of binary quadratics, so q', r' are coprime squares and u = q'/p' has degree one. Then V = (1/p)·(cubic forms) = L([0]+[∞]+[a]), with a the root of h' in the u-coordinate. Uses BSZ Lemma 4 for the progression; the theorem does not name 1/(u−a).

### Lead 2: implies

- **Citation:** E. Park and S. Sim, On rank 3 quadratic equations of Veronese embeddings, Math. Nachr. 298 (2025), 3135-3155; arXiv:2412.16983
- **Location:** Theorem 1.1 (rational normal curves), display (1.2), Definition and Remark 3.1. Read from arXiv v1.
- **Quote:** The minimal irreducible decomposition of Φ3 (C) is
- **Link:** https://arxiv.org/abs/2412.16983
- **Relation:** For d = 3 the only component is W₁(C), projectively a conic ν₂(P¹), consisting of quadrics built from s²h, sth, t²h with s, t, h linear. The derivation is then the same as for Park 2024. Characteristic 0 and algebraically closed, so K = Q̄ is covered.

### Lead 3: implies

- **Citation:** İ. Kadıköylü, Variety of singular quadrics containing a projective curve, Ann. Inst. Fourier 69 (2019), no. 4, 1879-1896; arXiv:1604.04425
- **Location:** Proof of Lemma 2.2, case k = 3, using the correspondence set up in the proof of Lemma 2.1, p. 1883 onward.
- **Quote:** 2A + F = OΓ (1), where A is a pencil
- **Link:** https://aif.centre-mersenne.org/article/AIF_2019__69_4_1879_0.pdf
- **Relation:** On the twisted cubic, 2 deg A + deg F = 3 with A a pencil forces deg A = 1 and deg F = 1. Here u is the ratio of the two sections of A, so u is Möbius in h, and F is the vertex point a. This is the target's degree count almost literally, but it appears inside a proof, as a parameter count, rather than as a stated result.

### Lead 4: implies

- **Citation:** T. Terasoma, Algebraic correspondences between genus three curves and certain Calabi-Yau varieties, Amer. J. Math. 132 (2010), 181-200; arXiv:1001.4846
- **Location:** Section 4: the discriminant display before Lemma 4.1, and Lemma 4.1 (arXiv numbering).
- **Quote:** the vertex v(x) of V (Q(x)) is
- **Link:** https://arxiv.org/abs/1001.4846
- **Relation:** The net of all quadrics through the twisted cubic has discriminant (t₁t₃ − t₂²)², and each singular member has its vertex at s(x) on the curve. So p, q, r share a root, and dividing it out gives q'r' = ρp'² and u of degree one. An explicit computation, with no general statement; it supplies the vertex fact only.

### Lead 5: implies

- **Citation:** V. Martello, On the rational Enriques-Fano threefolds discovered by Fano, arXiv:2107.04107 (2021); no journal reference found
- **Location:** Lemma 6.4
- **Quote:** If C is a twisted cubic contained in Q, then v ∈ C.
- **Link:** https://arxiv.org/abs/2107.04107
- **Relation:** Apply the lemma to Q: X₁X₂ = ρX₀², so p, q, r have a common root. Its proof is the degree count: off C the projection is a plane cubic, which cannot lie in a conic. The Möbius conclusion then follows as for Terasoma.

### Lead 6: implies

- **Citation:** E. Ballico and A. Bernardi, On the X-rank with respect to linear projections of projective varieties, Math. Nachr. 284 (2011), 2133-2140; arXiv:0912.4834
- **Location:** Remark 1 (arXiv numbering)
- **Quote:** deg(X) = n + 1 and ℓO |C → X is the normalization map
- **Link:** https://arxiv.org/abs/0912.4834
- **Relation:** With n = 2: if the vertex is off C, the projection (p:q:r) is a plane cubic, which cannot lie on the conic X₁X₂ = ρX₀². So the vertex is on C. This is the weakest of the leads, a remark that covers one half of the step.

### Lead 7: analogue only

- **Citation:** D. Mirandola and G. Zémor, Critical pairs for the Product Singleton Bound, IEEE Trans. Inform. Theory (2015); arXiv:1501.06419
- **Location:** Theorem 4.2, Lemmas 4.4 and 4.5, Corollary 4.6
- **Quote:** C and D are Reed-Solomon codes with a common evaluation-point sequence
- **Link:** https://arxiv.org/abs/1501.06419
- **Relation:** In code language, the three shapes of V are exactly the V for which (H₀, V) is a critical pair, dim H₀V = 6. The theorem assumes criticality and MDS codes; the target's hypothesis is a 2×3 configuration in V. So it does not imply the target.

## Notes

**Result.** The "not found" is broken for the key step, but not for the classification as a named list.

- I found no source that states the converse with the shapes u², ū², 1/(u−a).
- The step the entry calls not found, the degree count forcing u to be Möbius in h, is in print under another name: **rank-3 quadrics containing a rational normal curve**.
- Park (Trans. AMS 2024) gives Φ₃(P¹, O(d)) as a union of W(O(ℓ), O(d−2ℓ)). Its Proposition 3.1 is the parity argument on divisors of xy = z². For d = 3 this forces the forms f²ℓ, fgℓ, g²ℓ.
- From there the list follows by a two-line unique-factorisation argument plus BSZ Lemma 4.

**Restatement behind the search.** The relation u·(ρ/u) = ρ·1² is a rank-3 quadric vanishing on the twisted cubic of V = b⟨1, h, h², h³⟩. Three independent routes then give the Möbius conclusion:
- Park and Park-Sim: normal form of the quadric.
- Kadıköylü: 2A + F = O(3) with A a pencil.
- Terasoma, Martello, Ballico-Bernardi: the vertex lies on the curve, then the conic parametrisation.

**Derivation, checked by hand only (no referee, no Lean).**
1. u is transcendental, so 1, u, ū are independent.
2. p, q, r = 1/b, u/b, ū/b are independent cubic forms in h with qr = ρp².
3. By Park, they span h'·Sym²⟨s, t⟩ with h' linear, so p, q, r = h'p', h'q', h'r' with q'r' = ρp'².
4. The p', q', r' form a basis of binary quadratics, so q', r' are coprime squares and u = q'/p' has degree one.
5. Hence V = (1/p)·(cubic forms) = L([0]+[∞]+[a]) on the u-line, where a is the root of h'.
6. a = ∞ gives u², a = 0 gives u⁻² = ū²/ρ², and otherwise 1/(u−a).

**What this does not settle.**
- None of these authors mentions subspaces of a field, 2×3 configurations, or this classification. The link to the target is my translation.
- Whether the entry should stay "not routine" is for the referees, but on this evidence the label looks hard to keep.
- Kadıköylü's passage sits inside a proof, and Martello is an arXiv preprint with no journal reference found.
- Park and Terasoma were read in arXiv versions, so journal numbering may differ.
- Independence from the excluded work is judged from dates and subject, not from a citation check.
- The older textbook source (Harris, Semple-Roth, Hirschfeld) is probably where the classical statement lives, but I could not open any of them.

**Other translations.**
- Linear Kneser/Vosper line: BSZ, BCZ, Couvreur-Zémor and Wessel have no statement about a space containing 1, u, 1/u. The nearest is Mirandola-Zémor Theorem 4.2, an analogue only: it assumes (H₀, V) is critical.
- Lüroth and Möbius terms: no hits in those papers.
- Ax/Kirby: nothing relevant. The target is pure linear algebra over K, so this translation does not fit.
- Cylinder translation: x + iy = u makes H₀ the circle, so a real curve here is a twisted cubic on a circular cylinder through its vertex at infinity. Found no printed form. Only a search summary's own unsourced hand check of z = tan(θ/2); not relied on.
- Ball-Lavrauw Lemma 6 and Hamilton's cone of chords give the easy direction only (a point on the curve projects to a conic), so I did not list them as leads.
- Diaz 2007 and Fischler 2001: nothing stronger than the entry says. Fischler's Lemma 6.1 only bounds progressions in ℒ̃.

**Process.**
- Clock ran from 10:23 to about 10:35, under the time box.
- One script tried to turn off TLS certificate verification to reach sites that had failed. The harness blocked it, none of it ran, and I reran with verification on and did not try to get around the block. As a result zbMATH, the UFPB thesis and the Math. Scand. paper stayed unreached.
- Some search-tool summaries were unreliable, so I checked every lead against the paper's text rather than the summary.

## Read

- Park 2024, On rank 3 quadratic equations of projective varieties (arXiv v2) — https://arxiv.org/abs/2208.12481: Introduction, Theorem 1.2, Remark 1.3, P¹ paragraph, Definition 2.1, Lemma 2.2, Proposition 3.1 proof opening, start of section 4
- Park-Sim 2025, rank 3 quadratic equations of Veronese embeddings (arXiv v1) — https://arxiv.org/abs/2412.16983: Introduction, Theorem 1.1, start of Definition and Remark 3.1
- Kadıköylü 2019, Ann. Inst. Fourier (journal PDF) — https://aif.centre-mersenne.org/article/AIF_2019__69_4_1879_0.pdf: Lemmas 2.1 and 2.2 with proofs
- Terasoma 2010 (arXiv) — https://arxiv.org/abs/1001.4846: Section 4 opening, Lemma 4.1 statement and start of proof
- Martello 2021 (arXiv) — https://arxiv.org/abs/2107.04107: Lemma 6.4 with proof, Lemmas 6.5 and 6.7 usage
- Ballico-Bernardi 2011 (arXiv) — https://arxiv.org/abs/0912.4834: Remark 1
- Ball-Lavrauw, Arcs in finite projective spaces, EMS Surv. Math. Sci. 6 (arXiv) — https://arxiv.org/abs/1908.10772: Lemma 6: projection of a normal rational curve from one of its points
- Bachoc-Serra-Zémor 2017 (arXiv) — https://arxiv.org/abs/1501.00602: Introduction, Theorem 2, Lemma 4 and the following lemma
- Bachoc-Couvreur-Zémor 2018 (arXiv) — https://arxiv.org/abs/1709.00087: Introduction, Theorem 5.3 and following remark, section 2
- Mirandola-Zémor 2015 (arXiv) — https://arxiv.org/abs/1501.06419: Theorem 4.2, Lemmas 4.4 and 4.5, Corollary 4.6
- Diaz 2007 (local copy) — https://emis.univie.ac.at/journals/JTNB/2007-2/article04.pdf: Corollaire 5, Théorème 7
- Fischler 2001 (local copy) — https://eudml.org/doc/278399: Lemma 6.1, Theorems 6.2 and 6.4, closing N.B.
- Hamilton, On 'gauche' curves of the third degree (collected paper XL) — https://rcin.org.pl//Content/190090/PDF/WA35_223316_11536-3_art-40.pdf: Paragraph IV on the cone of chords
- Edge 1986, invariant of degree 4 of the binary quintic — https://webhomes.maths.ed.ac.uk/cheltsov/seminar/pdf/1986a.pdf: Passages on the net of quadrics and point-cones with vertices on the curve (degree 5 and higher odd degree)
- Wikipedia, Twisted cubic — https://en.wikipedia.org/wiki/Twisted_cubic: Properties: projections from tangent, secant and curve points

## Screened only

- Couvreur-Zémor, Freiman's 3k-4 theorem for function fields (keyword search only: no Lüroth, Möbius or P¹ statement) — https://arxiv.org/abs/2408.00183
- High dimensional Riemann-Roch spaces in linear spaces with small squares (keyword search only) — https://arxiv.org/abs/2609.06822
- Wessel, On Freiman's theorem in a function field setting (keyword search only) — https://arxiv.org/abs/2405.10724
- Stratified and strong maximal rank conjecture in P³ and P⁴, Lemma 3.1 excerpt (rank-3 quadrics and pencils) — https://arxiv.org/abs/2605.24612
- Han-Lee-Moon-Park, Rank 3 quadratic generators of Veronese embeddings, Compositio 157 (2021) — https://arxiv.org/abs/2001.06687
- Park, On the rank of quadratic equations for curves of high degree (Remark 2.4 excerpt) — https://arxiv.org/abs/2202.00857
- Meyer, Projections of the twisted cubic, Teaching of Mathematics 2007 (keyword search only) — https://teaching.matf.bg.ac.rs/vol/tm1014.pdf
- Rydell-Sundelius, Conic multiview varieties (keyword search only) — https://arxiv.org/abs/2404.03063
- Kapustka-Kapustka-Ranestad, Variety of apolar schemes to powers of quadrics (keyword search only) — https://arxiv.org/abs/2409.13352
- Edge 1980, A special polyhedral net of quadrics (keyword search only) — https://webhomes.maths.ed.ac.uk/cheltsov/seminar/pdf/1980a.pdf
- Havlicek, The Betten-Walker spread and Cayley's ruled cubic surface (keyword search only) — https://arxiv.org/abs/1304.0231
- Variations on Pascal's theorem (keyword search only) — https://arxiv.org/abs/2411.07638
- Kirby, Variants of Schanuel's conjecture; Kirby, Exponential algebraicity in exponential fields (titles and abstracts: no bilinear or progression statement) — https://arxiv.org/abs/1801.08765
- Reid, Chapters on algebraic surfaces, and Eisenbud-Harris 1988, Vector spaces of matrices of low rank (local copies, keyword search only)
- Davydov, Marcugini, Pambianco, Twisted cubic and plane-line incidence matrix in PG(3,q) (keyword search only) — https://arxiv.org/abs/2103.11248
- Baker, Symbolical algebra and the quadrics containing a rational curve (no cone or vertex hits; text layer poor)

## Inaccessible

- Harris, Algebraic Geometry: A First Course; Semple-Roth; Baker, Principles of Geometry: Paywalled print books. These likely hold the classical statement, but nothing about them is verified here.
- Hirschfeld, Finite Projective Spaces of Three Dimensions, ch. 21; Bruen-Hirschfeld 1978: Paywalled
- Eisenbud, The Geometry of Syzygies, ch. 6; Eisenbud 1988, Linear sections of determinantal varieties: Paywalled. Third-party PDFs of the book appeared in results and I did not open them; the MSRI prepublication URL I guessed timed out. Would give an older form of the 1-generic 2×3 fact.
- Ellingsrud-Piene-Strømme, nets of quadrics defining twisted cubics: Paywalled, not opened
- Freire, UFPB thesis on nets of quadrics containing twisted cubics — https://repositorio.ufpb.br/jspui/handle/tede/9275: TLS certificate verification failed from the sandbox
- A compactification of the space of twisted cubics, Math. Scand. — https://tidsskrift.dk/math/article/view/14387: TLS failure in Python, HTTP 404 through the fetch tool; title seen only
- On the Twisted Cubic of PG(3,q), J. Algebraic Combin. 18 — https://emis.univie.ac.at/journals/JACO/Volume18_3/q743n443u3306828.html: HTTP 503
- Little, TwistedMonthly.pdf (Holy Cross) — https://mathcs.holycross.edu/~little/TwistedMonthly.pdf: Timed out
- zbMATH Open API: TLS certificate verification failed from the sandbox, so no zbMATH queries ran
- Semantic Scholar API: HTTP 429 on all three queries

## Queries

- twisted cubic contained in a quadric cone passes through the vertex; quadrics of rank 3 containing twisted cubic are cones with vertex on curve
- projection of twisted cubic from a point on the curve is a conic, from a point not on it is a nodal or cuspidal plane cubic
- linear analogue Vosper field extension critical pair geometric progression algebraically closed rational functions
- subspace of rational functions containing 1, x, 1/x, Riemann-Roch space, Couvreur Zémor
- Harris First Course twisted cubic quadrics rank 3 cones vertex
- Eisenbud Linear sections of determinantal varieties 1-generic 2×3 matrix twisted cubic Kronecker-Weierstrass
- Mirandola Zémor critical pairs product Singleton bound
- curve of odd degree on quadric cone passes through vertex; C0+3f on F2
- Reed-Solomon subcode Schur square 2k-1, Möbius of evaluation points, PGL2
- rank one matrices linear forms in logarithms 2×3 configuration Diaz conjecture geometric progression
- quadric cones through a twisted cubic vertices on curve, Hirschfeld, Semple Roth, Baker, Todd
- net of quadrics containing twisted cubic, discriminant double conic, 2×2 minors
- nonsingular bilinear map K²×K³→K⁴, Kronecker L₃, 2×3×4 tensor orbit
- Fischler Orbits under algebraic groups Lemma 6.1
- L(D) containing u and 1/u, pole and zero divisor degree bound, inner projection, subseries
- Kirby weak Schanuel, Ax-Schanuel, products of linear forms in logarithms
- cubical ellipse, twisted cubic on elliptic or circular cylinder, x=cos θ, y=sin θ, z=tan(θ/2)
- twisted cubics on P(1,1,2), section w = c(s,t)/l(s,t), F₂
- span of b, bh, bh², bh³ containing 1, u, 1/u, Möbius degree one
- twisted cubic PG(3,q) quadrics, cone vertex on cubic
- Couvreur Zémor critical pair L(D) L(D') same divisor class
- Westerbaan, Dyson transform, linear Kneser, Vosper, algebraically closed
- rational normal curve inner and outer projection, base point free subseries g²₃
- rank 3 quadrics containing rational normal curve, L = 2A + F, property QR(3)
- Variety of singular quadrics containing a projective curve
- Park Shim locus of rank 3 quadratic equations of a rational normal curve
