function _chruby_version
  if begin; functions -q chruby; and test $RUBY_ROOT; end
    string match -r '\d+\.\d+\.\d+' $RUBY_ROOT
  end
end

function _kubectl_context
  if test -n "$KUBECONTEXT"
    echo $KUBECONTEXT
  else
    if type -t kubectl> /dev/null
      echo (kubectl  config current-context 2>/dev/null)
    end
  end
end

function _openstack_context
  if test -n "$OS_PROJECT_DOMAIN_NAME"
    echo -n $OS_PROJECT_DOMAIN_NAME
    if test -n "$OS_PROJECT_NAME"
       echo /$OS_PROJECT_NAME
    end
  end
end

set __fish_git_prompt_showcolorhints 1
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_color_prefix yellow
set __fish_git_prompt_color_suffix yellow
set __fish_git_prompt_color yellow
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_cleanstate green

set __red (set_color -o red)
set __blue (set_color -o blue)
set __cyan (set_color -o cyan)
set __purple (set_color -o purple)
set __normal (set_color normal)

function fish_prompt

  set -l arrow "$__red➜ "
  set -l cwd $__cyan(prompt_pwd)

  #set -l chruby_version (_chruby_version)
  if [ $chruby_version ]
    set ruby_info " $__red‹$chruby_version›"
  end

  set -l kubectl_context (_kubectl_context)
  if [ $kubectl_context ]
    if test -n "$KUBENAMESPACE"
      set kubectl_info " $__blue⎈($kubectl_context/$KUBENAMESPACE)"
    else
      set kubectl_info " $__blue⎈($kubectl_context)"
    end
  end

  set -l openstack_context (_openstack_context)
  if [ $openstack_context ]
    set openstack_info " "$__purple\[$openstack_context\]
  end

  set git_info (__fish_git_prompt ' <%s>')

  echo -n -s $arrow $cwd $ruby_info $kubectl_info $openstack_info $git_info $normal ' '
  #echo -n -s $arrow $normal ' '
end
