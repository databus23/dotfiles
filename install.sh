#!/bin/bash
#set -e

ABSOLUTE_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

while getopts "f" arg; do
  case $arg in
    f)
      FORCE=1
      ;;
  esac
done

fail() {
  echo $1
  exit 1
}

ask_overwrite(){
  local src=$1
  echo -n "File $src already exists. [s]kip,[o]verwrite,[b]ackup? "
  if [ -z "$FORCE" ]; then
    read -n1 choice
  else
    choice=o
  fi
  echo
  case $choice in
    o)
      echo "Removing ${src}"
      rm -rf "$src"
      ;;
    b)
      echo "Creating backup at ${src}.backup"
      mv "$src" "${src}.backup"
      ;;
    *)
      echo "Skipping $src"
      return 1
  esac
}

symlink() {
  local dest=$1
  local src=$2 
  [ !  -e "$dest" ] && fail "Link destination does not exit: $dest"

  #if the source is a symlink, make sure its up-to-date
  if [ -h "$src" ]; then
    local current_dest=$(readlink $src)
    if [ "$current_dest" == "$dest" ]; then
      echo "Symlink ${src} up to date"
      return 0 #nothing to do
    else
      rm $src
    fi
  #if a file or directory exists at the source location, prompt for directions 
  elif [ -f "$src" -o -d "$src" ]; then
    ask_overwrite $src || return 0 # do nothing if ask_overwrite return non-zero
  fi 
  #make sure the parent directory exists
  local parent=$(dirname $src) 
  [ ! -d "$parent" ] && mkdir -p $parent
  #Finally create the damm symlink
  echo "Creating symlink $src -> $dest"
  ln -s $dest $src 
}
#ensure cwd is the root of the dotfile checkout
pushd $ABSOLUTE_PATH >/dev/null

git submodule init
git submodule update

#symlink dotfiles & dirs
for f in bash_profile bashrc irbrc gemrc gitconfig githelpers gitignore gvimrc vimrc vim; do
  symlink $ABSOLUTE_PATH/$f $HOME/.$f
done
# symlink fish config
for f in `find fish -type f`; do
  symlink $ABSOLUTE_PATH/$f $HOME/.config/$f
done
# symlink kube config
for f in `find kube -type f`; do
  symlink $ABSOLUTE_PATH/$f $HOME/.kube/${f#kube/}
done
# symlink ~/bin
for f in `find bin -type f`; do
  symlink $ABSOLUTE_PATH/$f $HOME/bin/${f#bin/}
done

#back to the original directory
popd >/dev/null
