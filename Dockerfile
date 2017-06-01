# vim:set ft=dockerfile:
FROM alpine:latest
MAINTAINER DI GREGORIO Nicolas <nicolas.digregorio@gmail.com>

### Environment variables
ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm' 

### Install Application
RUN apk upgrade --no-cache && \
    apk add --no-cache --virtual=run-deps \
      su-exec && \
    rm -rf /tmp/* \
           /var/cache/apk/*  \
           /var/tmp/*
    
# Expose volumes
VOLUME ["/data"]

# Expose ports
EXPOSE 80
EXPOSE 443

### Running User: not used, managed by docker-entrypoint.sh
#USER syncthing

### Start syncthing
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["syncthing"]
