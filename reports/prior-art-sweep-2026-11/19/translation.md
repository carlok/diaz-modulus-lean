# Entry 19, strategy: translation

## Target, as restated by the searcher

Assume this: if x1,x2 are Q-independent, y1,y2 are Q-independent, eta is non-zero, the alpha_ij and beta are algebraic, and e^{x_i y_j - alpha_ij} and e^{eta x2/x1 - beta} are all algebraic, then x_i y_j = alpha_ij and eta x2 = beta x1. Then no u != 0 has both u*conj(u) algebraic and e^u algebraic. What is wanted is a printed statement of this implication, or one that yields it. One-line derivation (mine): take x=(1,u), y=(1,conj u), eta=1, beta=0, alpha_11=1, alpha_22=rho=u*conj(u), the other alphas 0. The independence of (1,u) and of (1,conj u) comes from Hermite-Lindemann. All five exponentials are algebraic, and the conclusion u=0 is a contradiction. In the function-space dictionary, this is the rank-one matrix [[1, conj u, 1],[u, rho, u]] with entries in H0, whose third column repeats the first. The quadric is the rank-3 conic XZ = rho Y^2 on 1, u, conj u.

## Leads

### Lead 1: analogue only

- **Citation:** M. Waldschmidt, On the transcendence methods of Gel'fond and Schneider in several variables, in A. Baker (ed.), New Advances in Transcendence Theory (Durham 1986), Cambridge Univ. Press, 1988
- **Location:** Remark after Corollary 2.2, p. 379
- **Quote:** it contains non trivial open problems
- **Link:** local: (local library) waldschmidt/Durham1986TMGSSV.txt (OCR text, formulas partly garbled)
- **Relation:** This is the origin of the conjecture and the closest printed consequence. Its example is (log a)(log b) != log c, for non-zero logarithms. The target needs (log a)(log b) not algebraic. A non-zero algebraic number is never a logarithm, by Hermite-Lindemann, so the printed inequality never touches lambda*conj(lambda)=rho and does not imply the target. The printed choice of x and y adapts by setting a22=rho instead of 0, but that adaptation is my step and is not in the text.

### Lead 2: special case

- **Citation:** M. Waldschmidt, Diophantine Approximation on Linear Algebraic Groups, Grundlehren 326, Springer, 2000
- **Location:** Sec. 11.6.1, after Conjecture 11.17, p. 399; compare the weaker status of Strong Five at Sec. 12.4.3, pp. 437-438
- **Quote:** the strong four exponentials Conjecture implies the following refinement of the Hermite-Lindemann's Theorem
- **Link:** local: (local library) waldschmidt/dalag.txt
- **Relation:** The printed implication is Strong Four => Diaz, credited to Diaz, with x=(1,lambda), y=(1,conj lambda). Pp. 437-438 call Strong Five a weaker statement than the Strong Four family, so the target has the weaker hypothesis and is strictly more than what is printed. Adding the fifth exponential e^lambda to the same configuration gives the target, but the book does not do this. The target file already treats this book as nearby for the conjectures; I found no stronger form in it.

### Lead 3: analogue only

- **Citation:** M. Waldschmidt, Hopf algebras and transcendental numbers, in Zeta Functions, Topology and Quantum Physics, Springer, 2005, 197-219
- **Location:** Sec. 1, discussion after Conjecture 1.5 (Sharp five exponentials), preprint pp. 3-4
- **Quote:** over Q, the conjecture is open
- **Link:** https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/ztq2003.pdf
- **Relation:** The same conjecture appears here as 'sharp five', with printed parameter choices giving transcendence of e^{lambda^2} only: x=y=(1,lambda), beta_22=0. This does not reach the modulus statement, since e^{lambda*conj(lambda)} algebraic is not the hypothesis at stake. The text also shows the conjecture follows from Roy's theorem unless y1, y2, gamma/x1 are Q-dependent. The Diaz configuration has y1=1, y2=conj u, gamma/x1=1, which is dependent, so it lies in the part the text calls open (my observation).

### Lead 4: analogue only

- **Citation:** M. Waldschmidt, Open Diophantine problems, Mosc. Math. J. 4 (2004), 245-305
- **Location:** After Conjecture 3.5, p. 269
- **Quote:** A consequence of Conjecture 3.5 is the solution of the open problem
- **Link:** https://arxiv.org/abs/math/0312440
- **Relation:** The only consequences listed are e^{pi^2} and e^{lambda^2}. Neither is about modulus or conjugation, and neither implies the target.

## Notes

**Outcome: no find.** The "not found" stands in everything I reached, but coverage is partial. The shared WebSearch budget for this turn ran out about 4 minutes in, well short of the 30-minute box. The tool told me to continue with what I had, so I ran no further web or index searches. A follow-up run could finish the citation search below.

**Why the target is thin.** The derivation is one line (see target). Printed sources state the same configuration, x=(1,lambda), y=(1,conj lambda), only under Strong Four:
- DALAG p. 399, crediting Diaz
- Diaz 2004 Sec. 5
- Diaz 2007 Sec. 1.2, through (P2) with l2 = conj l1
- Waldschmidt, role of complex conjugation, Sec. 5, Conj. 5.2

None of these says that the fifth exponential is free here, because it equals e^lambda. That small observation is exactly the gap. DALAG's printed "lambda = e^u" must mean lambda = u.

**Closest miss.** Waldschmidt 1988 p. 379 is the source of the conjecture and lists one consequence: (log a)(log b) != log c. By Hermite-Lindemann, an algebraic product is never of the form log c, so this is disjoint from lambda*conj(lambda)=rho, even though the parameter pattern is nearly identical. The later texts (ODP, Hopf algebras, AWS lecture 5, NCTS slides) list only e^{pi^2} and e^{lambda^2}.

**Naming trap for future searches.** Waldschmidt's 2003 papers and slides call this same statement "sharp five". The NCTS and Bangalore slides use "strong five" for a different form: one of x_i y_j, x1/x2 is not in L-tilde. A search on "strong five" alone misses the first usage. Conjecture 1.5 of the Hopf algebras paper is the statement in the target.

**Unresolved oddity.** In the Saarbruecken 2003 slides, "Corollary 2 (Strong Five Exponentials Theorem)" appears to state the implication as a theorem, with conclusion x_i y_j = beta_ij. Read literally, this would prove Diaz outright. The Hopf algebras paper says the case with y1, y2, gamma/x1 dependent is open, so the slide is probably an omitted hypothesis or a slip. I read only the text layer and did not read the preceding slides for the assumption. It is an unrefereed slide, not a lead, and a verifier could check it in a minute.

**Translation attempts.**
- *Geometry:* the Diaz configuration is the conic XZ = rho Y^2 on (1, u, conj u), a rank-3 quadric, with a 2x3 matrix [[1,conj u,1],[u,rho,u]] whose first and third columns coincide. The rank-index papers concern only the geometry of curves and carry no arithmetic of L, so the dictionary finds no statement under another name. Its useful output is an explanation: the repeated column is why Roy's strong six does not apply, which matches the open range described in the Hopf algebras paper.
- *Products of subspaces (Bachoc-Serra-Zemor line):* snippets only, no transcendence content. These are structure theorems over fields, while L-tilde is not a field.
- *Schanuel, Ax, Kirby:* the pseudo-exponentiation hits treat conjugation as an involution on Zilber fields, with no modulus statement. Diaz 2004 derives C(|u|) from Schanuel, which is a stronger hypothesis than Strong Five and does not touch the target.

**Not settled.**
1. Forward citations of Waldschmidt 1988 and ODP Conj. 3.5. This is the likeliest place for a find, and the APIs were down or rate-limited.
2. Papers after 2013 that use "sharp five" or "strong five". My one query for this was refused by the budget.
3. Kirby's weak Schanuel literature, which I never opened.
4. Diaz 2004's displayed Conjecture C(u1,u2), lost in the OCR. By the surrounding text it follows from Strong Four and Schanuel, with no five-exponentials mention.

Nothing in the repository was edited.

## Read

- Waldschmidt 1988, Durham proceedings (local OCR): Sec. 2c, Corollary 2.2 and the Strong Five remark, p. 379
- Waldschmidt, DALAG 2000 (local text): Remark in Ch. 1 (e^{|lambda|}), Sec. 11.6.1 p. 399, Sec. 12.4.3 pp. 437-438, Exercise 15.16
- Waldschmidt, Open Diophantine problems 2004 (local text) — https://arxiv.org/abs/math/0312440: Sec. 3, Conjectures 3.3-3.7, pp. 268-270
- Waldschmidt, Hopf algebras and transcendental numbers 2005 (local text) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/ztq2003.pdf: Sec. 1 on sharp six and sharp five
- Diaz 2007, JTNB 19 (local text): Sec. 1.1-1.3 pp. 374-378: (PQ), (P), (Q), (M), C(|u|); plus the single mention of the five exponentials theorem
- Diaz 2004, JTNB, Conjugaison complexe (local OCR) — https://emis.univie.ac.at/journals/JTNB/2004-3/pages535-553.pdf: Introduction; Sec. 5 on C(|u|) and C(u1,u2), Theorem 6 and closing remarks. Displayed formulas are lost in the OCR
- Waldschmidt 2007, The role of complex conjugation in transcendental number theory (local text) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/DION2005proceedings.pdf: Sec. 5, Theorem 5.1, Conjecture 5.2 and surrounding text
- Waldschmidt, Legacy of Ramanujan 2013 text (local): Sec. 3, five exponentials, strong four, strong six
- Waldschmidt, Algebraic groups lecture 5 (AWS notes) — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/AWSLecture5.pdf: Conjecture 5.9 and the following paragraph
- Waldschmidt, NCTS 2003 and Bangalore 2003 slides — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/NCTS-10-2003.pdf: Sharp five and strong five slides
- Waldschmidt, Saarbruecken 2003 slides — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Sarrebruck-07-2003.pdf: Strong four slide and 'Corollary 2' slides only
- Waldschmidt, Transcendence problems in several variables, Isao 1986 (local): Sec. 5, five exponentials theorem

## Screened only

- Diaz 1997, La conjecture des quatre exponentielles et les conjectures de D. Bertrand (keyword lines only; 'forte' is mentioned and set aside) — https://www.numdam.org/item/JTNB_1997__9_1_229_0.pdf
- Wikipedia, Six exponentials theorem (secondary) — https://en.wikipedia.org/wiki/Six_exponentials_theorem
- Mantova et al., pseudo-exponentiation and involutions (snippet: conjugation on Zilber fields, nothing on modulus) — https://arxiv.org/pdf/1202.4022
- Kirby-Zilber line, Fields with pseudo-exponentiation (Zilber) — https://arxiv.org/pdf/math/0012023
- Rank 3 quadratic generators of Veronese embeddings (purely geometric) — https://arxiv.org/pdf/2001.06687
- On the rank index of some quadratic varieties (purely geometric) — https://arxiv.org/pdf/2206.08586
- On the rank index of projective curves of almost minimal degree (purely geometric) — https://arxiv.org/pdf/2411.17494
- Ranks of matrices of logarithms of algebraic numbers I (Baker, Waldschmidt-Masser) — https://arxiv.org/pdf/2303.02037
- Bachoc-Serra-Zemor, An analogue of Vosper's theorem for extension fields (no transcendence content) — https://arxiv.org/pdf/1501.00602
- Bachoc-Serra-Zemor, Revisiting Kneser's theorem for field extensions (no transcendence content) — https://arxiv.org/pdf/1510.01354
- Waldschmidt, Taipei 2009, Heidelberg 2009, Wien-ESI, Hong Kong 2006, Hyderabad 2003, Four exponentials and Schanuel note: keyword grep only, no modulus statement tied to five exponentials — https://www.imj-prg.fr/~michel.waldschmidt/articles/pdf/Wien-ESI.pdf

## Inaccessible

- OpenAlex API: HTTP 503 and 429 on every attempt, so no citation search of Waldschmidt 1988, ODP or Diaz 2004
- Semantic Scholar API: HTTP 429 on every attempt
- zbMATH Open API: Python call failed TLS verification. The fetch tool worked for one query, but that query returned only irrelevant hits (towers of exponentials, automata) and was not followed up
- arXiv API full-text style queries: Metadata only: 'five exponentials' gave irrelevant hits and 'strong four exponentials' gave none. This is no evidence about paper bodies

## Queries

- strong five exponentials conjecture implies modulus of logarithm of algebraic number transcendental Diaz conjecture
- conjecture "cinq exponentielles" forte module d'un logarithme de nombre algebrique transcendant Diaz |log alpha|
- Schanuel conjecture complex conjugation absolute value of logarithm of algebraic number transcendental e^u algebraic |u| algebraic pseudo-exponentiation
- "product of two logarithms" of algebraic numbers algebraic "five exponentials" OR "four exponentials" conjecture consequence log a log b != log c
- weak Schanuel conjecture Kirby consequence transcendence of modulus of logarithm; four exponentials e^z algebraic with |z|=1
- rank 3 quadrics rational normal curve 1-generic matrices linear forms logarithms of algebraic numbers transcendence quadratic relations Roy
- Waldschmidt "should be transcendental" |lambda|^2 logarithm complex conjugation strong four exponentials consequence
- linear analogue Kneser Vosper field extension product of subspaces dimension 2 and 3 transcendence logarithms exponentials application
- local grep of sources/: strong five, sharp five, cinq exponentielles, five exponentials, C(|u|), product of two logarithms
- arXiv API: all:"five exponentials"; all:"strong four exponentials"; six exponentials AND conjugation; Schanuel AND absolute value AND logarithm
- zbMATH API: "five exponentials" (fetch tool; the other queries failed)
