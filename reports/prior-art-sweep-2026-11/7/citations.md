# Entry 7, strategy: citations

## Target, as restated by the searcher

Let K ⊂ ℂ be a field and u transcendental over K with ρ = uū ∈ K, so ū = ρ/u and W = K + Ku + Kū is three-dimensional inside K(u). Part (a): if x₁,x₂ and y₁,y₂ are each K-independent and every x_i y_j lies in W, then there are μ ≠ 0 and P, Q ∈ GL₂(K) with x = μP(1,u)ᵀ and y = μ⁻¹Q(1,ū)ᵀ. So these configurations form a single GL₂(K)×GL₂(K) orbit, that of (1,u)⊗(1,ū). Part (b): the matrix of constant terms c_ij (x_i y_j − c_ij ∈ Ku + Kū) is invertible, also with extra independent directions w_k added. Part (c): at a candidate (|u| and e^u algebraic, K = Q̄) no such configuration has a row or column made entirely of elements of Q̄ℒ. Part (d): if u and iπ are algebraically independent, every algebraic quadratic form vanishing at (1,u,ū,iπ) is a multiple of X₁X₂ − ρX₀². Part (e): if det(A+uB+ūC) = 0 with A,B,C ∈ M₂(K), then det(xA+yB+zC) = c(yz − ρx²). Related: H = (u r; r ū) with r² = uū, r ∈ K, u ∉ K has wᵀHv ≠ 0 for all non-zero w,v ∈ K².

## Leads

### Lead 1: special case

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000, §12.1.6 (motivation for Lemma 12.16, credited to Proposition 2 of Roy 1989)
- **Location:** p. 431, paragraph after Lemma 12.16
- **Quote:** satisfies V ∩ k² = {0} (because x ∉ k)
- **Link:** local copy: (local library) waldschmidt/dalag.txt, line 23456 onward (DOI 10.1007/978-3-662-11569-5)
- **Relation:** Reaches only Diaz.no_vanishing_coeff, by my own translation; it does not reach the orbit classification, the constant-term matrix or the pencil. The target file cites p. 431 only for the configuration and names Roy95 §3.2 as the nearest passage for no_vanishing_coeff, so this passage is closer than the file says. Waldschmidt takes E = ku+kux+kux², the rank-one matrix with rows (u,ux),(ux,ux²), and notes V = K(1,x) meets k² only in 0. Translation: put x = ū/r, which is not in K because u ∉ K. Then u·x = r and u·x² = ū, so H = u(1,x)ᵀ(1,x) and wᵀHv = u(w₁+w₂x)(v₁+v₂x) ≠ 0. The non-vanishing is not stated in print; it is one line from the printed fact. Roy 1989 Prop. 2, the credited source, could not be opened and may say more.

### Lead 2: analogue only

- **Citation:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, Math. Proc. Cambridge Philos. Soc. 163 (2017), 423–452
- **Location:** Theorem 33, p. 445 (stronger companion to the named Lemmas 4 and 5, but only for F algebraically closed)
- **Quote:** S and T have bases of the form {g, ga, …} and {g′, g′a, …
- **Link:** https://arxiv.org/abs/1501.00602
- **Relation:** Gives a common ratio a with S = g⟨1,a⟩ and T = g′⟨1,a⟩, but says nothing about a relative to a prescribed W, and K in the target is not algebraically closed. Identifying a as a Möbius function of u, and the multiplier as μ, μ⁻¹, is the part not found. Lemmas 4 and 5 are already named; Theorem 33 adds nothing for the target.

### Lead 3: analogue only

- **Citation:** V. Di Gennaro, A. Rapagnetta, P. Sabatino, The genus of a curve on Calabi-Yau threefolds, arXiv:2610.25065v2 (3 Nov 2026)
- **Location:** §2 items (v)–(vii); §3 Step 2, pp. 8–9, 14–15
- **Quote:** the minimal Hopf equality dim UV = dim U + dim V − 1 …
- **Link:** https://arxiv.org/abs/2610.25065
- **Relation:** The only forward citation of BSZ17 dated after 5 October 2026 that uses the critical-pair statement. Over ℂ on a curve, it writes UV = γ·Span(1,f,…,f⁴) and uses this to exclude a rational normal curve. No classification of factorisations of a fixed three-dimensional space, no K-rational orbit, no conjugation.

### Lead 4: analogue only

- **Citation:** D. Mirandola, G. Zémor, Critical pairs for the product Singleton bound, IEEE Trans. Inform. Theory 61 (2015), 4928–4937
- **Location:** Theorem 1.2 and the general classification of PMDS pairs (near Remark 2.3)
- **Quote:** Reed-Solomon codes with a common evaluation-point sequence
- **Link:** https://arxiv.org/abs/1501.06419
- **Relation:** Coding-theory analogue in F_q^n with componentwise product: critical pairs are Reed–Solomon with common locators. It is structurally parallel to a common Möbius coordinate, but it is not a statement about subspaces of a field and yields nothing about K + Ku + Kū.

### Lead 5: analogue only

- **Citation:** D. Roy, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, Acta Math. 175 (1995), 49–73; restated as Waldschmidt DALAG, Exercise 12.10
- **Location:** Theorem 3.4 and its proof, pp. 65–66 (just after the named §3.2 passage)
- **Quote:** Then its rank r satisfies 4r ≥ d+l
- **Link:** local copy: (local library) roy/roy-1995-acta-points-logarithms-varieties.txt, line 733 onward (OCR of the quote corrected)
- **Relation:** For Q̄-independent λ₁,λ₂,λ₃, the proof bounds the dimension of {t : tL₁ ⊆ L₀} by 1, 2, 3 for dim L₁ = 3, 2, 1. This is a dimension count for configurations in any 3-space. There is no normal form, and it uses no conic structure. It rules out a 3×2 configuration but does not classify the 2×2 ones.

## Notes

**Outcome: the "not found" stands for the orbit classification and its corollaries.** One partial find: DALAG p. 431 comes closer to `Diaz.no_vanishing_coeff` than the target file records.

**Run.** Started 15:33, last clock check 15:42, stopped a few minutes later because the APIs were rate-limiting. This is well inside the 30-minute box, so coverage is limited by the APIs and not by time.

**Citations, backward.**
- BSZ17 Lemmas 4–5 and Theorem 33 give the common ratio a and nothing about a prescribed target space.
- The only remaining step is short (my own derivation, not from any source):
  - the ratios of W generate K(u), so K(a) = K(u);
  - hence a is a Möbius function of u;
  - and ⟨1,a,a²⟩ = (γu+δ)⁻²⟨1,u,u²⟩ fixes the multiplier.
- This confirms the file's "routine" label. I did not find this step in print, in additive combinatorics or in algebraic geometry.
- Hopf and the base-point-free pencil trick give the common ratio over algebraically closed fields; the searches surfaced only these general forms.

**Citations, forward from BSZ17.**
- 55 Semantic Scholar citers, mostly Sidon spaces and cyclic subspace codes.
- After 5 Oct 2026 only arXiv:2610.25065 appears. Read: it applies Vosper to exclude rational normal curves, so analogue only.
- Just before that date, Tanisali–Wessel 2609.06822 (6 Sep) treats squares S² and Riemann–Roch spaces. It has no factorisation of a fixed 3-space. I read only its introduction and grepped the body.

**Citations, forward from the transcendence side.**
- Roy 1992 and 1995, Fischler and Roy–Waldschmidt 1997 lead to Dasgupta(–Kakde), Maksoud and similar: ranks of log matrices and regulators.
- Nothing on circle points; the zbMATH 11J81 page gave nothing either.
- Coverage is thinner here because of the rate limits.

**The DALAG passage.**
- P. 431 has the same matrix, up to renaming, as H: with x = ū/r, H = u(1,x)ᵀ(1,x).
- It records V ∩ k² = {0}. The non-vanishing of wᵀHv is then one line, but that line is my translation.
- More simply: any rank-one 2×2 matrix with K-independent rows and columns has no vanishing wᵀHv, because a zero entry after K-equivalence gives (a b; c 0), and rank one forces b or c to be 0.
- The target's source line for `no_vanishing_coeff` could cite this page alongside Roy95.
- A verifier should check the printed page; I used the text layer only.
- This is not the orbit statement, so I marked it "special case" and not "implies".

**Other parts.**
- (b) and (c): nothing printed. DALAG, Diaz 2004 and 2007 and Waldschmidt 2005 were grepped for matrix statements and show no constant-term or candidate-configuration claim. That was keyword screening, not a full read.
- (d) and (e): the only printed neighbours are RW97 Th. 0.2 and Roy95 §3.2, both about points of quadrics, not the classification. Part (e) is the Nullstellensatz for a conic; I found no statement of it in this form. A textbook form may exist, but it would be a general fact and not this claim.

**Could not settle.**
- Roy 1989 Prop. 2 is the most valuable unread item.
- Author listings on arXiv were blocked by 429s. Web search covers them only loosely, so an October–November 2026 preprint outside the BSZ17 citation graph could be missed.

## Read

- Bachoc–Serra–Zémor 2017, Lemmas 4–5, Theorem 33, opening of §5 on quadratic forms — https://arxiv.org/abs/1501.00602: §2 Lemmas 4–5; Theorem 33; intro; Definition 19 region
- Waldschmidt, DALAG (2000) — local dalag.txt: §11.5 (Conj. 11.17 and the |u| remark), §12.1.4–12.1.6 pp. 430–431, Exercises 12.8–12.12
- Roy, Acta Math. 175 (1995) — local roy-1995-acta-points-logarithms-varieties.txt: §3.2 and Theorem 3.4 with the start of its proof, pp. 65–66
- Di Gennaro–Rapagnetta–Sabatino, arXiv:2610.25065v2 — https://arxiv.org/abs/2610.25065: intro outline, §2 (v)–(vii), §3 Step 2, references
- Tanisali–Wessel, arXiv:2609.06822 — https://arxiv.org/abs/2609.06822: abstract, introduction; grep of the body for pairs, pencils, genus 0
- Roy–Waldschmidt, Ann. Sci. ENS 30 (1997) — local roy-waldschmidt-1997 text: Théorème 0.2 and the discussion after it

## Screened only

- Mirandola–Zémor 2015 (Theorem 1.2 and Remark 2.3 seen; main theorem seen via lines and search snippets) — https://arxiv.org/abs/1501.06419
- Bachoc–Couvreur–Zémor, Towards a function field version of Freiman's theorem, Algebraic Combinatorics 2018 (intro and K(x) example, S=T only) — https://arxiv.org/abs/1709.00087
- Couvreur–Zémor, Freiman's 3k−4 theorem for function fields (abstract, intro, S=T) — https://arxiv.org/abs/2408.00183
- Wessel, On Freiman's theorem in a function field setting (abstract) — https://arxiv.org/abs/2405.10724
- Aliabadi et al., Extremal Chowla sets and their linear analogues, arXiv:2607.24847 (title, abstract, citation context) — https://arxiv.org/abs/2607.24847
- Aliabadi, Conditions for matchability II, arXiv:2309.14664 (abstract, citation context) — https://arxiv.org/abs/2309.14664
- Astore–Borello–Couvreur–Salizzoni, q-analogue of the rational normal curve, arXiv:2606.13246 (abstract) — https://arxiv.org/abs/2606.13246
- Randriambololona, The quadratic hull of a code, arXiv:1912.06627 (abstract) — https://arxiv.org/abs/1912.06627
- Full Semantic Scholar citation lists: 55 for BSZ17, 9 for BCZ18, 1 for Couvreur–Zémor; top 25 of 50 for Mirandola–Zémor (titles only: Sidon spaces, MDS codes, subspace codes)
- OpenCitations citers of Roy 1992, Roy 1995, Fischler 2001, Roy–Waldschmidt 1997, Diaz 2004 (DOIs; titles resolved only for Dasgupta I, Dasgupta–Kakde II, Maksoud ×3, Ma: matrix-of-logarithm ranks and regulators, nothing on circle points)
- Dasgupta–Kakde, Ranks of matrices of logarithms II, Adv. Math. (grep for conic and quadric: none) — https://arxiv.org/abs/2408.08178
- Fischler 2001 (grep: Theorems 1.1, 1.2 on Veronese and Grassmannian cones; p. 186 not re-read)
- zbMATH Open, MSC 11J81, 2025–2026, first page of 50 records, keyword search only: nothing relevant — https://api.zbmath.org/v1/document/_search?search_string=cc%3A11J81%20%26%20py%3A2025-2026
- Huhtanen, The product of matrix subspaces, arXiv:1111.7143 (snippet) — https://arxiv.org/abs/1111.7143

## Inaccessible

- D. Roy, Sur la conjecture de Schanuel pour les logarithmes de nombres algébriques, Groupe d'Études sur les Problèmes Diophantiens 1988–1989, Publ. Math. Univ. Paris VI 90, no. 6, 12 pp.; Proposition 2 is the source of DALAG p. 431: Not in the local library, and one web search found no copy. This is the one source that might state more than DALAG reports.
- OpenAlex API: HTTP 429 on all attempts, so its citation graph was not used; Semantic Scholar and OpenCitations were used instead.
- arXiv API listings by author and keyword: The first batch worked, but its 'all:' and fuzzy results were mostly noise; later calls returned HTTP 429. Author listings for Zémor, Wessel, Waldschmidt, Diaz and Fischler were not obtained.
- Semantic Scholar citations of Diaz 2004, Diaz 2007, Waldschmidt 2005 and Roy–Waldschmidt 1995: HTTP 429 on title lookup. Its DOI lookup for Roy 1995 also returned an unrelated paper's citers. Diaz 2004 and Roy 1995 were covered through OpenCitations instead.

## Queries

- subspaces S T of rational function field K(x) dim ST = dim S + dim T - 1 classification geometric progression basis Vosper two-dimensional critical pair
- algebraic number modulus |u| and e^u algebraic Diaz conjecture 2x2 matrix logarithms u, ū rank one transcendence 2026
- "A Generalization of Vosper's Theorem" 2024 linear analogue products of vector spaces
- subspaces V W of rational functions product VW in three-dimensional space base point free pencil trick conic parametrization
- Mathematical Reviews strong four exponentials 2026 matrix entries linear combinations logarithms conic xy=z^2
- Hopf's theorem bilinear map dim UV = dim U + dim V - 1 rational normal curve Vosper classification of pairs
- Mirandola Zémor critical pairs Reed-Solomon common evaluation points
- Hopf lemma multiplication of linear series pencils same moving part; Veronese conic factorization H^0(O(2))
- Roy Sur la conjecture de Schanuel pour les logarithmes des nombres algébriques Groupe d'Étude 1988-1989
- factorization of span(1,x,1/x) as product of two-dimensional subspaces, Möbius equivalence, Sym^2 uniqueness
- transcendence matrix entries u, |u|, ū rank one strong four exponentials 2025 2026 Diaz Waldschmidt
- Semantic Scholar citations of BSZ17, BCZ18, Couvreur–Zémor, Mirandola–Zémor
- OpenCitations COCI citations of Roy 1992, Roy 1995, Fischler 2001, Roy–Waldschmidt 1997, Diaz 2004
- zbMATH Open cc:11J81 & py:2025-2026
- arXiv API: Diaz/modulus, six exponentials, four exponentials, logarithms and conjugation, product of subspaces, Vosper, Kneser/function field, matrices of logarithms
