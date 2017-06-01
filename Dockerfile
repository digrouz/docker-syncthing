FROM alpine:latest
LABEL maintainer "DI GREGORIO Nicolas <nicolas.digregorio@gmail.com>"

### Environment variables
ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm' 

### Install Application
RUN apk upgrade --no-cache && \
    apk add --no-cache --virtual=run-deps \
	  syncthing \
      su-exec && \
    rm -rf /tmp/* \
           /var/cache/apk/*  \
           /var/tmp/*
    
# Expose volumes
VOLUME ["/config"]

# Expose ports
EXPOSE 8384 
EXPOSE 22000
EXPOSE 21027/udp

### Running User: not used, managed by docker-entrypoint.sh
#USER syncthing

### Start syncthing
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["syncthing"]
