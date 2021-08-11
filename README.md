[![auto-update-workflow](https://github.com/digrouz/docker-syncthing/actions/workflows/auto-update.yml/badge.svg)](https://github.com/digrouz/docker-syncthing/actions/workflows/auto-update.yml)
[![dockerhub-workflow](https://github.com/digrouz/docker-syncthing/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/digrouz/docker-syncthing/actions/workflows/dockerhub.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/digrouz/syncthing)

# docker-syncthing
Install Syncthing into a Linux container

![syncthing](https://syncthing.net/img/logo-horizontal.svg)

## Tag
Several tag are available:
* latest: see alpine
* alpine: [Dockerfile_alpine](https://github.com/digrouz/docker-syncthing/blob/master/Dockerfile_alpine)

## Description

Syncthing replaces proprietary sync and cloud services with something open, trustworthy and decentralized. 
Your data is your data alone and you deserve to choose where it is stored, if it is shared with some third party and how it's transmitted over the Internet.

https://syncthing.net

## Usage
    docker create --name=syncthing  \
      -v <path to data folder>:/home/syncthing/Sync  \
      -v <path to config>:/config   \
      -v /etc/localtime:/etc/localtime:ro   \
      -e DOCKUID=<UID default:10019> \
      -e DOCKGID=<GID default:10019> \
      -p 8384:8384 \
      -p 22000:22000 \
      -p 21027:21027/udp \
    digrouz/docker-syncthing:latest


## Environment Variables

When you start the `syncthing` image, you can adjust the configuration of the `syncthing` instance by passing one or more environment variables on the `docker run` command line.

### `DOCKUID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `10019`.

### `DOCKGID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `10019`.

### `DOCKUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

## Notes
* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e DOCKUPGRADE=1` at container creation.
* gui port: `8384` 
* sync port: `22000`
* discovery port: `21027/udp`

## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-syncthing/issues)
