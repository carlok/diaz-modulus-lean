# Entry 10, strategy: translation

## Target, as restated by the searcher

Work in L = Q̄(u), with u transcendental, s real algebraic, s² = uū, and semilinear involution σ: u ↦ s²/u (conjugation). H₀ = ⟨1, u, 1/u⟩. A "degree-one configuration space" is a 5-dimensional σ-stable V ⊇ H₀ of the form ⟨1,u⟩·Y with dim Y = 3, that is, V = H₀ + ⟨g, ug⟩. Part (a): σ-stability forces the pencil and Y, after rescaling by s+u, to be separately σ-stable: X₀ = ⟨1, 1/(s+u)⟩ and Y₀ = (s+u)Y (a "real pencil space"; the target does not quote that definition, so this reading is inferred). Part (b): W = ⟨1, u, 1/u, f, f/(s+u)⟩ with f = u²/s² + s²/u² is such a space, yet no 4-dimensional H₀ + Q̄w inside it carries a 2×3 configuration. Geometric restatement: V maps P¹ to P⁴, a configuration means the curve lies on a cubic scroll S(1,2) as a section of the ruling, and a 2×3 configuration on a 4-dimensional space means a twisted cubic after projection.

## Leads

### Lead 1: implies

- **Citation:** J. Jung, H. Moon, E. Park, On the rank index of projective curves of almost minimal degree, arXiv:2411.17494 (recalling E. Park, Math. Z. 256 (2007) 685-697, Thm 1.1)
- **Location:** p. 2 (isomorphic projection iff rank of p is at least 3); p. 9 (C in S(d1-2,d2-2), class H+2F, from the apolar ideal of f_p); Lemma 5.1, p. 18
- **Quote:** There exists the unique trisecant line
- **Link:** https://arxiv.org/abs/2411.17494
- **Relation:** My own translation, and it reaches part (b) ONLY, not part (a). Clear denominators with D = u²v²(u+sv) (v the homogenising variable): W is a hyperplane in binary quintics, the kernel of a functional c, so it is the projection of the rational normal quintic from a point p. Solving gives c_k = s^(k-1)·(1,1,-1,1,-1,-1), i.e. c(N) = (2/s)N(0) - (1/s)N(-s) - 2s⁴·lead(N). Step 1: a 4-dimensional subspace with a 2×3 configuration is a progression (BSZ Thm 33), with ratio of degree 1 since 3e ≤ 5, so it equals A·H⁰(O(3)) for a quadratic form A. Step 2: this forces A to be apolar to c, so rank(p) ≤ 2 and the curve is not an isomorphic projection. Step 3: the 3×4 catalecticant of c has rank 3 for all s (exact check at s = 1, 2, 3/7, and c_k scales geometrically in s), so rank(p) = 3. Hence no 4-dimensional subspace of W carries a configuration, whether or not it contains H₀, which is stronger than stated. Dictionary bonus: for rank 3 the unique trisecant line has divisor 0+∞+(-s), H₀ is exactly the linear forms vanishing on it, and C sits on S(1,2) with C·F = 1, the degree-one pencil. The example's real structure is not in the source; the conjugation stability of W is a separate direct check.

### Lead 2: implies

- **Citation:** B. Reznick, On the length of binary forms, in Quadratic and Higher Degree Forms, Springer 2013; arXiv:1007.5485 (Sylvester 1851)
- **Location:** Theorem 2.1, p. 4; Corollary 2.2
- **Quote:** a certain subspace of the binary forms of degree r
- **Link:** https://arxiv.org/abs/1007.5485
- **Relation:** Same translation, same scope: part (b) only, not part (a). The functional c is a binary quintic F = (2/s)ℓ₀⁵ - (1/s)ℓ_{-s}⁵ - 2s⁴ℓ_∞⁵. Its cubic Sylvester form is uv(u+sv), which encodes H₀ ⊂ W. It has no quadratic Sylvester form (catalecticant rank 3), and a four-term progression in W would be exactly such a quadratic form, by BSZ Thm 33 as above. Corollary 2.2 gives the version over a subfield K, which applies to K = Q̄∩ℝ after a Cayley transform: one real node and a conjugate pair 0,∞. The explicit computation for W is mine and is not in the source.

### Lead 3: analogue only

- **Citation:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. 2017; arXiv:1501.00602
- **Location:** Theorem 33, pp. 25-26
- **Quote:** S and T have bases of the form
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** An ingredient, not a find. Over an algebraically closed base, dim ST = dim S + dim T - 1 forces progressions, which turns 'a 4-dimensional space with a 2×3 configuration' into 'a progression'. It says nothing about H₀, conjugation or dimension 5.

### Lead 4: analogue only

- **Citation:** J. Harris, M. Roth, J. Starr, Curves of small degree on cubic threefolds, Rocky Mountain J. Math. 35 (2005); arXiv:math/0202067
- **Location:** Section 6, Lemma 6.12, p. 25 (and Lemma 6.8, p. 22)
- **Quote:** there exists a unique triple
- **Link:** https://arxiv.org/abs/math/0202067
- **Relation:** A smooth rational quintic in P⁴, a trisecant line and an isomorphism determine a unique cubic scroll with C in class D+4F, which is the degree-one case. Uniqueness plus Galois descent would give a real ruling when that data is conjugation-stable, but the paper has no real structure, and it covers only polar degree 5, while part (a) allows g of any degree. Descent step is mine.

## Notes

**Outcome.** No printed source states either clause in this form. Part (b) has a partial break through my own translation. Part (a) stays not found in print, and I judge it routine.

**The dictionary that worked: apolarity, not Vosper alone.**
- Clear denominators. A 5-dimensional V of polar degree 5 is a hyperplane in binary quintics, so it is a functional c, equivalently a binary quintic F, equivalently a projection centre p in P⁵.
- For a fixed degree-one pencil, the maximal Y with X·Y ⊂ V is V ∩ u⁻¹V. This is the kernel of the 2×5 catalecticant, so it has dimension at least 3. Every such V therefore carries a degree-one 2×3 configuration, which matches C ⊂ S(1,2) in the printed recollection.
- A four-term progression in V is A·H⁰(O(3)) with A a quadric apolar to F. That is equivalent to the centre having rank ≤ 2, i.e. the curve being singular (not an isomorphic projection).
- For W, H₀ corresponds to the cubic apolar form uv(u+sv), i.e. the trisecant line.

**Computation for W (mine, no CAS).**
- c = (1/s, 1, -s, s², -s³, -s⁴) on numerator coefficients n₀..n₅ over D = u²(u+s).
- I checked exactly, with rational arithmetic at s = 1, 2, 3/7, that the five numerators have rank 5 and are killed by c, that the 3×4 catalecticant has rank 3 and the 2×5 has rank 2.
- c_k = s^(k-1)·(1,1,-1,1,-1,-1), so the ranks hold for every s.
- The 2×3 configuration I found by hand: X = (1, 1/(s+u)), Y = (s+u, (s+u)/u, f). I verified it by hand, but not by machine; the sympy attempt failed because sympy is not installed.

**What this does and does not reach.**
- Reached: W has no 4-dimensional configuration subspace at all, a slightly stronger statement than the target's, by BSZ Thm 33 plus the classical rank/isomorphic-projection fact (or Sylvester). The explicit W is my input, so a verifier should treat this as "follows from classical facts by a short translation", not as a printed statement. No source I read has the conjugation, the circle or H₀.
- Not reached: the general Laurent family (k, λ) mentioned in the source line. I did not attempt it.
- Part (a), not in print. My derivation is one line: Y* = V ∩ u⁻¹V, and σ(Y*) = uY*, so (s+u)Y* and ⟨1, 1/(s+u)⟩ are σ-stable. It is a pencil-trick computation with no literature hook beyond that. Harris-Roth-Starr's and Jung-Moon-Park's uniqueness statements give descent only for polar degree 5, not for arbitrary g. I also inferred the definition of "real pencil space", since the Proposition is not quoted in the target.

**Possible issue for the authors to check.** The source line says polar degree 5 implies W contains no progression. On my reading that inference is insufficient for four-term progressions: a hyperplane of quintics whose centre has rank 2 can have polar degree 5 and still contain A·H⁰(O(3)). It may be fine for a five-term progression (polar degree 4), or under the blueprint's own definition, which I was not given. The conclusion for W is correct anyway, by the catalecticant.

**Other translations tried, no reach.**
- Linear Kneser/Vosper/Freiman line (BSZ, BCZ, Couvreur-Zémor, Eliahou-Lecouvey): no real structure, and nothing on the asymmetric 2×3 case with dim XY = 5 and a fixed H₀.
- Real rank of binary forms (Reznick, Comon-Ottaviani, Blekherman, Blekherman-Chen-Jung): real structure present, with projections and rank, but the questions are about real length and sums of squares, not configurations. Blekherman-Chen-Jung is the closest setting to a real version; I read only its introduction.
- Orthogonal rational functions on the circle: the involution matches, but nothing about products of spaces.
- Kirby and Ax-Schanuel: nothing relevant.
- Rank-3 quadric and syzygy-scheme papers: no reach. W's rank-index is not the relevant invariant.

**Transcendence side.** Diaz 2007 Th. 7(1), with (v, v̄)×(1, u, ū), and Diaz 2004 Th. 2 are conjugation-stable configurations, but they contain no classification and no invisibility. Waldschmidt 2005 only restates Diaz.

**Limits.** OpenAlex and Semantic Scholar returned 429, and the zbMATH API failed on TLS, so older or non-arXiv items are under-searched. Park 2007 is known only through its recollection in Jung-Moon-Park. Extracts came from pdftotext, and the formulas I rely on from Jung-Moon-Park were read in garbled layout, so they should be checked against the page. The time box was not exhausted (roughly 10 minutes by the system clock).

## Read

- Target file, entry 10: all
- Jung, Moon, Park, arXiv:2411.17494 — https://arxiv.org/abs/2411.17494: Introduction p. 2, Preliminaries p. 5-6 and p. 9 (extracts), Lemma 5.1 and its setup (extracts)
- Reznick, arXiv:1007.5485 — https://arxiv.org/abs/1007.5485: Introduction outline, Theorem 2.1 and Corollary 2.2 (extracts)
- Bachoc, Serra, Zémor, local copy and arXiv:1501.00602 — https://arxiv.org/abs/1501.00602: Theorems 2 and 33, passages on progressions, Sidon spaces
- Harris, Roth, Starr, arXiv:math/0202067 — https://arxiv.org/abs/math/0202067: Lemmas 6.8, 6.9, 6.12 and the divisor class discussion (extracts)
- Bachoc, Couvreur, Zémor, Towards a function field version of Freiman's theorem, arXiv:1709.00087 — https://arxiv.org/abs/1709.00087: Introduction and passages on progressions (extracts)
- Couvreur, Zémor, Freiman's 3k-4 theorem for function fields, arXiv:2408.00183 — https://arxiv.org/abs/2408.00183: Abstract and introduction (extracts)
- Comas, Seiguer, On the rank of a binary form, arXiv:math/0112311 — https://arxiv.org/abs/math/0112311: Theorem 2 (extract)
- Comon, Ottaviani, On the typical rank of real binary forms, arXiv:0909.4865 — https://arxiv.org/abs/0909.4865: Introduction, Sylvester and catalecticant passages (extracts)
- Blekherman, Chen, Jung, Sums of squares, Hankel index and almost real rank, arXiv:2108.06635 — https://arxiv.org/abs/2108.06635: Abstract and introduction (extracts; the definition of almost real forms not read)
- Diaz 2004, Utilisation de la conjugaison complexe (local): Introduction, Théorème 2
- Diaz 2007, Produits et quotients (local fulltext): Théorème 7 and its proof
- Waldschmidt 2005, The role of complex conjugation (local): Corollary 2.7, Remark 2.8, Theorem 4.1, Corollary 4.2

## Screened only

- Eliahou, Lecouvey, On linear versions of some addition theorems — https://arxiv.org/abs/0802.3523
- Lecouvey, Plünnecke and Kneser type theorems for dimension estimates — https://arxiv.org/abs/1109.0134
- Beck, Lecouvey, Additive combinatorics methods in associative algebras — https://arxiv.org/abs/1504.02287
- Mirandola, Zémor, Critical pairs for the Product Singleton Bound — https://arxiv.org/abs/1501.06419
- Rank 3 quadrics in rational normal curves / Veronese, arXiv:2412.16983 — https://arxiv.org/abs/2412.16983
- Comaschi, Pfaffian representations of cubic threefolds — https://arxiv.org/abs/2005.06593
- Brodmann, Park, On varieties of almost minimal degree I — https://arxiv.org/abs/0808.0090
- Fritzsche, Kirstein, Lasarow, An extension of the associated rational functions on the unit circle (para-conjugate, self-reciprocal) — https://arxiv.org/abs/0911.1657
- Blekherman, Typical real ranks of binary forms — https://arxiv.org/abs/1205.3257
- Kirby, Exponential algebraicity in exponential fields — https://arxiv.org/abs/0810.4285
- Kirby, Variants of Schanuel (local copy): grep for conjugation, no hit
- Scrolls containing binary curves — https://arxiv.org/abs/1811.09690
- Sidman, Smith / Buczyński, Ginensky, Landsberg on the Eisenbud-Koh-Stillman conjecture (arXiv:1002.2023, 2510.01895, 0910.2424)
- Eisenbud, The Geometry of Syzygies, table of contents only (ch. 6, linear series and 1-generic matrices)
- Roy 1992 and Roy 1995 (local): grep for rank-one, Möbius and progression only

## Inaccessible

- E. Park, Projective curves of degree = codimension+2, Math. Z. 256 (2007) 685-697 — https://pure.korea.ac.kr/en/publications/projective-curves-of-degreecodimension2/: Paywalled; known only through the recollection in Jung, Moon, Park, so Thm 1.1 was not checked at source
- W. Lee, E. Park, Projective curves of degree=codimension+2 II, IJAC 26 (2016) — https://scholar.korea.ac.kr/handle/2021.sw.korea/89678: Paywalled; abstract record only
- J. A. Todd, 1944, and W. L. Edge, 1986, on the geometry of the binary quintic — https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/geometry-of-the-binary-quintic-form/6DC0E0B49A8BC35F74CB32F5ADD77B6C: Paywalled at Cambridge; classical projection to P⁴ not read
- zbMATH Open API — https://api.zbmath.org: TLS failure through a self-signed certificate chain in this environment; I did not disable verification
- OpenAlex and Semantic Scholar APIs: HTTP 429 on all attempts, so index searching relied on web search and arXiv only

## Queries

- linear analogue Vosper theorem field extension product of subspaces dim ST = dim S + dim T - 1 geometric progression
- function field version of Freiman's theorem product of subspaces dim S^2 Riemann-Roch space rational function field genus zero
- rational curve in P^4 on cubic scroll 2x3 matrix of linear forms non-normal, real structure conjugation invariant linear system P^1 pencil real
- rank index of projective curves rank 3 quadrics rational normal curve 1-generic matrices syzygy schemes
- six exponentials theorem complex conjugate modulus algebraic configuration products subspaces conjugation stable Diaz conjecture |u| e^u algebraic
- product of subspaces of rational function field dim XY = dim X + dim Y classification critical pairs Riemann-Roch pencil K(x) subspaces small doubling genus 0
- real forms of linear subspaces of rational functions on circle: antiholomorphic involution real linear system on P^1 real rational curve scroll Möbius real pencil
- Kirby weak Schanuel conjecture four exponentials rank matrix logarithms conjugation Ax-Schanuel transcendence degree one algebraic function field reduction 2x3 matrix
- Eliahou Lecouvey On linear versions of some addition theorems product of subspaces field extension
- critical pairs product Singleton bound Mirandola Zémor Reed-Solomon product of linear codes classification
- para-conjugate invariant spaces of rational functions unit circle self-inversive orthogonal rational functions Möbius real structure products of spaces
- Eisenbud Koh Stillman determinantal equations for curves multiplication of sections 2 x n matrix linear forms rational curves non complete linear series projection scroll containing curve uniqueness
- projected rational curve lying on rational normal scroll projection from point non-normal rational curve degree 5 in P^4 cubic scroll Brodmann Schenzel Lee Park almost minimal degree
- Reznick On the length of binary forms Sylvester theorem apolar binary form sum of powers real
- Park Projective curves of degree = codimension+2 rational curve projection rational normal curve from point rank scroll contained
- binary quintic catalecticant apolar hyperplane of forms rational quintic curve in P^4 projection rational normal curve lies on cubic scroll Sylvester three fifth powers
- real binary form apolar ideal conjugate roots complex conjugate pair Waring decomposition quintic real and two conjugate nodes generators F^perp defined over reals
- Blekherman Chen Jung Sums of squares, Hankel index and almost real rank real projection rational normal curve binary form rank
- Waldschmidt Diaz 2×3 matrix entries logarithms conjugate rank one space spanned products homographic substitution transcendence complex conjugation 2020s preprint
- Eisenbud Geometry of Syzygies 2 x n matrix linear forms rational normal scroll multiplication map curve contained in scroll pencil section unisecant base-point-free pencil trick
