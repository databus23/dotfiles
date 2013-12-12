function j
  set -l dest (command autojump $argv)
  if [ $dest ]
    echo $dest
    cd $dest
  end
end
