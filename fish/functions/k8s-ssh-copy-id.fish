function k8s-ssh-copy-id
  set -l key ~/.ssh/monsoon_rsa
  test  (count $argv) -gt 0; and set key $argv[1]

  set -l ssh_user core

  get --prompt "SSH Password:" --silent | read -l SSHPASS
  for node in (kubectl get nodes -o 'jsonpath={range .items[*]}{.metadata.name}{"\n"}{end}')
     echo sshpass -e ssh-copy-id -i $key -o StrictHostKeyChecking=no $ssh_user@$node
    env SSHPASS=$SSHPASS sshpass -e ssh-copy-id -i $key -o StrictHostKeyChecking=no $ssh_user@$node
  end
end
