# [Dockerfile](https://docs.docker.com/reference/dockerfile/)

## Dockerfile Instructions

### ENTRYPOINT vs CMD

#### ENTRYPOINT

It sets the main command to be executed when running the container.

```shell
ENTRYPOINT ["command", "param1", "param2"]
```

You cannot override ENTRYPOINT without `--entrypoint` flag.

#### CMD

It provides default arguments for the ENTRYPOINT or the command to run if no ENTRYPOINT is specified.

```shell
CMD ["command", "param1", "param2"]
```

You can override CMD by providing command line arguments when running the container e.g.:

```shell
docker run my_image othercommand otherparam
```

#### ENTRYPOINT + CMD

Putting them together allows you to set a fixed command with default parameters that can be overridden.

```shell
ENTRYPOINT ["python"]
CMD ["app.py"]
```

```shell
docker run my_image          # will run `python app.py`
docker run my_image other.py # will run `python other.py`
```

### ARG vs ENV

#### ARG

Variables for build-time (only available during build time).

```shell
ARG MY_NAME=Alex
```

#### ENV

Environment variables for runtime (available when container is running).

These environment variables are available during build time and runtime.

```shell
ENV MY_NAME=Alex
```

### From

It specifies the base image for the Dockerfile.

```shell
FROM <IMAGE_NAME>:<TAG>
```

### RUN

Execute commands in a new layer and commit the results.

```sh
RUN <bash command>
```

### LABELS

Adds metadata to an image.

### MAINTAINER

Author of the image.

### COPY

Adds files and folders into image.

### ADD

Download from a link and put in the image (it can even archive and unarchive).

### VOLUME

Creates a mount point and mark it as external mount volume.

### EXPOSE

Active network ports at container runtime (not buildtime).

### [USER](https://docs.docker.com/reference/dockerfile/#user)

Sets the user name (or UID).

### WORKDIR

Set shell spawn location in directory.

### [ONBUILD](https://docs.docker.com/reference/dockerfile/#onbuild)

Adds to the image a trigger instruction to be executed at a later time.

### [SHELL](https://docs.docker.com/reference/dockerfile/#shell)

Set the default shell of an image e.g.: bash or sh.

### [STOPSIGNAL](https://docs.docker.com/reference/dockerfile/#stopsignal)

Defines which signal Docker sends to PID 1 in the container when stopping it.

### [HEALTHCHECK](https://docs.docker.com/reference/dockerfile/#healthcheck)

Tells Docker how to check if a container is still working correctly (healthy).

Syntax:

```
HEALTHCHECK <options> CMD <shell-command>
```

## Create Dockerfile

```shell
touch Dockerfile
```

```Dockerfile
FROM jenkins/jenkins:2.506-slim-jdk17    # use official Jenkins image as base

USER root

RUN apt-get update && apt-get install -y \    # install dependencies
    git \
    maven

USER jenkins

RUN jenkins-plugin-cli --plugins \
    "warnings-ng" \
    "sonar"
```

## Build Image from Dockerfile

```shell
docker build -t <NAME>:<TAG> <PATH_TO_DOCKERFILE>
```
