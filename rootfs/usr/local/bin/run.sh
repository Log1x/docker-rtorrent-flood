#!/bin/sh

export TERM="xterm"

trap "kill $PID" HUP INT TERM
exec su-exec $PUID:$PGID rtorrent -n -o import=/config/rtorrent.rc "${@}"
exec su-exec $PUID:$PGID npm --prefix /usr/local/flood run start &
PID=$!
wait $PID
