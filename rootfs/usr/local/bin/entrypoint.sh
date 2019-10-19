#!/bin/sh

set -euo pipefail

# Create directories
[ ! -r /config/db ] && mkdir -p /config/db
[ ! -r /config/ssl ] && mkdir -p /config/ssl
[ ! -r /data/.watch ] && mkdir -p /data/.watch
[ ! -r /data/.session ] && mkdir -p /data/.session

# Move default configuration
[ ! -r /config/rtorrent.rc ] && cp /defaults/rtorrent.rc /config/rtorrent.rc
[ ! -r /config/flood.js ] && cp /defaults/flood.js /config/flood.js
[ ! -r /config/supervisord.conf ] && cp /defaults/supervisord.conf /config/supervisord.conf
[ ! -r /config/nginx.conf ] && cp /defaults/nginx.conf /config/nginx.conf

# Symlink Flood config
[ -r /usr/local/flood/config.js ] && rm -f /usr/local/flood/config.js
[ -r /config/flood.js ] && ln -s /config/flood.js /usr/local/flood/config.js

# Generate self-signed certificate
if [ ! -r /config/ssl/cert.pem ] || [ ! -r /config/ssl/key.pem ]
then
    openssl req -x509 -newkey rsa:4096 \
    -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=localhost" \
    -keyout /config/ssl/key.pem \
    -out /config/ssl/cert.pem \
    -days 3650 -nodes -sha256
fi

# Remove previous session lock
[ -r /data/.session/rtorrent.lock ] && rm -f /data/.session/rtorrent.lock

chown -R $PUID:$PGID /data /config /tmp /usr/local/flood /var/lib/nginx
exec "${@}"
