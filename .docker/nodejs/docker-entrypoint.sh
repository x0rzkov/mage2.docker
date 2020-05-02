#!/bin/sh

set -e

mainConfig() {
    if [[ $(grep -c $1 /etc/passwd) == 0 ]]; then
        adduser \
        --disabled-password \
        --gecos "" \
        --home "$2" \
        "$1"
    fi
}

mainConfig ${USER} ${WORKDIR_SERVER}
tail -f /dev/null