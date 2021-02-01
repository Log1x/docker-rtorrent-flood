#!/bin/sh

set -euo pipefail

[ ! -r /data/.watch ] && mkdir -p /data/.watch
[ ! -r /data/.session ] && mkdir -p /data/.session

[ ! -r /config/supervisord.conf ] && cp /defaults/supervisord.conf /config/supervisord.conf
[ ! -r /config/rtorrent.rc ] && cp /defaults/rtorrent.rc /config/rtorrent.rc
[ ! -r /config/nginx.conf ] && cp /defaults/nginx.conf /config/nginx.conf
[ ! -r /config/htpasswd ] && cp /defaults/htpasswd /config/htpasswd

[ -r /data/.session/rtorrent.lock ] && rm -f /data/.session/rtorrent.lock

chown -R $PUID:$PGID /config /data/.watch /data/.session
exec "${@}"
