set -g fish_greeting ''

#python freaks out without it
set -x LC_ALL en_US.UTF-8

set PATH /usr/local/bin /usr/local/sbin $PATH
set -x EDITOR (which vim)
#load chruby if available
test -f /usr/local/share/chruby/chruby.fish; and . /usr/local/share/chruby/chruby.fish
test -f /usr/local/share/chruby/chruby.fish; and . /usr/local/share/chruby/auto.fish

#load direnv if available
if which -s direnv
  eval (direnv hook fish)
end

set PATH $HOME/.krew/bin $PATH
set PATH $GOPATH/bin $PATH
set PATH $HOME/bin $PATH

alias ls='ls -A'
alias mtr='sudo mtr'

alias yaml2json="ruby -rjson -ryaml -e 'puts JSON.pretty_generate(YAML.load(STDIN.read))'"
#kubectl aliaes
alias pods='kubectl get pods -o wide'
alias pods-with-images="kubectl get pods -o custom-columns-file=$HOME/.kube/pods-custom-columns.txt"
alias k='kubectl'
alias nodes='kubectl get nodes -L failure-domain.beta.kubernetes.io/zone -L cloud.sap/maintenance-state'
alias nodes-with-ips="kubectl get nodes -o custom-columns-file=$HOME/.kube/nodes-custom-columns.txt"
alias pod='kubectl get pod -o yaml'
alias pvs="kubectl get pv -o custom-columns-file=$HOME/.kube/pv-custom-columns.txt"

#ssh aliases
alias ssh-no-check='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias scp-no-check='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
#git aliases
alias gs='git status'
alias ga='git add .'
alias gc='git commit'
alias gd='git diff'
alias gdt='git difftool'
alias gt='gittower (git rev-parse --show-toplevel)'

alias listening_ports='lsof -P -n -i|grep LISTEN|sort -k5'
#vagrant aliases
alias vu='vagrant up'
alias vs='vagrant status'
alias vp='vagrant provision'

#rails aliases
alias r='bundle exec rails'
alias be='bundle exec'
alias delete_swp_files='find . -name \*.swp -delete'

alias gnuenv='env PATH=/usr/local/opt/coreutils/libexec/gnubin:(string join ':' $PATH)'

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
test -f /usr/local/share/autojump/autojump.fish; and . /usr/local/share/autojump/autojump.fish
