function kubernikuspw
  set -l context $KUBECONTEXT
  test  (count $argv) -gt 0; and set -l context $argv[1]

  set -l server (kubectl config view -o jsonpath="{.clusters[?(@.name == \"$context\")].cluster.server}")
  set -l kluster_fqdn (echo $server | sed -n "s!https://\([^.]*\).*!\1!p")
  set -l parent_domain (echo $server | sed -n "s!https://[^.]*\.[^.]*\.\([^.]*\)\.cloud\.sap!\1!p")

  set -l parent_context
  set -l namespace

  switch $parent_domain
  case admin
    set parent_context admin
    set namespace $context
  case '*'
    set parent_context k-$parent_domain
    set namespace kubernikus
  end

  set -q KS_NAMESPACE; and set -l namespace $KS_NAMESPACE
  echo "Fetching node password for kluster $context ($server)" >&2
  #echo kubectl --context $parent_context --namespace $namespace get secret $kluster_fqdn -o go-template --template='{{index .data "node-password" }}'
  set -l pwb64 (kubectl --context $parent_context --namespace $namespace get secret $kluster_fqdn -o go-template --template='{{index .data "node-password" }}' | grep -v "<no value>")
  if [ $pwb64 ]
    echo "$pwb64" | base64 -D
  end
end
