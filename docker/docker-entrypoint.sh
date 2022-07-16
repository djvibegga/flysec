#!/bin/sh

/usr/sbin/nginx

while sleep 60; do
  echo "working" > /dev/null
done

exec "$@"
