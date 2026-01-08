#!/bin/bash

# Creates a new OPTION.
# 
# Input:
#     $2 / CMD = command used to jump to new directory
#     $3 / DIR = target directory of new OPTION

if [[ $# -ne 3 ]]; then
    # ensure exactly 3 command line arguments
    echo "aulo: invalid command line argument count: expected 3, got $#"
    exit 0
fi

CMD=$2
DIR=$3

if [ ! -d "$DIR" ]; then
    # check DIR exists
    >&2 echo aulo: $DIR: directory does not exist
    exit 0
fi

# add OPTION to options.txt
DIR="${DIR%/}"
gap_size=$(( 12 - ${#CMD} ))
spaces=$(printf "%*s" "$gap_size")
output="${CMD}${spaces}-->     ${DIR}"

echo "$output" >> $HOME/aulo/options.txt
