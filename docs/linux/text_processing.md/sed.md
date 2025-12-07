# [SED](https://www.gnu.org/software/sed/manual/sed.html)

## Delimiters

- Common delimiters: `/`, `#`, `|`, `@`

| Delimiter | Notes                   |
| --------- | ----------------------- |
| `/`       | default, most common    |
| `#`       | great for paths/URLs    |
| `@`       | readable in scripts     |
| `\|`      | good for nested slashes |
| `:`       | safe everywhere         |
| `~`       | nice visually           |
| `%`       | rarely used but valid   |
| `!`       | valid                   |
| `,`       | valid                   |

## Flags

- `-i` = edit in file (instead of printing content to stdout)

## Replacement Flags

- `/g` = global (all occurrences in line, not just first)
- `//` = replace with nothing

## Replacement Syntax

```
s<delimiter>pattern<delimiter>replacement<delimiter>flags
```

## File Replacement

```shell
sed -i "s/oldtext/newtext/g" filename.txt
```

## String Replacement Example

```shell
echo "hello1x hello2x" | sed 's#hello#bye#g'
```

output: `"bye1x bye2x"`

## Regex

## File Extension Replacement

```shell
echo "filename.tar.gz" | sed 's|\..*||g'
```

output: `"filename"`

## String Strip Example

```shell
echo "   hello world   " | sed 's@^[ ]*@@g' | sed 's@[ ]*$@@g'
```

output: `"hello world"`