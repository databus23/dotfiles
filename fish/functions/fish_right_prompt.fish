function fish_right_prompt
  #Save the return status of the previous command
  set stat $status

  set -l red (set_color -o red)
  set -l green (set_color -o green)
  set -l normal (set_color normal)
  if test "$stat" != "0"
    echo -n $red 
  else
    echo -n $green 
  end
    echo "$stat ↵$normal"

end
