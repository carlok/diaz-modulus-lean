# Entry 3, strategy: translation

## Target, as restated by the searcher

Let K = Q̄ and let u be transcendental with uū algebraic. Put s² = uū and v = u/s, so v̄ = 1/v and conjugation acts on K[v, 1/v] as the semilinear involution v -> 1/v (real structure with the circle as real locus; v = e^{iθ} turns these into trigonometric polynomials). H₀ = <1, v, 1/v>. For a Laurent polynomial z, W = H₀ + Kz + Kz̄. A 2×3 configuration in W is a pair of K-subspaces A, B of K(v), of dimensions 2 and 3, with AB ⊂ W.
The part sought is the converse classification. Such A, B exist iff dim W = 5 and W is in one of three classes:
(P) W contains αu² + βu³ for some (α,β) ≠ 0.
(Q) W = H₀ + K(v̄² + e v²) + K(β v̄³ + ζ v² + e v³), with |e| = |β| = 1 and ζ = −βe²ζ̄.
(R) W = H₀ + Kg + Kḡ with g = G(v) + κ·conj(vG(v)), |κ| = 1, G(0) = 0, deg G ≥ 2.
If an exponent of absolute value ≥ 4 occurs, only (R) survives. For z ≡ Aū³ + Bū² + Cu² + Du³ modulo H₀, with dim W = 5, the criterion is NΔ(|Δ|² − |u|²N²) = 0, where N = |A|² − |D|² and Δ = AC̄ − BD̄. Only the "only if" steps count (shape list, two-sided pinch, pencil analysis); the configurations themselves are known.
Translation used in the search. A·B ⊂ W with dim AB = 5 has a one-dimensional kernel in A⊗B spanned by a rank-2 tensor, so AB = c(<1,f,f²> + h<1,f>). With φ_W: P¹ -> P⁴ the map given by W, a rational curve C of degree 2k, the target asks when C lies on a cubic scroll S(1,2) or a cone S(0,3), given that C lies on the rank-3 quadric x₀² = x₁x₂ coming from H₀ and that W is stable under the real structure of the circle. Dually, W^⊥ is a (2k−4)-dimensional space of binary forms of degree 2k, that is, a space of Hankel (catalecticant) matrices with a common 2×3 zero block.

## Leads

### Lead 1: analogue only

- **Citation:** D. A. Cox and A. A. Iarrobino, Strata of rational space curves, Comput. Aided Geom. Design 32 (2015); arXiv:1408.2816
- **Location:** Section 4.2, Example 4.8, eqs (4.8)-(4.11) (the end of 4.2 covers general d)
- **Quote:** based on which two-dimensional rational normal scroll the curve lies on
- **Link:** https://arxiv.org/abs/1408.2816
- **Relation:** Closest vocabulary found. In their setting, a parametrization with μ-type (1,1,1,n−3) in P⁴ has I_n = R_2·h₁ ⊕ R_1·h₂ and lies on S_{2,1}. By my own translation, class (R) has this shape: W = v̄<1,v,v²> + g<1,v>, since ḡ = κ̄ v g. So they present the shape only for pencils of degree 1 (A = R_1 up to Möbius). They do not treat pencils of higher degree, such as the degree-2 pencil of class (Q), conjugation, the H₀ constraint, or any list of which W occur. It does not reach the shape list, the pinch or the pencil analysis.

### Lead 2: analogue only

- **Citation:** C. Bachoc, O. Serra and G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. (2017); arXiv:1501.00602
- **Location:** Section 7, Theorem 33 (not the Lemma 4 named as nearby)
- **Quote:** S and T have bases of the form
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** For F algebraically closed and dim ST = dim S + dim T − 1, S and T are geometric progressions. This is excess 0, and it is what would handle dim AB = 4. The target needs excess 1 (dim AB = 5) and the interaction with H₀ and conjugation. Stated in the same generality the target's notes already credit in part to this paper's §7 method, so it is not stronger than expected.

### Lead 3: analogue only

- **Citation:** A. Couvreur and G. Zémor, Freiman's 3k−4 Theorem for Function Fields, arXiv:2408.00183 (2024)
- **Location:** Theorem 1, Introduction
- **Quote:** there exists a Riemann-Roch space L(D) of F that contains S
- **Link:** https://arxiv.org/abs/2408.00183
- **Relation:** It concerns squares S² only, not products of two different spaces A·B, and concludes that S lies in a Riemann-Roch space. Every W here already lies in L(k·0 + k·∞), so that conclusion is empty for the target. No derivation reaches the classification.

### Lead 4: analogue only

- **Citation:** C. Bachoc, A. Couvreur and G. Zémor, Towards a function field version of Freiman's Theorem, Algebraic Combinatorics 1 (2018); arXiv:1709.00087
- **Location:** Section 2, Conjecture 2.2; Theorem 6.3 (known from the paper's own account, proof not read)
- **Quote:** Let the combinatorial genus γ of S satisfy
- **Link:** https://arxiv.org/abs/1709.00087
- **Relation:** It characterises S with dim S² = 2 dim S (γ = 1), which is the square version of excess 1. There is no statement for A·B with A ≠ B and no result on subspaces with a prescribed part H₀. Same relation for Wessel (arXiv:2405.10724, γ = 2 over K(x)) and Tanisali-Wessel (arXiv:2609.06822).

### Lead 5: analogue only

- **Citation:** D. Mirandola and G. Zémor, Critical pairs for the Product Singleton Bound, IEEE Trans. Inform. Theory 61 (2015); arXiv:1501.06419
- **Location:** Theorem 2.12, Theorem 4.2
- **Quote:** then C and D are Reed-Solomon codes with a common evaluation-point sequence
- **Link:** https://arxiv.org/abs/1501.06419
- **Relation:** Coding-theory form of Vosper for distinct spaces C, D (excess 0, MDS codes). This is the evaluation-code shadow of Theorem 33 above. Excess 1 and conjugation are not treated.

### Lead 6: analogue only

- **Citation:** J. Jung, H. Moon and E. Park, On the rank index of projective curves of almost minimal degree, arXiv:2411.17494 (to appear in J. Algebra, per a search snippet; not confirmed)
- **Location:** Theorem 1.1, Section 1, Section 3
- **Quote:** there is a unique rational normal surface scroll S that contains C
- **Link:** https://arxiv.org/abs/2411.17494
- **Relation:** Projected rational curves of degree r+1 in P^r lie on a unique scroll (via apolarity). For r = 4 that is degree 5. Our curves have even degree 2k (window [−k,k] by conjugation stability), so degree 5 never occurs. Degree 6, projection from a line, is the cubic window case and is not covered. Rank 3 is discussed, but only as rank index, not as a constraint from H₀.

### Lead 7: analogue only

- **Citation:** M. Franciosi, Scrolls containing binary curves, arXiv:1811.09690 (2018)
- **Location:** Section 1, Lemma 4.4, Lemma 4.7, Propositions 4.8-4.9
- **Quote:** families of scrolls containing a fixed scheme
- **Link:** https://arxiv.org/abs/1811.09690
- **Relation:** It counts scrolls of dimension n/2 containing a rational normal curve with induced map of degree k, and uses rank-3/4 quadrics. It treats rational normal curves only, not projected ones, and gives dimension counts rather than a criterion for a given W.

## Notes

**Result: no lead reaches the part not found.** All seven leads are analogues. None contains a classification of 5-dimensional conjugation-stable spaces of Laurent polynomials containing 1, v, 1/v that carry a 2×3 configuration, and none reaches the cubic-window criterion. The "not found" stands for this translation search, subject to the gaps below.

**Time used.** 10:41 to about 11:00 by the clock, under the 30-minute box. I stopped because searches had stopped producing new vocabulary, with API rate limits still in force.

**What the translation shows.**
- The linear-Kneser line (BSZ, BCZ, Couvreur-Zémor, Wessel, Tanisali-Wessel, Mirandola-Zémor) splits in two. Distinct-space results stop at excess 0 (Vosper). Excess-1 and higher results are for squares S² only. I found no published excess-1 inverse theorem for A·B with A ≠ B. The theorem's setting falls in that gap, and adding H₀ and conjugation moves it further away.
- The scroll line gives the right objects. Cox-Iarrobino and KPU cover degree-one pencils through μ-types. Jung-Moon-Park and related papers cover degree r+1. Franciosi covers rational normal curves. Rational curves of degree 2k in P⁴ with a fixed rank-3 quadric appear nowhere I looked.
- Real-structure searches (self-inversive polynomials, Fejér-Riesz, real pencils) gave only vocabulary.
- Schanuel and Kirby searches gave nothing: those statements do not concern function-space configurations.
- Diaz 2004 and 2007 state configurations and no converse. Waldschmidt's survey (Th. 6.1) is a statement about general 2×3 matrices.

**My own translation, not from any source and not checked by anyone.**
1. Kernel shape: AB of dimension 5 means AB = c(<1,f,f²> + h<1,f>).
2. Class (R) is explicit. From ḡ = κ̄ v g, take A = <1,v> and B = <v̄,1,g>, which gives W = v̄<1,v,v²> + g<1,v>. I checked this algebra by hand.
3. Possible short route to Corollary E(a) by Bezout. C has degree 2k and lies on the rank-3 quadric Q from H₀, and on a cubic scroll S. If Q does not contain S, then C ⊂ Q∩S forces 2k ≤ 6. If Q contains S, then Q is a rank-3 member of the net of S, which should force H₀ = c<1,f,f²> with f Möbius, and then conjugation should give (R). This is a sketch: the last two steps and the cone case S(0,3) are not worked out. It is also a proof idea, not a prior-art find, so it does not break the "not found". It may interest whoever writes up the "two-sided pinch", because it looks like a geometric form of that step, but that comparison is a guess since I did not see the proof.

**Could not settle.**
- Forward citations of Diaz 2004 and 2007 are essentially untraced (see inaccessible). This is the largest gap on the transcendence side.
- Iarrobino's ancestor ideals paper (J. Algebra 2004) was not read. It is the likeliest place for the dual language at degree-one pencils, but it would at most give the shape for (R)-type pencils, as Cox-Iarrobino does.
- Classical sources (Segre-era work on curves on scrolls, Room) were not reachable by these searches. A classical statement on rational curves on cubic scrolls could exist there, though a conjugation-specific criterion is unlikely.

**Hedges on citations.** Publication details for Cox-Iarrobino, Mirandola-Zémor and BCZ come partly from my memory and search snippets; the arXiv links are the checked identifiers. The Jung-Moon-Park journal status comes from a snippet. In the screened list, the first entry's authors are as I recall them for the zbMATH title, and Harris-Roth-Starr is likewise from memory; only the titles and links were seen.

## Read

- Diaz 2007, JTNB 19 (local copy) — https://doi.org/10.5802/jtnb.592: Théorème 4, Théorème 7, §2.4 bilan: configurations only, no converse and no classification
- Diaz 2004, JTNB 16 (local copy) — https://doi.org/10.5802/jtnb.459: Théorème 2 and its proof (partly garbled OCR); list of theorems and propositions
- Bachoc-Serra-Zémor 2017 (local copy) — https://arxiv.org/abs/1501.00602: Lemma 4, Section 7 through Theorem 33, overview
- Waldschmidt, The role of complex conjugation in transcendental number theory (local copy) — https://hal.science/hal-00411402: Section 6, Theorem 6.1 (2×3 matrices; statement only)
- Cox-Iarrobino 2015 — https://arxiv.org/abs/1408.2816: Section 4.2, end of 4.2, abstract
- Couvreur-Zémor 2024 — https://arxiv.org/abs/2408.00183: Introduction, Theorem 1; grep for two-space statements
- Bachoc-Couvreur-Zémor 2018 — https://arxiv.org/abs/1709.00087: Introduction, Section 2, Conjecture 2.2; grep for ST statements (Theorem 6.3 statement itself not read)
- Wessel 2024 — https://arxiv.org/abs/2405.10724: Abstract, Introduction, Conjecture 1.3
- Tanisali-Wessel 2026 — https://arxiv.org/abs/2609.06822: Abstract, Introduction
- Mirandola-Zémor 2015 — https://arxiv.org/abs/1501.06419: Theorem 2.12, Remark 2.13, Theorem 4.2, Remark 4.3
- Jung-Moon-Park 2024 — https://arxiv.org/abs/2411.17494: Theorem 1.1, Section 1 discussion of the unique scroll
- Franciosi 2018 — https://arxiv.org/abs/1811.09690: Abstract, Introduction, Lemma 4.7; statement list of Section 4
- Kustin-Polini-Ulrich, Rational normal scrolls and the defining equations of Rees algebras — https://arxiv.org/abs/0812.4963: Abstract, introduction lines on Proposition 2.1
- Kirby, Variants of Schanuel's conjecture (local copy) — https://arxiv.org/abs/1801.08765: List of conjecture statements: nothing about function-space configurations

## Screened only

- Coskun-Riedl? no: Alzati-Re, Irreducible components of Hilbert schemes of rational curves with given normal bundle (Zbl 1369.14066), title only
- Harris-Roth-Starr, Curves of small degree on cubic threefolds: unique cubic scroll for rational quartics, snippet only — https://arxiv.org/abs/math/0202067
- Brodmann-Schenzel, Arithmetic properties of projective varieties of almost minimal degree, snippet — https://arxiv.org/abs/math/0506277
- Brodmann-Park-Schenzel, On varieties of almost minimal degree II and III, abstracts
- Lee-Park, Projective curves of degree=codimension+2 II, abstract (degree r+1 only)
- Han-Park, Secant rank and syzygies of projections of elliptic normal curves, title and abstract — https://arxiv.org/abs/2604.02046
- Cortadellas Benítez-Cox-D'Andrea, The Rees algebra of parametric curves via liftings, title — https://arxiv.org/abs/1810.02077
- Madsen, on Rees algebras of height two ideals in k[x0,x1], snippet — https://arxiv.org/abs/1511.04073
- Coppens-Huisman, Pencils on real curves: real pencil vocabulary only, snippet — https://arxiv.org/abs/1107.4998
- Uchimura, Discriminants of a class of self-inversive polynomials and real binary forms, abstract — https://arxiv.org/abs/1704.00463
- Georgiou-Lindquist, Fejér-Riesz factorizations of generalized trigonometric polynomials, snippet (positivity, not subspace products) — https://arxiv.org/abs/2005.11920
- Bachoc-Serra-Zémor, Revisiting Kneser's theorem for field extensions, Combinatorica 2018, title (Zbl 1413.11115)
- Clubs and their applications (Zbl 1548.51004), title
- Kirby, Exponential algebraicity in exponential fields, snippet — https://arxiv.org/abs/0810.4285
- Rational curves of degree 10 and 11 on a general quintic threefold, snippets — https://arxiv.org/abs/0711.2758
- Lüroth and rational function decomposition papers (arXiv:1701.03529, arXiv:1004.5285): decomposition, not subspace products; snippets
- zbMATH Open result lists for Vosper & subspaces, complex conjugation with MSC 11J81, strong six exponentials, rational normal scroll & rational curves, cubic scroll & curves: titles; only Diaz 2004, Diaz 2007 and Waldschmidt 2008 relevant to the transcendence side

## Inaccessible

- Citation lists for Diaz 2004 and Diaz 2007 — 10.5802/jtnb.459, 10.5802/jtnb.592: OpenAlex and Semantic Scholar returned 429 throughout. Semantic Scholar answered once for Diaz 2007 with one citing paper (Waldschmidt 2008); it failed for Diaz 2004. Numdam pages show no cited-by list. MathSciNet not used. So forward citation tracing is incomplete.
- arXiv API keyword searches: HTTP 429, then a timeout; only one partial title list came back. arXiv PDFs themselves downloaded fine, and the gap was covered by web search.
- Iarrobino, Ancestor ideals of vector spaces of forms, and level algebras, J. Algebra (2004): Located only through the Cox-Iarrobino bibliography reference [I2]; web search did not surface it and it was not opened. Most likely source for the dual (W^⊥) language; not assessed.
- Eisenbud, Linear sections of determinantal varieties; Eisenbud-Koh-Stillman, Determinantal equations for curves of high degree; Schreyer and von Bothmer on scrollar syzygies: Not opened in the time box. Known to me from memory as general theory of 1-generic matrices and scrollar syzygies, with no reason to expect a classification of this kind. Judged from memory only.

## Queries

- subspaces of function field product dimension dim ST = dim S + dim T linear analogue Freiman 3k-4 classification rational function field
- rational curve in P^4 lying on a cubic scroll criterion rank 4 quadrics 2x3 matrix of linear forms vanishing on rational curve classification
- products of spaces of trigonometric polynomials conjugation-stable subspace Laurent polynomials factorization product of two subspaces dimension 2 and 3
- Diaz conjecture modulus transcendental |u| e^u algebraic complex conjugation matrices linear forms logarithms rank two by three strong six exponentials conjugation polynomial in u and ū
- rank index of projective curves quadrics of rank 3 or 4 rational curves
- critical pairs product Singleton bound classification, beyond critical
- projected rational curves on cubic scroll in P^4 almost minimal degree, 2x2 minors
- space of rational functions product of pencil and net, kernel of multiplication map, base point free pencil trick, classification in K(x)
- real trigonometric polynomials containing 1, cos, sin; self-inversive space stable under v -> 1/v̄
- Kirby weak Schanuel, complex conjugation, Roy strong six exponentials applications
- rational curve with one-parameter family of multisecant lines forming a pencil, scroll
- Bachoc Couvreur Zémor product of two distinct subspaces ST inverse theorem
- pencil of Hankel catalecticant matrices common isotropic subspaces; pair of binary sextics apolar to pencil times net
- rational curves of degree r+2 in P^r projected from a line, scroll containing the curve
- real structure on P^1, real pencil, conjugate-stable linear system factorization
- function field analogue of Lev-Smeliansky for two distinct sets
- Kustin Polini Ulrich scrolls Rees algebras; Iarrobino ancestor ideals
- linear spaces of Hankel matrices compression space common zero block
- rational sextic in P^4 on cubic scroll, intersection with quadric
- D'Angelo Hermitian rank on circle, quadratic relations between trigonometric polynomials
- Lüroth, vector spaces of rational functions, Möbius involution invariant
- zbMATH: complex conjugation with 11J81; conjugaison complexe; Vosper & subspaces; Kneser & field extension; Freiman & function field & Riemann-Roch; strong six exponentials; rational normal scroll & rational curves; cubic scroll & curves
