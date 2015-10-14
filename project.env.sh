#!/usr/bin/env bash

: ${EINTOPF_HOME:=$HOME}

#####
# static path configuration
#####

# general env
INBOX=false
INBOX_PROJECTS_PATH="/projects"
INBOX_PROJECT_PATH="${INBOX_PROJECTS_PATH}/$PROJECT_DIR"
INBOX_CONFIGS_PATH="/vagrant/configs"
INBOX_CONFIG_PATH="${INBOX_CONFIGS_PATH}/$CONFIG_DIR"

OUTBOX_PROJECTS_PATH="${EINTOPF_HOME}/eintopf"
OUTBOX_PROJECT_PATH="${OUTBOX_PROJECTS_PATH}/$PROJECT_DIR"
OUTBOX_CONFIGS_PATH="${EINTOPF_HOME}/.eintopf/default/configs"
OUTBOX_CONFIG_PATH="${OUTBOX_CONFIGS_PATH}/$CONFIG_DIR"

# current env
PROJECT_PATH="$OUTBOX_PROJECT_PATH"
CONFIG_PATH="$OUTBOX_CONFIG_PATH"
if [ -d "/vagrant" ]; then
  INBOX=true
  PROJECT_PATH="$INBOX_PROJECT_PATH"
  CONFIG_PATH="$INBOX_CONFIG_PATH"
fi

#####
# helper functions
#####

# helper for inbox commands
callInbox () {
    if [ -z "$1" ]; then
        echo "Command is zero length"
        return 1
    fi

    if [ -z "$2" ]; then
      _CWD="$INBOX_CONFIG_PATH"
    else
      _CWD="$2"
    fi

    if [ "$INBOX" = true ]; then
      cd "$_CWD" && ${1}
      return $?
    else
      echo "call inbox: vagrant ssh -c \"cd $_CWD && $1\""
      cd "$OUTBOX_CONFIGS_PATH"
      vagrant ssh -c "cd $_CWD && $1"
      return $?
    fi

    return 0
}
