#!/usr/bin/env bash

#####
# change this part for your own configuration
#####
PROJECT_DIR="${PWD##*/}" # start path for all project dev sources (default to last part of path)

####


. ./project.env.sh
if ! [ -d "$PROJECT_PATH" ]; then
    mkdir -p ${PROJECT_PATH}
fi

####
# implement you own cli wrapper
####

xcompose () {
    cd "$CONFIG_PATH" && docker-compose $@
}

if [ "$INBOX" != true ]; then
  xcompose () {
      callInbox "PROJECT_PATH=${INBOX_PROJECT_PATH} docker-compose $@"
  }
fi