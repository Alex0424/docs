# Docker Compose

## Description

A Docker Compose file is similar to Vagrant with multiple VMs defined in a Vagrantfile, but it is used for Docker to configure and run multiple containers as microservices.

## Commands

Start all services defined in compose.yaml

```sh
docker compose up
```

Stop all services

```sh
docker compose down
```

Show logs from all services

```sh
docker compose logs
```

List status from all services

```sh
docker compose ps
```

## Compose file example

compose.yaml

```yaml
services:
  vprodb:
    build: 
      context: ./Docker-files/db
    image: alexanderla/vprofiledb
    container_name: vprodb
    ports:
      - "3306:3306"
    volumes:
      - vprodbdata:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=vprodbpass

  vprocache01:
    image: memcached
    ports:
      - "11211:11211"

  vpromq01:
    image: rabbitmq
    ports:
      - "5672:5672"
    environment:
      - RABBITMQ_DEFAULT_USER=guest
      - RABBITMQ_DEFAULT_PASS=guest

  vproapp:
    build:
      context: ./Docker-files/app
    image: alexanderla/vprofileapp
    container_name: vproapp
    ports:
      - "8080:8080"
    volumes:
      - vproappdata:/usr/local/tomcat/webapps

  vproweb:
    build: 
      context: ./Docker-files/web
    image: alexanderla/vprofileweb
    container_name: vproweb
    ports:
      - "80:80"

volumes:
   vprodbdata: {}
   vproappdata: {}
```
