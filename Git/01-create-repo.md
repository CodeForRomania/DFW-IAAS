![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# GIT tutorial

##### *Note: Git client or GUI should be installed on client workstation - all git command*


In this tutorial we will work with GitHub - GitHub is version control tool that allows multiple users to modify and update code with revision control.

In this tutorial we will create local repository, create README.md document and sync repository with GitHub

#### 1 - Create new repo  

You can create GitHub repo two ways, using GitHub via browser or via REST-API

##### Repo via Web browser

1. Sign into your GitHub account
2. Click "Start a project"
3. Name your project "my_first_repo" and take everything default

##### Repo via REST-API

Execute command below to create REPO:

```
## Change username to your GitHub account and change Project name ##
curl -u 'your-github-user' https://api.github.com/user/repos -d '{"name":"my_first_repo","description":"This project is a test"}'
```

Script to read userInput:

```
read -p "GitHub_Username: " GitUSER
read -p -x "Github Password: " GitPass
read -p "Git Repo Name: " GitRepoName


curl -u $GitUSER:$GitPass https://api.github.com/user/repos -d '{"name":"DFW-IaC-'${GitRepoName}'","description":"This project is a test"}'
```

