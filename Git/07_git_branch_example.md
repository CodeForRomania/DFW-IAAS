![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# GIT tutorial

##### *Note: Git client or GUI should be installed on client workstation - all git command*

In this tutorial we will work with GitHub - GitHub is version control tool that allows multiple users to modify and update code with revision control.

In this tutorial we will look into branching of original repository.


##### Create a new repo StudyGroup

##### *Note: Create repo with your first name and last initial *

What we will do in this lab:

##### create a file content = add linux git jenkins
##### create a file studnets = add student data
##### create a file meetupschedule = add schedule

##### show the changes via history of the file

##### explain we are in master branch

##### show the network graph 

now create a new branch call linux

create a new file linuxtopics
create a new file linuxlab

show that new files are not added to the master
show the graph

explain why we are adding linux files to master

from master click on pull
add comments 

it will check for any confilicts 

now do this on your server


1) clone repo from git up 
git clone https://github.com/simpleweb/simpleweb.git

2) cd to the directory, it is already initialize for git
cd <project name>

3) check branch which branch you are in
git branch

4) it shows only master but we had a linux branch, where did that go. do following command to show all branches
git branch -a
will show all your branch


5) to switch to your branch 
git checkout Linux


6) create new branch, switch to master branch 
git checkout master

7) create a new jenkins branch 
git branch jenkins

8)this won't switch to new branch to swicth 
git checkout jenkins

10)create new branch and change to new branch
git checkout -b ansible

11) go to jenkins branch
git checkout jenkins

12) create a file in jenkins
echo "jenkins lab material" > jenkins.txt

13) add and commit 
git add .
git commit -m "added a new jenkins lab material text file"
git status 

14) swicth to master 
git checkout master

15)  check in master if jenkin file is there or missing
ls -al 

15) merge jenkins files to master
git merge <branch name>

16) ls -al to make sure new jenkin file is in master now and merge is completed.
ls -al 

17) push all these changes back to github repo
git push --all origin



