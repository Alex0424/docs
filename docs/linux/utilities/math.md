# Math

## Arithmetic Expansion

Pros:

- fast
- performance-critical scripts
- built into Bash

Cons:

- no decimals
- no floating point
- Limited to your system e.g.: 64-bit signed integers (−2⁶³ to 2⁶³−1 or −9,223,372,036,854,775,808 to 9,223,372,036,854,775,807)
- Silent overflow = no warning
- No built-in math functions
- No fractional precision
- no complex math
- no trigonometric functions

```bash
a=5
b=3
echo $(( a + b ))     # addition
echo $(( a - b ))     # subtraction
echo $(( a * b ))     # multiplication
echo $(( a / b ))     # division
echo $(( a % b ))     # modulus
echo $(( a ** b ))    # exponentiation
```

### Increment and Decrement

```bash
n=0                # n by default will be 0 when added to arithmetic expressions, not required, just for demonstration
echo $(( n++ ))    # post-increment
echo $(( ++n ))    # pre-increment
echo $(( n-- ))    # post-decrement
echo $(( --n ))    # pre-decrement
```

### Grouping

```bash
a=2
b=3
echo $(( (a + b) * 4 ))    # prioritizes addition before multiplication
```

### Comparisons

```bash
a=10
b=20
echo $(( a + b > 10 ))     # 1 (true)
echo $(( a + b > 100 ))    # 0 (false)
```

### Binary, Hex, Octal

```bash
echo $(( 2#11111111 ))    # 255 (base 2, binary; range 0–255 has 256 values)
echo $(( 16#FF ))         # 255 (base 16) (hex)
echo $(( 017 ))           # 15 (base 8) (octal)
```

### Random Numbers

```bash
echo $(( RANDOM ))            # random number between 0 and 32767 (15 bit, 2¹⁵ – 1)
echo $(( RANDOM % 100 ))      # random number between 0 and 99
echo $(( RANDOM % 100 + 1 ))  # random number between 1 and 100
```

### Bitwise Operations

```bash
a=5    # 0101 in binary
b=6    # 0110 in binary
```

```bash
echo $(( a & b ))    # Bitwise AND
```

```
   0101    (5)
&  0110    (6)
--------------
   0100    (4)
```

```bash
echo $(( a | b ))    # Bitwise OR
```

```
   0101    (5)
|  0110    (6)
--------------
   0111    (7)
```

```bash
echo $(( a ^ b ))    # Bitwise XOR
```

```
   0101    (5)
^  0110    (6)
--------------
   0011    (3)
```

```bash
echo $(( a << 3 ))   # Left Shift [2ⁿ]
```

```
   0000 0101   (5)
--------------------
   0000 1010   (shift 1)
--------------------
   0001 0100   (shift 2)
--------------------
   0010 1000   (shift 3)
--------------------
   0010 1000   (40)
```

```bash
echo $(( a >> 2 ))   # Right Shift [division by 2ⁿ]
```

```
   0101    (5)
--------------------
   0010    (shift 1)
--------------------
   0001    (shift 2)
--------------------
   0001    (1)
```

```bash
echo $(( ~a ))       # Bitwise NOT (two's complement) [~a = -(a + 1)]
```

```
~   0000 0101    (5)
---------------------
    1111 1010    (-6)
```

## BC; Basic Calculator

Pros:

- good for financial calculations
- math library
- decimals (arbitrary precision, good for currency)

Cons:

- slower than arithmetic expansion
- not built into Bash

### Decimal Numbers

```bash
a=5
b=3
echo "$a / $b" | bc -l          # division with decimal result
echo "scale=2; $a / $b" | bc    # division with 2 decimal digits
```

### Square Root

```bash
echo "sqrt(25)" | bc -l    # 5
```

### Trigonometric Functions

#### SIN

```bash
echo "s(1.5708)" | bc -l    # approximately sin(π/2)
```