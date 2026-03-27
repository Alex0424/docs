# Groups

## Add Group

Add ubuntu user to group docker

```sh
usermod -aG docker ubuntu
```

Flags:

`-a`: --append                  append the user to the supplemental GROUPS

`-G`: --groups GROUPS           new list of supplementary GROUPS

## Validate

Validate that the user has been added to the group:

```sh
tail -2 /etc/group
```

```sh
alex:x:1000:
docker:x:988:ubuntu
```
