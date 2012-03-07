[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

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
