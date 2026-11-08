# Entry 6, strategy: citations

## Target, as restated by the searcher

Let K ⊆ F be subfields of ℂ, V₀ ⊆ F a K-subspace, and w₁,…,w_m algebraically independent over F. Suppose x₁,…,x_p and y₁,…,y_q (p,q ≥ 2) are each K-linearly independent, and every product x_i y_j lies in V₀ + Kw₁ + … + Kw_m. Then every product lies in V₀: the w's never occur. Equivalently, a rank-one matrix with entries in that space and K-independent rows and columns has entries in V₀. Consequence (Theorem A): if u ≠ 0 has uū algebraic and u,w₁,…,w_m are algebraically independent over Q̄, then Q̄ + Q̄u + Q̄ū + ΣQ̄w_j carries no 2×3 configuration over Q̄. This comes from separation with F = Q̄(u), which reduces to m = 0, plus Roy's bound p+q ≤ 4 in a 3-dimensional space.

## Leads

### Lead 1: implies

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000, §12.1.3
- **Location:** Remark after the second proof of Proposition 12.2, p. 424; the field convention is at the head of §12.1, p. 418. Local copy: sources/waldschmidt/dalag.txt
- **Quote:** then E = k + E0 satisfies Property
- **Link:** https://doi.org/10.1007/978-3-662-11569-5
- **Relation:** My own translation; no source prints it. The printed Remark is stated for an arbitrary field pair k ⊆ K, not only k = Q̄, so it is stronger than the target file says. Take k := F, big field ℂ, E₀ := ΣFw_k; then E₀∩F = 0. The matrix M = (x_i y_j) ≠ 0 has entries in F + E₀, so M is F-equivalent to (A B; C 0) with A regular. Rank 1 forces A to be 1×1, and bc = 0 gives B = 0 or C = 0. Hence x = t·f with f ∈ F^p, or y = t·f with f ∈ F^q; f is K-independent. Take the first case. For fixed j write t y_j f_i = a_i + Σ c_ik w_k with a_i ∈ V₀, c_ik ∈ K. Cross-multiplying indices 1 and i, and using that 1,w₁,…,w_m are F-independent, gives f_i c_1k = f_1 c_ik. K-independence of f_1,f_i forces c = 0, so x_i y_j = a_i ∈ V₀. The second case is symmetric. With Roy 1995 Thm 3.4 / Wal00 Ex. 12.10 (r = 1 gives p+q ≤ 4 in dimension 3), F = Q̄(u), V₀ = H₀ gives Theorem A.

### Lead 2: implies

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Springer, 2000 (attributed there to D. Roy, Sur la conjecture de Schanuel pour les logarithmes de nombres algébriques, Groupe d'étude sur les problèmes diophantiens 1988-89, Lemme)
- **Location:** Proposition 12.4, p. 422
- **Quote:** (no quote: the one quote allowed for this source is used in the first …
- **Link:** https://doi.org/10.1007/978-3-662-11569-5
- **Relation:** My own translation; an alternative route that stays over k = K and needs no linear independence of V₀ beyond a basis. Apply the block form to x_1,…,x_n, a K-basis of the V₀-parts of the entries followed by w₁,…,w_m last. If some w_k occurs, with k maximal, the first non-empty diagonal block has diagonal entries involving w_k and all other entries free of w_k. A 2×2 minor of degree 2 in w_k shows the block is 1×1 (transcendence over F). The minors d·m_ab = m_1b·m_a1 then force m_ab = 0 for a,b ≥ 2, and force the rest of the first row or first column to vanish. So a column or a row of a K-equivalent matrix is zero, contradicting K-independence since p,q ≥ 2.

### Lead 3: analogue only

- **Citation:** D. Eisenbud, J. Harris, Vector spaces of matrices of low rank, Adv. Math. 70 (1988), 135-155
- **Location:** Introduction, before p. 138 (classical description of rank-one spaces). Local copy: sources/n3-lit/eisenbud-harris-1988-vector-spaces-low-rank.txt
- **Quote:** The description of vector spaces of transformations of rank 1 is classical
- **Link:** https://doi.org/10.1016/0001-8708(88)90054-X
- **Relation:** Pure linear algebra; it says nothing about K, F or the w's. It closes a third route when combined with Wal00 Cor. 12.14, p. 430, at k = F. That corollary gives rank M = structural rank over F, so M₀ + ΣX_kM_k has rank ≤ 1 over F(X), and the span of M₀,M_k is a rank ≤ 1 space with a common image or common kernel. If M_k ≠ 0 has entries in K, that line is K-rational, so x or y is proportional to a K-vector, contradicting p,q ≥ 2. Listed only as a supporting step.

## Notes

**Result.** I found no source that prints the separation theorem, or Theorem A with m ≥ 1. I did find something stronger than the target file describes.

**The main find.** The file treats [Wal00, Prop. 12.2 and Remark p. 424] as the case V₀ = K = Q̄, whose argument must be extended. But §12.1 opens by fixing K a field and k any subfield (p. 418), and the Remark is stated at that generality: if E₀ is spanned by k-algebraically independent elements and E₀∩k = 0, then k + E₀ satisfies Property (A B; C 0). So nothing needs extending. Take k = F, and the printed statement gives F-rationality of x or y. A short linear-independence step, written out in lead 1, then gives separation for any K ⊆ F and any V₀ ⊆ F.

**What this is and is not.** It is a derivation of mine from a printed statement, not a printed separation theorem. The final step, passing from F-rationality to the vanishing of the K-coefficients, appears nowhere I read. A verifier should check that step and the p. 424 Remark against the page. I read the Remark from the text layer, where only the matrix symbol is garbled.

Suggested reading: the source line could become "follows from the Remark on p. 424 with k = F", and "routine" stands. Theorem A then follows from Wal00 and Roy 1995 together, with F = Q̄(u). I checked that dim H₀ = 3, since u is transcendental and ū = ρ/u.

**Other routes.**
- Prop. 12.4 (Roy 1989, Lemme) at k = K gives a direct proof (lead 2).
- Cor. 12.14 at k = F plus the classical rank-one description gives a third route (lead 3, listed as an analogue because Eisenbud-Harris alone does not reach the target).

**What the other sources say.**
- Roy 1995 Thm 3.4 and Wal00 Lemma 12.16 / Ex. 12.10 give the 3-dimensional bound only. As the target says, neither adds w's.
- Roy 1995 §3.2 is about limits for homogeneous surfaces; no separation.
- Fischler p. 186 notes that the quadratic conjectures cannot be derived algebraically from Roy's theorem; no added numbers.
- Roy 1992 has field generality only for subfields of Q̄ (Remark (i) after Thm 4), and for a different theorem.
- Waldschmidt's four-exponentials paper defines structural rank over any field K, which fits the general-field reading.

**After 5 October 2026.** The only relevant-looking item is Waldschmidt, arXiv:2610.39810 (29 Oct 2026), a strategy survey with nothing on this. Bays 2610.27963 and Aslanyan 2610.35409 are off topic by title.

**Not settled.**
- Whether Roy 1990 Prop. 1 or Roy 1989 prints the general-field form or a mixed form like V₀ + ΣKw_j. Both are unavailable to me, and they are the most likely places for an actual printed statement.
- Forward citations were checked by title only, with 35 of 162 Wal00 citers unresolved. Coverage of OpenCitations is partial, and zbMATH citing data was not available.

Stopped at about 15 minutes of the 30, since the remaining indexes were rate-limited or blocked.

## Read

- Waldschmidt, DALAG (2000), Ch. 12: chapter opening; §12.1.1-12.1.3; Prop. 12.2, 12.4, 12.6; Cor. 12.14; Lemma 12.16; Exercises 12.7-12.12 — https://doi.org/10.1007/978-3-662-11569-5: pp. 417-419, 422, 424-425, 427, 429-430, exercises; text layer of the local copy
- D. Roy, Points whose coordinates are logarithms..., Acta Math. 175 (1995) — https://doi.org/10.1007/BF02392486: §3.1 opening, §3.2, Theorem 3.4 and proof, references
- S. Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, Acta Arith. 100 (2001): p. 186, the closing N.B. remarks; keyword check of the rest
- Eisenbud-Harris, Vector spaces of matrices of low rank (1988) — https://doi.org/10.1016/0001-8708(88)90054-X: passages on rank-one spaces in the introduction, by keyword
- M. Waldschmidt, An introduction to the strategy of transcendence proofs, arXiv:2610.39810 (29 Oct 2026) — https://arxiv.org/abs/2610.39810: Full-text keyword check (rank, Roy, structural, algebraically independent): one rank mention, no Roy, nothing on configurations
- D. Roy, Matrices whose coefficients are linear forms in logarithms, J. Number Theory 41 (1992): Abstract, introduction; keyword check for field generality and algebraic independence; Remark (i) after Theorem 4
- Waldschmidt, The Four Exponentials Problem and Schanuel's Conjecture (2022): Passages on structural rank, by keyword
- Waldschmidt, Variations on the Six Exponentials Theorem (2005): Passages on structural rank, by keyword

## Screened only

- Dasgupta, Ranks of matrices of logarithms I (2023); Dasgupta-Kakde II, matrix coefficient conjecture (2024/2026): keyword check only, no rank-one separation statement — https://arxiv.org/abs/2408.08178
- Roy-Waldschmidt 1997 (ASENS) and 1995: keyword check, no matrix separation lemma
- Diaz 2004 and Diaz 2007/2008 (JTNB): keyword check, no algebraic independence over a field in this form
- Maksoud, On the rank of Leopoldt's and Gross's regulator maps (2023): keyword check, uses Roy's rank bounds
- Fischler-Nakamaye, Multiplicity estimates and degeneration (2014): title only
- Butler, A Diophantine approach to the three and four exponentials conjectures (2015): title only
- Prasad, Some questions in Diophantine approximation (arXiv:2505.15744; 2026 version): abstract, off topic — https://arxiv.org/abs/2505.15744
- Burungale-Skinner-Wan, arXiv:2603.20886: title only, off topic
- Bays, SEAC from EAC modulo Schanuel, arXiv:2610.27963: title only, off topic
- Aslanyan, Modular Existential Closedness, arXiv:2610.35409: title only, off topic
- arXiv mathematics listings 5 Oct to 8 Nov 2026, abstract terms transcendence and Schanuel; 2026 for 'logarithms of algebraic numbers'; 2024 on for 'structural rank': titles only, no relevant paper beyond Waldschmidt's survey
- OpenCitations citers of Roy 1990 (2), Roy 1992 (17), Roy 1995 (9) by title; of Wal00 (162) by title with a keyword and 2025+ filter: no candidate. 35 of the 162 titles did not resolve

## Inaccessible

- D. Roy, Matrices dont les coefficients sont des formes linéaires, Sém. Théorie des Nombres Paris 1987-88, Progr. Math. 81 (1990), 273-281 (source of Prop. 12.2) — https://doi.org/10.1007/978-1-4612-3460-9_13: Springer returned a client challenge; not bypassed. I could not check whether Roy's Proposition 1 is stated over a general field.
- D. Roy, Sur la conjecture de Schanuel pour les logarithmes de nombres algébriques, Groupe d'étude sur les problèmes diophantiens 1988-89, Publ. Paris VI: No open copy found. Known only through Wal00's citation of its Lemme and Propositions 1 and 2.
- Gelbord-Meshulam, Spaces of p-vectors of bounded rank, Israel J. Math. (2001), which cites Roy 1995 — https://doi.org/10.1007/BF02784151: Not opened; web search did not give the abstract or a full text. Volume number conflicts across citations (121 vs 126).
- zbMATH Open citing-document queries: Citing queries returned 404/400 on the API and 403 on the web interface; only a title lookup worked (Roy 1995 = Zbl 0833.11031).
- OpenAlex, Semantic Scholar, arXiv API: OpenAlex's free budget for this network was exhausted (429). Semantic Scholar was rate-limited after one citations call. The arXiv API returned 429, so I used the arXiv HTML search instead.

## Queries

- web: linear subspaces of matrices of rank at most one, linear forms, algebraically independent, structural rank, Roy
- web: Roy Matrices dont les coefficients sont des formes linéaires, Proposition, éléments algébriquement indépendants
- web: matrix entries linear forms rank one algebraically independent over field, k-equivalent, (A B; C 0), generalization
- web: Diaz conjecture exp(u) algebraic |u| algebraic 2026 arXiv complex conjugation
- web: Roy Sur la conjecture de Schanuel pour les logarithmes, Groupe d'étude 1988-1989
- web: singular matrix entries linear combinations of 1, u, ū, logarithms, separation, coefficient vanish
- web: Gelbord Meshulam Spaces of p-vectors of bounded rank
- Semantic Scholar: citations of Roy 1995
- OpenCitations: citations of Roy 1990, Roy 1992, Roy 1995, Wal00, Wal00 ch. 12; the Fischler DOI I used was wrong
- arXiv advanced search, abstract: transcendence, Schanuel, 'logarithms of algebraic numbers', 'structural rank', 'bounded rank' matrices spaces, exponentials transcendental, algebraically independent matrices rank
- local grep: k-equivalent, structural rank, rang structurel, spanned by algebraically independent, across sources/
