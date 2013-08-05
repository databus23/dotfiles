set -g fish_greeting ''

set PATH /usr/local/bin /usr/local/sbin $PATH
set PATH $HOME/bin $PATH

set -x EDITOR (which vim)
#load chruby if available
test -f /usr/local/share/chruby/chruby.fish; and . /usr/local/share/chruby/chruby.fish
test -f /usr/local/share/chruby/chruby.fish; and . /usr/local/share/chruby/auto.fish

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

set netloc (/usr/sbin/scselect 2>&1 | egrep '^ \*' | sed 's:.*(\(.*\)):\1:'|tr [A-Z] [a-z])

# source host specific config
if functions -q $netloc"_env"  
  echo "Loading environment $netloc"
  eval $netloc"_env"
else
  echo "Loading default env"
  default_env
end

function fish_user_key_bindings
  bind \e.       'history-token-search-backward'
  bind \e\[1\;9A 'history-token-search-backward'
  bind \e\[1\;9B 'history-token-search-forward'
  bind \e\[1\;9C 'forward-word'
  bind \e\[1\;9D 'backward-word'
end

