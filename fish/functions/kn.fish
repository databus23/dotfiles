function kn 
  if test (count $argv) -gt 0
    set -g KUBENAMESPACE $argv[1]
    echo "Namespace is now $argv[1]"
  else
    set -e KUBENAMESPACE
    echo "Namespace has been removed"
  end
end
