# [AWK](https://www.gnu.org/software/gawk/manual/gawk.html)

## Fields

```shell
echo hello world | awk '{print $1, $2}'
```

## Matching Pattern

```shell
awk '/error/' file
```

## With Regex as Field Separator

REGEX: `[.\-/ ]` (dot, dash, slash, space)

```shell
echo one.two-three four | awk -F '[.\\-/ ]' '{print $2, $3}'
```