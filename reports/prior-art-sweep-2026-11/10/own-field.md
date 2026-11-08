# Entry 10, strategy: own-field

## Target, as restated by the searcher

Setting: u is a non-algebraic complex number with uū = s², where s is a real algebraic number, so ū = s²/u and conjugation acts on rational functions of u. H₀ = Q̄ + Q̄u + Q̄ū.

Part 1 (structure). Suppose 1, u, ū, g, ug are Q̄-free and ḡ lies in Q̄ + Q̄u + Q̄ug. The space V = H₀ + Q̄g + Q̄ug carries the degree-one 2×3 configuration (1, u) × (1, ū, g), because u·ū = s² is algebraic. The claim is that if V is conjugation-stable in this way, then it is one of the "real pencil spaces" of the source's proposition. That proposition's definition is not reproduced in the target file, so this reading is mine.

Part 2 (example). Put f = u²/s² + s²/u² and W = span(1, u, ū, f, f/(s+u)). Then:
- W is conjugation-stable and carries a 2×3 configuration.
- No four-dimensional H₀ + Q̄w with w in W outside H₀ carries one.
- W contains no progression (v, vt, vt², ...), since its polar divisor has degree 5.

I checked by hand that conj(f/(s+u)) = (f − s·f/(s+u))/s and that u·f/(s+u) = f − s·f/(s+u). So W has the form H₀ + Q̄g + Q̄ug with g = f/(s+u), and ḡ = ug/s.

The part sought is this classification plus the invisible example. It is linear algebra over Q̄ on subspaces of ℂ, conjugation-equivariant, and it has no transcendence input of its own.

## Leads

### Lead 1: analogue only

- **Citation:** G. Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, J. Théor. Nombres Bordeaux 19 (2007), 2nd issue (article04 in the EMIS copy)
- **Location:** Théorème 7(1) and its proof, p. 390; also Théorème 6, p. 389
- **Quote:** On applique le théorème fort des six exponentielles, version 1, à
- **Link:** https://emis.univie.ac.at/journals/JTNB/2007-2/article04.pdf
- **Relation:** Uses specific conjugation-built 2×3 families, (1,u,ū)×(v,v̄) and (v,v̄)×(1,u,u²) with (1,u,ū) dependent, to feed Roy's theorem. It never asks which conjugation-stable spaces carry a configuration, never fixes uū algebraic, and has no invisibility statement. Does not reach the part not found.

### Lead 2: analogue only

- **Citation:** G. Diaz, Utilisation de la conjugaison complexe dans l'étude de la transcendance de valeurs de la fonction exponentielle usuelle, J. Théor. Nombres Bordeaux 16 (2004), 535–553
- **Location:** Théorème 2 and proof, about p. 538 (page inferred from running heads in the OCR)
- **Quote:** sont stables par conjugaison complexe
- **Link:** https://www.numdam.org/item/JTNB_2004__16_3_535_0
- **Relation:** Applies the strong six exponentials theorem to (x1,x2)×(1,y,ȳ), getting the extra products by conjugation. This is the conjugation-closure mechanism only, for one family at a time, with no classification of spaces and no example of the target's kind.

### Lead 3: analogue only

- **Citation:** M. Waldschmidt, Variations on the six exponentials theorem, in Algebra and Number Theory (Hyderabad, 2005), Hindustan Book Agency
- **Location:** Corollary 2.13 and proof, pp. 346–347
- **Quote:** by using the complex conjugation à la Diaz
- **Link:** https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf
- **Relation:** Doubles a 2×3 matrix to 2×5 by conjugating columns, then concludes about 2×2 minors. It concerns matrices with real or imaginary entries, not subspaces of rational functions on a circle. The link is the search hit for Waldschmidt's Diaz-conjugation paper; I read the local copy, so the URL's identity with this paper is unverified.

## Notes

**Result: no lead reaching the part not found.** The three leads are analogues only. Neither half of the target was found in the transcendence literature I could reach: not the classification of conjugation-stable degree-one spaces, and not the invisible example.

**What the field's literature does**
- Diaz (2004, 2007) and Waldschmidt (Role; Variations) use conjugation in one way. They take a specific family such as (1,y,ȳ) or (v,v̄), note that conjugates of elements of L̃ stay in L̃, and enlarge a 2×2 pattern to the 2×3 pattern that Roy's theorem needs.
- The closest printed statements are Diaz 2007 Théorèmes 6 and 7(1). They exhibit conjugation-built 2×3 configurations.
- None of these papers does any of the following:
  - fix uū algebraic as the working frame;
  - study the space of rational functions of u;
  - treat stability of a whole Q̄-space under conjugation as a hypothesis;
  - classify anything;
  - introduce a four-dimensional extension of H₀ or ask whether a configuration survives in it.
- Diaz 2007 §2.3 is the nearest on progressions, with its {v, vu, vu²} families. There progressions are the object of study, not something to be avoided.
- Roy 1992 and 1995 and Laurent 1991 give rank bounds and structure for matrices over L, with no conjugation in this sense. Roy 1995 Theorem 1.2 is a block decomposition over Q, not a classification of spaces.

**Why a find here is unlikely.** My judgement, not a theorem: the target is pure linear algebra of Q̄-subspaces of Q̄(u), and transcendence papers state such steps only inside a proof, for the instance they need. If it is printed anywhere, a more plausible home is outside this field: products of subspaces in field extensions (linear Kneser and Vosper, function-field Freiman) or real forms of pencils and Kronecker classification. Those belong to other search strategies. I did not search them, beyond noting the Bachoc–Serra–Zémor statement in the local library.

**Limits**
- Web searches also surfaced releases of github.com/carlok/diaz-modulus-lean. I excluded them unread beyond the search summary, as the rules require.
- OCR of Diaz 2004 and 2007 drops conjugation bars. I read the statements through the proofs, but did not check them against page images. Page numbers for Diaz 2004 are inferred from running heads.
- Python urllib failed with a TLS certificate verification error in the sandbox. I did not disable verification, and used the sandbox's JavaScript fetch for the APIs instead.
- OpenAlex and most Semantic Scholar calls returned 429, so citation-chasing is incomplete, especially for citers of Waldschmidt's survey. HAL returned 0 hits, which may reflect query syntax rather than absence.
- zbMATH queries returning null may also be a syntax effect. Queries with hits covered the core vocabulary.
- I did not read Waldschmidt's other surveys in the library beyond grep (SASTRA, Hong Kong lectures, Transcendence of Periods). Only the conjugation hits in the files I named were checked. The other grep hits for "conjug" across the Waldschmidt folder were not opened one by one, though they are not on target by filename.
- The time box was not exhausted. The run stopped when the leads ran out, not because time was up; the last date check, partway through, read 15:36 against a 15:33 start.

## Read

- Diaz 2007, Produits et quotients (local copy) — https://emis.univie.ac.at/journals/JTNB/2007-2/article04.pdf: §1.3 Théorème 2 and §1.2 (Qr); §2.1 Corollaires 4–5; §2.2 Théorème 4 and Corollaire 6; §2.3 Théorèmes 5–7
- Diaz 2004, Utilisation de la conjugaison complexe (local copy, poor OCR with bars and formulas lost) — https://www.numdam.org/item/JTNB_2004__16_3_535_0: Théorème 2 and proof; statement of Théorème 6; list of all theorem and proposition statements by grep
- Waldschmidt, The role of complex conjugation in transcendental number theory (local copy) — https://hal.science/hal-00411402/document: §6 Theorems 6.1, 6.2, Corollary 6.3; theorem statements of §§1–5 from a grep listing
- Waldschmidt 2005, Variations on the six exponentials theorem (local copy): Corollaries 2.12–2.13 and proof
- Roy 1992, Matrices whose coefficients are linear forms in logarithms, J. Number Theory 41 (local copy): Theorem 4 statement and start of proof; theorem list
- Roy 1995, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, Acta Math. (local copy): Theorem 1.2, Corollary 1.3, theorem list
- Laurent 1991, Sur quelques résultats récents de transcendance, Astérisque 198–200 (local copy): Théorème 1 and its statement context; grep for conjugation and sous-espace (the conjugation there is the Galois element in the p-adic rank setting)

## Screened only

- Waldschmidt, Further variations on the six exponentials theorem (local; grep: no conjugation or modulus hits)
- Waldschmidt, The four exponentials problem and Schanuel's conjecture (local; grep: no conjugation or modulus hits)
- Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (local; grep for complex conjugation found nothing relevant)
- Butler, A Diophantine approach to the three and four exponentials conjectures, 2017 (local PDF; only cites Diaz 2004 in passing, by grep)
- Momot, Density of rational points on commutative group varieties and small transcendence degree (long version) (conjugation of varieties and Weil restriction, by contents and grep) — https://arxiv.org/pdf/1011.3368
- Habsieger, A few remarks related to the four exponentials conjecture, Publ. Math. Debrecen 70 (2007) 179–194 (summary of abstract: alternants, combinatorial) — https://publi.math.unideb.hu/paper/1156
- Mantova, Involutions on Zilber fields, 2011 (title in zbMATH; model theory)
- Murty and Murty, Transcendental values of class group L-functions I, II (titles in zbMATH)
- Dasgupta 2023; Dasgupta and Kakde 2024, Ranks of matrices of logarithms I, II (titles and search summaries; local grep shows conjugation only in the Galois or CM sense) — https://arxiv.org/pdf/2303.02037
- Fischler 2001, Orbits of logarithms; Kirby, Variants of Schanuel (local; grep for complex conjugation found nothing relevant)
- Bachoc, Serra and Zémor 2017, Vosper in extension fields (local; Theorem 2–3 statements only). Finite fields of prime degree, dim ST = dim S + dim T − 1. Outside this agent's field and not a lead here
- Diaz 1997, Bertrand conjecture paper; Diaz AFST 1996 (titles; Diaz 2007's summary of Prop. 3) — https://www.numdam.org/item/JTNB_1997__9_1_229_0.pdf
- Citation lists for Diaz 2004 (8 citing papers in Semantic Scholar) and Diaz 2007 (1 citing paper): only the Waldschmidt, Butler and Momot papers above plus surveys
- zbMATH title lists for the 18 queries below; none concerns conjugation-stable spaces of logarithm products

## Inaccessible

- Roy, Matrices dont les coefficients sont des formes linéaires, Séminaire de Théorie des Nombres, Paris 1987–88, Progress in Math. 81 (1990), 273–281 — https://link.springer.com/content/pdf/10.1007%2F978-1-4612-3460-9_13.pdf: Publisher copy, not opened (treated as paywalled). The zbMATH title and search summary suggest rank bounds for matrices of linear forms, with no conjugation seen.
- Citers of Waldschmidt's role-of-conjugation paper: Semantic Scholar returned HTTP 429, so this list was not obtained.
- OpenAlex keyword searches and citing lists: Repeated HTTP 429 and a timeout; only the Diaz 2004 citation count (9) came back.

## Queries

- web: Diaz "module d'un logarithme" transcendance conjugaison complexe exponentielles produits de logarithmes matrices rang un
- web: transcendence product of linear subspaces complex conjugation stable subspace logarithms rank one matrices 2x3 modulus algebraic |u| e^u
- web: Guy Diaz transcendance conjecture module logarithme |λ| théorème fort des six exponentielles conjugaison quatre exponentielles fortes
- web: Waldschmidt complex conjugation four exponentials rational functions of u unit circle bar u = rho/u linear subspace products
- web: Roy Matrices dont les coefficients sont des formes linéaires
- web: recent progress strong four exponentials complex conjugation modulus logarithm 2020..2026
- web: arXiv transcendence modulus of logarithm of algebraic number absolute value Diaz conjecture
- web: "conjugaison complexe" transcendance exponentielles nombres complexes de module algébrique espace vectoriel stable matrice 2 x 3
- web: Habsieger A few remarks related to the four exponentials conjecture
- web (extended): Diaz Utilisation de la conjugaison complexe cited, strong six exponentials, u bar u algebraic new theorem
- web: transcendence 1, u, bar u linearly independent, products logarithms six exponentials, u bar u algebraic exp(u)
- zbMATH: "complex conjugation" & transcendence; "conjugaison complexe" & transcendance; exponentielles & logarithmes & conjugaison; au:Diaz, Guy & cc:11J81; "four exponentials"; "six exponentials"; "quatre exponentielles"; "six exponentielles"; "strong four exponentials"; matrices & "linear forms in logarithms" & rank; "products of logarithms"; "produits de logarithmes"; "rank one" & logarithms & matrices & transcendence; "linear subspaces" & products & transcendence & exponential; "Schanuel" & "complex conjugation"; transcendence & "conjugation" & "logarithms"; "complex conjugate" & "logarithms of algebraic numbers"
- arXiv API: all:"six exponentials"; all:"four exponentials"; all:"strong six exponentials"; "linear forms in logarithms" AND conjugation; Schanuel AND "complex conjugation"
- HAL API: conjugaison complexe transcendance logarithmes; exponentielles module logarithme transcendance (0 hits, possibly a query-syntax effect)
- Semantic Scholar: citations of DOI 10.5802/jtnb.459 and 10.5802/jtnb.592; keyword searches (mostly 429)
- local grep across the sources library: conjugation near subspace or stable; pencil, pinceau, progression; |u|; sous-espace
