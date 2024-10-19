ansible-playbook -i inventory/hosts -c local local.yml --ask-become-pass

ansible-pull -U https://github.com/f4alt/ansible-fedora.git --ask-become-pass -i localhost -e ansible_user=chris
