# Entry 14, strategy: translation

## Target, as restated by the searcher

Work over Q̄ with u transcendental and ρ = uū algebraic, so H₀ = ⟨1, u, ρ/u⟩ = L(0+∞) on P¹ with coordinate u. Take g in ℂ with 1, u, ρ/u, g, ug linearly independent over Q̄, and put W_g = H₀ + Q̄g + Q̄ug. Claim: there is a w in W_g outside H₀ such that the 4-dimensional space H₀ + Q̄w contains all products of a 2-dimensional and a 3-dimensional subspace of ℂ, if and only if u·R(u)·g = N(u) for polynomials R ≠ 0 of degree ≤ 2 and N of degree ≤ 3. In divisor terms: g lies in L(0+p+q) for some points p, q of P¹, which is equivalent to W_g being a complete Riemann-Roch space L(0+∞+p+q). The corollary for g = (P/Q)/(s+λu), with s² = ρ, |λ| = 1 and P, Q coprime, is: visible iff max(deg P, deg Q+1) ≤ 2 + [Q(0)=0] + [P(−sλ̄)=0].

## Leads

### Lead 1: implies

- **Citation:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. 163 (2017), 423-452, DOI 10.1017/S0305004117000044 (arXiv:1501.00602)
- **Location:** Theorem 33 and Theorem 2 (arXiv numbering; Section 7 'Transcendental extensions'). Journal numbering not checked.
- **Quote:** Then S and T have bases of the form {g, ga, ...}
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** The translation is my own; the paper never mentions H₀, circles or this criterion. (1) Q̄ is algebraically closed in ℂ, so Theorem 2 gives dim AB ≥ 4 for dim A = 2, dim B = 3. Hence AB = V := H₀+Q̄w, and Theorem 33 applies: V = c⟨1,a,a²,a³⟩ with a transcendental. (2) 1 ∈ V gives c = 1/p(a) with deg p ≤ 3, so V = L(D) on P¹_a with deg D = 3 and V ⊂ Q̄(a). (3) u and 1/u both lie in L(D), and the pole and zero divisors of u are disjoint, so 2·deg_a(u) ≤ 3. Thus deg_a(u) = 1, a is Möbius in u, and V = L(0+∞+p) on P¹_u. Conversely each such L has a geometric basis and so carries a configuration. (4) w = h + (α+βu)g with h ∈ H₀ and (α,β) ≠ 0 by freeness, so visibility means (α+βu)g ∈ L(0+∞+p), i.e. g ∈ L(0+p+q) with q the zero of α+βu. Clearing denominators gives uRg = N with deg R ≤ 2 and deg N ≤ 3, and each step reverses, padding R with p or q = ∞ when deg R < 2. (5) Pencil corollary: W(λ,f) = W_g for g = P/(Q(s+λu)). After cancelling the factor at u = −sλ̄ when P vanishes there, the polar divisor of g has degree max(deg P, deg Q+1) − [P(−sλ̄)=0]. It contains 0 exactly when Q(0)=0, since s ≠ 0. So polar divisor ≤ 0+p+q is exactly the stated inequality.

### Lead 2: analogue only

- **Citation:** C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's theorem, Algebraic Combinatorics 1 (2018), no. 4, 501-521 (arXiv:1709.00087)
- **Location:** Theorem 5.3 and the remark closing Section 6.1; Theorem 6.3
- **Quote:** S has a basis in geometric progression
- **Link:** https://arxiv.org/abs/1709.00087
- **Relation:** Theorem 5.3 is the symmetric case S = T, dim S² = 2 dim S − 1, and the following remark identifies such S with a·L(nP∞). This supplies the Riemann-Roch vocabulary used in the derivation above. It does not cover a 2×3 pair with A ≠ B, and it says nothing about spaces H₀ + Q̄g + Q̄ug. Theorem 6.3 (codimension 1 in L(D)) concerns a different space and is not needed.

## Notes

**Outcome.** I found no printed statement of the criterion itself, under any name. I did find a published theorem from which it follows in a few lines: Bachoc-Serra-Zémor 2017, Theorem 33 with Theorem 2. That is the linear Vosper theorem over an algebraically closed base. The translation is mine, so the `implies` relation rests on my derivation, not on anything the authors say. It should be checked by a verifier.

**Restatement that drives the search.** H₀ is L(0+∞) on P¹. A 2×3 configuration in a 4-dimensional V over Q̄ is a critical pair: Theorem 2 forces AB = V, because Q̄ is algebraically closed in ℂ. Theorem 33 then gives V = c⟨1,a,a²,a³⟩, which is a twisted cubic linear system.
- Since 1, u, 1/u lie in V, a is Möbius in u, and V = L(0+∞+p).
- This also forces g into Q̄(u). The target need not assume rationality for that, since it comes out of visibility.
- Visibility becomes: (α+βu)g lies in some L(0+∞+p), i.e. g ∈ L(0+p+q). That is the condition uRg = N.

**A cleaner equivalent, also mine.** Visible iff W_g = L(0+∞+p+q), a complete degree-4 Riemann-Roch space, i.e. W_g = c⟨1,x,x²,x³,x⁴⟩. If g ∈ L(0+p+q), then W_g sits in a 5-dimensional L and equals it by freeness. In the suggested dictionary: W_g embeds P¹ as a rational normal quartic, and the 4-dimensional subspace is an inner projection to a twisted cubic. Searching those terms gave nothing closer.

**Pencil corollary.** The stated formula, max(deg P, deg Q+1) ≤ 2 + [Q(0)=0] + [P(−sλ̄)=0], also comes out exactly from the polar-divisor count, including the two correction terms. The cancellation at −sλ̄ uses λ̄ = 1/λ, and s ≠ 0 because u ≠ 0. I spot-checked by hand: g = u² is visible, g = u³ is not, and f = u³ in the pencil is not. I ran no machine check.

**What each source says relative to the target.**
- BSZ: Theorem 33 has no restriction beyond dim S, dim T ≥ 2 and F algebraically closed, so it covers 2×3 in ℂ/Q̄ directly. Its proof uses a place valued in F. Nothing about H₀ or pencils appears.
- BCZ: the symmetric case only, plus the identification with a·L(nP∞). Analogue only.
- Wessel: extends BCZ to γ = 2 style cases with S = S. Not relevant to the part not found.
- Determinantal, scroll and rank-index literature: covers curves cut out by minors and rank-3 or rank-4 quadrics. I found no statement about which pencil sums contain a twisted cubic system. Eisenbud 1988 was not read.
- Transcendence and Schanuel side: the target is purely algebraic over Q̄ and has no Ax or Kirby content, so I did not pursue that branch beyond one search.

**Independence.** BSZ was published in 2017 and is arXiv 2015, so it predates this work and does not cite it. I excluded the repository and related pages. The local sources directory was only listed, not read, since the target needs no transcendence input.

**Limits.**
- Theorem numbers are from the arXiv text; the journal version was not opened.
- The target is classed as routine, and this result fits that: it is a short corollary of a published theorem, not a printed statement of it. "Not found" remains true literally. What changes is that the result now has a citable source one step away.
- Theorem B itself (the 4-dimensional case) is what the derivation effectively re-derives in steps 1 to 3. The target file names Theorem B only through the statement's source line, so a verifier may want to compare those steps with its printed form.
- The wall clock used was far under the 30-minute box. I stopped because the translation was settled and further searches returned only the same papers. Citation-chasing through zbMATH and OpenAlex did not run, because of the errors listed under inaccessible.

## Read

- Bachoc, Serra, Zémor, An analogue of Vosper's theorem for extension fields (arXiv version) — https://arxiv.org/abs/1501.00602: Introduction (Theorems 2, 3), Section 7 (Theorems 33, 34 and the proof of 33)
- Bachoc, Couvreur, Zémor, Towards a function field version of Freiman's theorem (arXiv version) — https://arxiv.org/abs/1709.00087: Introduction, Theorem 5.3, Section 6.1 closing remark, Section 6.2 including Theorem 6.3
- M. Wessel, On Freiman's Theorem in a function field setting, arXiv:2405.10724 — https://arxiv.org/abs/2405.10724: Introduction: Conjecture 1.3, Theorem 1.4

## Screened only

- On the rank index of projective curves of almost minimal degree, arXiv:2411.17494 (abstract, part of introduction, keyword scan). Concerns outer projections of rational normal curves and rank-3 quadrics; no criterion of this kind. — https://arxiv.org/abs/2411.17494
- On Parameterizations of plane rational curves and their syzygies, arXiv:1507.02227 (search snippet only; PDF downloaded but not scanned) — https://arxiv.org/abs/1507.02227
- Sidman, Smith, arXiv:0910.2424, on schemes cut out by 2-minors of 1-generic matrices (snippet) — https://arxiv.org/abs/0910.2424
- Beck, Lecouvey, Additive combinatorics methods in associative algebras, Confluentes Math. 9 (2017), arXiv:1504.02287 (keyword scan: no Vosper or Riemann-Roch statement) — https://arxiv.org/abs/1504.02287
- Eliahou, Lecouvey, On linear versions of some addition theorems, Linear Multilinear Algebra 57 (2009), arXiv:0802.3523 (keyword scan: nothing relevant) — https://arxiv.org/abs/0802.3523
- On the product of vector spaces in a commutative field extension, arXiv:0802.4186 (keyword scan: nothing relevant) — https://arxiv.org/abs/0802.4186
- Freiman's 3k-4 Theorem for function fields, arXiv:2408.00183 (title and snippet only) — https://arxiv.org/abs/2408.00183
- Galois subspaces for the rational normal curve, arXiv:1809.02635 (title and snippet only) — https://arxiv.org/abs/1809.02635
- Ranks of matrices of logarithms of algebraic numbers I, Dasgupta, arXiv:2303.02037 (snippet: rank theory, no rational-function criterion) — https://arxiv.org/abs/2303.02037

## Inaccessible

- Bachoc, Serra, Zémor, journal version (Cambridge) — 10.1017/S0305004117000044: Not opened; assumed paywalled. Theorem numbers checked only against arXiv.
- Author copy of the same paper on the Bordeaux site — https://www.math.u-bordeaux.fr/~cbachocb/articles/Vosper.pdf: Download failed on an SSL certificate error; I did not bypass verification.
- D. Eisenbud, Linear sections of determinantal varieties, Amer. J. Math. 110 (1988): Not attempted; assumed paywalled. It would at most give an alternative route to the twisted cubic step.
- zbMATH Open API and OpenAlex: zbMATH failed on an SSL certificate error and OpenAlex returned HTTP 429, so no citation-chasing was done there. Crossref was used instead, with little yield.

## Queries

- linear Vosper theorem field extension subspaces geometric progression algebraically closed base
- subspace of rational functions product of 2- and 3-dimensional subspaces in 4-dimensional space Riemann-Roch P^1
- 1-generic 2x3 matrix linear forms P^3 twisted cubic projection from a point criterion
- projection of rational curve from a point in P^4 to rational normal cubic; rank index; syzygy scheme
- Towards a function field version of Freiman's theorem
- Roy matrices linear forms in logarithms rank one 2x3, Vosper analogue in transcendence
- Vosper subspaces function field algebraically closed constant field critical pair
- L(D) containing 1, u, 1/u; multiplication of linear series on P^1 of minimal dimension
- 1-generic Eisenbud linear sections 2 x n rational normal curve scroll
- Laurent polynomial subspaces containing products of subspaces; Hopf lemma
- Eliahou Lecouvey linear addition theorems; Beck Lecouvey associative algebras
- space of rational functions spanned by 1, x, 1/x, f being a Riemann-Roch space
- Waldschmidt rank-one matrix coefficients Q̄+Q̄u+Q̄ū, circle point
- inner projection rational normal quartic to twisted cubic; complete linear system g<1,u>
- dim(S+xS)=dim S+1 implies geometric progression, pole characterization
- Crossref keyword searches on the same themes
