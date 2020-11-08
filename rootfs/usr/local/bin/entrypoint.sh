#!/bin/sh

set -euo pipefail

# Create directories
[ ! -r /config/db ] && mkdir -p /config/db
[ ! -r /data/.watch ] && mkdir -p /data/.watch
[ ! -r /data/.session ] && mkdir -p /data/.session

# Move default configuration
[ ! -r /config/rtorrent.rc ] && cp /defaults/rtorrent.rc /config/rtorrent.rc
[ ! -r /config/flood.js ] && cp /defaults/flood.js /config/flood.js
[ ! -r /config/supervisord.conf ] && cp /defaults/supervisord.conf /config/supervisord.conf
[ ! -r /config/nginx.conf ] && cp /defaults/nginx.conf /config/nginx.conf
[ ! -r /config/htpasswd ] && cp /defaults/htpasswd /config/htpasswd

# Symlink Flood config
[ -r /usr/local/flood/config.js ] && rm -f /usr/local/flood/config.js
[ -r /config/flood.js ] && ln -s /config/flood.js /usr/local/flood/config.js

# Remove previous session lock
[ -r /data/.session/rtorrent.lock ] && rm -f /data/.session/rtorrent.lock

# Removed /data because this takes FOREVER
chown -R $PUID:$PGID /config /tmp /usr/local/flood
exec "${@}"
