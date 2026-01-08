#!/bin/bash

curr_path=$(find $HOME -type f -path "*/aulo/aulo.sh" 2>/dev/null)

if [[ "$curr_path" != $(dirname "$curr_path") ]]; then
    # move ./aulo/ to $HOME
    mv $(dirname "$curr_path") "$HOME" 2>/dev/null
fi

# create symlink
ln -s "$HOME/aulo/aulo.sh" "$HOME/.local/bin/aulo" 2>/dev/null
chmod a+x "$HOME/aulo/aulo.sh"
chmod a+x "$HOME/.local/bin/aulo"

source ~/.bashrc
