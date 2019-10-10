# docker-ansible
Docker Image with Ansible to bootstrap ICT


## Basic usage

Start terminal with prepared Ansible enviroment
```
docker run -it --rm -h docker-ansible hermesck/ansible /bin/bash
```

Create hosts file with localhost only for testing
```
echo -e "[local]\nlocalhost\n192.168.1.1" > /etc/ansible/hosts
```

Test ansible command
```
ansible all -m ping
```

## Bootstrap ICT

Clone Ansible configuration from remote GIT repository
```
git clone https://github.com/<GitHubName>/<GitHubRepo>.git my-ansible-boot-ict
```

Run Ansible playbook (--check is for dry run)
```
ansible-playbook my-ansible-boot-ict/boot-ict.yml --check
```
