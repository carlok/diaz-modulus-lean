# Entry 15, strategy: translation

## Target, as restated by the searcher

Let L be the Q-space of logarithms of non-zero algebraic numbers and L~ = Qbar + Qbar L. Look for any published model or metatheorem of this type: a Q-subspace L' of C (or an abstract analogue) that contains L, is closed under the statements of Baker, Hermite-Lindemann, Gel'fond-Schneider, six exponentials, four exponentials in transcendence degree one and (relatively) Roy's strong six exponentials, and contains u != 0 with u*conj(u) algebraic. The specific model is L_u = L + Qu + Q conj(u), with u on a circle and transcendental over Q(L~). The consequence is that these theorems, used only as membership properties of (L, L~), cannot prove Diaz's conjecture that |u| algebraic and u != 0 imply e^u transcendental. Translated: an exceptional element adjoined to the logarithm space that keeps the known transcendence statements true and creates an element with algebraic modulus, or equivalently a pair u, v of 'logarithms' with uv algebraic. In exponential-field language, this is a structure with counterexamples to the Schanuel property confined to a finite-dimensional base, in which the classical theorems still hold.

## Leads

### Lead 1: analogue only

- **Citation:** M. Bays, J. Kirby, Pseudo-exponential maps, variants, and quasiminimality, Algebra & Number Theory 12:3 (2018), 493-549; arXiv:1512.04262v3
- **Location:** Section 9.2, 'Incorporating a counterexample to Schanuel's conjecture' (p. 37 of the arXiv version)
- **Quote:** soft methods which ignore transcendental number theory and analytic considerations cannot hope to work
- **Link:** https://arxiv.org/pdf/1512.04262
- **Relation:** Closest find, and the same kind of statement: an explicit model containing an exception, used as a barrier. They build exponential fields M(F_base) from any finitely generated partial exponential field with standard kernel, with Schanuel failing inside a finite-dimensional Q-space and holding over it. The barrier they draw is against categoricity arguments for Schanuel. They do not mention Baker, Gel'fond-Schneider, six exponentials, conjugation or modulus, so it does not reach the part not found. See notes for an unverified sketch of my own that would specialise it.

### Lead 2: analogue only

- **Citation:** J. Kirby, Finitely presented exponential fields, Algebra & Number Theory 7:4 (2013), 943-980; arXiv:0912.4019v4
- **Location:** Section 9, 'Transcendence problems', Theorem 9.2 and the discussion after it (pp. 33-35 of the arXiv version)
- **Quote:** P cannot be true in any exponential field
- **Link:** https://arxiv.org/pdf/0912.4019
- **Relation:** A metatheorem on transcendence statements and models, in the opposite direction: a statement false in the freely constructed B0 holds in no exponential field unless vacuously. It uses the four exponentials conjecture as its example. It says nothing about a model satisfying known theorems while a conjecture fails, and it does not treat conjugation.

### Lead 3: analogue only

- **Citation:** D. Roy, Interpolation formulas and auxiliary functions, J. Number Theory 94 (2002), 248-285
- **Location:** Introduction, pp. 249-250, and Section 8
- **Quote:** the hopes in this direction are limited
- **Link:** https://doi.org/10.1006/jnth.2000.2595
- **Relation:** A barrier against a method: the auxiliary-function construction aimed at the four exponentials conjecture is essentially optimal. It is analytic and quantitative, and it concerns auxiliary functions, not membership properties of a set, so it is not a model of the formal properties. It is complementary to the target, whose barrier explicitly excludes arguments through exponential values. A secondary remark in arXiv:1011.3368 Section 1 reads it as saying the conjecture cannot be proved with Schneider's method.

### Lead 4: analogue only

- **Citation:** V. Mantova, Involutions on Zilber fields, Rend. Lincei Mat. Appl. 22 (2011), 237-244 (announcement); full proof in arXiv:1109.6155v2
- **Location:** Theorems 1.1 and 1.2 of the arXiv version; modulus defined as sqrt(z sigma(z)) in the section on real and imaginary parts
- **Quote:** automorphisms of order two analogous to complex conjugation
- **Link:** https://arxiv.org/abs/1109.6155
- **Relation:** Supplies conjugation and modulus on pseudo-exponential fields, but those fields satisfy Schanuel. Diaz's conjecture therefore holds in them, and they contain no exceptional element. This is the opposite of a barrier. It is listed only because it is the printed ingredient missing from the Bays-Kirby model.

## Notes

**Result: no find.** Nothing I read states L_u, or any set containing the logarithms that is closed under these theorems and has an element of algebraic modulus. Nor did I find a metatheorem saying these theorems, as membership properties, cannot prove Diaz's conjecture. All four leads are analogues.

**Time.** Started 15:54:33; last clock reading 16:04:08, with a few more calls after it. This was well inside the 30-minute box. I stopped because returns had dried up and the scholarly indexes were rate-limited, so coverage is weaker than the box allowed.

**Translations tried**

1. *Exponential fields* gave the only real traction.
   - Bays-Kirby Section 9.2 is the closest printed statement: a model with planted Schanuel exceptions, used explicitly as a barrier.
   - The other nearby papers are Kirby 2013 Section 9, Kirby's variants survey (a hypothetical e, pi dependence) and Viale. None of them treats Baker-type statements as properties of the model.
2. *Products of subspaces and Riemann-Roch.* The Roy clause reads as follows: V in F, W = V + Ku + K/u inside F(u), so W lies in L(0 + infinity) over F. A 2x3 product in W then has divisor constraints. BCZ, Couvreur-Zémor and Bachoc-Serra-Zémor study dim S^2 or dim ST when the product is small. They never prescribe a target space of the form V + Ku + K/u, or ask whether adjoining a transcendental preserves 'no product'. Analogue only, not listed as a lead.
3. *Scrolls and rank index.* Rank-index and syzygy-scheme papers concern quadrics on a curve over a field. The target is a model statement over K smaller than F, and only the Roy clause touches this dictionary. Nothing reaches the barrier.
4. *Weak Schanuel and Ax.* Kirby's weak Schanuel, and Bays-Kirby-Wilkie on exponentially transcendental powers, give genericity properties of the same flavour. Neither gives a closed set with an exceptional element.

**Two follow-ups (my own, neither is in print nor verified)**

(a) Bays-Kirby specialisation. Take F_base generated by tau, algebraically independent u, and v = rho/u, with exp(u) and exp(v) algebraic.
- Their predimension over the base gives: elements independent modulo D_base are algebraically independent over the base.
- Baker, Hermite-Lindemann and Gel'fond-Schneider for the logarithm set of M(F_base) then seem to reduce to linear independence of 1, tau, u, 1/u over Qbar.
- If the six exponentials clause and the base-field cases also hold, this would be a stronger barrier than Theorem D in one respect: it comes with a full exponential function, and so removes the caveat 'membership only'. It would hold for the pair u, v with uv algebraic.
- It has no conjugation, though, and Mantova's involution construction is printed only for genuine Zilber fields. Diaz's proofs use conjugation essentially, so the gap matters.
- I checked only the Baker step on paper. The six exponentials clause needs the same base-field case analysis as Roy's clause in the target. I also did not check that this F_base meets their standard-kernel and division-sequence requirements.

(b) p-adic transfer. Brumer, Mahler and the p-adic six exponentials theorem give Baker-type properties for p-adic logarithms, and C_p is abstractly isomorphic to C, so the image of those logarithms would satisfy some clauses. I found no printed use of this as a barrier, and the conjugation clause would not obviously survive.

**Nearby results.** Diaz 2004 and 2007 and Waldschmidt 2005 state the conjecture and the conditional implications. In the keyword-located passages I read, they make no barrier remark. Citers of Diaz 2004 found through Semantic Scholar show no barrier by title. Butler 2017 is among them, and I did not read it for this question.

**Not settled**
- zbMATH was not searched (TLS failure on the API).
- OpenAlex cited-by data was unavailable.
- Mantova Section 4 and Roy Section 8 were not read in full.
- Several local files were covered by keyword only, so a French phrasing outside my keyword list could be missed.
- The journal details for Kirby 2013 and the Mantova announcement come from memory or search listings, not a check against the page.
- I did not record the author of arXiv:1011.3368.

## Read

- Bays-Kirby, Pseudo-exponential maps, variants, and quasiminimality — https://arxiv.org/pdf/1512.04262: Abstract; Section 9.2 in full; other mentions of counterexample and conjugate
- Kirby, Finitely presented exponential fields — https://arxiv.org/pdf/0912.4019: Section 9 through the start of the periods discussion; the passage on automorphisms and conjugation at the end of Section 6
- Roy, Interpolation formulas and auxiliary functions (local library copy): Abstract; introduction passage on four exponentials; opening of Section 8; Section 7 obstruction passages. Section 8 not read to the end.
- Mantova, Involutions on Zilber fields — https://arxiv.org/pdf/1109.6155: Abstract; Theorems 1.1 and 1.2; modulus definition; contents list. Section 4 ('involuntary restriction on sigma') seen only as a contents entry.
- Waldschmidt, The role of complex conjugation in transcendental number theory (local library copy): Passages around Conjecture 5.2 (Diaz's conjecture); searched for p-adic and Zilber, no hits
- Diaz 2007, Produits et quotients de combinaisons linéaires de logarithmes (local library copy): Passages on C(|u|) and Conjecture (M), and the 'hors de portée' lines; no barrier remark in those passages
- Diaz 2004, Utilisation de la conjugaison complexe (local library copy): Keyword passages only (limits, reach); closing remark that analysis plays a limited role
- Kirby, Variants of Schanuel's conjecture (local library copy): Proposition 1.6 passage on a hypothetical e, pi dependence; Baker mention
- Dasgupta, Ranks of matrices of logarithms I (local library copy): Keyword passages on 'purely' and 'formal'; Masser's theorem is the only purely algebraic statement found
- Bachoc-Couvreur-Zémor 2018, Towards a function field version of Freiman's theorem (local library copy): Section 2 motivating examples on K(x); genus-zero remark
- Couvreur-Zémor 2024 (local library copy): Introduction, Riemann-Roch and genus-zero passages
- arXiv:1011.3368, Density of rational points on commutative group varieties and small transcendence degree — https://arxiv.org/pdf/1011.3368: Section 1 passages on Schneider's method and the Roy citation

## Screened only

- M. Viale, Forcing the truth of a weak form of Schanuel's conjecture (Newton preprint NI15087) — https://api.newton.ac.uk/website/v0/events/preprints/NI15087
- Kirby, Exponential algebraicity in exponential fields (weak Schanuel) — https://arxiv.org/pdf/0810.4285
- Bays, Kirby, Wilkie, A Schanuel property for exponentially transcendental powers — https://ar5iv.arxiv.org/html/0810.4457
- Kirby, Macintyre, Onshuus, The algebraic numbers definable in various exponential fields — https://arxiv.org/pdf/1101.4224
- Kirby, A note on the axioms for Zilber's pseudo-exponential fields — https://arxiv.org/pdf/1006.0894
- Aslanyan, Henderson, Kamsma, Kirby, independence relations on exponential fields (APAL 2023) — https://eprints.whiterose.ac.uk/200481/1/1-s2.0-S0168007223000453-main.pdf
- Jung, Moon, Park, On the rank index of projective curves of almost minimal degree — https://arxiv.org/pdf/2411.17494
- Bachoc, Serra, Zémor, Revisiting Kneser's theorem for field extensions — https://arxiv.org/pdf/1510.01354
- Bachoc, Serra, Zémor, An analogue of Vosper's theorem for extension fields — https://www.math.u-bordeaux.fr/~cbachocb/articles/Vosper.pdf
- Sidman, Smith, determinantal presentation of sufficiently ample line bundles — https://arxiv.org/pdf/0910.2424
- Pila-type four exponentials paper, Publ. Math. Debrecen 2008 (Schneider's method, conjectural non-example) — https://publi.math.unideb.hu/paper/1328/download/10_5486_PMD_2008_4212.pdf
- Semantic Scholar citers of Diaz 2004: Butler (Ramanujan J. 2017), Waldschmidt 2005 (two papers), Waldschmidt on periods 2006, Diaz 2007, Waldschmidt on Ramachandra 2003, by title — https://doi.org/10.5802/jtnb.459
- Dasgupta, Ranks of matrices of logarithms I (arXiv abstract view) — https://arxiv.org/abs/2303.02037
- Waldschmidt, The Four Exponentials Problem and the Schanuel Conjecture; Hyderabad Variations; Open Diophantine Problems (keyword check for barrier and Schneider's method, no hit) — https://webusers.imj-prg.fr/%7Emichel.waldschmidt/articles/pdf/FourExponentialsSchanuel.pdf
- Wikipedia, Schanuel's conjecture (its remark that the pseudo-exponential method cannot prove Schanuel; secondary, not used) — https://www.wikipedia.org/wiki/Schanuel%27s_conjecture
- Local library keyword sweep over about 128 text files for barrier, formal consequence, cannot prove, exotic, algebraic modulus, Zilber, pseudo-exponential

## Inaccessible

- zbMATH Open API: TLS certificate verification failed from this machine (self-signed certificate in chain); I did not bypass it, so no zbMATH queries ran
- OpenAlex API — https://api.openalex.org: HTTP 429 and 503 on almost every call, including the cited-by query for Diaz 2004; only two DOI lookups succeeded
- arXiv API keyword queries: Most AND-queries returned 0 hits, then HTTP 429; web search and direct PDF fetches were used instead
- Semantic Scholar keyword search: HTTP 429; only the citations endpoint for Diaz 2004 answered
- core.ac.uk copy of Kirby 2013 — https://core.ac.uk/download/77029254.pdf: HTTP 403; the arXiv version was read instead

## Queries

- model of transcendence theorems: exotic logarithm set closed under Baker, Gel'fond-Schneider, six exponentials, cannot prove conjecture, barrier, abstract logarithms
- Zilber pseudo-exponential field involution conjugation real closed, algebraic modulus, Mantova Involutions on Zilber fields
- Diaz conjecture e^u |u| algebraic modulus unit circle, limitation of known methods
- linear analogue Kneser Vosper product of subspaces, transcendental extension, generic element, 2 by 3, Bachoc Serra Zémor
- Schanuel property abstract exponential field satisfies known transcendence theorems; Lindemann-Weierstrass, Baker axioms; independence from formal properties, Kirby
- exponential field Schanuel property, four exponentials, Gelfond-Schneider, Baker holds in pseudo-exponential field, known theorems as axioms
- rational normal curve quadrics rank 3, rank index, 1-generic matrix, syzygy scheme, determinantal presentation, product of subspaces of polynomials
- Waldschmidt complex conjugation transcendence unit circle algebraic |u|, Baker does not suffice
- relativized transcendence, generic set of logarithms, Ax-Schanuel, generic transcendental preserves Lindemann-Weierstrass
- barrier in transcendence theory, relativization; model satisfying six exponentials but violating four exponentials
- Kirby Macintyre Onshuus algebraic numbers definable in exponential fields, automorphism, complex conjugation
- exponential field not satisfying Schanuel but satisfying Lindemann-Weierstrass, E-field with algebraic exponential of a transcendental element, D'Aquino Macintyre Terzo
- Bays Kirby soft methods Schanuel counterexample exp(1) tau algebraically dependent
- Diaz 2004 conjugaison complexe citers, recent papers on e^u with algebraic modulus
- spaces of Laurent polynomials, products of subspaces, span of 1, x, 1/x, Hopf lemma, Riemann-Roch, Kneser in function fields
- logarithms extended by a transcendental element; L + Qu model where Baker holds; set of logarithms properties
- mathoverflow barriers in transcendental number theory, formal obstruction model
- p-adic analogue Baker Brumer six exponentials, isomorphism C_p and C, conjugation has no p-adic analogue
- partial exponential field with prescribed Schanuel failure, Kirby strong extension, Baker analogue
- Local keyword sweep of the Diaz sources library: barrier, formal consequence, algebraic modulus, Zilber, exotic, does not suffice
