#!/usr/bin/env bash
set -e
USER="-u=$UID:`id -g $UID`"
docker run -it ${USER} -v ${PWD}:/app gradle
