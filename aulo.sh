aulo() {
    OPTIONS_LIST="$HOME/aulo/options.txt"

    check_option_exists() {
        # Check that the entered option exists in options.txt

        OPTION=$1

        if [ -z "$(cat $OPTIONS_LIST | awk '{print $1}' | grep -- $CMD)" ]; then
            # OPTION doesn't exist
            >&2 echo aulo: $OPTION: option does not exist
            return 0
        fi
    }

    if [[ $1 == "-c" || $1 == "--create" ]]; then
        # create an OPTION

        bash $HOME/aulo/create.sh $@ 

    elif [[ $1 == "-d" || $1 == "--delete" ]]; then
        # deletes an OPTION

        bash $HOME/aulo/delete.sh $@

    elif [[ $1 == "-r" || $1 == "--rename" ]]; then
        # renames an OPTION

        bash $HOME/aulo/rename.sh $@

    elif [[ $1 == "-h" || $1 == "--help" ]]; then
        # print help instructions

        bash $HOME/aulo/help.sh

    elif [[ $1 == "-l" || $1 == "--list" ]]; then
        # list all OPTIONS
        cat $OPTIONS_LIST

    elif [[ $# -eq 1 ]]; then
        # search and cd into OPTION directory

        cd "$($HOME/aulo/search.sh $1)" || echo "aulo: failed to cd into $target_line"

    fi
}
