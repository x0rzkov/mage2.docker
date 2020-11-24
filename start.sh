#!/bin/bash

set -e

message() {
  echo ""
  echo -e "$1"
  seq ${#1} | awk '{printf "-"}'
  echo ""
}

dockerRefresh() {
   if [[ $(uname -s) == "Darwin" ]]; then
    osxExtraPackages
    rePlaceInEnv "false" "SSL"
    if ! [[ -x "$(command -v mutagen)" ]]; then
      message 'Error: mutagen is not installed.' >&2
      exit 1
    fi
    message "mutagen compose up -d"
    mutagen compose up -d
  else
    if ! [[ -x "$(command -v docker-compose)" ]]; then
      message 'Error: docker-compose is not installed.' >&2
      exit 1
    fi
    message "docker-compose up -d;"
    docker-compose up -d
  fi
}

dockerRefresh
