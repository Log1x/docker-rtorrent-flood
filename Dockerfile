FROM alpine:edge

ENV PUID="${PUID:-1000}"
ENV PGID="${PGID:-1000}"

RUN \
  apk upgrade --no-cache \
    && apk add -U --no-cache \
      su-exec \
      supervisor \
      git \
      nginx \
      openssl \
      nodejs \
      nodejs-npm \
      unrar \
      rtorrent \
      xmlrpc-c-dev \
      mktorrent \
      mediainfo \
  && ln -s /usr/bin/mktorrent /usr/local/bin/mktorrent \
  && ln -s /usr/bin/mediainfo /usr/local/bin/mediainfo \
  && rm -rf /var/cache/apk/* /tmp/*

RUN \
  npm install --global flood

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
