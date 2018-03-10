![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# GIT tutorial

##### *Note: Git client or GUI should be installed on client workstation - all git command*

##### *We will integrate SSH for password-less login - for this exercise pub key is provided in google drive.*
  
Make sure there is at least one file in it (even just the README)
Generate ssh key:
```
ssh-keygen -t rsa -C "your_email@example.com"
```
Copy the contents of the file ~/.ssh/id_rsa.pub to your SSH keys in your GitHub account settings.

##### Copy and setup private key with your ssh client

Copy ssh private key dfwmtc to your ~/.ssh directory

```
[ec2-user@ip-172-31-43-232 .ssh]$ pwd
/home/ec2-user/.ssh
[ec2-user@ip-172-31-43-232 .ssh]$ ls -la
total 24
drwx------ 2 ec2-user ec2-user 4096 Mar  3 16:53 .
drwx------ 5 ec2-user ec2-user 4096 Mar  3 17:30 ..
-rw------- 1 ec2-user ec2-user  395 Mar  3 16:40 authorized_keys
-rw------- 1 ec2-user ec2-user   64 Mar  3 16:53 config
-rw------- 1 ec2-user ec2-user 1679 Mar  3 16:45 dfwmtc
-rw-r--r-- 1 ec2-user ec2-user 1326 Mar  3 17:01 known_hosts
```

Create new file config in your .ssh directory and copy code below:

```
Host github.com
 AddKeysToAgent yes
 IdentityFile ~/.ssh/dfwmtc
```

Change permission for config file & private key to read only!

```
chmod 0600 config
chmod 0600 dfwmtc
```
 

Test SSH key:
```
ssh -T git@github.com
clone the repo:
git clone git://github.com/dfwmtc/DFW-IAAS.git
```
Now cd to your git clone folder and do:
```
git remote set-url origin git@github.com:dfwmtc/simpleweb.git
```
Now try editing a file (try the README) and then do:

```
git add -A
git commit -am "my update msg"
git push
```



