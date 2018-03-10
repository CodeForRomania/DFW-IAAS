# Display Output as a Table

You can format Linux output nicely for better visual experience, for example running "mount" command and output displays in one line and often you have to dig through content to get relevant information.

Using command "column" converts the output in tabular format and here is example with and without column command.

mount command generic output:
```
mount
```

![alt text](http://i.imgur.com/63GQw9l.png "Logo Title Text 1")

mount command with columnar output:

```
mount |column -t
```

![alt text](http://i.imgur.com/x8lHE3D.png "Logo Title Text 1")


Another example of output from "/etc/passwd" - notice I am using ":" as field separator

```
cat /etc/passwd | column -t -s:
```

![alt text](http://i.imgur.com/WpWHx27.png)

Now let's
