# Container

## Start

```shell
docker run -d --name <NAME> <IMAGE> # -d for detached mode
```

## Stop

```shell
docker stop <NAME> # graceful
```

```shell
docker kill <NAME> # force
```

## Remove

```shell
docker rm <NAME>
```

## List

```shell
docker ps -a
```

## Visualize Realtime Metrics

```shell
docker stats
```

## Logs

```shell
docker logs <NAME>
``` 