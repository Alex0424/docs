# Container

## Create and run container

in detached (background) mode

```shell
docker run -d --name <NAME> <IMAGE>
```

Specify Ingress firewall rule for container

```shell
docker run -d -p <external_port>:<internal_port> --name <NAME> <IMAGE>
```

Create container and get inside container bash shell

```shell
docker run -it --name <NAME> <IMAGE> /bin/bash
# or using lightweight shell:
docker run -it --name <NAME> <IMAGE> /bin/sh
```

## Start

```shell
docker start <NAME>
```

## Stop

```shell
docker stop <NAME> # graceful
```

```shell
docker kill <NAME> # force
```

## Restart

```shell
docker restart <NAME>
```

## Remove

```shell
docker rm <NAME>
```

## List

```shell
docker ps -a
```

## Execute

Execute a command on a container

Detached

```shell
docker exec <NAME> <command>
```

Interactive

```shell
docker exec -it <NAME> /bin/bash
```

## Detail of a container

```shell
docker inspect
```

## Visualize Realtime Metrics

```shell
docker stats
```

## Logs

```shell
docker logs <NAME>
```

## Container DIR

Docker container is a process from a directory

```shell
cd /var/lib/docker/containers/ && ls -la
ps -ef | grep <container image name>
```
