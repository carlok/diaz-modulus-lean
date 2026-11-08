# Entry 13, strategy: translation

## Target, as restated by the searcher

Let K = Q̄ and let u be transcendental with uū = ρ algebraic, so ū = ρ/u and conjugation is the involution u → ρ/u on K(u). A 2×3 configuration in a K-space V means K-subspaces A, B of a field with dim A = 2, dim B = 3 and AB ⊆ V; equivalently, a rank-one 2×3 matrix with entries in V and K-independent rows and columns.

(a) For P in K[X], V_P = span(1, u, 1/u, P(u), P(ρ/u)) has dimension at most 5. It contains such a product iff deg P is 2 or 3. The part not found is the converse for deg P ≥ 4. Geometrically: the rational curve t → [1 : t : 1/t : P(t) : P(ρ/t)] in P^4 lies on no scroll or cone given by the 2-minors of a 1-generic 2×3 matrix of linear forms, i.e. no pencil-times-net factorisation lands in this linear system.

(b) If z is a real polynomial in Re u, Im u with algebraic coefficients, so z is a Laurent polynomial in u fixed by u → ρ/u, then span(1, u, 1/u, z, z̄) contains no such product. Since z̄ = z, this is a space of dimension at most 4.

(c) If V0 ⊆ F are K-space and field, and u is transcendental over F, then every 2×3 configuration over K in V0 + Ku + K/u has its products in V0. Hence Roy's theorem (no 2×3 configuration in L̃) passes to L̃ + Q̄u + Q̄ū when uū is algebraic and u is transcendental over the field of L̃.

## Leads

### Lead 1: special case

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000. Attributed there to D. Roy, Sur la conjecture de Schanuel pour les logarithmes de nombres algébriques, Groupe d'Études sur les Problèmes Diophantiens 1988-89, Publ. Math. Paris VI 90, no. 6, Lemme.
- **Location:** Proposition 12.4, §12.1.2, p. 422 (the entry names only Proposition 12.2, p. 419). Its proof pattern, the top u-degree term of det A, is on pp. 421-422.
- **Quote:** the diagonal elements belong to En−i+1 and not to En−i
- **Link:** https://doi.org/10.1007/978-3-662-11569-5
- **Relation:** Printed result stronger than the entry says, but it does not itself state (c). Prop. 12.4 is a normal form for any k-independent x1,...,xn, not only algebraically independent ones. It reaches arbitrary V0 + Ku, whereas the entry credits only V0 = K via Prop. 12.2. MY OWN DERIVATION, not in the book. Take x_n = u, with the other x_i a basis of the entries' span in V0 + K/u. Then M is K-equivalent to a matrix with block M11 = diag(c_i)u + (entries of u-degree ≤ 0), and all other entries in V0 + K/u. The u-degree of det M11 is exactly r1, so rank one forces r1 ≤ 1. If r1 = 1, write M = [[α, w1, w2], [x, n1, n2]] with α of u-degree 1. A column operation on columns 2 and 3 clears the 1/u term of n2, so n2 ∈ V0. Then α n2 = w2 x and degrees give n2 = 0, so w2 x = 0. Column independence gives w2 ≠ 0, so x = 0. Then n1 ≠ 0 and α n1 = 0, a contradiction. So r1 = 0, and no u occurs. The same argument with 1/u in place of u removes 1/u, so the products lie in V0. This is the Proposition rank_one_config_inverse_adjoin, and (c) follows with V0 = L̃. For V0 + Ku alone the conclusion is one line from 12.4. The u^-1 step is not printed; it is short but it is where three columns are needed, since [[u,1],[1,1/u]] is a 2×2 counterexample. Parts (a) and (b) are untouched.

### Lead 2: analogue only

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Springer, 2000; after D. Roy 1989, Proposition 1.
- **Location:** Lemma 12.15 with Exercise 12.9 and its hint, pp. 431 and 443-ish (page of the exercise not checked against the print)
- **Quote:** (no second quote from this source) A subspace of k[x] with degrees at least …
- **Link:** https://doi.org/10.1007/978-3-662-11569-5
- **Relation:** A printed degree condition under which a polynomial space carries no rank-degenerate matrix, close in spirit to (a). It does not apply to (a): after clearing denominators, the degrees of span(1, u, 1/u, P, P̄) are 0, d-1, d, d+1, 2d, which do not double. It also needs t_{n+1} ≥ 2t_n throughout. The statement has no converse and no two-sided (0 and ∞) count.

### Lead 3: analogue only

- **Citation:** D. Roy, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, Acta Math. 175 (1995), 49-73.
- **Location:** Theorem 3.4, §3.2, p. 66; companion: Waldschmidt DALAG Lemma 12.16 and Roy 1989 Prop. 2
- **Quote:** let M be a d x l matrix with coefficients in
- **Link:** https://projecteuclid.org/download/pdf_1/euclid.acta/1485890866
- **Relation:** Coefficient spaces of dimension 3: rank r satisfies 4r ≥ d + l, so a 2×3 rank-one matrix with independent rows and columns cannot occur. This is a theorem of the same type, for dim V = 3. The target concerns specific spaces of dimension 4 and 5 where the dimension alone decides nothing, so it is not reached.

### Lead 4: analogue only

- **Citation:** S. Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, Acta Arith. 100 (2001), 167-187.
- **Location:** Lemma 6.1 and final N.B. of §6
- **Quote:** in geometric progression with transcendental ratio
- **Link:** https://doi.org/10.4064/aa100-2-5
- **Relation:** Known and named in the entry. Included only to record that it concerns geometric progressions in L, with no statement about hulls or higher powers; nothing stronger than the entry says.

### Lead 5: analogue only

- **Citation:** H. Jung, H. Moon, E. Park (authors as reported by search, not checked), On the rank index of projective curves of almost minimal degree, arXiv:2411.17494.
- **Location:** Introduction and main theorem, seen in search excerpts only
- **Quote:** (not quoted; abstract-level screening only)
- **Link:** https://arxiv.org/abs/2411.17494
- **Relation:** Studies low-rank quadrics through isomorphic projections of rational normal curves, which is the suggested dictionary. It concerns degree r+1 curves and generation by quadrics of low rank, not existence of a 2×3 1-generic presentation for the 0,∞-singular curves of degree 2d in P^4 that (a) needs.

## Notes

**Result.** No printed statement of (a) or (b) found. For (c), one printed result is stronger than the entry records, but it is not (c) itself.

**(c), the only real lead.** The source line credits [Wal00, Prop. 12.2] with V0 = K, without u^-1. DALAG Prop. 12.4 (Roy 1989, Lemme), p. 422, is a normal form for arbitrary k-independent elements, so it covers general V0 + Ku. The u-degree argument of the determinant is printed in the proof of 12.2.

From 12.4 I derive the full Proposition `rank_one_config_inverse_adjoin` in a few lines; the derivation is in the lead. It is my translation, not printed. The u^-1 step, where the third column matters, appears nowhere I read. So I label this "special case", not "same". A verifier should check my r1 = 1 step. I checked it by hand and against the 2×2 counterexample [[u,1],[1,1/u]], which shows 2×3 is needed. Suggested change to the source line: cite Prop. 12.4 alongside 12.2. Chapter-14 status "routine" stands.

**(a), translation tried.**
- Linear Kneser/Vosper line: BSZ Theorem 33 classifies dim ST = dim S + dim T - 1 only. BCZ, Couvreur-Zémor and Wessel treat S², not pairs S, T of different dimensions. (a) needs dim AB ≤ 5 = dim A + dim B with |A| = 2, |B| = 3. I found no classification at that level, and none would directly decide a given 5-dimensional V.
- Scroll dictionary: V_P gives a rational curve of degree about 2d in P^4 with a distinguished pair 0, ∞. A 2×3 configuration amounts to the curve lying on a cubic scroll or cone over a twisted cubic (when dim AB = 4, a triple cover of a twisted cubic). The literature on curves on scrolls, syzygy schemes and rank index treats canonical curves, curves of high degree, or almost minimal degree. None tests this family.
- Monomial case k: support {0, ±1, ±k}. Searches for monomial curves in P^4 and 2×3 minors found arithmetic-sequence and P^3 results, nothing on these symmetric supports.
- Codes (error-correcting pairs, Schur products): analogues over finite fields; no match.

**(b).** The hull has dimension at most 4 since z̄ = z, so AB would equal it with dim AB = 4. BSZ Theorem 33 then gives geometric progressions. That is the named method, and the remaining step, excluding span(1, u, 1/u, z) = g·span(1, f, f², f³), is not printed anywhere I found.

**Diaz p. 390.** The remark only says one cannot hope to go very far within the strong six exponentials frame. There is no converse statement.

**Roy 1995 §3.2 and Roy 1989 Prop. 2.** These are limit statements in the same spirit (Theorem 3.4, dim V = 3). They do not reach dimensions 4 or 5.

**Could not settle.**
- Roy 1989 itself is not accessible and may hold more; get it by hand.
- Forward citations were not chased, because all citation APIs returned 429.
- Page of Exercise 12.9 in DALAG is unchecked against print.
- Time: stopped at about 7 minutes by the clock, well inside the box, because the search angles returned the same material. A rerun could usefully retry the citation chase.

**Exclusions.** Nothing from the excluded repositories or sites was used. The local library was read as allowed; `n3-lit` was only listed by filename, not opened.

## Read

- Waldschmidt, DALAG (2000), §12.1: Prop. 12.2, Lemma 12.3, first proof, Prop. 12.4, Property (A B; C 0), Lemmas 12.15-12.16, Exercises 12.7, 12.9, 12.11 — https://doi.org/10.1007/978-3-662-11569-5: pp. 419-431 and exercise statements, local text layer
- Diaz 2007, J. Théor. Nombres Bordeaux 19: Théorème 7, §2.4 closing remark (p. 390), references; local text
- Fischler 2001, Acta Arith. 100: Lemma 6.1, end of §6 including N.B., local text
- Roy 1995, Acta Math. 175 — https://projecteuclid.org/download/pdf_1/euclid.acta/1485890866: Introduction, §3.2 including Theorem 3.4, local text
- Bachoc-Serra-Zémor 2017, An analogue of Vosper's theorem for extension fields — https://arxiv.org/abs/1501.00602: §7, Theorem 33 statement and start of proof, local text
- Waldschmidt, The role of complex conjugation in transcendental number theory (DION 2005): §§5-6 opening, local text
- Waldschmidt, Further variations on the six exponentials theorem, Hardy-Ramanujan J. 28 (2005): Introduction and Theorems 1.1-1.2, Cor. 1.3, by my OCR of the local PDF; OCR garbled formulas, not checked against page images

## Screened only

- Bachoc-Couvreur-Zémor, Towards a function field version of Freiman's theorem (2018): search and keyword pass of local text; concerns S² with dim S² = 2 dim S — https://arxiv.org/abs/1709.00087
- Couvreur-Zémor 2024, Freiman's 3k-4 theorem for function fields: keyword pass; concerns S² — https://arxiv.org/abs/2408.00183
- Wessel 2024, arXiv:2405.10724: keyword pass; dim S² = 2 dim S + 1 in rational function fields — https://arxiv.org/abs/2405.10724
- Revisiting Kneser's theorem for field extensions (Bachoc-Serra-Zémor) — https://arxiv.org/abs/1510.01354
- On the product of vector spaces in a field extension, arXiv:0802.3523 — https://arxiv.org/abs/0802.3523
- Mirandola-Zémor, Critical pairs for the product Singleton bound — https://arxiv.org/abs/1501.06419
- Márquez-Corbella-Pellikaan, A characterization of MDS codes that have an error correcting pair — https://arxiv.org/abs/1508.02187
- On the rank index of some quadratic varieties — https://arxiv.org/abs/2206.08586
- On the rank of quadratic equations for curves of high degree — https://arxiv.org/abs/2202.00857
- Variety of singular quadrics containing a projective curve — https://arxiv.org/abs/1604.04425
- Last syzygies of 1-generic spaces — https://arxiv.org/abs/math/0307361
- Maximal minors of 1-generic matrices have rational singularities — https://arxiv.org/abs/2506.08385
- On binomial equations defining rational normal scrolls — https://arxiv.org/abs/math/0602609
- Sidman-Smith, Linear determinantal equations for all projective schemes, arXiv:0910.2424 — https://arxiv.org/abs/0910.2424
- Generalizations of self-reciprocal polynomials — https://arxiv.org/abs/1609.07677
- Dasgupta 2023 and Dasgupta-Kakde 2024, Ranks of matrices of logarithms I, II: keyword pass; structural rank over Q(x), no adjoined circle point — https://arxiv.org/abs/2408.08178
- Kirby, Variants of Schanuel's conjecture: keyword pass; no statement on rank-one matrices with an adjoined element — https://arxiv.org/abs/1801.08765
- zbMATH Open title lists for six exponentials, four exponentials, complex conjugation with logarithms, rational normal curve quadrics rank
- Roy 1992, J. Number Theory 41: keyword pass only, no matching statement found
- Waldschmidt, Variations on the six exponentials theorem (2005): keyword pass only

## Inaccessible

- D. Roy, Sur la conjecture de Schanuel pour les logarithmes de nombres algébriques, Groupe d'Études sur les Problèmes Diophantiens 1988-89, Publ. Math. Paris VI 90, no. 6 (Lemme, Prop. 1, Prop. 2): No online copy found. It is the origin of DALAG Prop. 12.4 and Lemmas 12.15-12.16, and Fischler cites its Prop. 2 as an 'impossible to derive algebraically' statement. It could be stronger than DALAG's account and is the first source to get by hand.
- D. Roy, Matrices dont les coefficients sont des formes linéaires, Sém. Théorie des Nombres Paris 1987-88, Progr. Math. 81, 273-281 — https://doi.org/10.1007/978-1-4612-3460-9_16: Paywalled book chapter; known only through DALAG's account.
- D. Eisenbud, Linear sections of determinantal varieties, Amer. J. Math. 110 (1988): Not opened; JSTOR-type access. Known only through secondary excerpts.
- Citation chase forward from Diaz 2004, Diaz 2007, Roy 1992, BSZ 2017: OpenAlex, Semantic Scholar and arXiv APIs all returned HTTP 429 in this session, so no forward-citation list was obtained. zbMATH keyword search worked but gives no citing list. This is a gap in coverage.

## Queries

- products of subspaces of rational functions k(t) dim AB = dim A + dim B function field Freiman theorem genus zero
- rational curve in P^4 lying on a cubic scroll 1-generic 2x3 matrix linear forms projected rational normal curve quadrics of rank 4
- rank index of projective curves rank 3 quadrics rational normal curve projection
- Laurent polynomial spaces factorization product of linear subspaces u^k u^-k rank one matrix strong six exponentials configuration
- linear analogue Kneser Vosper rational function field dim ST ≤ dim S + dim T critical pairs Riemann-Roch two places
- syzygy scheme rational curves on cubic scroll in P^4 monomial curve
- Ax-Schanuel rank one matrix logarithms transcendental element adjoined strong six exponentials
- Westerbaan products of subspaces field extension Kneser valuations geometric progression
- Riemann-Roch spaces P^1 base point free pencil trick rational curve lies on scroll, product of pencil and net
- Diaz conjecture |u| algebraic e^u algebraic powers u^k polynomial in u not in linear combinations of logarithms
- 2x3 determinantal curves Laurent polynomial subspace Newton polytope Minkowski decomposition
- projective monomial curves in P^4 determinantal 2x3 minors rational normal scroll
- Roy Sur la conjecture de Schanuel pour les logarithmes 1988-1989
- error-correcting pairs A*B in code, Schur product, cyclic code supports, sparse Laurent span
- self-reciprocal Laurent polynomials Möbius involution u to rho/u, pencil and net multiplication map
- Eisenbud Linear sections of determinantal varieties, 1-generic, H^0(L1) H^0(L2) multiplication, projected rational curves on scroll
- zbMATH: "six exponentials"; "four exponentials"; "strong four exponentials"; logarithms algebraic numbers complex conjugation; rational normal curve quadrics rank; linear forms in logarithms matrices rank
