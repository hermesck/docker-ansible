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
mkdir ansible-manager && cd ansible-manager && mkdir etc && mkdir ssh && mkdir work

# Run ansible powered console (Linux)
docker run -it --rm -h docker-ansible \
-v ./etc:/etc/ansible \
-v ./ssh:/root/.ssh \
-v ./work:/root/work \
hermesck/ansible

# Run ansible powered console (Windows)
docker run -it --rm -h docker-ansible ^
-v c:/ansible-manager/etc:/etc/ansible ^
-v c:/ansible-manager/ssh:/root/.ssh ^
-v c:/ansible-manager/work:/root/work ^
hermesck/ansible

# Clone ansible ICT Bootstrap repository in local working directory
git clone https://github.com/<YOUR_USER>/<YOUR_REPO>.git .

# Run ansible command
ansible all -m ping

# Run ansible playbook (dry run)
ansible-playbook boot-ict.yml --check
```
