#!/bin/bash
set -e
#DOCKER_NETWORK=$(/sbin/ip route|awk '/default/ { print $3 }')

#if [ "$(ls -A /tmp)" ]; then
#    syncthing -generate="/syncthing" &&\
#        exec syncthing -home="/syncthing"
#else
exec syncthing -home="/syncthing"
#fi
