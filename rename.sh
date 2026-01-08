#!/bin/bash

# Rename an OPTION's command.
#
# Input:
#     $2 / OLD_CMD = old name of the OPTION's command
#     $3 / NEW_CMD = new name of the OPTION's command

OLD_CMD=$2
NEW_CMD=$3

OPTION_LIST="$HOME/aulo/options.txt"

if [ -z "$(cat $OPTION_LIST | awk '{print $1}' | grep -- $OLD_CMD)" ]; then
    # OLD_CMD doesn't exist
    >&2 echo aulo: $OLD_CMD: command does not exist
    exit 0
fi

DIR=$(grep $OLD_CMD $OPTION_LIST | awk '{print $3}')

aulo -d $OLD_CMD
aulo -c $NEW_CMD $DIR
