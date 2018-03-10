![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# GIT tutorial

##### *Note: Git client or GUI should be installed on client workstation - all git command*


In this tutorial we will work with GitHub - GitHub is version control tool that allows multiple users to modify and update code with revision control.


#### 1 - Delete file locally

```
rm README.md
git rm README.md
```


#### 2 - Commit delete to repo

```
git commit -m "Delete README.md file"
```

Output:
```
[master 66a90ad] Delete README.md file
 1 file changed, 1 deletion(-)
 delete mode 100644 README.md
```

#### 3 - Push changes to GitHub

```
git push -u origin master
```

When prompted for username, supply your username (hint: your GitHub user is in most cases https://github.com/userID)

Sample output:
