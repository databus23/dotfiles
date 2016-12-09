function kc 
  if test (count $argv) -gt 0
    set -g KUBECONTEXT $argv[1]
    echo "Context is now $argv[1]"
  else
    set -e KUBECONTEXT
    echo "Context has been removed. Defaulting to current-context in .kubeconfig"
  end
end
