# System-wide .bashrc file for interactive bash(1) shells.
# $Id: //depot/ops/corp/puppet/goobuntu/desktop/hardy/stable/modules/shell/files/bash.bashrc#1 $

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
PS1="\[\e[32;1m\]\h\[\e[30;1m\]:\[\e[34;1m\]\w\[\e[30;1m\]$\[\e[0m\]\[\e]2;\w\a\] "

# enable bash completion in interactive shells
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

# Eclipse settings
export ECLIPSE_MEM_START=1024m
export ECLIPSE_MEM_MAX=2048m
export ECLIPSE_PERM_SIZE=128m
export ECLIPSE_MAX_PERM_SIZE=256m


#############
## CLINT   ##
#############

PATH=$PATH:$HOME/Desktop/dart/dart-sdk/bin:'/Applications/Android Studio.app/sdk/tools'

# Convenience setup for "cd" command.
CDPATH=".:~:$HOME/Desktop:$HOME/perforce-src:$HOME/ws"

alias cy="ssh clintyang@clintyang2.mtv.corp.google.com"
export cy="clintyang@clintyang2.mtv.corp.google.com"
alias sb="source $HOME/.bashrc"
alias vb="vi $HOME/.bashrc"
alias ll="ls -l"
alias lh="ls -lh"
alias lc="ls --color"

alias notes="vi $HOME'/Google Drive/MacBookAir/note/notes.md'"
export note="$HOME/Google Drive/MacBookAir/note"

export drive="$HOME/Google Drive/MacBookAir"
