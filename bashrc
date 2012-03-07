# Load RVM if it is installed, try user then root install.
if [[ -s "$rvm_path/scripts/rvm" ]] ; then
  source "$rvm_path/scripts/rvm"

elif [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  true ${rvm_path:="$HOME/.rvm"}
  source "$HOME/.rvm/scripts/rvm"

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  true ${rvm_path:="/usr/local/rvm"}
  source "/usr/local/rvm/scripts/rvm"
fi

export EDITOR=/usr/bin/vim

PATH=$HOME/bin:$PATH

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s autocd

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#ls coloring
case `uname -s` in
 Darwin)
  export LSCOLORS=Gxfxcxdxbxegedabagacad
  export CLICOLOR=true
  ;;
 *)
esac

alias reload='source ~/.bashrc'

# use .bashrc_local for settings specific to one system
if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi
