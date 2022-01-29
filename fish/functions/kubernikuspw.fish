function kubernikuspw
  set -l kluster_fqdn $argv[1]
  set -l parent_context $KUBECONTEXT
  test  (count $argv) -gt 1; and set -l parent_context $argv[2]


  set -l namespace kubernikus

  echo "Fetching node password for kluster $kluster_fqdn" >&2
  #echo kubectl --context $parent_context --namespace $namespace get secret $kluster_fqdn -o go-template --template='{{index .data "node-password" }}'
  set -l pwb64 (kubectl --context=$parent_context --namespace=$namespace get secret $kluster_fqdn-secret -o go-template --template='{{index .data "node-password" }}' | grep -v "<no value>")
  if [ $pwb64 ]
    echo "$pwb64" | base64 -D
  end
end
