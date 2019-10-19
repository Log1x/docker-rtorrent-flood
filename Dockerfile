FROM alpine:edge

ENV PUID="${PUID:-1000}"
ENV PGID="${PGID:-1000}"

RUN \
  apk upgrade --no-cache \
    && apk add -U --no-cache \
      su-exec \
      supervisor \
      make \
      gcc \
      build-base \
      nginx \
      openssl \
      python \
      nodejs \
      nodejs-npm \
      unrar \
      rtorrent \
      mktorrent \
      mediainfo \
  && ln -s /usr/bin/mktorrent-borg /usr/local/bin/mktorrent \
  && ln -s /usr/bin/mediainfo /usr/local/bin/mediainfo \
  && rm -rf /var/cache/apk/* /tmp/*

RUN \
  mkdir -p /usr/local/flood \
    && cd /usr/local/flood \
  && wget -qO- https://github.com/jfurrow/flood/archive/master.tar.gz | tar xz --strip 1 \
    && cp config.template.js config.js \
  && npm install \
    && npm cache clean --force \
    && npm run build \
    && npm prune --production \
  && rm -f config.js

COPY   rootfs /
RUN    chmod +x /usr/local/bin/*
EXPOSE 3000 3001 49184 49184/udp
VOLUME /data /config

LABEL description "rTorrent with Flood"

ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/config/supervisord.conf"]
