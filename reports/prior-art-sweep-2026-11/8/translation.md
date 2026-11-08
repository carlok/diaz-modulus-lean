# Entry 8, strategy: translation

## Target, as restated by the searcher

Let K = Q̄ and let u be transcendental over K with uū = ρ in K, so conjugation acts on K(u) by ū = ρ/u. Then H₀ = ⟨1, u, 1/u⟩ is a space of rational functions on P¹ with polar divisor (0)+(∞). Take W = H₀ + Kz + Kz̄ with z = u/(u²−a) or u/(u²−a)². W is 5-dimensional and contains a product XY with dim X = 2, dim Y = 3. (The product is X = ⟨u, 1/u⟩, Y = ⟨1, 1/(u²−a), 1/(u²−b)⟩ or its double-pole analogue, and it lies in the 4-dimensional odd part of W, which does not contain 1.) The part not found: for no w in W∖H₀ does the 4-dimensional space V = ⟨1, u, 1/u, w⟩ contain such a product XY. In particular, V = ⟨1, u, 1/u, u/(u²−a)⟩ with aā = ρ² contains none. In curve language: the image of P¹ in P(V*) = P³ is birational of degree at least 4 and is not on the three quadrics given by the 2×2 minors of a 2×3 1-generic matrix with entries in V.

## Leads

### Lead 1: implies

- **Citation:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. 163 (2017), 423-452; arXiv:1501.00602v2
- **Location:** Theorem 33, Section 7 (arXiv pp. 25-26), together with Theorem 2 (intro; the lower bound dim ST ≥ dim S + dim T − 1)
- **Quote:** S and T have bases of the form {g, ga, . . . gadimS−1 }
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** My own translation; the paper never mentions these spaces. Let V ⊂ K(u) be 4-dimensional with 1, u in V, and let XY ⊂ V with dims 2, 3. Theorem 2 gives XY = V, and Theorem 33 (K algebraically closed) gives V = g⟨1,f,f²,f³⟩. Then f is a ratio of elements of V, so f is in K(u), and u is a ratio of two polynomials in f, so K(f) = K(u) and f is Möbius in u. Since 1 is in V, g = 1/P(f) with deg P ≤ 3, so V has polar divisor of degree exactly 3. But for w = h + αz + βz̄ in W∖H₀, the term αz + βz̄ is nonzero, odd and vanishes at ∞, so it has poles at some c, −c with c ≠ 0. So V = H₀ + Kw has polar degree ≥ 4, a contradiction. This covers both the invisibility and the conjugation-stable case. It does not address 'W carries a configuration', which the target already counts as printed.

### Lead 2: implies

- **Citation:** Castelnuovo's Lemma (classical), as stated in E. Park, On hypersurfaces containing projective varieties, arXiv:1104.5599 (journal version Forum Math., volume and pages from memory, not checked)
- **Location:** Abstract and Section 1
- **Quote:** the equality is attained if and only if the variety is of minimal degree
- **Link:** https://arxiv.org/abs/1104.5599
- **Relation:** My own translation, following the dictionary, with no use of Vosper. V = H₀+Kw maps P¹ birationally (u is a ratio of coordinates) onto a nondegenerate irreducible curve C in P³ of degree = polar degree ≥ 4. If XY ⊂ V, the matrix (x_i y_j) has entries in V. It is 1-generic because (Σc x)(Σd y) ≠ 0 in a field. Its three 2×2 minors vanish on C and are independent in Sym²V: a dependency would, after a column change, make one 2×2 minor vanish identically, and unique factorisation would then contradict 1-genericity. So C lies on 3 = binom(c+1,2) independent quadrics with c = 2, hence has minimal degree 3, a contradiction.

### Lead 3: implies

- **Citation:** M. Green, Koszul cohomology and the geometry of projective varieties, J. Differential Geom. 19 (1984); statement read in Y. Kim, H. Moon, E. Park, Some remarks on the K_{p,1} theorem, arXiv:2404.03293
- **Location:** Kim-Moon-Park Theorem 1.1(2), attributed there to Green
- **Quote:** βe,1(X) > 0 if and only if d = e + 1.
- **Link:** https://arxiv.org/abs/2404.03293
- **Relation:** My own translation, and heavier than the Castelnuovo route. The 2×3 1-generic matrix has minors of codimension 2 (Hilbert-Burch), and its two linear syzygies inject into the linear strand of I_C, so β_{2,1}(C) > 0. With e = 2 this forces deg C = 3, contradicting deg C ≥ 4. Green's original paper was not opened, and the characteristic hypothesis should be checked; the abstract text I extracted was cut off at that point.

### Lead 4: analogue only

- **Citation:** C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's Theorem, Algebraic Combinatorics 1 (2018), 501-521; arXiv:1709.00087
- **Location:** Theorem 5.3 and the remark after it in Section 6.1; Theorem 6.3
- **Quote:** S has combinatorial genus γ = 0 if and only if it has genus 0
- **Link:** https://arxiv.org/abs/1709.00087
- **Relation:** Symmetric case only (S², not XY), so it does not exclude a 2×3 configuration on its own. It supplies the Riemann-Roch vocabulary. It also places the conjugation-stable V: my computation gives dim V² = 8 = 2 dim V, so V has combinatorial genus 1 and falls under the genus-0 case of Theorem 6.3 (codimension 1 in L(D), deg D = 4). To reach the target you still need BSZ Theorem 33 to get from XY to a geometric progression.

### Lead 5: analogue only

- **Citation:** D. Mirandola, G. Zémor, Critical pairs for the Product Singleton Bound, IEEE Trans. Inform. Theory 61 (2015); arXiv:1501.06419
- **Location:** Theorem 1.2 and Section 4
- **Quote:** C is either a Reed-Solomon code or a direct sum of self-dual codes
- **Link:** https://arxiv.org/abs/1501.06419
- **Relation:** The evaluation-code version of the same critical-pair phenomenon, with Reed-Solomon codes in the role of geometric progressions, over finite fields. It says nothing directly about K(u).

## Notes

**Result.** I found no printed statement of the invisibility itself: nothing names H₀ + Kw, circle points, or these z. But the "not found" breaks in the weak sense that two printed general theorems imply it, each in a few lines through my own translation. This fits the entry's class "routine". It should be recorded as "follows from X", not "stated in X".

**Translation that does the work.** Everything lives in K(u) with K = Q̄, u transcendental.
- A 2×3 configuration in a 4-dimensional V is exactly a presentation V = g⟨1,f,f²,f³⟩.
- Geometrically, V maps P¹ onto a twisted cubic, possibly as a multiple cover.
- If 1 and u are both in V, the cover has degree 1, since u is in K(f) and f is in K(u). So V is a complete L(D) with deg D = 3.
- Hence: a 4-dimensional V ⊂ K(u) containing 1 and u carries a 2×3 configuration iff its polar degree is exactly 3.
- This is the whole target. H₀ already contributes the poles (0)+(∞). Any w in W∖H₀ adds at least two more, because the non-H₀ part is odd, nonzero and vanishes at ∞. So the polar degree is at least 4.

The configuration W does carry sits in the odd part W⁻ = u⁻¹(polys of degree ≤ 3 in s = u²)/((s−a)(s−b)), which has f = u² of degree 2. That is why it is invisible: a space containing 1 and u cannot be composed with a degree-2 map. On P⁴ this says the rational sextic projects from the fixed point of u ↦ −u as a double cover of a twisted cubic, and the centre of that projection does not lie on the line dual to H₀.

**Two independent routes.**
1. BSZ Theorem 33 plus Theorem 2 (Vosper over algebraically closed K, proved by a valuation argument).
2. Castelnuovo's Lemma: the three independent minors of the 1-generic matrix force minimal degree. This is the dictionary the brief suggested, and it reaches the target without any additive combinatorics.

Green's K_{p,1} theorem gives a third, heavier route and needs a characteristic check.

**Sanity checks (mine, numerical, modulo a 61-bit prime, with a = 5, b = 11 in the pole loci).**
- The conjugation-stable V has dim V² = 8.
- The space ⟨u,1/u⟩·⟨1,1/(u²−a),1/(u²−b)⟩ has dimension 4.
- H₀+w with w in W∖H₀ gave dim V² in {8, 9} in the simple-pole case and 9 in the double-pole case, over 29 choices of w per case, including special ones.
- A geometric-progression space would have dim V² = 7.
- By hand, the conjugation-stable V is ⟨1,u²,u⁴,u³−au⟩/(u(u²−a)), a nodal rational quartic with node {±√a}. It lies on a pencil of quadrics, one quadric short of the net a twisted cubic needs.

These checks support the derivation but are not a proof beyond it.

**Caveats for the verifier.**
- The target's "W carries a configuration" is not claimed as a find; the target already counts that shape as printed.
- The hypotheses in the target's Proposition (which z goes with which a) were not visible to me, as the Proposition is not in the target file. The pole argument above does not depend on that pairing. I checked both z forms by hand for the simple-pole pairing aā ≠ ρ² and the double-pole pairing aā = ρ².
- X and Y may a priori lie in ℂ rather than K(u). Theorem 33 still applies with L = ℂ, and g, f land in K(u) because they are ratios of elements of V.
- BSZ 2017 and BCZ 2018 are already in the local library under sources/others/, so the project may have these papers in view. I was told not to read further, so I cannot say whether this derivation was already considered and set aside.

**Tried with nothing beyond analogy.**
- Symmetric Freiman line (Couvreur-Zémor, Wessel, Tanisali-Wessel): S² only.
- Rank-3 and rank-index quadrics (Park, Han et al.): high-degree curves, complete series.
- Syzygy schemes (Bothmer): about 1-genericity, not this count.
- Product Singleton (Mirandola-Zémor): the code analogue.
- Lüroth and Möbius searches found no dedicated statement; Lüroth is not actually needed, as K(f) = K(u) is direct.
- The Schanuel and Ax vocabulary does not fit: the target has no transcendence content once u is transcendental, so I did not pursue it.

**Not settled.**
- The exact textbook location of the 2×3 normal form (Kronecker pencils, Eisenbud-Harris Practice of Algebraic Curves §18.1, Geometry of Syzygies §6B) was not verified against a page.
- The Park journal reference is from memory.
- OCR was not an issue for Theorem 33, whose statement is clear in the text layer, but the printed page was not compared.

Time used: well under the 30-minute box; the last date check read 13:21, five minutes in.

## Read

- Bachoc, Serra, Zémor, An analogue of Vosper's theorem for extension fields (arXiv v2) — https://arxiv.org/abs/1501.00602: Intro (Theorems 1-3), Section 7 Theorems 33-34 with the proof of 33
- Bachoc, Couvreur, Zémor, Towards a function field version of Freiman's Theorem — https://arxiv.org/abs/1709.00087: Intro, Theorem 5.3, Section 6 statements including Theorem 6.3, closing remark on Riemann-Roch spaces
- Park, On hypersurfaces containing projective varieties — https://arxiv.org/abs/1104.5599: Abstract and start of Section 1 (Castelnuovo's Lemma statement)
- Kim, Moon, Park, Some remarks on the K_{p,1} theorem — https://arxiv.org/abs/2404.03293: Theorem 1.1 and the discussion after it
- Mirandola, Zémor, Critical pairs for the Product Singleton Bound — https://arxiv.org/abs/1501.06419: Intro, Theorems 1.1-1.2
- Sidman, Smith, Linear determinantal equations for all projective schemes — https://arxiv.org/abs/0910.2424: Intro, and the passage citing Eisenbud's Geometry of Syzygies Prop. 6.10 (the multiplication matrix is 1-generic and its 2-minors vanish on X)
- von Bothmer, Last syzygies of 1-generic spaces — https://arxiv.org/abs/math/0307361: Intro passage on 1-generic 2×m matrices

## Screened only

- Couvreur, Zémor, Freiman's 3k−4 theorem for function fields (symmetric S² only; text search for ST, scroll, Hopf found nothing relevant) — https://arxiv.org/abs/2408.00183
- Wessel, On Freiman's Theorem in a function field setting (symmetric, γ = 2) — https://arxiv.org/abs/2405.10724
- Tanisali, Wessel, High dimensional Riemann-Roch spaces in linear spaces with small squares (2026, symmetric; intro mentions UV only for the Kneser/Vosper background) — https://arxiv.org/abs/2609.06822
- Bachoc, Serra, Zémor, Revisiting Kneser's theorem for field extensions — https://arxiv.org/abs/1510.01354
- Park, On the rank of quadratic equations for curves of high degree (rank-3 quadrics; high degree, complete linear series; analogue vocabulary only) — https://arxiv.org/abs/2202.00857
- Han, Lee, Moon, Park, Rank 3 quadratic generators of Veronese embeddings — https://arxiv.org/abs/2001.06687
- von Bothmer, Generic syzygy schemes — https://arxiv.org/abs/math/0403432
- Eisenbud, Harris, The Practice of Algebraic Curves: table of contents only, Section 18.1 lists the classification of 1-generic 2×f matrices (likely the textbook home of the normal form; statement not seen)
- Domínguez, Lam, Nonsingular bilinear maps revisited (polynomial multiplication; no classification over algebraically closed fields) — https://arxiv.org/abs/1811.03200
- Edge, Symbolical algebra and the quadrics containing a rational curve, Proc. Edinburgh Math. Soc. (title and snippet only; classical apolarity approach) — https://www.cambridge.org/core/journals/proceedings-of-the-edinburgh-mathematical-society/article/symbolical-algebra-and-the-quadrics-containing-a-rational-curve/D0696AF376A204DF151CB07C79717629

## Inaccessible

- D. Eisenbud, Linear sections of determinantal varieties, Amer. J. Math. 110 (1988): No free copy surfaced in search; known only through citations (Sidman-Smith)
- D. Eisenbud, The Geometry of Syzygies (2005), Ch. 6, Prop. 6.10: Commercial book; the only full copies that surfaced were third-party uploads, so I did not open them. The statement is taken from Sidman-Smith's citation
- D. Eisenbud, J. Harris, On varieties of minimal degree, Proc. Sympos. Pure Math. 46 (1987): No free copy surfaced; not opened
- M. Green, Koszul cohomology and the geometry of projective varieties, J. Differential Geom. 19 (1984): Not opened in the time used; statement read through Kim-Moon-Park
- OpenAlex API and zbMATH Open API: OpenAlex returned HTTP 429 and zbMATH failed on an SSL certificate error in the sandbox. No index results from either; web search and arXiv only

## Queries

- Bachoc Couvreur Zémor Towards a function field version of Freiman's theorem dim S^2 = 2 dim S - 1 genus 0
- equality in Hopf lemma linear series curve multiplication map dim XY = dim X + dim Y - 1 subspaces composed with a pencil rational function field geometric progression
- linear analogue Vosper theorem transcendental extension K(t) algebraically closed subspaces product bases geometric progression critical pair
- Eisenbud Linear sections of determinantal varieties 1-generic matrix 2x2 minors prime 2 x n matrix of linear forms rational normal scroll theorem
- rank index of projective curves quadrics of rank 3 or 4 rational normal curve projection, determinantal presentation 1-generic matrix multiplication map line bundles
- Mirandola Zémor Critical pairs for the Product Singleton Bound Reed-Solomon codes product MDS characterization
- Green K_{p,1} theorem variety of minimal degree; scrollar syzygy 2 x n 1-generic matrix syzygy scheme
- Eisenbud Geometry of Syzygies chapter 6 1-generic matrix multiplication sections line bundles Kronecker pencil normal form
- subspaces of rational function field K(t) product of two subspaces minimal dimension Riemann-Roch space L(D) Lüroth nonsymmetric ST
- nonsingular bilinear maps K^r x K^s to K^{r+s-1} algebraically closed classification polynomial multiplication Kronecker pencil 2 x n x (n+1) tensors
- Castelnuovo bound number of quadrics containing nondegenerate irreducible variety equality iff minimal degree
- rational quartic space curve nodal pencil of quadrics not three quadrics; 2x3 matrix linear forms twisted cubic Kronecker classification
- curve in P^3 not on three quadrics; multiplication map dim 2 and 3 image dim 4 twisted cubic composed with pencil; base-point-free pencil trick
- Laurent polynomial spaces span 1, x, 1/x, x/(x^2-a) nodal quartic hyperplane in binary quartics apolar 2 x 3 determinantal representation
