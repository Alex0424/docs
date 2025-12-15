# Image

## Download

Pull an image from a registry, example: [Docker Hub](https://hub.docker.com/)

```shell
docker pull <NAME>:<TAG>
```

## Remove

Remove an image from local machine

```shell
docker rmi <NAME>:<TAG>
```

## List

List all images on local machine

```shell
docker images
```

## Rename

Create a copy and rename an image on local machine

```shell
docker tag <OLD_NAME>:<OLD_TAG> <NEW_NAME>:<NEW_TAG>
```