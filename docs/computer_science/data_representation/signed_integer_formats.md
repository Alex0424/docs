# Signed Number Formats - How Computers Represent Negative Numbers

## Two's Complement (the standard)

```
+5  = 0000 0101
invert → 1111 1010
add +1 → 1111 1011   (this is –5)
```

most significant bit (MSB) = sign bit (0 = positive, 1 = negative)

Why its GOOOOOOOD:

- Only one representation of zero: `0000 0000`
- Addition and subtraction are the same for signed and unsigned numbers
- Simplifies hardware design

## One's Complement (old, mostly obsolete, avoid)

```
+5  = 0000 0101
invert → 1111 1010   (this is –5 in one's complement)
```

Problem:

- Two representations of zero: `+0 = 0000 0000` `–0 = 1111 1111`
- Addition requires "end-around carry"

Use cases:

- Not used in modern computers

## Signed Magnitude

```
sign = 1
value = 000 101
→ 1000 0101
```

Problems:

- Two representations of zero: `+0 = 0000 0000` `–0 = 1000 0000`
- Addition/subtraction is more complex in hardware

Use cases:

- Used today only in floating point formats (for the sign bit)