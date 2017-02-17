#!/usr/bin/env bash

set -ue

DOCKER=${DOCKER_CMD:-$(command -v docker)}
APP_DIR="/app"
USER="-u=$UID:`id -g $UID`"

${DOCKER} run -it ${USER} -v $(pwd):${APP_DIR} gradle
