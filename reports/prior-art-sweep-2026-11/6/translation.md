# Entry 6, strategy: translation

## Target, as restated by the searcher

Let K ⊆ F be subfields of ℂ, V₀ ⊆ F a K-subspace, and w₁,…,w_m algebraically independent over F. Suppose x₁,…,x_p are K-linearly independent, y₁,…,y_q are K-linearly independent, p,q ≥ 2, and every x_i y_j lies in V₀ + Kw₁ + … + Kw_m. Then every x_i y_j lies in V₀. Equivalently: a rank-one matrix M = A + Σ w_k C_k, with A over F and C_k over K, whose rows and columns are K-independent, has all C_k = 0. Consequence (Theorem A): if u,w₁,…,w_m are algebraically independent over Q̄ and uū is algebraic, no 2×3 configuration over Q̄ lies in Q̄ + Q̄u + Q̄ū + Σ Q̄w_j. This combines separation (V₀ = H₀, F = Q̄(u)) with the bound p+q ≤ 4 for spaces of dimension at most 3.

## Leads

### Lead 1: implies

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000. Attributed there to D. Roy, Sur la conjecture de Schanuel pour les logarithmes de nombres algébriques, Groupe d'étude sur les problèmes diophantiens 1988-89, Publ. Math. Univ. Paris VI 90 (Lemme; not read).
- **Location:** Proposition 12.4, p. 422, for arbitrary fields k ⊆ K. Also Exercise 12.10 with its hint, p. 443, for the bound.
- **Quote:** any d × ℓ matrix with entries in E_n is k-equivalent to a block …
- **Link:** (local library) waldschmidt/dalag.pdf (PDF p. 442; statement checked on the page image)
- **Relation:** The derivation is mine; the separation is not printed. Take x_1..x_s a K-basis of the V₀-parts of the entries, then the w's last, so the x's are K-independent. Apply 12.4 to M = (x_i y_j). Let i ≤ m be smallest with r_i > 0, so the top variable is w_t. All entries lie in F' = F(w_1..w_{t-1}) except the diagonal of M_ii, whose entries are c w_t + e with c ≠ 0. Rank 1 forces r_i = 1. So PMQ = [[a,R],[S,T]] with a = c w_t + e. The minors aT = S·R, with w_t transcendental over F', give T = 0 and then R = 0 or S = 0. That produces a zero column or row, contradicting K-independence since p,q ≥ 2. Hence r_1 = … = r_m = 0 and all entries lie in E_s ⊆ V₀. Theorem A then follows from Exercise 12.10 (rank ≥ (d+ℓ)/4 when dim E ≤ 3, any k): 1 ≥ 5/4 is false.

### Lead 2: implies

- **Citation:** C. de Seguins Pazzis, Large spaces of bounded rank matrices revisited, arXiv:1507.05375v2 (journal version not confirmed by my search).
- **Location:** Proposition 2.3, §2.2, pp. 14-15 of the arXiv PDF.
- **Quote:** all the non-zero matrices of S have the same image
- **Link:** https://arxiv.org/abs/1507.05375
- **Relation:** The translation is mine. Write M = A + Σ w_k C_k with A over F and C_k over K. Algebraic independence over F makes S = {A + Σ t_k C_k : t ∈ F^m} an affine F-space of rank ≤ 1, and #F > 2 excludes the third outcome. Suppose some C_k ≠ 0 and all non-zero matrices of S share an image D. Then C_k = (A+C_k) − A has image D, so D is spanned by a column in K^p. Take r ∈ K^p, r ≠ 0, annihilating D (p ≥ 2). Then r^T M = 0, so Σ r_i x_i = 0, a contradiction. The common-kernel case is the same by transposing (q ≥ 2). So all C_k = 0.

### Lead 3: implies

- **Citation:** D. Eisenbud, J. Harris, Vector spaces of matrices of low rank, Advances in Math. 70 (1988), 135-155.
- **Location:** p. 136, the classical description of rank-1 spaces (common kernel of codimension 1, or common image of dimension 1).
- **Quote:** The description of vector spaces of transformations of rank 1 is classical
- **Link:** (local library) n3-lit/eisenbud-harris-1988-vector-spaces-low-rank.pdf
- **Relation:** The translation is mine, the same as the previous lead after homogenising. The F-span of A, C_1..C_m has rank ≤ 1: the minors of sA + Σ t_k C_k vanish for s ≠ 0, hence everywhere because F is infinite. A common image or kernel, made K-rational by a non-zero C_k, gives a K-relation among the x_i or the y_j, unless all C_k = 0.

## Notes

**Result.** I found no printed statement of the separation itself. Its "not found" does not break verbatim. It does break as "implies by a short derivation", and the closest source is the book the entry already cites.

**Main lead: [Wal00, Prop 12.4], p. 422.** The entry cites Prop 12.2 and the Remark, but not 12.4, two pages on. The book says the proof of 12.2 gives this more general result without algebraic independence of the x_i, crediting Roy 1989. It holds for arbitrary k ⊆ K and needs only k-independent x_i, so it applies to a basis of V₀ followed by the w's. The block form plus one transcendence step gives separation (derivation in the lead). Exercise 12.10's hint also applies Prop 12.4 to the m = 0 case. So both halves of Theorem A sit in §12.1. The added step is mine and is not in the book. The entry's "whose argument it extends" could point to 12.4.

**Printed result stronger than the entry says.** Prop 12.2 and the Remark on p. 424 hold for an arbitrary subfield k ⊆ K, not only Q̄. So the case V₀ = K is printed for every K, where no configuration with p,q ≥ 2 exists at all. Exercise 12.10 likewise gives p+q ≤ 4 over any k when dim E ≤ 3, which is the bound in `generic_circle_point_config_is_two_by_two`.

**Second route: rank-one spaces of matrices.** Over F, M(t) is an affine space of rank ≤ 1 matrices. Common image or kernel is classical in the linear case (Eisenbud-Harris p. 136) and is stated for affine spaces in de Seguins Pazzis Prop 2.3. The only extra idea is K-rationality: a non-zero C_k over K makes the common line K-rational, and that contradicts K-independence. This is why the K/F distinction matters. With V₀ + Fw in place of V₀ + Kw the statement fails: x = (1,t) with t ∈ F∖K and y = (w,1) has all products in F + Fw. These two leads are textbook linear algebra plus my translation, so they support "routine" more than they supply a precedent. For m = 1, Kronecker's pencil form gives the same result; I did not look up a page for it.

**Dictionary results.**
- *Scrolls and quadrics:* the data map to a cone over the curve with vertex P(W). A rank-one matrix gives quadrics containing the cone, hence singular along the vertex. This is a third proof sketch, but I found no printed statement about determinantal presentations of cones. Rank-index work (Moon-Park) concerns generators of I(X) and is analogue only.
- *Kneser-Vosper line:* these results give dimension lower bounds for AB, such as p+q−1 when K is algebraically closed in L. That recovers m = 0 for K = Q̄ only. They say nothing about AB meeting an F-part plus a generic part, so analogue only. I left these out of the leads to save verifier time.
- *Schanuel and Ax-type:* nothing relevant found; judged from search results and abstracts only.
- *Mixed matrices (Murota):* the generic entries are independent parameters over the constant field, not K-linear forms with F-constants. Analogue only.

**Unsettled.**
- Roy 1989 and Roy 1990 could not be opened, and either may be closer than DALAG.
- zbMATH, OpenAlex, Semantic Scholar and the arXiv API were unavailable, so the search relied on web search and the local library. A negative here is weaker than usual.
- I stopped at about 15 minutes, because the remaining index routes were blocked.
- Eisenbud-Harris and DALAG are cited by local copies of the printed works. The journal details for de Seguins Pazzis were not confirmed.
- All derivations were checked by hand, not by machine.

## Read

- Waldschmidt, DALAG (2000) — (local library) waldschmidt/dalag.pdf: §12.1 (pp. 418-431) including Props 12.2, 12.4, 12.5, 12.6, the Remark on p. 424, Lemmas 12.15-12.16; Exercises 12.7-12.12 (p. 443); Exercise 1.8 (p. 24)
- Roy, Points whose coordinates are logarithms..., Acta Math. 175 (1995) — (local library) roy/roy-1995-acta-points-logarithms-varieties.pdf: §3.1 end, §3.2, Theorem 3.4 with proof
- Fischler, Orbits under algebraic groups..., Acta Arith. 100 (2001) — (local library) others/fischler-2001-acta-arith-orbits-logarithms.pdf: Lemma 6.1 and its proof only
- de Seguins Pazzis, arXiv:1507.05375 — https://arxiv.org/abs/1507.05375: §2.2, Proposition 2.3 with proof
- Eisenbud-Harris (1988) — (local library) n3-lit/eisenbud-harris-1988-vector-spaces-low-rank.pdf: pp. 136-137, rank-1 description and compression spaces
- Moon, Park, On the rank index of some quadratic varieties, arXiv:2206.08586 — https://arxiv.org/abs/2206.08586: abstract and introduction
- Waldschmidt, ProcCNTA1991 (local copy) — (local library) waldschmidt/ProcCNTA1991.txt: structural-rank passage only

## Screened only

- Roy, Matrices whose coefficients are linear forms in logarithms, JNT 41 (1992): keyword scan of the local text; no lemma of this shape — (local library) roy/roy-1992-jnt-matrices-linear-forms-logarithms.pdf
- Roy-Waldschmidt 1997 (ASENS): keyword scan of the local text
- Dasgupta, Ranks of matrices of logarithms I: keyword scan and search result — https://arxiv.org/abs/2303.02037
- Dasgupta-Kakde, Ranks of matrices of logarithms II: The Matrix Coefficient Conjecture — https://arxiv.org/abs/2408.08178
- Bachoc, Serra, Zémor, An analogue of Vosper's theorem for extension fields — https://arxiv.org/abs/1501.00602
- Bachoc, Serra, Zémor, Revisiting Kneser's theorem for field extensions — https://arxiv.org/abs/1510.01354
- Bachoc, Couvreur, Zémor, Towards a function field version of Freiman's theorem — https://arxiv.org/abs/1709.00087
- Couvreur, Zémor, Freiman's 3k-4 theorem for function fields — https://arxiv.org/abs/2408.00183
- Eliahou, Lecouvey, On the product of vector spaces in a field extension — https://arxiv.org/abs/0802.3523
- Last syzygies of 1-generic spaces — https://arxiv.org/abs/math/0307361
- Generic syzygy schemes — https://arxiv.org/abs/math/0403432
- Murota's layered mixed matrices, via search results and arXiv:1712.02582 — https://arxiv.org/abs/1712.02582
- Bays, Kirby, Wilkie, A Schanuel property for exponentially transcendental powers — https://ueaeprints.uea.ac.uk/34966/4/BLMS2010_Bays_917_22.pdf
- Tsimerman, Ax-Schanuel sketch — https://www.math.utoronto.ca/~jacobt/ASsketch.pdf
- Rank weights for arbitrary finite field extensions — https://arxiv.org/abs/1902.00733

## Inaccessible

- D. Roy, Sur la conjecture de Schanuel pour les logarithmes de nombres algébriques, Publ. Math. Univ. Paris VI 90 (1988-89): No online copy found. It is the original of Prop 12.4 ('Lemme') and may state more.
- D. Roy, Matrices dont les coefficients sont des formes linéaires, Sém. Théorie des Nombres Paris 1987-88, Progr. Math. 81: Birkhäuser volume, no open copy found. Not opened.
- D. Roy, Transcendance et questions de répartition dans les groupes algébriques (Luminy 1990), de Gruyter: No open copy found. Not opened.
- zbMATH Open: API: TLS certificate verification failed, and I did not bypass it. Web page: HTTP 403.
- OpenAlex, Semantic Scholar and arXiv query APIs: HTTP 429 on every attempt. I used web search instead, so index coverage is thinner than intended.

## Queries

- linear spaces of rank one matrices affine linear forms algebraically independent structural rank Roy
- Bachoc Couvreur Zémor products of subspaces field extension transcendental rational functions
- rational normal curve quadrics rank 3 rank 4 rank index linear syzygies scroll 1-generic
- Schanuel linear subspace x_i y_j products span of algebraically independent numbers rank one
- affine subspace of matrices rank at most one, de Seguins Pazzis
- Roy Sur la conjecture de Schanuel pour les logarithmes pdf
- subspaces A B of field extension, AB in F-space plus K-span of independent elements; Hou Leung Xiang
- Zariski closure of generic point, k-rational affine subspace, determinantal variety
- singular 2x2 matrix over Qbar + Qbar u + Qbar ubar + Qbar i pi
- Murota mixed matrix rank algebraically independent, Edmonds problem
- Eisenbud linear sections of determinantal varieties, 1-generic, cone vertex
- Ax-Schanuel, linear disjointness, products, Möbius
- rank one over field extension with K-independent rows; Hopf lemma; (d+l)/4
- Segre variety linear sections, subfield rational subspaces, L tensor_K L decomposable
- Couvreur Zémor product in Riemann-Roch space, degree one, Möbius
- local library regex: transcendental over k(E), rows independent over a subfield with rank, French equivalents
