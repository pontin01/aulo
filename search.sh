# Switches to the target directory of the LOCATION's command.
#
# Input:
#     $1 / CMD = command of the LOCATION to switch to

CMD=$1
OPTION_LIST="$HOME/aulo/options.txt"

if [ $# -ne 1 ]; then
    # no search term entered
    return 0
fi

if [ -z "$(cat $OPTION_LIST | awk '{print $1}' | grep -- $CMD)" ]; then
    # CMD doesn't exist
    >&2 echo aulo: $CMD: OPTION does not exist
    return 0
fi

DIR=$(grep $CMD $OPTION_LIST | awk '{print $3}')

if [ ! -d "$DIR" ]; then
    # check DIR exists
    >&2 echo aulo: $DIR: directory does not exist
    return 0
fi

target_line=$(grep "^$CMD " $OPTION_LIST | awk '{print $3}')
echo $target_line
