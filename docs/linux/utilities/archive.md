# Archive Commands

## 💾 TAR

**Flags**

- `-c` = create
- `-x` = extract
- `-z` = gzip
- `-v` = verbose
- `-f` = filename
- `-C` = extract into directory

| Operation | Command |
| --- | --- |
| Create a `.tar` archive | `tar -cvf archive.tar <file_or_directory>` |
| Extract a `.tar` archive | `tar -xvf archive.tar -C </target_directory>` |
| Preview a `.tar` archive | `tar -tvf archive.tar` |
| Create a TAR + GZIP `.tar.gz` archive | `tar -czvf archive.tar.gz <file_or_directory>` |
| Extract a TAR + GZIP `.tar.gz` archive | `tar -xzvf archive.tar.gz -C </target_directory>` |
| Preview a TAR + GZIP `.tar.gz` archive | `tar -tzvf archive.tar.gz` |

## 📃 GZIP `⚠️ only single files ⚠️`

**Flags**

- `-c` = Write compressed or decompressed data to stdout
- `>` =	Redirect that output into a new file

| Operation | Command |
| --- | --- |
| Compress a `.gz` file | `gzip -c archive.txt > archive.txt.gz` |
| Decompress a `.gz` file | `gunzip -c archive.txt.gz > archive.txt` |

## 🔗 ZIP

**Flags**

- `-r` = Recursively include directories and files

| Operation | Command |
| --- | --- |
| Create a `.zip` archive | `zip -r archive.zip <file_or_directory>` |
| Extract a `.zip` archive | `unzip archive.zip -d </target_directory>` |
| Preview a `.zip` archive | `unzip -l archive.zip` |

## 🗜️ 7-ZIP

| Operation | Command |
| --- | --- |
| Create a `.7z` archive | `7z a archive.7z <file_or_directory>` |
| Extract a `.7z` archive | `7z x archive.7z -o<target_directory>` |
| Preview a `.7z` archive | `7z l archive.7z` |

## 🔍 Validate file info

```shell
file $file_path
```