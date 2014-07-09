set -g fish_greeting ''

set PATH /usr/local/bin /usr/local/sbin $PATH
set PATH $HOME/bin $PATH
if test -f /usr/libexec/java_home
  set -x JAVA_HOME (/usr/libexec/java_home)
end
set -x EC2_HOME $HOME/Applications/ec2-api-tools-1.6.7.2
set PATH $EC2_HOME/bin $PATH
set -x EDITOR (which vim)
#load chruby if available
test -f /usr/local/share/chruby/chruby.fish; and . /usr/local/share/chruby/chruby.fish
test -f /usr/local/share/chruby/chruby.fish; and . /usr/local/share/chruby/auto.fish

set -x GOPATH ~/gocode
set PATH $GOPATH/bin $PATH

#git aliases
alias gs='git status'
alias ga='git add .'
alias gc='git commit'
alias gd='git diff'
alias gdt='git difftool'

alias listening_ports='sudo lsof -P -n -i|grep LISTEN|sort -k5'
alias flushdns='sudo killall -HUP mDNSResponder'
#vagrant aliases
alias vu='vagrant up'
alias vs='vagrant status'
alias vp='vagrant provision'

#rails aliases
alias r='bundle exec rails'
alias be='bundle exec'
alias delete_swp_files='find . -name \*.swp -delete'

function fish_user_key_bindings
  bind \e.       'history-token-search-backward'
  bind \e\[1\;9A 'history-token-search-backward'
  bind \e\[1\;9B 'history-token-search-forward'
  bind \e\[1\;9C 'forward-word'
  bind \e\[1\;9D 'backward-word'
end


set platform (uname| tr '[:upper:]' '[:lower:]')
test -f ~/.config/fish/$platform.fish; and . ~/.config/fish/$platform.fish
test -f ~/.config/fish/config.local.fish; and . ~/.config/fish/config.local.fish
