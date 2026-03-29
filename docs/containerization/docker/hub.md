# Docker Hub

## Publish image to registry

### Requirements

- Docker
- Dockerfile
- Docker Hub Account

### Tutorial

Syntax:

```sh
docker build -t <your-docker-hub-username>/<image-name>:<version> .
```

Example:

```sh
docker build -t alexander/my-app:1.0 .
```

Login:

```sh
docker login
```

Push image:

```sh
docker push <your-docker-hub-username>/<image-name>:<version>
```

Example:

```sh
docker push alexander/my-app:1.0
```
