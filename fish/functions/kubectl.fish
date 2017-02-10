function kubectl
  set -l args $argv
  if test -n "$KUBENAMESPACE"
    set args "--namespace" $KUBENAMESPACE $args
  end
  if test -n "$KUBECONTEXT"
    set args "--context" $KUBECONTEXT $args
  end
  env GITHUB_TOKEN=$MONSOONCTL_TOKEN monsoonctl $args
end
