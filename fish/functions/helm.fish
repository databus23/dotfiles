function helm
  set -l args $argv
  if test -n "$KUBECONTEXT"
    set args "--kube-context" $KUBECONTEXT $args
  end
  switch "$KUBECONTEXT"
    case "ap-au-1"
      env -u no_proxy https_proxy=http://127.0.0.1:7171 (which helm) $args
    case '*'
      eval (which helm) $args
  end
end
