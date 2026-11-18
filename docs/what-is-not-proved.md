[← README](../README.md)

## What is *not* proved

Stated plainly, because an adversarial audit found these and a reader
should not have to.

- **The transfer of rank and structural rank is not formalized.** Only the
  matrix-coefficient third of "every assertion transfers" is proved. The
  accompanying note says so explicitly rather than claiming the whole
  transfer.
- **The no-contradiction corollary is not formalized**, being a statement
  about derivations rather than a theorem. What is formalized is what
  makes it true: the transfer, and the existence of the comparison
  point.
- The two analytic obstructions **are now formalized**, as
  `DiazModulus.no_first_order_arithmetic_operator` and
  `DiazModulus.kronecker_factorisation` in `Diaz/Mirror/`: the exponential
  system attached to a candidate admits no first-order arithmetic
  differential operator, and its interpolation matrix on a Cartesian
  lattice factors as a Kronecker product with non-zero determinant.
  Neither needed real analysis in the end. The first is Baker's theorem,
  carried as an explicit hypothesis until Baker's theorem was proved here
  (`no_first_order_arithmetic_operator_unconditional`), plus the fact that a polynomial
  vanishing on `ℤ²` is zero; the second is `Matrix.det_kronecker` and a
  Vandermonde determinant. The first is stated for polynomial
  coefficients, where the note states it for rational functions regular
  on `ℤ²`; clearing denominators is not formalized.

### Caveat on `Exponential.lean`

`Exp0_eq_one_iff` and `Exp0_pow_eq_one_iff` are facts about `2^ℚ`, not
about the model. The only constraints the model puts on a formal
exponential are that it be a homomorphism into the algebraic numbers
commuting with the involution, and those are also met by

```
Exp'(a, b) = exp(2πi(a − b)) · 2^(a+b)
```

whose values are a root of unity times a rational power of two, hence
algebraic, and whose kernel is a rank-one *lattice*. So a lattice kernel
does not by itself escape the model.

