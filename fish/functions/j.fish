function j
  set -l dest (command autojump $argv)
  if [ $dest ]
    cd $dest
  end
end
