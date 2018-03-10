![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# GIT and GIT HUB for dummies:
## https://backlogtool.com/git-guide/en/

#### GIT:		Version Control Software Collabration Software 
#### GIT HUB:		Web Service. Runs GIT Software, where user can create project and save their files.

#### Repo:		Repository => A project, composed of all sort of files.

#### Commit:		Make changes and Save file in GIT HUB, by making commit and add notes for version control.
#### 			Commit all to see history of all changes and have a unique hash value.

#### Commit Hash:	A unique identifier for a particular commit.

#### Branch:		
		A seperate path for saving files.  Moving your repository in a different direction and tracking those changes 
		independent of the main or master branch.  By default when user create a GIT repository all files will be saved in Master Branch.
		Branch allows each user to branch out from the Master Branch and isolate their work from others. 
		Another good thing about branch is that it helps Git to easily merge the versions later on.  Different branches can be merged 
		into any one branch provided that they belong to the same repository.

		You are free to create branches in any way you want. 

#### Pull Request:	Takes changes from one branch and pull them in a different branch.

#### Merge:		Merge the changes of one branch to other.

#### Graph: 		Network and branching.
		Main Repo => Graph => Network


***Linux Commands for Branch:***

####clone remote repo to server 
git clone https://github.com/dfwmtc/test1.git

####check branches, * represent which branch your are in
git branch

####create a new branch, but doesn't change your current branch
git branch jenkins

####change a branch
git checkout dev

####push new branch to github
git push origin <branch name>

####create new branch and change to new branch
git checkout -b githubr

####create a new file in a branch
echo "learn Github" > Github.txt

####status of all changes
git status

###include updates to a particular file/director in the next commit.
git add .

## The first thing you should do when you install Git is to set your user name and email address. This is important because every Git commit uses this information, and it’s immutably baked into the commits you start creating
```
git config --global user.name "git username"
git config --global user.email "git user email address"
```

####add files to the directory
```
git commit -m "ansible files"
```

####to merge a branch to master. Switch to master branch first
```
git checkout master
```

###merge branch ansible to master
```
git merge <branch name>
```


###delete a branch
```
git branch -d <branch name>
```

*** create a branch in  correct location to carry files over to new branch. If user is in master branch and creates a new branch all files from master branch will carry over.
If a user is in ansible branch and creates a new branch all files from ansible will carry over to new branch.



