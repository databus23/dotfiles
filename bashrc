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
