# Swap memory

Is a partition on your 'Hard Disk Drive'/'Solid State Drive' that will store memory when RAM is full. Its much slower than ram but it prevent OOM (Out of Memory) Crashes.

```sh
free -h # Swap
cat /proc/meminfo
```

## Disk Space

### df

```sh
df -h
```

`-h`: human readable

```sh
df -i
```

```sh
lsof | wc -l
```
