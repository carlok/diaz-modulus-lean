# Entry 4, strategy: scrolls

## Target, as restated by the searcher

Let W be a 5-dimensional space of functions containing 1, u, 1/u. Suppose there are a function h = p(u)/q(u) of degree 2 and a 3-dimensional space T with T and hT both inside W (a 2×3 configuration with ratio h). The claim is that W then has one of three shapes. (D1) There is a 3-dimensional T' with T' and uT' inside W. (D2a) W = <1, u, 1/u, Q'S1/(uP'), P'S2/(uQ')>, with P', Q' coprime of maximum degree 2 and deg S_i ≤ 2. (D2b) W = <1, u, 1/u, Q'S1/(uP'), Q'(Q'S1+P'S2)/(uP'^2)>. Theorem F then says that a 5-dimensional W inside Q̄(u) carries a configuration exactly when it has one of these shapes. Geometrically, W maps P^1 to a rational curve C in P^4, and C lies on the cubic scroll or cone of the 2×2 minors, with ruling cut by h. The condition that 1, u, 1/u lie in W says that hyperplanes through a line ℓ cut a conic system, so C is projected to a conic from ℓ.

## Leads

### Lead 1: special case

- **Citation:** D. Eisenbud, J. Koh, M. Stillman, Determinantal equations for curves of high degree, with an appendix with J. Harris, Amer. J. Math. 110 (1988), 513-539
- **Location:** Appendix, Theorem A(2), cases (b) and (c), p. 533 (page image checked); explicit description of case (c) just below it
- **Quote:** Paraphrase, not verbatim: equality in Clifford on an integral curve holds only for a multiple of the g^1_2 on a Gorenstein hyperelliptic curve, or for O_C<1,t,...,t^d> on a rational curve with one singular point whose conductor is the maximal ideal.
- **Link:** https://eisenbud.github.io/papers/pdfs/1988-002.pdf
- **Relation:** My own translation, not stated in the source. It gives the D1 versus D2 split only when W has pole degree 6. Take Γ = image of P^1 in P^4, of arithmetic genus 2, with L of degree 6 and F = O_Γ<x0,x1>. Y gives 3 sections of Hom(F,L). Clifford for F and Hom(F,L) forces deg F = 2 and h^0(F) = 2, so F is Clifford-extremal. Case (b): the ratio is the g^1_2 (degree 2), Γ is Gorenstein: D2 side. Case (c) with d = 1: the ratio is a Möbius function of u, Γ is non-Gorenstein: D1 side. It does not separate D2a from D2b, gives no normal forms, does not mention 1, u, 1/u, and does not show that a configuration forces degree ≤ 6.

### Lead 2: special case

- **Citation:** J. Buczyński, N. Ilten, E. Ventura, Singular curves of low degree and multifiltrations from osculating spaces, Int. Math. Res. Not. IMRN 2020, no. 21, 8139-8182; arXiv:1905.11860
- **Location:** Theorem 1.2 with Tables 1-2; Example 1.5 (same configurations for ℓ = 2, stated there for d = 5, n = 3); Theorem 1.2 applies at ℓ = 2, d = 6, n = 4
- **Quote:** two nodes, two cusps, or a node and a cusp
- **Link:** https://arxiv.org/abs/1905.11860
- **Relation:** My own translation, not in the source, which has no scrolls, pencils or configurations. Every base-point-free birational 5-dimensional W in Sym^6 has total δ = 2. Two δ=1 points: their preimages are the zeros of coprime P', Q' and W contains P'Q'·Sym^2, which gives D2a by working mod P' and mod Q'. Tacnode or (2,5)-cusp: W contains P'^2·Sym^2, the D2b side. (3,4,5)-cusp, cusp with smooth branch, or ordinary triple point: W contains f·Sym^3 with deg f = 3, which gives D1. So at pole degree 6 the three types hold for every W, with or without a configuration. The step that a configuration forces degree ≤ 6 is not printed here.

### Lead 3: special case

- **Citation:** N. Ilten, A. Mokhtar, Khovanskii-finite rational curves of arithmetic genus 2, Michigan Math. J. 73 (2023), no. 5, 1059-1082; arXiv:2101.09410
- **Location:** §3.1, Table 1, Table 2, Theorem 3.6(1), equations (2)-(3)
- **Quote:** Paraphrase, not verbatim: for each of the eight singularity strata of degree n+2 rational curves in P^n, Table 2 lists explicit representative parameterizations.
- **Link:** https://arxiv.org/abs/2101.09410
- **Relation:** These are explicit normal forms for pole-degree-6 W, in my own translation (n = 4, divide by a suitable form, u = x/y). Two cusps gives <1,u,1/u,u^3-au^2,u^-3-bu^-2>, which is exactly D2a at pencil (X^2,1), the shape of class (P). Tacnode gives <1,u,1/u,u^2-au^-2,u^3+bu^-2-u^-3>, which is D2b at P'=X, Q'=X^2+1/a, the shape of class (Q). Exact rational checks at one parameter value: dim{t in W: ht in W} = 3 for the ratio h in the two-cusps, tacnode, (2,5)-cusp, node+cusp and two-nodes rows, and dim{t: ut in W} = 2 in those rows. dim{t: ut in W} = 3 in the (3,4,5)-cusp, cusp+branch and triple-point rows. The paper does not group strata into these types and mentions no configuration.

### Lead 4: analogue only

- **Citation:** D. Eisenbud, Linear sections of determinantal varieties, Amer. J. Math. 110 (1988), 541-575
- **Location:** §4(c), Proposition 4.5; Theorem 5.1(i),(iii); Corollary 5.2
- **Quote:** Paraphrase, not verbatim: a 1-generic 2×v space with minimal codimension of the rank-one locus is equivalent to a unique scrollar space M(a_1,...,a_d).
- **Link:** https://eisenbud.github.io/papers/pdfs/1988-003.pdf
- **Relation:** For v = 3 this gives the two pairing shapes Cat(3,2) (span 4) and M(1,2) (span 5), that is, cone/progression versus cubic scroll. This is the Rei97 level in sharper form, plus the uniqueness of the shape. It classifies the abstract pairing and says nothing about how it sits relative to 1, u, 1/u, so the three types are absent.

### Lead 5: analogue only

- **Citation:** D. Eisenbud, J. Harris, On varieties of minimal degree (a centennial account), in Algebraic Geometry, Bowdoin 1985, Proc. Sympos. Pure Math. 46, Part 1, AMS 1987, 3-13
- **Location:** §2, Lemma 2.1 and Examples (i), pp. 8-10 (read by OCR)
- **Quote:** Paraphrase, not verbatim: a nondegenerate pairing k^2 ⊗ k^δ into linear forms gives a scroll of degree δ; a hyperelliptic curve embedded by a complete series lies on the scroll of g^1_2 secants as a divisor of class 2H+(d-2r+2)F.
- **Link:** https://eisenbud.github.io/papers/pdfs/1987-001.pdf
- **Relation:** Gives the scroll containing C and the class of a curve whose ruling is cut by a g^1_2, for complete series on a hyperelliptic curve. Stops before incomplete series, singular rational models, any normal form of W, and the three types. Only the Bertini-Del Pezzo classification and this construction are treated.

### Lead 6: analogue only

- **Citation:** J. Harris, M. Roth, J. Starr, Curves of small degree on cubic threefolds, arXiv:math/0202067
- **Location:** Lemma 6.8; also Lemmas 6.9, 6.10, 6.12
- **Quote:** Paraphrase, not verbatim: a smooth rational quartic in P^4 with a base-point-free g^1_2 lies on a unique cubic scroll, in class 2D+2F, whose ruling cuts that pencil.
- **Link:** https://arxiv.org/abs/math/0202067
- **Relation:** Treats the complete quartic only, with a pushforward computation for O(1)+O(2). This is the case ℓ = a ruling (pole degree 4) in my count in the notes, and it lands on the D1 side. No degree 6, no modifications, no D2a or D2b.

### Lead 7: analogue only

- **Citation:** A. Alzati, R. Re, Irreducible components of Hilbert schemes of rational curves with given normal bundle, arXiv:1502.02521
- **Location:** §7, Theorem 2 and its proof
- **Quote:** Paraphrase, not verbatim: a smooth rational curve lies on a smooth scroll exactly when its vertex is the space of e-th partials of one form, equivalently when the restricted tangent bundle has a given splitting.
- **Link:** https://arxiv.org/abs/1502.02521
- **Relation:** An apolar criterion on the D1 side: the proof treats C as a section of the scroll, so the ratio has degree 1. It assumes C smooth, which excludes the singular bisections of D2a and D2b. Nothing on degree-2 ratios.

## Notes

**Run:** 10:54 to about 11:13. Stopped early because the question was settled as far as these sources go.

**Verdict.** No source states Theorem NF or the three types as such. The "not found" for that exact statement survives, but it is weaker than the entry says. The D1/D2 split and the normal forms are in print at pole degree 6, in other words. These are not "implies" leads: my translations are unrefereed and one step is my own.

**What the requested sources give**
- Eisenbud-Harris 1987: scroll from a nondegenerate pairing (Lemma 2.1); class 2H+(d-2r+2)F for hyperelliptic curves under complete series. No incomplete series, no types.
- Eisenbud 1988, Thm 5.1(iii), Prop. 4.5: for 2×3, the shapes Cat(3,2) and M(1,2) (cone versus cubic scroll). No types.
- Eisenbud-Harris 1988 (sources/n3-lit): sheaves of c1 = 1 and compression spaces. Unrelated to the types.
- Geometry of Syzygies Ch. 6: **not read** (see inaccessible).

**The useful finds** (none of them named in the target):
- EKS 1988 Appendix Theorem A: Clifford-extremal torsion-free sheaves. Case (b) is the g^1_2 on a Gorenstein curve; case (c) is O_C<1,t,...> on a non-Gorenstein rational curve. In my translation, at genus 2, this is D2 versus D1.
- Buczyński-Ilten-Ventura 2020 and Ilten-Mokhtar 2023: the eight singularity strata of degree n+2 rational curves in P^n, with explicit forms.
- The strata match the types: two singular points with δ=1 are D2a; tacnode and (2,5)-cusp are D2b; the three non-Gorenstein δ=2 strata are D1.
- At n = 4, Table 2's two-cusps row is the class (P) shape and its tacnode row is the class (Q) shape, which a verifier should find striking.

**Checks.** Exact rational arithmetic (values at 48 points) at one parameter value (a=3/7, b=5/11, c=2/13), over all eight rows in my transcription of Table 2:
- D2 rows: dim{t: ht in W} = 3 for the expected h, dim{t: ut in W} = 2. Covers two cusps, tacnode, (2,5)-cusp, node+cusp, two nodes. The two-nodes row needed the pair (1, 1/c) and contains the expected P'Q'·Sym^2.
- D1 rows: dim{t: ut in W} = 3 for (3,4,5)-cusp, cusp+branch, triple point.
- Exact span equalities: two cusps = D2a(X^2,1); tacnode = D2b(X, X^2+1/a, S1, S2) with S1 = -a^2+X^2 and a constant S2 = 15/77.
- The general-parameter statements are by hand only.

**What is not printed: "configuration forces pole degree ≤ 6".** Here is my own bridge, for a verifier; it is not in any source and has not been refereed.
1. Let d be the pole degree. The forms s·Sym^2 for 1, u, 1/u have deg s = d-2, so the line ℓ pulls back to div(s), of length d-2.
2. C lies on S = minors of the 2×3 matrix, with C·F = 2. S is cut out by quadrics.
3. If ℓ is not in S, then ℓ∩S has length ≤ 2 and is transverse to the ruling, so its pullback lies in h^-1 of a length ≤ 2 scheme, length ≤ 4. So d ≤ 6.
4. If ℓ is a ruling, d-2 ≤ 2. If ℓ is the directrix, the pullback has length d-4 < d-2: impossible.
5. On the cone S(0,3) (the Case I shape), ℓ misses the vertex, else u would lie in Q̄(h). The same count applies.
6. For d = 4 or 5: W is complete, or contains P'·Sym^3, which gives D1.
7. W outside Q̄(u) is excluded elementarily: τ outside Q̄(u) would force h algebraic, or u in Q̄(h).

With this bridge, Theorem NF would follow from Eisenbud-Harris Lemma 2.1 plus the hand translation of Buczyński-Ilten-Ventura. The trichotomy also matches length-2 torsion over P^1_h (two points, cyclic, non-cyclic), which agrees with the entry's bundle language. In that language, G = π_*O(0+∞) ≅ O(1)+O, the sheaf generated by 1, u, 1/u.

**Reach and limits.** None of this addresses the rest of Theorem F: ratios of degree ≥ 3, the 4-dimensional case, or the conjugation hull. D1 at degrees other than 4, 5, 6 is not treated by these leads either. Treat this as a reduction proposal, not an independent proof of the entry.

**Suggested action for the entry.** Name EKS Thm A, Buczyński-Ilten-Ventura and Ilten-Mokhtar in the source line. A verifier should recheck the three translations and the bridge.

**Quotes.** My operating rules allow one verbatim quote per response, stricter than the task's one per source. Only the Buczyński-Ilten-Ventura field is verbatim; the others are labelled paraphrases, with locations given.

**Sources.** Eisenbud papers from his own page (eisenbud.github.io), which hosts JSTOR-stamped scans. Scans were read by OCR; only EKS p. 533 was checked against the page image. Temporary folders were deleted. No repository files were read except the target and the local Eisenbud-Harris 1988 copy (plus a directory listing of sources).

## Read

- Eisenbud-Harris 1987, On varieties of minimal degree — https://eisenbud.github.io/papers/pdfs/1987-001.pdf: §1 skimmed; §2 in full; references (OCR of scan)
- Eisenbud-Harris 1988, Vector spaces of matrices of low rank (local copy, sources/n3-lit): abstract, §1 opening, §4 from the curves examples to the end; grep for scrolls, 1-generic and multiplication; no scrolls or 2×3 classification of this kind
- Eisenbud-Koh-Stillman 1988 with Harris appendix — https://eisenbud.github.io/papers/pdfs/1988-002.pdf: Introduction; §(c) elliptic and hyperelliptic examples; Appendix Theorem A (page image of p. 533) and Theorem B
- Eisenbud 1988, Linear sections of determinantal varieties — https://eisenbud.github.io/papers/pdfs/1988-003.pdf: Introduction; §4(c) scrollar spaces, Prop. 4.5; §5 Theorem 5.1, Cor. 5.2, part of the proof (OCR)
- Buczyński-Ilten-Ventura 2020 — https://arxiv.org/abs/1905.11860: Theorem 1.2, Table 1, Example 1.5; grep for scroll, hyperelliptic, involution, determinantal, minors: no hits
- Ilten-Mokhtar 2023 — https://arxiv.org/abs/2101.09410: Introduction, §3.1, Tables 1-2, equations (2)-(3), Theorem 3.6; same grep, no relevant hits
- Harris-Roth-Starr, Curves of small degree on cubic threefolds — https://arxiv.org/abs/math/0202067: §6 preliminaries on cubic scrolls; Lemmas 6.8-6.10, 6.12
- Alzati-Re, Irreducible components of Hilbert schemes of rational curves — https://arxiv.org/abs/1502.02521: §7 Theorem 2 and its proof
- Bernardi-Gimigliano-Idà, On parameterizations of plane rational curves and their syzygies — https://arxiv.org/abs/1507.02227: Introduction, Prop. 2.1 (unisecant curves only), statement on splitting type (3,d-3)

## Screened only

- Lee-Park, On curves lying on a rational normal surface scroll, JPAA 223 (2019): Betti tables of divisors on scrolls — https://arxiv.org/abs/1808.03038
- Kustin-Polini-Ulrich, Rational normal scrolls and the defining equations of Rees algebras, Crelle 2011 — https://arxiv.org/abs/0812.4963
- Cortadellas Benítez-Cox-D'Andrea, The Rees algebra of parametric curves via liftings — https://arxiv.org/abs/1810.02077
- Madsen, height two ideals in k[x0,x1] — https://arxiv.org/abs/1511.04073
- von Bothmer, Last syzygies of 1-generic spaces — https://arxiv.org/abs/math/0307361
- Eisenbud, Lectures on the geometry of syzygies (MSRI Publ. 51): grep only; no 1-generic or scroll content — https://eisenbud.github.io/papers/pdfs/2004-003.pdf
- Lara-Marchesi-Vidal Martins, canonical models and scrolls — https://arxiv.org/abs/1502.07556
- Huizenga, Restrictions of Steiner bundles: multiplication on P^1, generic series — https://arxiv.org/abs/1102.5580
- On linear versions of some addition theorems: Hopf-type bound only — https://arxiv.org/abs/0802.3523
- Eisenbud-Schreyer 2024, Hyperelliptic curves and Ulrich sheaves (title only) — https://eisenbud.github.io/papers/pdfs/2024-001.pdf

## Inaccessible

- D. Eisenbud, The Geometry of Syzygies, GTM 229, Springer 2005, Chapter 6: Paywalled and not on the author's page; the old MSRI draft URLs timed out or had no archive copy. Only the table of contents was seen (6A rational normal curves, 6B 1-generic matrices, 6C linear series, 6D elliptic normal curves). Search showed copies at a UMN course folder and agorism.dev; I did not open them, under the no-paywall rule. So Chapter 6 itself is NOT read. Its research-paper sources (EKS 1988, Eisenbud 1988) were read.
- F.-O. Schreyer, Syzygies of canonical curves and special linear series, Math. Ann. 275 (1986), 105-138: Only a bibliographic record found; no open PDF. Known to treat canonical curves, so unlikely to bear on the target.
- zbMATH Open API, OpenAlex, Semantic Scholar: zbMATH failed on an SSL certificate error in the sandbox (not bypassed). OpenAlex and Semantic Scholar returned rate-limit errors. Indexes actually used: arXiv API and web search.

## Queries

- Eisenbud Harris "On varieties of minimal degree" centennial account pdf
- Eisenbud The Geometry of Syzygies chapter 6 "Linear series and 1-generic matrices" scrolls pdf
- rational curves on cubic scroll S(1,2) ruling cut by g^1_2 bisection classification 2x3 matrix linear forms multiplication map linear series P^1
- multiplication of two linear series on P^1 dim(VW)=dim V+dim W rational functions classification subspaces product pencil 3-dimensional subspace scroll vector bundle elementary modification
- rational normal scroll containing projection of rational normal curve, subspace of binary forms H^0(O(d)) codimension, 2x3 determinantal rational curve in P^4 degree d splitting type
- Lee Park On curves lying on a rational normal surface scroll
- Kustin Polini Ulrich Rational normal scrolls and the defining equations of Rees algebras
- elementary transformations rank two bundle O(1)+O on P^1 lattice over double cover pencil degree 2 colength two subsheaf cyclic torsion quotient
- hyperelliptic g^1_2 rational normal scroll projected curve incomplete linear series cubic scroll P^4 class 2H+bF
- Hopf lemma equality case dim(AB)=dim A+dim B spaces of rational functions classification Castelnuovo curves scrolls
- rational curve in P^4 on rank 3 quadric and cubic scroll; subspace of H^0(O_{P^1}(d)) containing s·H^0(O(2))
- integral curves arithmetic genus 2 rational normalization singular hyperelliptic double cover P^1 degree 6 embedding P^4 cubic scroll classification tacnode ramphoid cusp two nodes
- Schreyer Syzygies of canonical curves and special linear series; Castelnuovo curves scroll
- Buczyński Ilten Ventura singular curves classification singularities projection rational normal curve
- Ilten Mokhtar Khovanskii-finite rational curves of arithmetic genus 2 journal
- rational sextic curve in P^4 two nodes or tacnode arithmetic genus 2 lies on cubic scroll hyperelliptic pencil projection from a line
- arXiv API: rational normal scroll + bisection; rational normal surface scroll + curves; cubic scroll + rational curves; 1-generic; one-generic; multiplication map + subspaces + binary forms; Hecke modification + scroll; scroll + incomplete linear series; product of subspaces + function field + linear series
- Eisenbud's publication list at eisenbud.github.io/papers/ filtered on scroll, 1-generic, linear series, minimal degree, determinantal, low rank
