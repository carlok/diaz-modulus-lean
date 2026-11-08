# Entry 2, strategy: translation

## Target, as restated by the searcher

Work over k = Q-bar and let u be transcendental, so k(u) is the function field of P^1. Let h be a non-constant element of k(u) and c a non-zero element. Put H = span(1, u, 1/u) and S = c * span(1, h, h^2, h^3), and suppose W = H + S has dimension 5, so H and S meet in dimension exactly 2. Not found: (a) W contains u^2, u^-2 or some 1/(u-b) with b non-zero, or W is an involution space. (b) deg_u h <= 2. (c) If deg h = 2, with P the pencil of quadratics spanned by the numerator and denominator of h (the orbits of a Moebius involution of the u-line), then W = H + (1/(u l1 l2)) Sym^3(P) for some non-zero l1, l2 in P. (d) Assume u*conj(u) is algebraic, so that H is the space H0. Every such W carries a 2x3 configuration (x_i y_j all in W, each family independent), but no 4-dimensional H + k w inside W carries one.

## Leads

### Lead 1: analogue only

- **Citation:** M. Wessel, On Freiman's Theorem in a function field setting, arXiv:2405.10724 (2024)
- **Location:** Proposition 3.5 with its proof; Corollary 1.6.1; Lemma 2.8
- **Quote:** the set of degrees of Sγ+3 equals {0, 2, 4, . . . , …
- **Link:** https://arxiv.org/abs/2405.10724
- **Relation:** Closest lead, but it reaches none of (a)-(d). My translation: take x with involution x -> -x. Then W = m * span(1, x^2, x^4, x^6, x L1 L2) with L_i in span(x^2, 1), where m = 1/(n d L1 L2) and u = n/d is Moebius in x. So involution spaces, up to the multiplier m, have dim 5 and gamma = 2 (dim W^2 = 11), and degree set {0,2,4,5,6} at a fixed point of the involution, except when L1 L2 is proportional to x^2. That is the gamma = 2 case of Prop. 3.5. Its proof has the progression 1, e2, e2^2, e2^3 and gets [F:K(e2)] <= 2, the same conclusion as (b), but from gamma and the degree pattern, not from H in W. Its stated conclusion is only S in L((n+gamma-1)P_inf). The normal form follows from that in one line, but only for spaces already known to have gamma = 2, which the target's hypotheses do not give without (c). H and invisibility never appear.

### Lead 2: analogue only

- **Citation:** A. Couvreur, G. Zémor, Freiman's 3k-4 Theorem for Function Fields, arXiv:2408.00183 (2024); for gamma <= 1, C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's Theorem, Algebraic Combinatorics 1 (2018) 501-521, Theorems 5.3 and 8.1
- **Location:** Couvreur-Zémor, Theorem 1
- **Quote:** there exists a Riemann-Roch space L(D) of F that contains S
- **Link:** https://arxiv.org/abs/2408.00183
- **Relation:** Applied to m*W (gamma = 2, genus 0) it gives only containment in an L(D) of dimension at most 7. The target's W already sits in the binary sextics, which has dimension 7, so this adds nothing towards (a)-(d).

### Lead 3: analogue only

- **Citation:** A. Hofmann, The ideal of curves of genus 2 on rational normal scrolls, arXiv:1102.3156 (2011)
- **Location:** Section 2 (class of C on the scroll); Proposition 3.2 and its proof
- **Quote:** [C] = 2H − (d − 6)F
- **Link:** https://arxiv.org/abs/1102.3156
- **Relation:** Smooth genus 2 only. With d = 6, C is a quadric section of the cubic g^1_2-scroll, and the proof of Prop. 3.2 gives type (3,0), the cone over the twisted cubic, when H = 3K. By my translation an involution space is the same picture degenerated: span(1, t, t^2, t^3, y) with t = h and y^2 = (t-a)^2 (t-b)^2 (t-alpha)(t-beta), a rational sextic of arithmetic genus 2 with two nodes. Hofmann does not treat singular curves, and neither H nor the dichotomy in (a) appears.

### Lead 4: analogue only

- **Citation:** M. Aprodu, A. Bruno, E. Sernesi, A characterization of bielliptic curves via syzygy schemes, arXiv:1708.08056; Zbl 1419.14047 (2019)
- **Location:** Theorem 1; opening of Section 4
- **Quote:** complete intersection of a quadric with a cone S over a normal curve
- **Link:** https://arxiv.org/abs/1708.08056
- **Relation:** Same geometric shape: a double cover of a normal curve lies on the cone over it, and the cone's vertex corresponds to one extra eigenvector of the involution. There the base is elliptic and the curve canonical, whereas the target has a rational base and a genus-0 cover. It says nothing that reaches (a)-(d).

### Lead 5: special case

- **Citation:** N. P. Nguyen, A generalization of Desargues' involution theorem, arXiv:1912.12200; J. Geom. Graph. 24 (2020)
- **Location:** Statement of the generalized theorem, introduction
- **Quote:** conjugate under an involution if and only if
- **Link:** https://arxiv.org/abs/1912.12200
- **Relation:** Covers only the classical correspondence behind (c)'s parenthesis: a regular pencil of quadrics restricted to a line gives an involution. Taking binary quadratics on P^1 itself gives pencil = orbits of a Moebius involution. It does not give the normal form W = H + (1/(u l1 l2)) Sym^3(P). This is a modern statement of a classical fact, so a verifier need only confirm the wording.

## Notes

**Outcome: no find.** None of (a)-(d) turned up in print. All leads are analogues, except one partial covering only (c)'s classical parenthesis.

**Translation (my own, not from a source).** Choose x with the involution acting as x -> -x and let u = n/d be Moebius in x. Then

W = (1/(n d L1 L2)) * span(1, x^2, x^4, x^6, x L1 L2), with L_i in span(x^2, 1),

and H = (1/(n d)) * span(1, x, x^2). Equivalently, W * (u l1 l2) = Sym^3(P) + k l1 l2 J, with J the Jacobian of the pencil: the even sextics plus one odd element.

Geometrically, W maps P^1 to a rational sextic in P^4 of arithmetic genus 2 with two nodes, a quadric section of the cone over the twisted cubic. It is the degenerate tricanonical genus 2 curve: y^2 = (t-a)^2 (t-b)^2 (t-alpha)(t-beta). H is projection from the line through the nodes onto a conic. (d) then says no projection from a point of that line lands on a twisted cubic.

Checked by exact arithmetic on one sample pencil only: dim W = 5, codimension 2 in the sextics, dim W^2 = 11 (gamma = 2), and l1 l2 J lies in W. The node and cone statements are reasoning, not computed.

**What each line of literature gives.**
- **Linear Freiman line:** this was the real surprise. Involution spaces are, up to a multiplier, the n = 5, gamma = 2 case of Wessel's Prop. 3.5, degree set {0,2,4,5,6}, with one degenerate exception (L1 L2 proportional to x^2). Her proof also reaches an index bound <= 2 for a progression ratio. But her hypotheses are gamma and a degree pattern, and H and invisibility never appear. Worth citing as neighbouring work, not as prior art.
- **BSZ Theorem 33:** over an algebraically closed field it gives the progression directly, which is slightly more than the named Lemma 4. It does not touch the part not found.
- **Scrolls and syzygies:** Hofmann covers the smooth genus 2 picture and Aprodu-Bruno-Sernesi the bielliptic analogue. Neither treats the nodal case or a distinguished H.
- **Rank index:** a 3-term progression in W is a rank-3 quadric through the curve, and H is one. Jung-Moon-Park handle projections from a point (codimension 1 in Sym^d), whereas the target is codimension 2. No statement on two such structures in one space was found.
- **Kronecker, 1-generic, Schanuel, Ax:** vocabulary only. The target is purely about k(u), and I found no Schanuel-type statement bearing on it.
- **Coding theory (Mirandola-Zémor):** the Reed-Solomon form of Vosper only.

**A remark on the "not routine" label.** These are my own short derivations, for whoever reviews the ranking.
- **(b):** take independent f, g in the 2-dimensional intersection of H and S. Then f/g lies in k(h) and has u-degree <= 2, so the tower law gives deg h <= 2. That is about two lines, and it needs the degree formula but not Lüroth's theorem proper, since h is given.
- **(c):** write f/g = F1(p,q)/F2(p,q). Since the degree in h must be 1, F_i = E m_i with E binary quadratic, factoring over Q-bar as l1 l2 and m_i in P. Comparing with n_i/u gives c' = lambda/(u l1 l2). That is a few lines, and I checked it by hand only.
- **Möbius part of (a):** looks like a finite partial-fraction case analysis, which I started but did not finish.
- **(d):** I did not derive it. It is the part most specific to this work and seems the least likely to be printed anywhere.

**Coverage limits.**
- OpenAlex, Semantic Scholar and the arXiv API returned 429 on every attempt, so those indexes were effectively not searched. Web search and direct arXiv PDFs stood in for them.
- zbMATH failed from Python with a self-signed certificate error. I did not disable verification and used Node fetch, which worked. Several multi-term title queries there still returned 404 or 502, so its coverage is partial too.
- Formulas came from pdftotext and were not checked against page images. I read the Wessel Prop. 3.5 statement and proof in that text layer, so it should be confirmed on the page before being cited.
- Stopped at about 18 minutes of the 30 because returns had run out. Hyeon-Lee (paywalled) is the one open item I would check next.

## Read

- Bachoc, Serra, Zémor, An analogue of Vosper's theorem for extension fields (arXiv version) — https://arxiv.org/abs/1501.00602: Lemma 4 and start of proof; Section 7 through Theorems 33-34
- Bachoc, Couvreur, Zémor, Towards a function field version of Freiman's Theorem — https://arxiv.org/abs/1709.00087: Introduction; Conjecture 2.2; statements of Theorems 5.3 and 8.1
- Wessel, On Freiman's Theorem in a function field setting — https://arxiv.org/abs/2405.10724: Theorems 1.4 and 1.6; Corollary 1.6.1; Lemmas 2.8 and 2.9 (statements); Propositions 3.4-3.6 with proofs of 3.5 and 3.6
- Couvreur, Zémor, Freiman's 3k-4 Theorem for Function Fields — https://arxiv.org/abs/2408.00183: Abstract; introduction; Theorem 1
- Hofmann, The ideal of curves of genus 2 on rational normal scrolls — https://arxiv.org/abs/1102.3156: Abstract; introduction; Theorem 5.1 (statement); class formula; Proposition 3.2 and proof
- Aprodu, Bruno, Sernesi, A characterization of bielliptic curves via syzygy schemes — https://arxiv.org/abs/1708.08056: Abstract; Theorem 1; opening of Section 4
- Jung, Moon, Park, On the rank index of projective curves of almost minimal degree — https://arxiv.org/abs/2411.17494: Abstract; start of introduction; the structure statement for curves projected from a point (g1, g2 presentation and containing scroll), read in part
- Nguyen, A generalization of Desargues' involution theorem — https://arxiv.org/abs/1912.12200: Theorem statements in the introduction only
- Mirandola, Zémor, Critical pairs for the Product Singleton Bound — https://arxiv.org/abs/1501.06419: Abstract; Theorems 1.1 and 1.2 statements
- Nguyen, Projective line revisited — https://arxiv.org/abs/1804.00639: Part of Section 3 (involutions identified with quadratic cycles)
- Abdesselam, Chipalkatti, Quadratic involutions on binary forms — https://arxiv.org/abs/1008.3117: Opening construction of the involution from a binary quadratic

## Screened only

- Moon, Park, On the rank index of some quadratic varieties — https://arxiv.org/abs/2206.08586
- Park, On the rank of quadratic equations for curves of high degree — https://arxiv.org/abs/2202.00857
- Aprodu, Bruno, Sernesi, The second syzygy schemes of curves of large degree — https://arxiv.org/abs/2409.11855
- Bachoc, Serra, Zémor, Revisiting Kneser's theorem for field extensions — https://arxiv.org/abs/1510.01354
- Beck, Lecouvey, Additive combinatorics methods in associative algebras — https://arxiv.org/abs/1504.02287
- Hassett, Classical and minimal models of the moduli space of curves of genus two — https://arxiv.org/abs/math/0408338
- Eisenbud, Harris, Vector spaces of matrices of low rank (local copy, keyword search only)
- Eisenbud, Popescu, Last syzygies of 1-generic spaces (search listing) — https://arxiv.org/abs/math/0307361
- Ginensky, A generalization of the Clifford index and determinantal equations for curves and their secant varieties — https://arxiv.org/abs/1002.2023
- Buczyński, Ginensky, Landsberg, Determinantal equations for secant varieties and the Eisenbud-Koh-Stillman conjecture — https://arxiv.org/abs/1007.0192
- Graf von Bothmer, Generic syzygy schemes — https://arxiv.org/abs/math/0403432
- Bopp, Hoff, Resolutions of general canonical curves on rational normal scrolls — https://arxiv.org/abs/1505.07235
- Bays, Kirby, Wilkie, A Schanuel property for exponentially transcendental powers — https://ueaeprints.uea.ac.uk/34966/
- Ranks of matrices of logarithms of algebraic numbers I (Structural Rank background) — https://arxiv.org/abs/2303.02037
- Castelnuovo's last higher geometry lectures 1922-23 (search listing) — https://arxiv.org/abs/1505.03009
- Explicit bases of the Riemann-Roch spaces on divisors on hyperelliptic curves — https://arxiv.org/abs/2012.08870
- Local library keyword search for involution and Lüroth: only unrelated hits (Draisma 2006, Reid's Chapters, Waldschmidt notes)

## Inaccessible

- Hyeon, Lee, Stability of tri-canonical curves of genus two, Math. Ann. 337 (2007) 479-488 — 10.1007/s00208-006-0046-2: Publisher copy, not opened as paywalled; no arXiv version found. Could describe the singular tricanonical curves, including two-nodal rational ones, so it is the first thing to check by hand.
- Bolza, On binary sextics with linear transformations into themselves (1887) — zbMATH JFM 19.0119.04: Only the index record seen; I did not try to open a full copy.
- Eisenbud, Koh, Stillman, Determinantal equations for curves of high degree (1988); Eisenbud, Linear sections of determinantal varieties (1988): Seen only through secondary descriptions; no open copy found in the searches and not pursued.
- Di Gennaro, On curves on rational normal scrolls (2001) — Zbl 1083.14053: Title only from zbMATH; not opened.

## Queries

- linear analogue Vosper theorem rational function field subspaces product dim ST = dim S + dim T - 1 geometric progression k(x) classification
- Bachoc Couvreur Zémor function field Freiman subspaces rational functions small square genus zero
- linear system on projective line composed with an involution Lüroth double cover twisted cubic cone sextic P^4 four-secant line
- rank 3 quadrics through rational curve projected rational normal curve rank index 1-generic matrix scroll determinantal 2x3
- subspaces of rational functions k(x) containing 1, x, 1/x product of 2-dimensional and 3-dimensional subspace dimension 5
- involution of the projective line pencil of binary quadratic forms Desargues involution g^1_2 orbits
- Eisenbud Koh Stillman determinantal equations line bundle decomposition 1-generic
- rational curve on cone over twisted cubic degree six double cover ruling almost minimal degree scroll
- Beck Lecouvey linear Kneser transcendental extension stabilizer subfield
- degree 2 subfield k(h) of k(u) Moebius involution pencil normal form Lüroth index two
- Eisenbud Linear sections of determinantal varieties; Kronecker normal form 2x3 matrix scroll twisted cubic
- binary sextic roots in involution cubic form in two quadratics degree 15 invariant Clebsch Bolza
- Dolgachev involution on P^1 pencil binary forms apolar Jacobian fixed points
- Mirandola Zémor critical pairs product Singleton bound Reed-Solomon Vosper
- double cover of rational normal curve on cone, Castelnuovo curves on cones classification
- Schanuel rank-one 2x3 matrix logarithms structural rank Roy; Kirby weak Schanuel predimension
- genus 2 degree 6 P^4 tricanonical cone over twisted cubic quadric section Castelnuovo extremal cubic scroll
- rational nodal sextic arithmetic genus 2 P^4 cubic scroll projected rational normal curve codimension two binary sextics
- Hyeon Lee stability of tri-canonical curves of genus two two nodes
- two geometric progressions in one function space; hyperelliptic Riemann-Roch basis 1,x,x^2,x^3,y
- serie lineare composta con involuzione curva razionale; composite linear series multiple covering rational normal curve
- combinatorial genus 2 subspaces K(x) dim S^2 = 2 dim S + 1 examples 1,x^2,x^4,x^5,x^6
- zbMATH title searches: Vosper; Kneser field; Freiman function; rank index; spaces of rational functions; syzygy schemes; tri-canonical; binary sextics transformations; curves on rational normal scrolls
