[← README](../README.md)

## Diaz's conjecture

Let `ℒ = {u ∈ ℂ : eᵘ ∈ Q̄ˣ}`, the logarithms of algebraic numbers. Diaz conjectured in 2004 that no non-zero
element of `ℒ` has algebraic modulus. He also asked a question of method: how could the non-holomorphic maps
`z ↦ z̄` and `z ↦ |z|` enter a transcendence proof at all?

The companion note (`tex/`) gives the mathematical account. Every branch of the conjecture is either closed
or reduced to two open statements. Each of the published conjectures above would settle it. The note also
records which methods cannot: in particular, nothing homogeneous on a candidate's own data, and, for a single power through its hull, the strong
six exponentials route stops at `u³`.

### The observation

Suppose `u ≠ 0` has `eᵘ` and `|u|` both algebraic, and put `ρ = u ū`.
Then

```
ū = ρ / u
```

so the conjugate of a candidate is not independent data — it is a
rational function of `u` with algebraic coefficients. Hence `Q̄(u)` is a
rational function field carrying an involution, and complex conjugation
on it is determined by the ring structure rather than being extra
information that might fail to be matched. Consequently no statement
about vanishing of matrix coefficients over `Q̄ ⊕ Q̄u ⊕ Q̄ū` can tell a
candidate apart from an ordinary complex number placed on the same
circle.

An entire style of attack — accumulate algebraic constraints on `u` and
`ū` until they collide — cannot settle the conjecture.

