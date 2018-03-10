![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# GIT tutorial

##### *Note: Git client or GUI should be installed on client workstation - all git command*


In this tutorial we will work with GitHub - GitHub is version control tool that allows multiple users to modify and update code with revision control

In this tutorial we will create local repository, create README.md document and sync repository with GitHub

#### 2 - First create directory or repo on your local machine

```
mkdir my_first_repo
cd my_first_repo
```

##### *Note: If using windows, this can be either done from command prompt or Windows powershell*


#### 3 - Create new document called README.md

```
echo "this is my test document" >> README.md
```
##### *Note: On Windows "echo" statement will not work - you can use notepad or file editor and save document under directory in step-1*


#### 4 - Initiate git repo locally


```
git init
```
#### 5 - Add files

```
git add README.md
```
