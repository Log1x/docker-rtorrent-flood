#!/bin/sh

export TERM="xterm"

trap "kill $PID" HUP INT TERM
su-exec $PUID:$PGID npm --prefix /usr/local/flood run start &
su-exec $PUID:$PGID rtorrent -n -o import=/config/rtorrent.rc "$@"
PID=$!
wait $PID
