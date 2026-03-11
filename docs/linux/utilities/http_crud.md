# CRUD HTTP Methods with 🌀 CURL

**Flags**

- `-X` = Request Method
  - `-X GET` = Read data
  - `-X POST` = Create data
  - `-X PUT` = Update or replace data
  - `-X DELETE` = Remove data
  - `-X PATCH` = Partially update data
- `-d` = Sends data in the request body
  - `-d '{"name":"alex","role":"dev"}'`
  - `-d "name=alex&role=dev"`
- `-F` = Upload a file (multipart/form-data)
  - `-F "file=@report.pdf"`
- `-H` = Add custom request **headers**
  - `-H "Content-Type: application/json"`
  - `-H "Authorization: Bearer TOKEN"`
  - `-H "X-Client-Version: 1.2.0"`
- `-v` = Verbose (Show detailed request and response info)
- `-L` = Follow redirects (301 or 302 CODE)
- `-C -` = Resumes partial download
  - `curl -O https://example.com/largefile.zip` → Start download  
  - (If it fails midway...)  
  - `curl -C - -O https://example.com/largefile.zip` → Continue from where it stopped
- `-u user:pass` = Basic Auth

## 🔽 GET (READ)

### 📟 Terminal Output

```shell
curl -X GET https://api.example.com/users
```

### 💾 Download Files

Save with original filename
```shell
curl -O https://example.com/file.txt
```

Save as a specific filename
```shell
curl -o myfile.txt https://example.com/file.txt
```

## ➕ POST (CREATE)

```shell
curl -X POST https://api.example.com/developers \
  -H "Content-Type: application/json" \
  -d '{"name": "Alexander", "role": "DevOps"}'
```

## ✍️ PUT (UPDATE / REPLACE)

### Replace data for user with ID 3

```shell
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{"email": "updated.email@example.com"}' \
  https://crud.ba3a.tech/users/3
```

## ❌ DELETE

```shell
curl -X DELETE https://crud.ba3a.tech/users/3
```

## 🔒 Upload a File with Token Auth

```shell
curl -X POST https://api.example.com/upload \
  -H "Authorization: Bearer $TOKEN" \
  -F "file=@report.pdf"
```

## 🕵️ Debugging

View only headers
```shell
curl -I https://example.com
```

Verbose output (full request/response)
```shell
curl -v https://example.com
```

# 🌐 Download With WGET (easier download tool)

## Save to a directory (prefix)

```shell
wget --https-only -P ./path <URL>
```

## Save to a specific file

```shell
wget --https-only -O ./path/file.txt <URL>
```
