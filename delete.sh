#!/bin/bash

# Deletes an OPTION.
# 
# Input:
#     $2 / CMD = command of the OPTION that will be deleted

CMD=$2
OPTION_LIST="$HOME/aulo/options.txt"

if [ -z "$(cat $OPTION_LIST | awk '{print $1}' | grep -- $CMD)" ]; then
    # OPTION doesn't exist
    >&2 echo aulo: $CMD: command does not exist
    exit 0
fi

# get target line information
target_line_number=$(cat -n $OPTION_LIST | grep -- $CMD | awk '{print $1}')
target_line=$(sed -n "${target_line_number}p" $OPTION_LIST)

# check if selected line is first option
if [ $target_line_number -eq 1 ]; then
    # selected line is first option
    info_before_target=""
else
    info_before_target="$(cat $OPTION_LIST | sed -n '1,$((${target_line_number} - 1))p')"
fi

# delete target line from options.txt
printf "%s" "$info_before_target" > $OPTION_LIST
printf "%s" "$info_before_target" >> $OPTION_LIST
