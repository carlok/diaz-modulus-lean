# Entry 11, strategy: translation

## Target, as restated by the searcher

Work in spaces of functions of u over the algebraically closed field Q̄, with H0 = <1, u, ρ/u> and conjugation acting as the Möbius involution u -> ρ/u. A 2×3 configuration in V means subspaces A and B of dimensions 2 and 3 with AB ⊂ V. Three statements are sought. (1) Invisibility: certain explicit 5-dimensional conjugation-stable spaces contain H0 and carry a configuration, but no 4-dimensional H0 + Q̄w inside them does. These are W1 = H0 + <F, F̄> with F = (u/s)^3 + (u/s)^2 (s^2 = uū), and the two-orbit spaces H0 + <g1, g2>, where g1, g2 have simple poles at ±a and ±b. Their configurations have ratio x2/x1 of degree two in u, and no configuration has a Möbius ratio. (2) Degree bound: if 1, u, 1/u lie in the span of c, ch, ch^2, ck, chk, which is AB with A = <1,h> and B = <c,ch,ck>, then h has degree at most 2 as a rational function of u. (3) Laurent classification: for f a self-conjugate Laurent polynomial of degree k in u/s and |λ| = 1, W(λ,f) = H0 + <f, f/(s+λu)> is invisible when the five numbers are free and k >= 3, or k = 2 and f(-λ̄) != 0. When k = 2 and f(-λ̄) = 0, u^2 and ū^2 lie in W(λ,f). Geometric form: V maps P^1 to P^4, H0 is a projection onto a conic, a 5-dimensional configuration puts the curve on a cubic scroll S(1,2) (hyperplane section of Segre P^1×P^2) with h as the ruling map, and a 4-dimensional configuration makes the projected curve a composite of a twisted cubic. Invisibility says no projection of the curve from a point of the line dual to H0 lands on such a twisted cubic.

## Leads

### Lead 1: analogue only

- **Citation:** A. Couvreur, G. Zémor, Freiman's 3k-4 Theorem for function fields, arXiv:2408.00183v2 (2024).
- **Location:** Introduction, passage on the limiting case dim ST = dim S + dim T - 1 with K algebraically closed
- **Quote:** the spaces S and T must have bases in geometric progression
- **Link:** https://arxiv.org/abs/2408.00183
- **Relation:** Gives only an ingredient. With K = Q̄ and dim AB = 4, a configuration has the form a<1,g>, b<1,g,g^2>, so the 4-dimensional spaces in question are c<1,g,g^2,g^3>. This reduces invisibility to checking that W1 and the others contain no such space that also contains H0. That check, which is the part not found, is not in the paper. The paper then moves to the symmetric case S = T and does not treat dim ST = dim S + dim T.

### Lead 2: analogue only

- **Citation:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. (2017); arXiv:1501.00602.
- **Location:** Theorems 2 and 3, introduction
- **Quote:** S and T have bases of the form
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** Treats the critical pair dim ST = dim S + dim T - 1, mainly over finite fields in prime extensions. It says nothing about the excess-one pair that carries the 5-dimensional configuration, about degree bounds in u, or about invisibility.

### Lead 3: analogue only

- **Citation:** C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's theorem, Algebraic Combinatorics 1 (2018); arXiv:1709.00087.
- **Location:** Abstract and introduction; Conjecture 2.2
- **Quote:** such a space S is included in a function field of genus 0 or …
- **Link:** https://arxiv.org/abs/1709.00087
- **Relation:** Studies the square S^2 with small excess, not a 2×3 product AB. Nothing gives the bound deg h <= 2 under the constraint 1, u, 1/u in AB. The same holds for Wessel, arXiv:2405.10724, and Tanısalı-Wessel, arXiv:2609.06822, which I screened only.

### Lead 4: analogue only

- **Citation:** A. Alzati, R. Re, Irreducible components of Hilbert schemes of rational curves with given normal bundle, Algebraic Geometry (2017); arXiv:1502.02521.
- **Location:** Section 7, Theorem 2
- **Quote:** characterize smooth non-degenerate rational curves contained in rational normal scrolls
- **Link:** https://arxiv.org/abs/1502.02521
- **Relation:** Closest match to the scroll translation: a smooth rational curve lies on a smooth scroll exactly when the projection vertex has a special type, equivalently by the splitting of the restricted tangent bundle. It says nothing about ruling degree against a conic projection, or about projections from a line dual to H0. It covers smooth curves only and does not address the part not found.

### Lead 5: analogue only

- **Citation:** J. Jung, H. Moon, E. Park, On the rank index of projective curves of almost minimal degree, arXiv:2411.17494v2.
- **Location:** Theorem 1.1
- **Quote:** rank-index(C) ≤ 4
- **Link:** https://arxiv.org/abs/2411.17494
- **Relation:** Concerns quadrics of low rank through curves of degree r+1, projected from a point. Our sextic in P^4 has degree r+2, and the theorem says nothing about which low-rank quadrics or configurations exist in a given subspace containing H0.

## Notes

**Result: no lead reaches the part not found.** All five leads are analogues. The clock showed under 15 minutes at my last check, so I stopped before the 30-minute box. The search was cut short by rate limits, not by exhausting the topic.

**Restatement that drove the search**
- With A = <1,h>, dim AB = 5 forces B ∩ h^{-1}B to have dimension 1, so B = <c, ch, ck> and AB = <c, ch, ch^2, ck, chk>. This is the excess-one pair, a linear Hamidoune-Rødseth case. It is automatic when dim A = 2.
- The 4-dimensional case is the critical pair. Over algebraically closed Q̄ it gives a twisted cubic, by the valuation argument Couvreur-Zémor sketch.
- In geometry: a curve on S(1,2), whose ruling is the pencil of h, projected to a conic.

**The degree bound is one line in this language (my own derivation, not a find)**
- Take a general fibre of h with d points. The evaluation vectors of (c, ch, ch^2, ck, chk) at those points lie on the line spanned by (1,t,t^2,0,0) and (0,0,0,1,t).
- So the fibre imposes at most 2 conditions on V, and the images in the conic given by <1, u, 1/u> are collinear. A conic has no trisecant, so d <= 2.
- This assumes c and k lie in Q̄(u). I sketched the other case (compare coefficients of k) but did not write it out.
- This supports the "routine" label, and it explains why nothing printed would state it: it is a fact about a conic with extra packaging. I searched for this form and found no printed statement.

**What each source says relative to the target**
- Diaz 2007 Th. 7 gives only the excluded families. It contains no statement that a space is out of reach of the method. The bilan says only that the six-exponentials framework cannot go far.
- Couvreur-Zémor is the nearest in spirit, but it covers only the critical pair and then specialises to S = T.
- BCZ, Couvreur-Zémor and Wessel treat squares. I found no asymmetric ST version at excess one, and none with a prescribed subspace H0.
- Aliabadi's Hamidoune content is about Chowla subsets, not Hamidoune-Rødseth.
- Alzati-Re characterises when a rational curve lies on a scroll, not its ruling degree against a conic.
- The rank-index papers concern quadric ranks only.
- Eisenbud-Harris rank-1 spaces and Reid's scroll chapter supply the dictionary, not the statement. I do not list them as leads.

**Not settled**
- Invisibility of W1 and the two-orbit spaces, and the Laurent classification for W(λ,f): I found nothing printed. They would be explicit computations given the twisted-cubic structure, and no source addresses a space of this shape. Multi-orbit pole spaces and Möbius-involution-stable spaces turned up nothing in web search, but the arXiv abstract query for them never ran.
- OpenAlex, zbMATH, Semantic Scholar search and later arXiv API calls were unavailable (see inaccessible). Citation chasing of Diaz 2007 is therefore thin: one citing paper only. Classical books and Italian-school scroll literature were not checked, and a stray lemma on trisecant-free projections could sit there, though it would give at most the degree bound.
- Several checks above are keyword scans of the text layer, not close reading.

## Read

- Diaz 2007, JTNB 19, local copy — https://emis.univie.ac.at/journals/JTNB/2007-2/article04.pdf: Théorèmes 6 and 7 with proofs, closing bilan of section 2
- Couvreur-Zémor, arXiv:2408.00183 — https://arxiv.org/abs/2408.00183: Introduction, limiting-case passage; keyword scan of the rest
- Bachoc-Serra-Zémor, arXiv:1501.00602 — https://arxiv.org/abs/1501.00602: Introduction, Theorems 1-3; keyword scan for excess-one statements (none found)
- Bachoc-Couvreur-Zémor, arXiv:1709.00087 — https://arxiv.org/abs/1709.00087: Abstract, introduction, Conjecture 2.2, Theorems 4.1-4.2; keyword scan
- Alzati-Re, arXiv:1502.02521 — https://arxiv.org/abs/1502.02521: Abstract, introduction, start of section 7 and Theorem 2 statement
- Jung-Moon-Park, arXiv:2411.17494 — https://arxiv.org/abs/2411.17494: Abstract, Theorem 1.1
- Reid, Chapters on algebraic surfaces, alg-geom/9602006, local copy — https://arxiv.org/abs/alg-geom/9602006: Keyword scan of chapter 2 on rational scrolls, determinantal equations
- Eisenbud-Harris 1988, Vector spaces of matrices of low rank, local copy: Introduction: compression spaces, the rank 1 classification

## Screened only

- Wessel, On Freiman's theorem in a function field setting, arXiv:2405.10724 — https://arxiv.org/abs/2405.10724
- Tanısalı-Wessel, High dimensional Riemann-Roch spaces in linear spaces with small squares, arXiv:2609.06822 — https://arxiv.org/abs/2609.06822
- Bachoc-Serra-Zémor, Revisiting Kneser's theorem for field extensions, arXiv:1510.01354 — https://arxiv.org/abs/1510.01354
- Aliabadi, Conditions for matchability in groups and field extensions II, arXiv:2309.14664 (linear Chowla conjecture, not Hamidoune-Rødseth) — https://arxiv.org/abs/2309.14664
- Mirandola-Zémor, Critical pairs for the product Singleton bound, arXiv:1501.06419 — https://arxiv.org/abs/1501.06419
- Lee-Park, On curves lying on a rational normal surface scroll, arXiv:1808.03038 (Betti tables only) — https://arxiv.org/abs/1808.03038
- von Bothmer, Generic syzygy schemes, math/0403432 — https://arxiv.org/abs/math/0403432
- Aprodu et al., The second syzygy schemes of curves of large degree, arXiv:2409.11855 — https://arxiv.org/abs/2409.11855
- Sidman-Smith, Linear determinantal equations for all projective schemes, arXiv:0910.2424 — https://arxiv.org/abs/0910.2424
- Chau-Kummini, Maximal minors of 1-generic matrices have rational singularities, arXiv:2506.08385 — https://arxiv.org/abs/2506.08385
- Kaveh-Khovanskii, Note on the Grothendieck group of subspaces of rational functions, arXiv:1302.2402 — https://arxiv.org/abs/1302.2402
- Waldschmidt, The role of complex conjugation in transcendental number theory (2005): the only citing paper of Diaz 2007 returned by Semantic Scholar
- Kirby, Variants of Schanuel's conjecture, arXiv:1801.08765 (keyword scan only) — https://arxiv.org/abs/1801.08765
- Waldschmidt, Diophantine approximation on linear algebraic groups, structural rank passages, local copy (keyword scan only)

## Inaccessible

- OpenAlex API: HTTP 429 on every call, including a retry; not used
- arXiv API, second and third batches: HTTP 429 after the first batch of 15 queries; scroll, Hopf-lemma, mu-basis and Möbius-involution abstract queries did not run, so web search stood in for them
- Semantic Scholar search endpoint: HTTP 429; only the citations lookup for Diaz 2007 succeeded, and it returned one paper
- zbMATH API via python: TLS certificate failure in the sandbox; one query worked through ctx_fetch_and_index and returned noise, so zbMATH is effectively unsearched
- Eisenbud-Harris, The Practice of Algebraic Curves; Eisenbud, The Geometry of Syzygies; Harris, Curves in Projective Space: Books not opened here; I saw only a zbMATH review of the first. Any scroll exercises in them are unchecked

## Queries

- arXiv API: linear analogue Vosper; Kneser field extension subspaces product; Hamidoune linear field extension; product of subspaces function field; Freiman function field subspace; rank index quadric curve; rank 3 quadrics rational normal; one-generic matrix linear forms curve; syzygy scheme curve; rational curves rational normal scroll projection; spaces of rational functions product; Schanuel six exponentials rank; matrices linear forms in logarithms rank; Riemann-Roch products of subspaces; tensor rank rational functions pencil
- linear analogue Hamidoune-Rødseth theorem subspaces field extension dim(AB) = dim A + dim B almost geometric progression
- rational curve on cubic scroll S(1,2) projection to conic, ruling degree, 2x3 matrix linear forms 1-generic
- Diaz conjecture modulus logarithm |u| e^u algebraic Laurent polynomial six exponentials conjugation-stable
- rank index of projective curves rank 3 quadrics rational normal curve projections scroll syzygy
- Eisenbud linear sections determinantal varieties 1-generic 2x3 hyperplane section Segre P^1 x P^2 cubic scroll
- spaces of rational functions on P^1 product of pencil and subspace dim VW = dim V + dim W Lüroth base point free pencil trick
- Vosper subspaces algebraically closed function field critical pair Bachoc Couvreur Zémor Westerbaan
- Mirandola Zémor critical pairs product Singleton bound near-critical
- rational curve on rational normal scroll secant lines ruling sextic rational curves P^4 cubic scroll classification
- Laurent polynomial unit circle transcendence six exponentials polynomial in u not in L tilde
- subspace of rational functions containing 1, x, 1/x in product of two subspaces degree bound Lüroth conic no trisecant
- Diaz Produits et quotients citations, modulus conjecture, new partial results
- incomplete linear series pencil fibres impose two conditions scroll multiplication map kernel binary forms
- Alzati Re rational curves restricted tangent bundle scroll multisecant lines
- asymmetric Freiman 3k-4 Lev Smeliansky product of two different subspaces function field
- Ax Schanuel weak four exponentials rational function of u modulus u^3 + c u^2
