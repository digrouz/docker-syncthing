# docker-alp-syncthing
Install Syncthing into a Linux container

![syncthing](https://syncthing.net/images/logo-horizontal.svg)

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
      digrouz/docker-alp-syncthing


## Environment Variables

When you start the `syncthing` image, you can adjust the configuration of the `syncthing` instance by passing one or more environment variables on the `docker run` command line.

### `DOCKUID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `10019`.

### `DOCKGID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `10019`.

## Notes

* The docker entrypoint will upgrade operating system at each startup.
* gui port: `8384` 
* sync port: `22000`
* discovery port: `21027/udp`

