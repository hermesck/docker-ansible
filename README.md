# docker-ansible
Docker Image with Ansible to bootstrap ICT


## Basic usage

Start terminal with prepared Ansible enviroment
```
docker run -it hermesck/ansible
```

## Advanced usage

Start terminal with persistent and customizable Ansible enviroment
```
# Create working local directory
mkdir ansible-manager && cd ansible-manager

# Run ansible powered console
docker run -it --rm -h docker-ansible \
-v ./ansible-etc:/etc/amsible \
-v ./ansible-bin:/root/ansible-bin \
-v ./ansible-work:/root/ansible-work \
hermesck/ansible

# Clone ansible ICT Bootstrap repository in local working directory
git clone https://github.com/<YOUR_USER>/<YOUR_REPO>.git .

# Run ansible command
ansible all -m ping

# Run ansible playbook (dry run)
ansible-playbook boot-ict.yml --check
```
