function kubectl
  set -l args $argv
  if test -n "$KUBENAMESPACE"
    set args "--namespace" $KUBENAMESPACE $args
  end
  if test -n "$KUBECONTEXT"
    set args "--context" $KUBECONTEXT $args
  end

  if test -n "$KUBEPROXY"
    env GITHUB_TOKEN=$MONSOONCTL_TOKEN https_proxy=$KUBEPROXY http_proxy=$KUBEPROXY no_proxy=localhost,127.0.0.1 monsoonctl $args
  else
    env GITHUB_TOKEN=$MONSOONCTL_TOKEN (if set -q KUBECTL; echo $KUBECTL;else; echo monsoonctl; end) $args
  end
end
