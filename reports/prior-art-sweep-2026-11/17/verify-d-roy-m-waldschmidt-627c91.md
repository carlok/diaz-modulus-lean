# Entry 17, verification: D. Roy, M. Waldschmidt,

- **Source read:** D. Roy, M. Waldschmidt, Proc. Japan Acad. Ser. A 71 (1995), 151-153, Theorem 2, p. 151. Read from local scan missions/diaz/sources/roy-waldschmidt-1995-quadratic-relations.pdf, page image checked. The given link https://projecteuclid.org/download/pdf_1/euclid.pja/1195510604 did not yield the PDF from here (a 1054-byte HTML stub, then 403).
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "contained in a vector subspace of C^n which is defined over Q"

**Hypotheses.** Field: printed P in Q[X] (no bar; zoomed page image) and subspace defined over Q. My three P are rational, so this matches. Dimension: n=3. Conjugation: not involved. Genericity: Theorem 2 needs transcendence degree exactly 1; this holds under the assumed rationality, since t^2 lies in Q(pi^2) and pi is transcendental. Coordinates: t, i*pi and i*gamma/pi all lie in L. Difference: the target is not stated in these terms. Theorem 2 is only announced in 1995, with a sketch given only for Theorem 1. The same statement is Theorem 0.2 of Roy-Waldschmidt, Ann. ENS 30 (1997), p. 755; I checked that page image and located its proof in section 7 without checking the proof.

**Explanation.** Theorem 2 is there. The target's numbers are not printed, but all three statements follow. Put z=i*pi.

Uniqueness: let a=t0^2+pi^2, b=t1^2+pi^2 be rational and suppose t0^2 != t1^2, so a != b, with a,b>0. Then P=bX^2-aY^2+(a-b)Z^2 has rank 3 and vanishes at (t0,t1,z).

Boundary: let c=t^2+pi^2, t != 0, gamma != 0, and suppose w=i*gamma/pi lies in L. Then P=gamma X^2-gamma Z^2+cZW vanishes at (t,z,w), since zw=-gamma. Its rank is 3 because c>0.

Conclusion for both: the transcendence degree is 1. A rank-3 quadric in C^3 contains no plane, so Theorem 2 gives a rational line through the point. Hence t0=r*i*pi (or t=r*i*pi) with r rational. Real against imaginary forces r=0, so the t vanishes. In the uniqueness case that makes pi^2 rational, which is false; in the boundary case it contradicts t != 0.

Pair: log 3 != ±log 2, so uniqueness applies.

No Baker or Gelfond-Schneider is needed. The argument is mine, not printed.
