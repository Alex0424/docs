# Containerization

## What are containers?

Containers share the host operating system kernel but run in isolated user spaces, which makes them lightweight, portable, and consistent across environments.

## Why Containerize?

### Scenario

- Multi tier application stack
- Running on VM's
- Regular Deployment
- Continuous Changes

### Problem

- High CapEx & OpEx
- Resource wastage
- Human errors in deployment
- Not portable, environments are not in sync: DEV, QA, STAGING, and PROD
- Not compatible with microservice architecture

### Solution

- Switch to containers
- Consumes low resource
- Suits well for microservice design
- Deployment via images
- Same container images across environments
- Reusable & Repeatable

### How? - Workflow

1. Build/customize multiple docker images with Dockerfiles
2. Test with "Docker Compose"
3. Push docker image to a image registry

## Docker Instructions/Commands

- [Image](./docker/image.md)
- [Container](./docker/container.md)
- [Storage](./docker/storage.md)
- [Dockerfile](./docker/docker_file.md)
- [Multistage Dockerfile](./docker/multistage_dockerfile.md)
- [Docker Hub](./docker/hub.md)
- [Docker Registries](./docker/registries.md)
- [Compose](./docker/compose.md)
