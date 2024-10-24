ansible-playbook -i inventory/hosts -c local local.yml

ansible-pull -U https://github.com/f4alt/ansible-fedora.git
ansible-pull -U https://github.com/f4alt/ansible-fedora.git --purge --start-at-task='Reboot 1'
