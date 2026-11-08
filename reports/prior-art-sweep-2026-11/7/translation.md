# Entry 7, strategy: translation

## Target, as restated by the searcher

Let K ⊂ C be a field, u transcendental over K, ρ = uū in K nonzero, so ū = ρ/u and V = K + Ku + Kū = ⟨1, u, 1/u⟩ = L((0)+(∞)) on P^1_K, the coordinate space of the conic C: X1X2 = ρX0². Target: (1) if x1,x2 and y1,y2 are each K-independent complex numbers with all x_i y_j in V, then x = μP(1,u)ᵀ and y = μ⁻¹Qᵀ(1,ū)ᵀ with P,Q in GL2(K), so these pairs form one GL2×GL2 orbit. (2) The matrix of constant terms of (x_i y_j) is invertible. (3) If u is a candidate (|u|, e^u algebraic, K = Q̄), each row and column of such a matrix has an entry outside Q̄ℒ. (4) If u, iπ are algebraically independent, a quadratic form vanishing at (1,u,ū,iπ) is a multiple of X1X2 − ρX0². (5) If det(A+uB+ūC) = 0 then det(xA+yB+zC) = c(yz − ρx²), and matrices such as [[u,r],[r,ū]] with r² = uū have w^T H v ≠ 0 for nonzero w,v in K². Translation: writing x_i y_j = a_ij + b_ij u + c_ij ū gives a 2×2 matrix M = X0 a + X1 b + X2 c of linear forms over K, of rank 1 at the generic point of C. Clause (1) says M is equivalent to the one standard determinantal representation of the conic.

## Leads

### Lead 1: implies

- **Citation:** Y. Ishitsuka, A positive proportion of cubic curves over Q admit linear determinantal representations, J. Ramanujan Math. Soc. 32 (2017), no. 3, 231-257; arXiv:1512.05167
- **Location:** Section 6.2, Proposition 6.1 (last sentence) and Example 6.3; arXiv pp. 12-13 (published page numbers not checked). Rests on Theorem 5.2, whose proof is stated to work over arbitrary fields.
- **Quote:** the conic C has a unique equivalence class of linear determinantal representations over k
- **Link:** https://arxiv.org/abs/1512.05167
- **Relation:** My translation; the paper does not mention configurations or u. Clause (1): M is defined over K because 1,u,ū are K-independent. det M vanishes at (1,u,ρ/u), so det M = c·(X1X2 − ρX0²), by clearing u² and comparing coefficients. If c = 0, the span of a,b,c is a space of singular 2×2 matrices over an infinite field, so it has a common left or right kernel vector w, giving Σw_i x_i = 0 or Σw_j y_j = 0, which contradicts independence. So c ≠ 0 and M is a linear determinantal representation of the smooth conic C, which has the K-point [0:1:0]. Prop 6.1 gives M = A·M0·B with M0 = [[X1,ρX0],[X0,X2]] and A,B in GL2(K). Since M0(1,u,ρ/u) = (u,1)ᵀ(1,ū), and a rank-one factorisation is unique up to a scalar μ, clause (1) follows. Clause (2): a = M(1,0,0) has det a = −cρ ≠ 0. Clause (3) needs Baker in addition: u,ū are in ℒ and Q̄ℒ∩Q̄ = 0, so a row inside Q̄ℒ would have zero constant terms. With extra w_j: det M is still c·Q; the polar complement of the nondegenerate 3-space M0(X) in (M2,det) is an anisotropic line, so the w-coefficient matrices vanish. Clause (5), non-vanishing, for u transcendental: w^T(·)v factors as (w·(u,1))((1,ū)·v) ≠ 0. Clauses (4) and the pencil formula are elementary generic-point facts and do not come from this source.

### Lead 2: implies

- **Citation:** A. Beauville, Determinantal hypersurfaces, Michigan Math. J. 48 (2000), 39-64; arXiv:math/9910030
- **Location:** Conventions (0.3) (arbitrary field k); Corollary 1.12; Proposition 3.1; Proposition 3.3 and its proof, pp. 46-47
- **Quote:** if two matrices M and M′ give rise to isomorphic pairs
- **Link:** https://projecteuclid.org/journals/michigan-mathematical-journal/volume-48/issue-1/Determinantal-hypersurfaces/10.1307/mmj/1030132707.pdf
- **Relation:** Conics are not stated; take d = 2, g = 0 in my own specialisation. Prop 3.1(b): the cokernel of a 2×2 linear M with det M = F is a line bundle of degree −1 on C. On C ≅ P^1_K (C has a K-point) all such line bundles are isomorphic. The proof of Prop 3.3 says matrices with isomorphic pairs have isomorphic minimal resolutions, hence are equivalent under GL2×GL2. This gives the uniqueness used in the Ishitsuka lead, 17 years earlier, and the remaining derivation is the same. It is a statement about all degrees, so it is a generalization of the uniqueness step, but reaching the part not found still needs the translation above. Beauville's generic-fibre uniqueness over non-closed k rests on his diagram argument, not on the quotient isomorphism alone, so a verifier should check that step.

### Lead 3: analogue only

- **Citation:** Y. Ishitsuka, T. Ito, The local-global principle for symmetric determinantal representations of smooth plane curves, Ramanujan J. (2017); arXiv:1412.8336
- **Location:** Section 4, Proposition 4.1 (conics)
- **Quote:** C admits a symmetric determinantal representation over K
- **Link:** https://arxiv.org/abs/1412.8336
- **Relation:** Existence of a symmetric representation of a smooth conic is equivalent to having a K-point. It concerns symmetric representations and existence, and it does not reach non-symmetric rank-one matrices x y^T. Useful only as a companion to Ishitsuka's Prop 6.1, which itself says to compare with it.

### Lead 4: special case

- **Citation:** J. Sidman, G. G. Smith, Linear determinantal equations for all projective schemes, Algebra Number Theory 5 (2011), 1041-1061, citing D. Eisenbud, The Geometry of Syzygies (2005), Prop. 6.10
- **Location:** Section 1 and start of Section 3 (the map µ and matrix Ω)
- **Quote:** The matrix Ω is 1-generic and its ideal I2(Ω) of 2-minors vanishes on X
- **Link:** https://arxiv.org/abs/0910.2424
- **Relation:** Take X = conic and E = E′ = O_{P^1}(1); then Ω is the 2×2 Hankel matrix. 1-generic means no conjugate has a zero entry, which is Diaz.no_vanishing_coeff when u, r, ū are K-independent. The target is slightly wider, since it assumes only u ∉ K, and there the direct factorisation H = u⁻¹(u,r)ᵀ(u,r) is needed. This is the forward direction only: it does not classify all 1-generic matrices vanishing on the curve, so it does not give the orbit clause.

### Lead 5: analogue only

- **Citation:** J. Jagiełła, J. Jelisiejew, Classification and degenerations of small minimal border rank tensors via modules, arXiv:2409.06025 (2024)
- **Location:** Section 2.7, Example 2.21(1)
- **Quote:** It seems nontrivial to find a reference over an arbitrary field
- **Link:** https://arxiv.org/abs/2409.06025
- **Relation:** A 2-dimensional space of 2×3 matrices of constant rank 2 is one GL2×GL3 orbit over any field, which is the tensor form of the critical-pair step. It gives the normal form only up to GL3 acting on V, so it does not pin V = K+Ku+Kū or the Möbius step. The target needs that pinning. It is about the same tensor but does not reach the statement.

## Notes

**Result.** The central clause of the "not found" is in print under another name. A 2×2 configuration in K+Ku+Kū is a linear determinantal representation (LDR) of the conic X1X2 = ρX0², and uniqueness of LDRs of a smooth conic with a rational point is stated verbatim in Ishitsuka 2017, Prop 6.1. It follows from Beauville 2000, Prop 3.1 and the proof of Prop 3.3, taken at d = 2 (Beauville works over an arbitrary field, (0.3)). Ishitsuka's Example 6.3 even writes the normal form [[X0,X1],[X1,X2]], attributed to Vinnikov 1989, which I could not open.

**What the sources do and do not say.** Neither source mentions configurations, transcendental u, or logarithms. The bridge is my own translation, and it is short:
1. Expand x_i y_j over the K-basis 1,u,ū to get M.
2. det M vanishes at the generic point of the conic, so det M = c·Q.
3. c ≠ 0, because a singular space of 2×2 matrices has a common kernel vector, which would contradict independence of x or y. This uses the classical rank-one-space fact, not the cited papers.
4. Apply uniqueness to get M = A·M0·B, and evaluate at (1,u,ρ/u).

I checked by hand that M0(1,u,ρ/u) = (u,1)ᵀ(1,ū). A sympy check did not run because the module was missing.

**Coverage by clause.**
- One orbit: reached, through the translation.
- Invertible constant terms: reached, and in fact needs only det M = cQ with c ≠ 0, since det M(1,0,0) = −cρ.
- Never matrices of logarithms: needs Baker in addition (Q̄ℒ∩Q̄ = 0), and u, ū are in ℒ at a candidate.
- The w_j version in the blueprint: my polar-complement argument removes the w-coefficients. This is my derivation, unconfirmed by a source, and a verifier should check it.
- Quadratic relations and the pencil formula: not from these sources. They are elementary generic-point computations, and I found no printed statement in this exact form. They need no novelty treatment.
- No vanishing coefficient: for K-independent u, r, ū this is 1-genericity of the 2×2 Hankel matrix (Eisenbud Prop 6.10 via Sidman-Smith). For u transcendental it also follows from the orbit. The case of u algebraic over K with u, r, ū dependent is not in these sources, but H = u⁻¹(u,r)ᵀ(u,r) settles it in one line.

**Suggested reclassification.** The "extends BSZ Lemmas 4 and 5" framing undersells the printed neighbour: Entry 7's first clause looks like a corollary of known determinantal-representation theory, not only an extension of the critical-pair lemma. Whether to change chapter 14 is for the verifier and Carlo.

**Other translations tried.**
- Vosper/Kneser line: BSZ Lemmas 4-5 give A = a⟨1,g⟩, B = b⟨1,g⟩, and none of the papers I saw pins a prescribed product space ⟨1,u,1/u⟩. Bachoc-Couvreur-Zémor is about the symmetric case, screened only. Mirandola-Zémor is an analogue in codes.
- Tensors: Jagiełła-Jelisiejew Example 2.21 gives one GL2×GL3 orbit over any field, which leaves the GL3 on V unresolved, so it is an analogue only. They remark that an arbitrary-field reference is hard to find.
- Syzygies and scrolls: 1-generic matrix literature gives the forward direction (factorisation gives 1-generic). I did not find the converse classification on open sources; it may be in Eisenbud's book or the 1988 paper, both unopened.
- Clifford modules and matrix factorisations: an M·adj(M) = Q·I reading with even Clifford algebra M2(K) should give the same uniqueness and explains why the K-point matters. I did not verify it against Buchweitz-Eisenbud-Herzog (paywalled), so it is not a lead.
- Schanuel, Ax, Kirby: nothing relevant found; the target is not a trdeg-one reduction statement.
- Transcendence sources: Roy 1995 Section 3.2, Fischler Section 6 and Diaz 2007 Theorem 7 are not stronger than the target says. Waldschmidt's complex-conjugation paper was keyword-searched only. I did not relocate the Wal00 p. 431 passage in the local text, because my page search failed, so that citation is unchecked here.

**Unsettled.**
- Published page numbers for Ishitsuka: the location is from arXiv.
- Whether a statement directly about rank-one matrices x y^T over a conic exists in Eisenbud 1988 or the Geometry of Syzygies.
- Earlier attribution: Vinnikov 1989 and Cook-Thomas 1979 may have the conic case over C.

**Time.** Started 13:16, stopped around 13:30, inside the box, because the lead was verified on the page. Independence: both main sources predate this work and carry no connection to it.

## Read

- Ishitsuka, A positive proportion of cubic curves over Q admit LDRs (arXiv:1512.05167) — https://arxiv.org/abs/1512.05167: Theorem 5.2 and proof sketch; all of Section 6.1-6.2 including Prop 6.1, Cor 6.2, Example 6.3; references [19],[26],[38]
- Beauville, Determinantal hypersurfaces (author's copy of the Michigan Math. J. version) — https://math.unice.fr/~beauvill/pubs/det.pdf: (0.3) conventions, Prop 1.11, Cor 1.12, Prop 3.1, (3.2), Prop 3.3 with proof
- Ishitsuka, Linear determinantal representations of smooth plane cubics over finite fields (arXiv:1604.00115) — https://arxiv.org/abs/1604.00115: Definition of LDR and equivalence (F = λ det M, M′ = AMB), Theorem 2.1 statement
- Ishitsuka, Ito, Local-global principle for symmetric determinantal representations (arXiv:1412.8336) — https://arxiv.org/abs/1412.8336: Introduction, Prop 4.1, Theorem 5.1
- Bachoc, Serra, Zémor, An analogue of Vosper's theorem for extension fields (arXiv:1501.00602) — https://arxiv.org/abs/1501.00602: Lemmas 4 and 5 (named nearby; stated as the target says, with F algebraically closed in L; no statement about a prescribed product space)
- Roy, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, Acta Math. 175 (local copy): Section 3.2 and Theorem 3.4, pp. 65-66: no normal form, not stronger than the target says
- Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, Acta Arith. 100 (local copy): Section 6, pp. 184-185 (Lemma 6.1, Theorems 6.2, 6.4): rank-one and symmetric-power statements in L, no conic normal form
- Sidman, Smith, Linear determinantal equations for all projective schemes (arXiv:0910.2424) — https://arxiv.org/abs/0910.2424: Section 1, start of Section 3, Conjecture 1.2 context
- Jagiełła, Jelisiejew (arXiv:2409.06025) — https://arxiv.org/abs/2409.06025: Section 2.7, Example 2.21
- Waldschmidt, The role of complex conjugation in transcendental number theory (local copy): Passages on the alternate matrix forms and Conjecture 3.2 (keyword search, not the full paper)
- Diaz 2007 (local full text): Theorem 7 and its surrounding versions only: 2×3 forms, no 2×2 normal form
- Beauville, An introduction to Ulrich bundles — https://math.univ-cotedazur.fr/~beauvill/pubs/UlrichIntro.pdf: Keyword passages (3.3) on curves and conventions; no explicit conic classification found

## Screened only

- Mirandola, Zémor, Critical pairs for the Product Singleton Bound (arXiv:1501.06419): Reed-Solomon pairs with common evaluation points, an analogue in codes — https://arxiv.org/abs/1501.06419
- Bachoc, Couvreur, Zémor, Towards a function field version of Freiman's Theorem, Algebraic Combinatorics 2018: symmetric S·S case, genus 0 or 1, no bilinear statement in a prescribed space seen — https://arxiv.org/abs/1709.00087
- von Bothmer, Last syzygies of 1-generic spaces (arXiv:math/0307361): abstract and introduction only — https://arxiv.org/abs/math/0307361
- Ishitsuka, Ito, symmetric representations in characteristic two (arXiv:1412.8343): snippet says at most one symmetric class for a conic — https://arxiv.org/abs/1412.8343
- arXiv:1507.03329, Knörrer periodicity and Bott periodicity: matrix factorisations and Clifford modules background — https://arxiv.org/abs/1507.03329
- Lavrauw, Sheekey, 2×3×3 tensor classification (arXiv:1411.5910): different format — https://arxiv.org/abs/1411.5910
- Agostini, Kummer, Park, Ulrich sheaves and determinantal representations for higher secant varieties of curves (arXiv:2607.22247): snippet only — https://arxiv.org/abs/2607.22247
- D'Aquino, Fornasiero, Terzo (arXiv:1909.10241) on generic points under Schanuel: no link to the conic — https://arxiv.org/abs/1909.10241

## Inaccessible

- Vinnikov, Complete description of determinantal representations of smooth irreducible curves, Linear Algebra Appl. 125 (1989), 103-140 (Ishitsuka's Example 6.3 points to it) — https://www.sciencedirect.com/science/article/pii/0024379589900344: ScienceDirect returned HTTP 403 to the fetch
- Eisenbud, The Geometry of Syzygies (2005), Prop. 6.10 and Chapter 6: Paywalled at Springer; third-party uploads surfaced in search and were not opened, so it is cited through Sidman-Smith
- Eisenbud, Linear sections of determinantal varieties, Amer. J. Math. 110 (1988): Paywalled (JSTOR); not opened
- Buchweitz, Eisenbud, Herzog, Cohen-Macaulay modules on quadrics, LNM 1273 (1987). The Clifford-module route (isotropic ternary form, even Clifford algebra M2(K)) should give the same uniqueness: Paywalled; the route was not checked against the primary source
- Dolgachev, Classical Algebraic Geometry, Ch. 4 — https://dept.math.lsa.umich.edu/~idolga/CAG-1.pdf: Author's draft link returned 404; book paywalled
- Published J. Ramanujan Math. Soc. text of Ishitsuka 2017: Not opened; the journal reference comes from a Kyushu University faculty listing, and the numbering comes from arXiv
- zbMATH Open and OpenAlex API checks: zbMATH failed on an SSL certificate error in the sandbox, which I did not bypass; OpenAlex returned HTTP 429

## Queries

- linear determinantal representations of smooth conic unique up to equivalence over a field rational point 2x2 matrix linear forms
- 1-generic matrix of linear forms vanishing on a curve factorization line bundles multiplication map 2x2 minors rational normal curve Eisenbud
- critical pair subspaces rational function field dim AB = dim A + dim B - 1 Riemann-Roch spaces genus zero Möbius bilinear Hopf classification equality
- orbits of GL2 x GL2 x GL3 on 2x2x3 tensors over arbitrary field Kronecker pencil L_2 normal form polynomial multiplication tensor unique
- Beauville Determinantal hypersurfaces Michigan Math J 2000 plane curve linear determinantal representation line bundle Proposition 3.1
- linear matrix factorizations of a quadratic form correspond to graded modules over Clifford algebra; ternary quadratic form isotropic unique 2x2 determinantal representation M_2(K) even Clifford algebra
- Ulrich sheaf on rational normal curve P^1 O(d-1) unique determinantal representation conic Ulrich line bundle Beauville
- rank four quadrics containing a curve correspond to pencils decomposition L = L1 + L2 + base locus, rational normal scroll 2x2 matrix of linear forms vanishing on curve converse
- Eisenbud The Geometry of Syzygies Proposition 6.10 1-generic line bundles multiplication matrix
- Dolgachev Classical Algebraic Geometry determinantal equations chapter 4 conic determinantal representation unique
- three-dimensional subspaces of 2x2 matrices classification equivalence, determinant nondegenerate ternary form, hyperplane sections of Segre P1xP1 conic orbit GL2xGL2 over a field
- every linear determinantal representation of a conic equivalent to symmetric matrix [[x,y],[y,z]] GL2 x GL2 equivalence nondegenerate ternary quadratic form
- complex number modulus algebraic exponential algebraic 2x2 matrix rank one entries in Q-bar + Q-bar u + Q-bar conjugate u, four exponentials, Diaz
- two pencils on a curve multiplication map H0(A)⊗H0(B) not injective iff compose with same map to P^1, base-point-free pencil trick, Möbius relation
- Schanuel conjecture generic point conic x y = rho z^2 logarithms algebraic numbers quadratic relation, Ax-Schanuel weak Kirby rank-one matrix linear forms in logarithms quadric
- Ishitsuka A positive proportion of cubic curves over Q admit linear determinantal representations J. Ramanujan Math. Soc. 32 2017
