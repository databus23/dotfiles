function kubectl
  set -l args $argv
  if test -n "$KUBENAMESPACE"
    set args "--namespace" $KUBENAMESPACE $args
  end
  if test -n "$KUBECONTEXT"
    set args "--context" $KUBECONTEXT $args
  end
  switch "$KUBECONTEXT"
    case "ap-au-1"
      env -u no_proxy GITHUB_TOKEN=$MONSOONCTL_TOKEN https_proxy=http://127.0.0.1:7171 monsoonctl $args
    case '*'
      env env GITHUB_TOKEN=$MONSOONCTL_TOKEN monsoonctl $args
  end
end
