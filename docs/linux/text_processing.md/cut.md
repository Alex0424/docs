# [Cut](https://www.gnu.org/software/coreutils/manual/html_node/cut-invocation.html#cut-invocation)

## Cut by Delimiter (-d) and Field (-f)

```shell
echo 'hello new world' | cut -d ' ' -f 2-3
```

Output:

```shell
new world
```

## Indexing by Character (-c)

```shell
echo 'hello new world' | cut -c [7-9]
```

Output:

```shell
new
```