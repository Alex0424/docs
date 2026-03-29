# Storage

## Volumes

- Managed by Docker
- Isolated
    - Non-Docker processes on the host should not modify this data
- Portable
    - Easy to back up, migrate, or share volumes between containers
- Better Performance

### Syntax

```sh
docker volume         # list default volume commands
docker volume create <volume-name>
docker volume ls
ls /var/lib/docker/volumes/<volume-name>/_data/ # check files in the volume
```

```sh
docker run --mount type=volume,src=<volume-name>,dst=<mount-path> # preferred
docker run --volume <volume-name>:<mount-path>
```

## Bind Mounts

- User Managed
    - You control exactly where the data sits on your hard drive
Shared Access
    - Both the container and host processes (like your Code Editor or File Explorer) can modify the files simultaneously.


### Syntax

```sh
docker run --mount type=bind,src=<host-path>,dst=<container-path> # preferred
docker run --volume <host-path>:<container-path>
```

## Tmpfs Mounts

- Only available on Linux
- Tmpfs mount is temporary, when container stops, the mount is removed, and files written there won't be persisted
- The data is only stored in the host system's volatile memory (RAM), not HDD or SSD

### Syntax

```sh
docker run --mount type=tmpfs,dst=<mount-path> # preferred
docker run --tmpfs <mount-path>
```
