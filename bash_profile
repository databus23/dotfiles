# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

PS1='\u@\h:\w\$ '
export TITLEBAR='\[\033]0;\u@\h:\w \007\]'

PS1="$TITLEBAR$PS1"
export EDITOR=/usr/bin/vim

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
