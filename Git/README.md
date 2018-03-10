![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# GIT tutorial

##### *Note: Git client or GUI should be installed on client workstation - all git command*


In this tutorial we will work with GitHub - GitHub is version control tool that allows multiple users to modify and update code with revision control.

In order to have successful LAB, you will need following:

* GitHub account
* Git client/gui installed locally

After fulfilling above requirements, you should be able to create/update/delete repositories.

tutorial are broken down by topics

1. **Create repository -- 01-create-repo.md**
2. **Add README.md file repository -- 02-add-files-repo.md**
3. **Commit and Update README.md  to repository -- 03-update-repo.md**
4. **Delete README.md from repository -- 04-delete-repo.md**
5. **Create branch of master repository -- 05-create-branch.md**
6. **Authenticate using SSH keys -- 06-create-sshkeys.md**

Let's install Git locally on our client host:

For Linux (CentOS/RedHat/AWS Linux):
```
sudo yum install -y git
```

For Mac users:
```
brew install git
```

For windows users:
```
https://git-scm.com/download/win
```

Setup git local with your userID

```
git config --global user.name "First_Name Last_name"
git config --global user.email "youremailaddress"
```
