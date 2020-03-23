function kubernikuslogin
  set -l internal_ip (kubectl get node $argv[1] -o jsonpath="{.status.addresses[?(@.type == \"InternalIP\")].address}")
  set -l context (_kubectl_context)
  test -z $internal_ip; and return 1
  set -l pw (kubernikuspw $context)
  if test -z $pw;
    echo "No password found for cluster $cluster. Try the old default one."
  else
    echo $pw | pbcopy
    echo "Copied node password to clipboard"
  end
  echo "ssh core@$internal_ip"
  ssh-no-check core@$internal_ip
end
