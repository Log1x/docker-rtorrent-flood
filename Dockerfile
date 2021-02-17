FROM alpine:edge

ENV PUID="${PUID:-1000}"
ENV PGID="${PGID:-1000}"

RUN \
  apk add -U --no-cache \
    git \
    mediainfo \
    nginx \
    nodejs \
    nodejs-npm \
    openssl \
    py3-setuptools \
    rtorrent \
    su-exec \
    supervisor \
    unrar \
    xmlrpc-c-dev \
  && rm -rf /var/cache/apk/* /tmp/*

RUN \
  npm install --global flood \
    npm cache clean

RUN \
  addgroup -g ${PGID} torrent \
    && adduser -G torrent -D -u ${PUID} torrent

COPY   rootfs /
RUN    mkdir -p /run/nginx
RUN    chmod +x /usr/local/bin/*
EXPOSE 3000 3001 49184 49184/udp
VOLUME /data /config

LABEL description "rTorrent with Flood"

ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/config/supervisord.conf"]
