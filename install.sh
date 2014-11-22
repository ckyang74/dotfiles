#!/usr/bin/env bash

# To install, run ./install.sh (must run under this directory)
#
# It iterates over filenames that start with underscore and create symlink to dot files.
# For example,
# _vimrc --> $HOME/.vimrc

# Creates the symlinks
function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
        mv $target $target.df.bak
	      echo "Moved original to: $target.df.bak"
    fi

    ln -sf "${source}" ${target}
    echo "Installed: $target"
}

# Removes the symlinks and restores the original
function unlink_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    # If target is symlink there's original, remove symlink and restore original
    if [ -e "${target}.df.bak" ] && [ -L "${target}" ]; then
      unlink ${target}
      echo "Removed symlink: $target"

      mv $target.df.bak $target
      echo "Removed symlink: $target"
    fi
}

if [ "$1" = "restore" ]; then
    for i in _*
    do
        unlink_file $i
    done
    exit
else
    for i in _*
    do
        link_file $i
    done
fi

#git submodule update --init --recursive
#git submodule foreach --recursive git pull origin master

# setup command-t
#cd _vim/bundle/command-t
#rake make
