# Archive Commands

## 💾 TAR

**Flags**

- `-c` = create
- `-x` = extract
- `-z` = gzip
- `-v` = verbose
- `-f` = filename
- `-C` = extract into directory

### 💾 Create a `.tar` archive

```shell
tar -cvf archive.tar <file_or_directory>
```

### 💾 Extract a `.tar` archive

```shell
tar -xvf archive.tar -C </target_directory>
```

### 💾 TAR `.tar` file preview

```shell
tar -tvf archive.tar
```

### 🗜️ Create a TAR + GZIP `.tar.gz` archive

```shell
tar -czvf archive.tar.gz <file_or_directory>
```

### 🗜️ Extract a TAR + GZIP `.tar.gz` archive

```shell
tar -xzvf archive.tar.gz -C </target_directory>
```

### 🗜️ TAR + GZIP `.tar.gz` file preview

```shell
tar -tzvf archive.tar.gz
```

## 📃 GZIP `⚠️ only single files ⚠️`

**Flags**

- `-k` = keep file
- `-c` = Write compressed or decompressed data to stdout
- `>` =	Redirect that output into a new file

### 📄 Archive (Compress) to `.gz` file with GZIP

```shell
gzip -k archive.txt
```

💡 or (same result using output redirection):

```shell
gzip -c archive.txt > archive.txt.gz
```

✅ Also keeps the original file.

### 📄 Extract (Decompress) a `.gz` file with GZIP

```shell
gunzip -k archive.txt.gz
```

💡 or (same result using output redirection):

```shell
gunzip -c archive.txt.gz > archive.txt
```

✅ Also keeps the original file.

## 🔗 ✄┈┈┈┈ ZIP

**Flags**

- `-r` = Recursively include directories and files

### 🔗 Create a `.zip` archive

```shell
zip -r archive.zip <file_or_directory>
```

### 🔗 Extract (Unzip) a `.zip` archive

```shell
unzip archive.zip -d </target_directory>
```

### 🔗 Zip file preview

```shell
unzip -l archive.zip
```

## 🔍 Validate file info

```shell
file archive.zip
file archive.tar.gz
file archive.tar
file archive.gz
```