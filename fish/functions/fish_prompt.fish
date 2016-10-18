function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function _rbenv_version
  if type -q -P rbenv
    echo (rbenv version-name | sed -e 's/ .*//')
  end
end

function _chruby_version
  if begin; functions -q chruby; and test $RUBY_ROOT; end
    string match -r '\d+\.\d+\.\d+' $RUBY_ROOT
  end
end

function fish_prompt

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l green (set_color -o green)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $cyan(basename (prompt_pwd))

  set chruby_version (_chruby_version)
  if [ $chruby_version ]
    set ruby_info " $red‹$chruby_version›"
  else
    set rbenv_version (_rbenv_version)
    if [ $rbenv_version ]
      set ruby_info " $red‹$rbenv_version›"
    end
  end

  set git_branch_name (_git_branch_name)
  if [ $git_branch_name ]
    set git_info $yellow$git_branch_name

    if [ (_is_git_dirty) ]
      set indicator "$red ✗"
    else
      set indicator "$green ✔"
    end

    set git_info " $yellow‹$git_info$indicator$yellow›"
  end

  echo -n -s $arrow $cwd $ruby_info $git_info $normal ' '
end
