function helm
  set -l args $argv
  if test -n "$KUBECONTEXT"
    set args "--kube-context" $KUBECONTEXT $args
  end
  if test -n "$KUBEPROXY"
    env https_proxy=$KUBEPROXY http_proxy=$KUBEPROXY no_proxy=localhost,127.0.0.1 (which helm) $args
  else
    eval (which helm) $args
  end
end
