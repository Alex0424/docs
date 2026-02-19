# Disk Space

## df

### Space Usage

```sh
df -h # --human-readable
```

### Inode Usage

```sh
df -i # --inodes
```

## lsof

Return total amount of files/sockets/descriptors:

```sh
lsof | wc -l
```
