function _chruby_version
  if begin; functions -q chruby; and test $RUBY_ROOT; end
    string match -r '\d+\.\d+\.\d+' $RUBY_ROOT
  end
end


function _kubectl_context
  set -l kubectl_namespace ""

  if test -n "$KUBENAMESPACE"
    set kubectl_namespace "/$KUBENAMESPACE"
  end

  if test -n "$KUBECONTEXT"
    echo $KUBECONTEXT$kubectl_namespace
  else
    if type -p monsoonctl > /dev/null
      echo (monsoonctl config current-context)$kubectl_namespace
    end
  end
end


set __fish_git_prompt_showcolorhints 1
set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_color_prefix yellow
set __fish_git_prompt_color_suffix yellow
set __fish_git_prompt_color yellow
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_cleanstate green

function fish_prompt

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l green (set_color -o green)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $cyan(basename (prompt_pwd))

  set -l chruby_version (_chruby_version)
  if [ $chruby_version ]
    set ruby_info " $red‹$chruby_version›"
  end

  set -l kubectl_context (_kubectl_context)
  if [ $kubectl_context ]
    set kubectl_info " $blue‹$kubectl_context›"
  end

  set git_info (__fish_git_prompt ' <%s>')

  echo -n -s $arrow $cwd $ruby_info $kubectl_info $git_info $normal ' '
  #echo -n -s $arrow $normal ' '
end
