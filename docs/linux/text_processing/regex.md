# Regex in Linux

## Symbols

### Anchors

| Symbol | Meaning                                  |
| ------ | ---------------------------------------- |
| `^`    | Start of string/line                     |
| `$`    | End of string/line                       |
| `\b`   | Check if between `\w` & `\W` or other way|
| `\B`   | If not between `\w` & `\W` or other way  |

### Quantifiers

| Symbol | Meaning                                  |
| ------ | ---------------------------------------- |
| `*`    | **0 or more** times                      |
| `+`    | **1 or more** times                      |
| `?`    | **0 or 1** time (optional)               |
| `{n}`  | Exactly n times                          |
| `{n,}` | At least n times                         |
| `{n,m}`| Between n and m times                    |

### Character Classes

| Symbol | Meaning                                  |
| ------ | ---------------------------------------- |
| `.`    | Any character except newline             |
| `s`    | Whitespace                               |
| `S`    | Non-whitespace                           |
| `\w`   | Any word character `[a-zA-Z0-9_]`        |
| `\W`   | Whitespace: `space`, `\t`, `\n`, punctuation: `.,!?-`, special symbols: `@#£€¥$%^&*+=/\()[]{}<>:;'"|~`, |
| `\d`   | Digit                                    |
| `\d`   | Non-digit                                |

### Sets / Ranges

| Symbol | Meaning                                  |
| ------ | ---------------------------------------- |
| `[abc]`   | Any character in the set              |
| `[^abc]`  | Any character not in the set          |


### Groups

| Symbol | Meaning                                  |
| ------ | ---------------------------------------- |
| `(abc)`   | Capture group                         |
| `(?:abc)` | Non-capturing group                   |

### Logic Operator

| Symbol | Meaning                                  |
| ------ | ---------------------------------------- |
| `a|b`  | OR (alternative)                         |

### Special Characters

| Sequence | Meaning                         |
| -------- | ------------------------------- |
| `\n`     | Newline                         |
| `\r`     | Carriage return                 |
| `\t`     | Tab                             |
| `\v`     | Vertical tab                    |
| `\f`     | Form feed                       |
| `\0xxx`  | Octal escape, e.g. `\012`       |
| `\xhhhh` | Hexadecimal escape, e.g. `\x41` |

## Escape Character

### Common Escape Sequences

```
\.  \*  \+  \?  \{  \}  \[  \]  \|  \(  \)  \^  \$
# or (i need to escape 2x becouse my shell eats one "\")
\\.  \\*  \\+  \\?  \\{  \\}  \\[  \\]  \\|  \\(  \\)  \\^  \\$
```

### Characters that must be escaped INSIDE [ ... ]

```
-  ]  \
```

### Characters that must be escaped OUTSIDE [ ... ]

```
.  *  +  ?  { }  [ ]  |  ( )  ^  $ 
```

### Characters that DO not need escaping INSIDE [ ... ]

```
.   *   +   ?   |   (   )   {   }   $ 
```