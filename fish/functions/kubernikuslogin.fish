function kubernikuslogin
  set -l internal_ip (kubectl get node $argv[1] -o jsonpath="{.status.addresses[?(@.type == \"InternalIP\")].address}")
  test -z $internal_ip; and return 1
  set -l pw (kubernikuspw (_kubectl_context))
  test -z $pw; and return 1
  echo $pw | pbcopy
  echo "Copied node password to clipboard"
  echo "ssh core@$internal_ip"
  ssh core@$internal_ip
end
