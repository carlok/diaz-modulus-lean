# Entry 18, strategy: own-field

## Target, as restated by the searcher

Let t be a nonzero real with e^t algebraic, and let a, b, c be rationals with a nonzero and a t^2 + b pi^2 = c. Claim: e^{i gamma/pi} is transcendental for every nonzero rational gamma. Specialising to t = log 2 and using Euler's Li_2(1/2) = pi^2/12 - (log 2)^2/2 gives the dichotomy: Li_2(1/2) is irrational, or e^{i gamma/pi} is transcendental for all nonzero rational gamma. Mechanism: under the relation, t^2/(i pi) equals a rational multiple of i/pi plus a rational multiple of i pi, so exp(t^2/(i pi)) is e^{i kappa/pi} times a root of unity, and the question is whether a quotient of the form (logarithm)^2/(logarithm) can again be a logarithm when t and pi are algebraically dependent.

## Leads

### Lead 1: implies

- **Citation:** M. Waldschmidt, Nombres transcendants, Lecture Notes in Mathematics 402, Springer, 1974
- **Location:** Chapter 7, remark right after Corollaire 7.4.3, printed p. 202 (course page 7.20). Page image checked.
- **Quote:** alors l'une au moins des deux propriétés suivantes est vraie
- **Link:** https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/LN402/LN402chap7.pdf
- **Relation:** Printed: for Q-linearly independent logarithms l1, l2 of algebraic numbers, either (i) l1, l2 are algebraically independent or (ii) exp(l1^2/l2) is transcendental. My translation: take l1 = t, l2 = i pi (independent, one real and one imaginary). The relation a t^2 + b pi^2 = c makes them algebraically dependent, so (ii) holds. Now t^2/(i pi) = -i(c/a)/pi + i(b/a) pi, so exp(t^2/(i pi)) is e^{-i(c/a)/pi} times the root of unity e^{i pi b/a}; hence e^{-i(c/a)/pi} is transcendental. If c = 0 this says a root of unity is transcendental, so that case cannot occur. If c is nonzero, a rational power gives every e^{i gamma/pi}. With t = log 2 and Li_2(1/2) = rho rational (rho > 0): (log 2)^2 = pi^2/6 - 2 rho, which is the dichotomy. Li_2 and e^{i/pi} are not printed; the dichotomy shape with general logarithms is. Printing note: the book's choice x = 1 + l2/l1 yields exp(l2^2/l1) while (ii) prints exp(l1^2/l2); the labels are symmetric, so this is harmless.

### Lead 2: implies

- **Citation:** M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191-202
- **Location:** Corollaire 4, p. 192, and the remark right after it. Page image checked.
- **Quote:** deux des quatre nombres log α, log β, log γ, exp(log α log β/log γ)
- **Link:** https://doi.org/10.1016/0022-314X(73)90045-0
- **Relation:** Printed: for algebraic alpha, beta, gamma with log alpha, log gamma and log beta, log gamma each Q-independent, two of the four numbers log alpha, log beta, log gamma, exp(log alpha log beta/log gamma) are algebraically independent. My translation: alpha = beta = e^t, log gamma = i pi. Under a t^2 + b pi^2 = c, the numbers t and pi are algebraically dependent, so the fourth number must be algebraically independent of pi. That number is a root of unity times e^{-i(c/a)/pi}. This gives more than the target: for nonzero rational gamma, e^{i gamma/pi} and pi are algebraically independent; c = 0 is again impossible. The DOI suffix is from memory and was not checked; the local copy is waldschmidt-1973-huitieme-probleme-schneider.pdf.

### Lead 3: generalization

- **Citation:** D. Roy and M. Waldschmidt, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. Sci. ENS (4) 30 (1997), 753-796
- **Location:** Théorème 0.2, p. 755
- **Quote:** contenu dans un sous-espace vectoriel de C^n défini sur Q
- **Link:** https://doi.org/10.1016/S0012-9593(97)89938-3
- **Relation:** Implies the target through my own translation, by a route different from the leads above. Suppose e^{i gamma/pi} is algebraic. Then z = t^2/(i pi) is in L, by the relation. The point (t, i pi, z) lies on the quadric X^2 = YZ, with coordinates of transcendence degree at most 1. Théorème 0.2 puts the point in a Qbar-subspace contained in that quadric, which is at most a line because the quadratic form has rank 3. Then t/(i pi) is algebraic, contradicting Gelfond-Schneider. The theorem says nothing about Li_2 or 1/pi. The DOI suffix is from memory and was not checked; the local copy is roy-waldschmidt-1997-approximation-diophantienne-logarithmes.pdf.

### Lead 4: analogue only

- **Citation:** D. Roy and M. Waldschmidt, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. Sci. ENS (4) 30 (1997), 753-796
- **Location:** Corollaire 7.4 and the example after it, pp. 792. OCR read; page image not checked.
- **Quote:** si log2 et π sont algébriquement dépendants sur Q
- **Link:** https://doi.org/10.1016/S0012-9593(97)89938-3
- **Relation:** Same hypothesis shape on log 2 and pi, but the conclusion is the transcendence of exp(sqrt((log 2)^2 + pi^2)), a different number. It does not reach e^{i gamma/pi}. I tried Corollaire 7.3: its form needs q(lambda, conjugate lambda) = (lambda')^2, and t^2 = -(i pi) z does not fit because i pi and z are both purely imaginary. Théorème 0.2 is the statement that covers the target.

## Notes

**Result: the \"not found\" is broken in substance.** The dichotomy shape is printed, at the level of general logarithms, in Waldschmidt's 1974 book and in sharper form in his 1973 paper. Neither prints Li₂(1/2), π² or e^{i/π}, so the last step is my own one-line translation.

**Best find: LN402 p. 202, after Cor. 7.4.3.** For Q-independent logarithms ℓ₁, ℓ₂ of algebraic numbers, either ℓ₁, ℓ₂ are algebraically independent or exp(ℓ₁²/ℓ₂) is transcendental.
- Take ℓ₁ = t and ℓ₂ = iπ. The relation at² + bπ² = c is an algebraic dependence, so exp(t²/(iπ)) is transcendental.
- That number equals e^{-i(c/a)/π} times a root of unity.
- c = 0 cannot occur, since the conclusion would make a root of unity transcendental. This agrees with Gelfond-Schneider. So no separate case is needed.
- Rational powers reach every nonzero rational γ.
- At t = log 2 with Euler's identity this is the Li₂(1/2) dichotomy; ρ = Li₂(1/2) > 0, so c ≠ 0 there.

**Stronger form: Waldschmidt 1973, Cor. 4.** With α = β = e^t and log γ = iπ, two of t, iπ, exp(t²/(iπ)) are algebraically independent. Under the relation, t is algebraic over Q(π). So the sharper dichotomy is: Li₂(1/2) is irrational, or e^{iγ/π} and π are algebraically independent for every nonzero rational γ. This is stronger than the target's \"transcendental\", and the target does not list it as nearby. Cor. 4 is a two-line consequence of the W73 Théorème.

**Other results.**
- W73's remark after Cor. 4 gives, for rational r ≠ 0, 1, that e^{iπ^r} or e^{iπ^{2-r}} is transcendental. At r = -1 that is e^{i/π} or e^{iπ³}. This is the closest place the literature prints e^{i/π}-type numbers, but it is a different disjunction.
- LN402 p. 203 prints the same family as e^{π^r} + i e^{π^{2-r}} being transcendental.
- Diaz 2007 prints exp(π²) or exp(1/π). This is an analogue with no log 2, so I did not list it as a lead.
- RW97 Th. 0.2 gives another route to the target. RW97 Cor. 7.4 has a look-alike hypothesis on log 2 and π, but its conclusion is a different number.
- ODP p. 274 only lists Li₂(1/2) as open, as the target says.

**Consistency with Bro74 Cor. 5.** With η = t/π, Cor. 5 gives that exp(t) or exp(i t²/π) is transcendental, the same statement. Bro74 and W73 prove the same theorem independently, as RW97 records. So LN402 and W73 do not add new mathematics beyond the entry's route. They do add a printed statement in dichotomy form, with the hypothesis being algebraic dependence of the two logarithms. That covers any polynomial relation, not only at² + bπ² = c.

**What I could not settle.** I found no source that prints the literal Li₂(1/2) or (log 2)²/π² dichotomy. Absence of that literal form is weak evidence, because OpenAlex and zbMATH were unusable (see inaccessible). The Brownawell 1972 Norske notes were not read. Web search returned nothing literal.

**Checks.** W73 p. 192 and LN402 pp. 202-203 were checked against page images, not only OCR. RW97 statements were read from OCR, with garbled symbols interpreted, and were not checked on the page. The two DOIs for W73 and RW97 are from memory, not verified; the local PDFs are under missions/diaz/sources/. All three are independent of this work, dating from 1973, 1974 and 1997.

**Timing.** Started 16:02, last clock check 16:06:52 CET, well inside the box. I stopped once the find was verified rather than using the full 30 minutes. Page images remain in (temp path)

## Read

- Waldschmidt, Nombres transcendants, LNM 402 (1974), Chapter 7 — https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/LN402/LN402chap7.pdf: Théorème 7.4.1, Corollaires 7.4.2 and 7.4.3 and the following remark, pp. 201-203; historical notes on Shmelev and Brownawell. Pp. 202-203 checked from page images.
- Waldschmidt, Solution du huitième problème de Schneider, JNT 5 (1973): Théorème and Corollaires 1-4 with the remark after Cor. 4, pp. 192-193. P. 192 checked from page image.
- Brownawell, The algebraic independence of certain numbers related by the exponential function, JNT 6 (1974): Theorem and Corollaries 1-7, pp. 22-23
- Roy-Waldschmidt, Approximation diophantienne et indépendance algébrique de logarithmes, Ann. ENS 30 (1997): Théorèmes 0.1 and 0.2, Cor. 1.2 and its remark, Cor. 7.3 and 7.4 (OCR)
- Diaz, Produits et quotients de combinaisons linéaires de logarithmes (2007, local copy diaz-2007-produits-quotients): Introduction; Théorème 3 remarks with exp(pi^2) or exp(1/pi); consequences with exp(pi^2) or exp(pi^3); remark on the Brownawell-Waldschmidt theorem
- Waldschmidt, Diophantine Approximation on Linear Algebraic Groups (2000, local copy dalag): Cor. 15.28, Cor. 15.29, section 15.3.4 Theorem 15.30 and its discussion
- Waldschmidt, Open Diophantine problems, Mosc. Math. J. 4 (2004): Passage listing Li_2(1/2) as not known irrational (no dichotomy stated there)
- Waldschmidt, Independance algebrique ... exponentielle (1971, local copy): Corollaires 1 and 2 only
- Waldschmidt, Four exponentials problem and Schanuel (local copy): Passage on log 2 and pi after Conjecture 1

## Screened only

- Local library grep for 1/pi, exp(pi^2), (log 2)^2, Li_2, algebraically dependent with log 2: Diaz 1989, Diaz 1996 AFST, Diaz 1997, Diaz 2004, Laurent 1991, Roy-Waldschmidt 1995, Waldschmidt 2005 (three papers), MahdiaPeriodes, TranscendencePeriods
- LN402 Chapter 5 (pointer to Brownawell, Gel'fond's method); LN402 bibliography
- A. A. Shmelev, The algebraic independence of certain transcendental numbers, Mat. Zametki 3 (1968), 51-58 (abstract from search listing) — https://geodesic.mathdoc.fr/item/MZM_1968_3_1_a6
- G. V. Chudnovskii, Algebraic independence of some values of the exponential function, Mat. Zametki 15 (1974) (index record only) — https://portal.mardi4nfdi.de/wiki/Item:Q1212967
- arXiv 2609.06895, Three Irrationality Results for the Dilogarithm (search snippet: Li_2(1/2) not among settled cases) — https://arxiv.org/pdf/2609.06895
- Waldschmidt slide decks and surveys in search results (SurveyTrdceEllipt2005, NCTS-10-2003, SchanuelEnVI, DION2005)
- Wikipedia, Four exponentials conjecture (secondary, screened only) — https://wikipedia.com/wiki/Four_exponentials_conjecture

## Inaccessible

- W. D. Brownawell, Some transcendence results for the exponential function; The algebraic independence of certain values of the exponential function, K. Norske Vidensk. Selsk. Skr. (1972): Not opened in this time box; no free copy located. These are likely earlier printings of the same family of statements.
- OpenAlex API: HTTP 429 and 503 throughout, so no OpenAlex sweep was done
- zbMATH Open API: Python urllib failed on certificate verification, which I did not bypass. One query through the fetch tool returned irrelevant hits and I did not pursue it, so there was no real zbMATH sweep.

## Queries

- Li_2(1/2) irrational or e^{i/pi} transcendental algebraic independence log 2 pi dichotomy
- Brownawell 1974 algebraic independence of certain numbers related by the exponential function corollary e^{1/pi} log^2 pi^2
- indépendance algébrique log 2 pi^2 transcendance e^{i/pi} corollaire exponentielles Waldschmidt Diaz produits de logarithmes
- exp(pi^2) transcendental e and pi algebraically independent Brownawell Waldschmidt corollary four exponentials transcendence degree one
- Shmelev algebraic independence values exponential function Mat. Zametki 1968 1974 Gelfond
- e^{1/pi} transcendence open problem periods Kontsevich Zagier log 2 Waldschmidt
- four exponentials consequence: log 2 and pi algebraically dependent, rational relation (log 2)^2 pi^2, Li_2(1/2)
- irrationality of Li_2(1/2) open, implies algebraic independence log 2 and pi
- exp(lambda_1^2/lambda_2) or exp((log 2)^2/pi) transcendental, Brownawell Waldschmidt 1971
- Waldschmidt Nombres transcendants 1974 LN402: logarithmes linéairement indépendants, algébriquement indépendants ou exp transcendant
- Local grep: 1/pi, exp(pi^2), (log 2)^2, Li_2, dépendants, Shmelev, across missions/diaz/sources
- zbMATH ab:"\exp(1/\pi)"
