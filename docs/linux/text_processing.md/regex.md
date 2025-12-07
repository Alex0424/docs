# Regex in Linux

| Symbol | Meaning (short)                          |
| ------ | ---------------------------------------- |
| `.`    | Any single character                     |
| `*`    | Repeat **0 or more** times               |
| `+`    | Repeat **1 or more** times               |
| `?`    | **0 or 1** (optional)                    |
| `{ }`  | Exact or range quantifier `{m}`, `{m,n}` |
| `[ ]`  | Character class (one character from set) |
| `\|`    | OR (alternative)                        |
| `( )`  | Grouping / capture                       |
| `^`    | Start of string/line                     |
| `$`    | End of string/line                       |

## Escape Character

```
\.  \*  \+  \?  \{  \}  \[  \]  \|  \(  \)  \^  \$
# or (i need to escape 2x becouse my shell eats one "\")
\\.  \\*  \\+  \\?  \\{  \\}  \\[  \\]  \\|  \\(  \\)  \\^  \\$
```

## Characters that must be escaped INSIDE [ ... ]

```
-  ]  \
```

## Characters that must be escaped OUTSIDE [ ... ]

```
.  *  +  ?  { }  [ ]  |  ( )  ^  $ 
```

## Characters that DO not need escaping INSIDE [ ... ]

```
.   *   +   ?   |   (   )   {   }   $ 
```