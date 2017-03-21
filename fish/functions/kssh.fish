function kssh
  set -l selector
  set -l dry_run
  while set -q argv[1]
    switch $argv[1]
      case --selector -l
        set -e argv[1]
        set selector --selector=$argv[1]
      case '--selector=*'
        set selector --selector=(string sub -s 12 -- $argv[1])
      case -n --dry-run
        set dry_run 1 
      case '*'
        break
    end
    set -e argv[1]
  end

  set -l hosts (kubectl get nodes $selector -o 'jsonpath={range .items[*]}core@{.metadata.name} {end}')
  if [ $dry_run ]
    echo pssh -P -t 0 --host="$hosts" $argv
  else
    pssh -P -t 0 --host="$hosts" $argv
  end
end
