# `ls` command - List current directory files

## Default `ls` command without flags

Input:

```sh
ls
```

Output:

```sh
DEMO_DIR  demo_file
```

## Including hidden starting with `.`

Input:

```sh
ls -a # or -all
```

Output:

```sh
. .. .hidden DEMO_DIR  demo_file
```

## hidden files except "." (current dir) and ".." (previous dir)

Input:

```sh
ls -A # or --almost-all
```

Output:

```sh
.hidden_file DEMO_DIR  demo_file
```

## Long list format

- Shows file type, permissions, "amount of hard links", owner, group, size(bytes), date, file.

Input:

```sh
ls -l
```

Output:

```sh
drwxr-xr-x  3 alex alex 4096 Feb 18 21:39 DEMO_DIR
-rw-r--r--  1 alex alex 7130 Feb 19 03:12 demo_file
```

## Combination of flags

- `-l`: Long list
- `-A`: All files (incl hidden) except implied . and ..
- `-t`: Sort by time, newest first.
- `-h`: Human readable format (size in kb)

Input:

```sh
ls -lAth
```

Output:

```sh
-rw-r--r--  1 alex alex 7.0K Feb 19 03:12 demo_file
drwxr-xr-x  8 alex alex 4.0K Feb 19 03:05 .hidden
drwxr-xr-x  3 alex alex 4.0K Feb 18 21:39 DEMO_DIR
```
