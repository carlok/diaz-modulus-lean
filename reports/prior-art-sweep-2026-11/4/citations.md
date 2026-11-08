# Entry 4, strategy: citations

## Target, as restated by the searcher

Let K be algebraically closed (here Q̄), u transcendental over K (or at least not in K), and W a 5-dimensional K-space containing 1, u and 1/u. Suppose W contains all products of a 2-dimensional space K x0 + K x1 and a 3-dimensional space Y, so dim(UV) ≤ dim U + dim V, one above the Vosper/Hopf minimum. Suppose the ratio h = x1/x0 is a rational function of u of degree exactly 2. Theorem NF says W must then be of one of three types. (D1): W ∩ u⁻¹W has dimension at least 3. (D2a): W = ⟨1, u, 1/u, g1, g2⟩ with g1 = Q'S1/(uP'), g2 = P'S2/(uQ'), where P', Q' are coprime of max degree 2 and deg S_i ≤ 2. (D2b): the cyclic variant, with g2 = Q'(Q'S1 + P'S2)/(uP'²). The classification built on it: for W ⊂ K(u), having a 2×3 configuration is equivalent to being one of these three types (σ-free form). For z rational in u with uū algebraic, the hull W_z carries a configuration exactly when it is 4-dimensional with z ∈ H₀ + Q̄/(u−a), aā = uū, or 5-dimensional of those types (Theorem F). Geometrically: the three types of rational curves in P⁴ on S(1,2) or S(0,3) whose ruling is cut by a g¹₂ and which lie on the rank-3 quadric from 1, u, 1/u; equivalently colength-2 modifications of O(1) ⊕ O. The part sought is the only-if classification, not the existence of configurations.

## Leads

### Lead 1: analogue only

- **Citation:** N. Tanisali and M. Wessel, High dimensional Riemann–Roch spaces in linear spaces with small squares, arXiv:2609.06822v1 (6 Sep 2026)
- **Location:** Theorem B and Conjecture A, Introduction, p. 3; hyperplane types (i)-(iii) on pp. 3-4
- **Quote:** Define b as the co-dimension of S in L(D)
- **Link:** https://arxiv.org/abs/2609.06822
- **Relation:** My translation, not in the paper: the target says the two-orbit and cyclic W have k=5, γ=2, b≤2. Then 2b≤7 and Theorem B gives L(G) ⊂ W² with dim L(G) ≥ 9. This is new relative to the [Wes24]/[CZ24] step the target names, but it concerns W², is symmetric (S·S), and says nothing of 2×3 configurations or the types D1/D2a/D2b. It does not reach the part not found.

### Lead 2: analogue only

- **Citation:** J. Harris, M. Roth and J. Starr, Curves of small degree on cubic threefolds, arXiv:math/0202067 (2002); published Rocky Mountain J. Math. 35 (2005)
- **Location:** Section 6, Lemma 6.8 (arXiv version)
- **Quote:** a pencil of degree 2-divisors on C without basepoints
- **Link:** https://arxiv.org/abs/math/0202067
- **Relation:** My translation: the smooth rational quartic is W = ⟨t⁻², t⁻¹, 1, t, t²⟩ with u=t, and the lemma builds the unique cubic scroll from a degree-2 pencil by pushing forward to a rank-2 bundle on P¹, giving O(-2)+O(-1). This prints the bundle construction for one space, which is already of type D1 (t_j = t⁻², t⁻¹, 1). It is an 'if' instance only. There is no classification, and D2a/D2b never appear.

### Lead 3: analogue only

- **Citation:** H.-C. Graf von Bothmer, Geometric syzygies of Mukai varieties and general canonical curves with genus at most 8, arXiv:math/0202133
- **Location:** Section 2.2 (Scrollar syzygies), opening paragraph and Proposition 2.2.1
- **Quote:** we can construct a scroll S containing X from a pencil of divisors on X
- **Link:** https://arxiv.org/abs/math/0202133
- **Relation:** This is the general dictionary between low-rank syzygies, scrolls containing X and pencils of divisors on X, which the author calls well known apart from one morphism. It concerns canonical curves. No normal forms for a space containing 1, u, 1/u, and no types.

### Lead 4: analogue only

- **Citation:** V. Di Gennaro, A. Rapagnetta and P. Sabatino, The genus of a curve on Calabi-Yau threefolds, arXiv:2610.25065v2 (v1 18 Oct 2026, v2 3 Nov 2026)
- **Location:** Section 2, items (v)-(vii)
- **Quote:** which we will refer to as “Vosper’s theorem”
- **Link:** https://arxiv.org/abs/2610.25065
- **Relation:** This is the only work found after 5 Oct 2026 citing [BSZ17]. It applies Hopf and BSZ Theorem 33 to U⊗V→W coming from a rank-2 sheaf A⊗A∨(1)→O(1) on a curve. It uses only the equality case dim UV = dim U + dim V − 1 to exclude a rational normal curve, one step below the target (dim UV = dim U + dim V). No classification.

## Notes

**Outcome: no lead reaches the part not found.** I found no printed classification of 2×3 configurations in a 5-dimensional space containing 1, u, 1/u, and nothing equivalent to D1/D2a/D2b. The four leads are analogues. This is a limited negative, because several indexes failed. Stopped at about 20 minutes (started 10:41; last timestamp 10:52).

**Backward from the named results.**
- The reference lists of [Wes24], [CZ24] and Tanisali–Wessel stay within Kneser/Vosper/Freiman work: Hou–Leung–Xiang, BSZ, BCZ, Beck–Lecouvey, Eliahou–Lecouvey, Lecouvey, Mirandola–Zémor, Randriambololona.
- All structure theorems I read in that line are either symmetric (S²) or at the minimum dim ST = dim S + dim T − 1.
- CZ24 frames its introduction around S and T but states its theorem for S². It borrows the Lev–Smeliansky proof method, not an asymmetric statement.
- I found no linear Hamidoune–Rødseth theorem, which is the natural home for dim ST = dim S + dim T. The search hit on Aliabadi concerns Chowla subspaces, not that problem.

**Forward.**
- Citers of BSZ17 are dominated by Sidon spaces and cyclic subspace codes.
- After 5 Oct 2026 only arXiv:2610.25065 appeared, and it uses only the Vosper equality case.
- Just before that date, arXiv:2609.06822 (6 Sep 2026) cites all of BSZ17, BCZ18, CZ24 and Wes24. The target does not name it. It adds a statement about W² (my translation, conditional on the target's γ=2 computation) but no types.
- Its introduction also resolves one direction of Randriambololona's conjecture, listing three types of hyperplanes of L(A) with non-full square. The count of three is a coincidence of form as far as I can tell: those are hyperplanes and squares, not 2×3 products. I read only the introduction's description, not Proposition 3.8.

**Scroll and bundle side.**
- Harris–Roth–Starr Lemma 6.8 is the nearest print in this geometry and is not named by the target. It takes a rational quartic with a g¹₂, pushes forward to a rank-2 bundle on P¹, and gets a unique cubic scroll.
- Its proof shape matches what the target describes for the research notes' bundle proof, but it handles one space, which is D1 already.
- The Kronecker–Weierstrass form for 2×n pencils and the scroll/pencil dictionary are confirmed as standard through secondary mentions and von Bothmer. These match the ingredients the target already attributes to [Rei97].
- The extra hypothesis 1, u, 1/u ∈ W, which is what produces the three types, appeared in none of these. It amounts to the curve lying on a specific rank-3 quadric (my reading).

**What I could not settle.**
1. Eisenbud–Harris 1987, Eisenbud 1988, Eisenbud–Koh–Stillman 1988 and Eisenbud's Ch. 6 were not read. They remain the target's stated weak point. From what secondary sources say about them, I expect the 1-generic 2×n normal form and curves on scrolls, not a classification under the 1, u, 1/u constraint; that is an expectation, not a check.
2. zbMATH and OpenAlex were unavailable throughout, so review-based and full forward-citation coverage is missing. Semantic Scholar's lists are the only forward data, and its coverage of pre-arXiv and classical Italian geometry is poor.
3. Classical work on rational curves in S₄, and apolarity or level-algebra language (pencils of binary sextics), were barely searched or not searched at all. A statement in that language could evade my keywords.
4. Diaz forward citations remain open: S2 gave a single 2005 title for the 2007 paper, and the 2004 DOI I used was wrong. Any such citer would be a transcendence paper and is unlikely to contain this algebra, but I did not verify that.

**Checks on the target's claims.**
- [Wes24] Cor. 1.6.1 and Theorem 1.4 match the target's description: containment and BCZ's genus-1 forms only. Theorem 1.6 gives no normal forms.
- [BSZ17] Lemma 4 is exactly the Case I step (dim AS = dim S + 1).
- [BCZ18] Theorem 8.1 is as stated.
- I found none of these stated more strongly than the target says.

## Read

- Tanisali–Wessel, arXiv:2609.06822 — https://arxiv.org/abs/2609.06822: Introduction (Theorems 1.1, 1.2, B; Conjecture A; Randriambololona hyperplane list), reference list; keyword search of the whole text for pencil/scroll/asymmetric/bundle (no hits). Proposition 3.8 itself not read
- Wessel, arXiv:2405.10724 — https://arxiv.org/abs/2405.10724: Introduction to Theorem 1.7, Corollary 1.6.1, references
- Couvreur–Zémor, arXiv:2408.00183 — https://arxiv.org/abs/2408.00183: Introduction, use of Lev–Smeliansky, references; keyword search for pencil/scroll/bundle (no hits)
- Bachoc–Couvreur–Zémor, arXiv:1709.00087 — https://arxiv.org/abs/1709.00087: Introduction, statement of Theorem 8.1
- Bachoc–Serra–Zémor, arXiv:1501.00602 — https://arxiv.org/abs/1501.00602: Introduction and plan, Lemma 4, the lemma following it
- Di Gennaro–Rapagnetta–Sabatino, arXiv:2610.25065v2 — https://arxiv.org/abs/2610.25065: Abstract, Section 2 items (v)-(vii)
- Harris–Roth–Starr, arXiv:math/0202067 — https://arxiv.org/abs/math/0202067: Section 6.1 and Lemma 6.8 with the start of its proof
- von Bothmer, arXiv:math/0202133 — https://arxiv.org/abs/math/0202133: Section 2.2 opening and Proposition 2.2.1
- von Bothmer, Last syzygies of 1-generic spaces, arXiv:math/0307361 — https://arxiv.org/abs/math/0307361: Introduction, Definition 3.6, Example 3.7

## Screened only

- Mirandola, On products of linear error correcting codes (thesis, Leiden 2017), table of contents and keyword search: Kneser, Vosper and PMDS pairs in K^n; no scroll content — https://ir.cwi.nl/pub/27113/mirandola.pdf
- Randriambololona, The quadratic hull of a code, arXiv:1912.06627, keyword search only — https://arxiv.org/abs/1912.06627
- Aliabadi et al., Extremal Chowla sets, arXiv:2607.24847, abstract and passage citing BSZ — https://arxiv.org/abs/2607.24847
- Aliabadi–Losonczy, Matchings and product growth, arXiv:2608.18340, abstract — https://arxiv.org/abs/2608.18340
- Aliabadi et al., Conditions for matchability II, arXiv:2309.14664, search snippet (Chowla subspaces conjecture) — https://arxiv.org/abs/2309.14664
- Hamidoune, On Minkowski product size: the Vosper's property, arXiv:1004.3010, abstract (groups only) — https://arxiv.org/abs/1004.3010
- Banks–Ramkumar, Varieties of minimal degree in weighted projective space, arXiv:2604.17735, abstract and Kronecker–Weierstrass passage — https://arxiv.org/abs/2604.17735
- Chau–Kummini, Maximal minors of 1-generic matrices, arXiv:2506.08385, abstract — https://arxiv.org/abs/2506.08385
- Semantic Scholar citation lists of 1501.00602 (55), 1709.00087 (9), 2408.00183 (1), 2405.10724 (1), by title: mostly Sidon spaces, cyclic subspace codes, linear sets; none on dim UV = dim U + dim V
- OpenCitations citers of Roy 1992 (17 DOIs, not resolved one by one) and Semantic Scholar citers of Roy 1992 (19 titles): transcendence surveys and Iwasawa theory, no classification
- Grep of the local library missions/diaz/sources: 'scroll', '1-generic', 'Kronecker pencil' hit only Reid; 'Vosper', 'Freiman' hit only the four papers already named by the target
- Maroni/double-cover hits, by snippet: alg-geom/9710015, 1505.04323, 2010.09243, math/0306058, 2604.04709: bundle splitting of covers, no spaces of this kind
- Rational matrix minimal-index hits, by snippet: arXiv:2505.00699, 2601.08522: Kronecker indices only

## Inaccessible

- Eisenbud–Harris, On varieties of minimal degree (a centennial account), Proc. Sympos. Pure Math. 46 (1987) — 10.1090/pspum/046.1/927946: The AMS URL I tried did not return a readable PDF, and no open copy surfaced. The target's flagged weak point therefore stays unchecked by this search.
- Eisenbud, Linear sections of determinantal varieties, Amer. J. Math. 110 (1988); Eisenbud–Koh–Stillman, Determinantal equations for curves of high degree, Amer. J. Math. 110 (1988): No open copy surfaced; publisher or JSTOR access only, not attempted.
- Eisenbud, The Geometry of Syzygies, Ch. 6 (GTM 229): Only the table of contents was seen. A copy appeared on a university course page; I did not open it because its permission status was unclear.
- Wang–Tang, A generalization of Vosper's theorem, Chin. Ann. Math. Ser. B 45 (2024) — 10.1007/s11401-024-0038-0: Paywalled. Keywords are sumsets and Kemperman, which suggests the additive setting, but I could not confirm this from the text.
- zbMATH Open: The API failed TLS verification (self-signed certificate in chain; I did not disable verification) and the web search page returned 403.
- OpenAlex: HTTP 429 on every attempt, so no forward citations from there.
- arXiv API and arXiv search: HTTP 429 after the first batch. Date-sorted coverage is partial: Vosper, Freiman function field and Kneser queries ran; scroll and rational-curve queries did not.
- 'Linear analogue of additive theorems' (2017, Semantic Scholar record citing BSZ17): Could not resolve author or text; the lookup was rate-limited.
- Forward citations of Diaz 2004 and Diaz 2007: OpenCitations returned 0 for 2007. The DOI I used for 2004 resolved to unrelated class-polynomial papers, so this list is unusable. Web search found no 2025-26 citers.

## Queries

- Semantic Scholar citations of ARXIV:1709.00087, 1501.00602, 2408.00183, 2405.10724
- Semantic Scholar and OpenCitations citations of Diaz 2004, Diaz 2007, Roy 1992
- arXiv API: all:Freiman AND function field AND subspaces; linear Kneser AND Riemann-Roch; product of subspaces AND function field; combinatorial genus; Vosper AND field extension; one-generic matrices; 1-generic AND scroll
- arXiv abstract search sorted by date: Vosper; Freiman function field; Kneser field extension subspaces
- Freiman 3k-4 function fields product of subspaces classification 2026
- A Generalization of Vosper's Theorem 2024
- linear analogue Hamidoune-Rødseth theorem field extension dim(ST) = dim S + dim T
- rational curves on cubic scroll S(1,2) in P^4, multiplication map, pencil, g^1_2
- subspaces of rational functions, dim UV = dim U + dim V, pencil multiplication map normal forms
- Eisenbud Harris varieties of minimal degree, one-generic 2 x n, Eisenbud Koh Stillman
- Eisenbud Geometry of Syzygies 1-generic 2 x 3 Kronecker normal form
- Maroni invariant double cover rank two bundle bisection on S(1,2), S(0,3)
- almost invariant subspace dim(V + hV), Kronecker minimal indices K(t)
- rational curves degree 5 or 6 in P^4 on cubic scroll or cone, three quadrics
- Mieke Wessel 2026 distinct subspaces, Lev-Smeliansky analogue
- Diaz 2007 citers 2025-2026
- Mirandola thesis critical pairs
