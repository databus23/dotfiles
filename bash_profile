# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

PS1='\u@\h:\w\$ '
export TITLEBAR='\[\033]0;\u@\h:\w \007\]'

[ -n "$SSH_CLIENT" ] && PS1="$TITLEBAR$PS1"

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
