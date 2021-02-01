#!/bin/sh

set -euo pipefail

[ ! -r /config/supervisord.conf ] && cp /defaults/supervisord.conf /config/supervisord.conf
[ ! -r /config/rtorrent.rc ] && cp /defaults/rtorrent.rc /config/rtorrent.rc
[ ! -r /config/nginx.conf ] && cp /defaults/nginx.conf /config/nginx.conf
[ ! -r /config/htpasswd ] && cp /defaults/htpasswd /config/htpasswd

[ ! -r /config/.session ] && mkdir -p /config/.session
[ ! -r /data/.watch ] && mkdir -p /data/.watch

chown -R $PUID:$PGID /config /data/.watch
exec "${@}"
