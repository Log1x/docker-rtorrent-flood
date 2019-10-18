#!/bin/sh

export TERM="xterm"

trap "kill $PID" HUP INT TERM
su-exec $PUID:$PGID rtorrent /config/.rtorrent.rc &
su-exec $PUID:$PGID npm --prefix /usr/local/flood run start &
PID=$!
wait $PID
