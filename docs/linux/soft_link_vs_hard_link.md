# 'Soft Link'/'Symbolic Link'/Symlink vs Hard Link - What is the differences?

## Soft Link

- Soft link is a refference to a file.
- Whatever is added in symlink file (child) or the child file will be added to parent file.
- If parent file is removed then the child file content be unavailable.

```sh
$ echo version_1 > demo_file_1
$ ln -s demo_file_1 demo_file_2 # demo_file_2 will be created as soft link file type
$ ls -lA
-rw-r--r--. 1 alex alex  30 Feb 18 14:04 demo_file_1
  lrwxrwxrwx. 1 alex alex  11 Feb 18 13:59 demo_file_2 -> demo_file_1
# /\
# symbolic link type

$ cat demo_file_1
version_1
$ cat demo_file_2
version_1

$ echo version_2 >> demo_file_1
$ echo version_3 >> demo_file_2

$ cat demo_file_1
version_1
version_2
version_3

$ cat demo_file_2
version_1
version_2
version_3

$ rm demo_file_1
$ cat demo_file_2
cat: demo_file_2: No such file or directory # Symlink rely on parent file
```

## Hard Link

- Refferences same data across all files that are linked together

```sh
$ echo version_1 > demo_file_1
$ ln demo_file_1 demo_file_2 # demo_file_2 will be created as hard link type file
$ ls -lA
-rw-r--r--. 2 alex alex 10 Feb 18 14:29 demo_file_1
-rw-r--r--. 2 alex alex 10 Feb 18 14:29 demo_file_2
#           /\
#    amount of hard links

$ cat demo_file_1
version_1
$ cat demo_file_2
version_1

$ echo version_2 >> demo_file_1
$ echo version_3 >> demo_file_2

$ cat demo_file_1
version_1
version_2
version_3

$ cat demo_file_2
version_1
version_2
version_3

$ rm demo_file_1
$ cat demo_file_2 # hardlink does not rely on other linked files 
version_1
version_2
version_3
```
