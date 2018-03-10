# Ansible EC2 - Hands on

##Create two Ec2 instances source and target

Login to source and install ansible


*Execute commands as "root" user.*

```
sudo pip install --upgrade pip

pip install ansible

sudo pip install --upgrade ansible
```

Exit as root user 

```
exit

mkdir ansible
```



Note down public an private IP address of target EC2 instance
Default inventory file should be in /etc/ansible/hosts but you can create in your current dir and provide as parameter. 
Cerate hosts file with private IP address of target ec2 instance

#### *Get private ip address of ec2 target server*

```
curl http://169.254.169.254/latest/meta-data/local-ipv4
```

[TargetServer]
172.31.69.224



##Check version of ansible

```
ansible --version
```

Ansible Command Line
Ansible playbook
Ansible Roles


## Ansible Command Line

Run Simple test ping. This is not ping command. It will login to target server and check connectivity. 


```
ansible all -i hosts -m ping
```

Now do the same with privileged user
```
ansible all -i hosts -b -m ping
```
You can verify using shell module which runs OS commands
```
ansible all -i hosts -b -m shell -a 'whoami'

ansible all -i hosts -m shell -a 'whoami'
```

Lets intall some packages using yum module


```
ansible all -i hosts -b -m yum -a 'pkg=sysstat state=installed'

ansible all -i hosts -b -m yum -a 'pkg=sysstat state=latest'

ansible all -i hosts -b -m yum -a 'pkg=vim state=latest'
```

## Remove vim package
```
ansible all -i hosts -b -m yum -a 'pkg=vim state=absent'
```

## Now reinstal using latest command. 
```
ansible all -i hosts -b -m yum -a 'pkg=vim state=latest'
```

#Install apache 

```
ansible all -i hosts -b -m yum -a 'pkg=httpd state=latest'


ansible all -i hosts -b -m yum -a 'pkg=httpd state=latest'

```


## Start Apache server. Use module service

```
ansible all -i hosts -b -m service -a 'name=httpd state=started'


ansible all -i hosts -b -m service -a 'name=httpd state=stopped'
```

## Now remove the httpd package


```
ansible all -i hosts -b -m yum -a 'pkg=httpd state=absent'
```


## Ansible Playbooks
Create playbook to install apache web server

---
- name: Install webserver
  hosts: TargetServer

  tasks:
   - name: install apache
     yum: pkg=httpd state=latest

#
Now run playbook using ansible-playbook command
ansible-playbook -i hosts -b installhttpd.yml


## Create playbook to install apache web server and start webserver


---
- name: Install webserver
  hosts: TargetServer

  tasks:
   - name: install apache
     yum: pkg=httpd state=latest

   - name: Start Apache
     service: name=httpd state=started


#

## Create a playbook to Stop and rmeove webserver


HANDLERS
## Create playbook to install apache web server and start webserver using handlers



---
- name: Install webserver
  hosts: TargetServer

  tasks:
   - name: install apache
     yum: pkg=httpd state=latest
     notify:
      - Start Apache

  handlers:
   - name: Start Apache
     service: name=httpd state=started

