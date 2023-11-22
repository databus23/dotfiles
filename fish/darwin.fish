set PATH /Applications/MacVim.app/Contents/bin/ $PATH

#osx specific init stuff
set -x EDITOR (which mvim)" -f"
set -x BUNDLER_EDITOR (which mvim)

eval (/opt/homebrew/bin/brew shellenv)

#source ~/.config/fish/iterm2_shell_integration.fish
