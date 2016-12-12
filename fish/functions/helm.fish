function helm
  set -l args $argv
  if test -n "$KUBECONTEXT"
    set args "--kube-context" $KUBECONTEXT $args
  end
  eval (which helm) $args
end
