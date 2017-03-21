function k8s-ssh-copy-id
  set -l key ~/.ssh/monsoon_rsa
  test  (count $argv) -gt 0; and set key $argv[1]
  for node in (kubectl get nodes -o 'jsonpath={range .items[*]}{.metadata.name}{"\n"}{end}')
    echo ssh-copy-id -i $key core@$node
    ssh-copy-id -i $key core@$node
  end
end
