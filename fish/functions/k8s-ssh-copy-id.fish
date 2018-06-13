function k8s-ssh-copy-id
  set -l key ~/.ssh/monsoon_rsa
  test  (count $argv) -gt 0; and set key $argv[1]

  get --prompt "SSH Password:" --silent | read -l SSHPASS
  for node in (kubectl get nodes -o 'jsonpath={range .items[*]}{.metadata.name}{"\n"}{end}')
     echo sshpass -e ssh-copy-id -i $key -o StrictHostKeyChecking=no core@$node
    env SSHPASS=$SSHPASS sshpass -e ssh-copy-id -i $key -o StrictHostKeyChecking=no core@$node
  end
end
