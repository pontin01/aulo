#!/bin/bash

curr_path="$(readlink -f "${BASH_SOURCE[0]}")"
echo $curr_path

if [[ "$curr_path" != $(dirname "$curr_path") ]]; then
    # move ./aulo/ to $HOME
    mv $(dirname "$curr_path") "$HOME" 2>/dev/null
fi

# create symlink
ln -s "$HOME/aulo/aulo.sh" "$HOME/.local/bin/aulo" 2>/dev/null
chmod a+x "$HOME/aulo/aulo.sh"
chmod a+x "$HOME/.local/bin/aulo"

# add aulo.sh to .bashrc
echo >> ~/.bashrc
echo "# aulo" >> ~/.bashrc
echo "source ~/aulo/aulo.sh" >> ~/.bashrc
