## Git Tag

Pull the latest changes

```sh
git pull origin main
```

Create a new tag pointing to the latest commit

```sh
git tag -a v0.1.5 -m "Version 0.1.5"
```

Push the tag

```sh
git push origin v0.1.5
```

Delete tag from local repository

```sh
git tag -d v0.1.5
```

Delete the tag remotely

```sh
git push origin --delete v0.1.5
```

Check git tags

```sh
git tag
```
