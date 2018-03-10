![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# GIT tutorial

##### *Note: Git client or GUI should be installed on client workstation - all git command*


In this tutorial we will work with GitHub - GitHub is version control tool that allows multiple users to modify and update code with revision control

In this tutorial we will commit changes and update changes to GitHub.

#### 1 - Commit changes

```
git commit -m "first commit"
```

#### 2 - Add changes to repo

```
git remote add origin https://github.com/your-git-repo/my_first_repo.git
```

#### 3 - Push changes to GitHub

```
git push -u origin master
```

When prompted for username, supply your username (hint: your GitHub user is in most cases https://github.com/userID)

Sample output:

```
[ec2-user@ip-172-31-13-92 my_first_repo]$ git push -u origin master
Username for 'https://github.com': userID
Password for 'https://userID@github.com':
Counting objects: 3, done.
Writing objects: 100% (3/3), 230 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/userID/my_first_repo.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
[ec2-user@ip-172-31-13-92 my_first_repo]$
```
