# Sort Processes by Memory Usage

```
ps aux | sort -rnk 4
```


# Sort Processes by CPU Usage

```
ps aux | sort -nk 3:
```

# To check your architecture, perform getconf LONG_BIT.

```
getconf LONG_BIT
```

# Make a Non-Interactive Shell Session Interactive
To do this, change the settings from ~/.bashrc to ~/.bash_profile.

Monitor Command Output at Regular Intervals
Using the watch command (watch df –h), you can watch any output of any command. For example, you can watch the free space and how it is growing.

```
watch df -h
```

You can imagine what you can do with variant data by using the watch command.

# Run Program After Session Killing
When you run any program in the background and close you, it will be killed by your shell. How can you continue running the program after closing the shell?

This can be done using a nohup command — which stands for no hang-up:

```
nohup wget site.com/file.zip
```

This command is one of the most forgotten Linux command line tricks because many of us use another command-like screen:

nohup command

A file will be generated in the same directory with the name nohup.out, which contains the output of the running program:

nohup output

Cool command, right?

# Automatically Answer Yes or No to Any Command
If you want to automate the process that requires user to say yes

That can be done using yes command: yes | apt-get update.

Maybe you want to automate saying "no" instead. This can be done using yes no | command.

yes command

# Create File With a Specific Size
You can create a file with a specific size using the dd command: dd if=/dev/zero of=out.txt bs=1M count=10.

This will create a file of 10 megabytes filled with zeros:

dd command

# Run Your Last Command as Root
Sometimes, you forget to type sudo before your command that requires root privileges. You don’t have to rewrite it; just type sudo!

sudo command

# Record Your Command Line Session
If you want to record what you’ve typed on your shell screen, you can use script command to save all of your typings to a file named typescript : script.

Once you type exit, all of your commands will be written to that file so you can review it later.

Replace Spaces With Tabs
You can replace any character with any other using the tr command, which is very handy: cat geeks.txt | tr ':[space]:' '\t' > out.txt.

tr command

# Convert a File to Upper or Lower Case
You can do this using: cat myfile | tr a-z A-Z > output.txt.

# Powerful Xargs Command
The xargs command is one of the most important Linux command line tricks. You can use this command to pass the output of a command to another command as an argument. For example, you may search for PNGpng files and compress them or do anything with them:

```
find. -name *.png -type f -print | xargs tar -cvzf images.tar.gz
```
Or, maybe you have a list of URLs in a file and you want to download them or process them in a different way:

cat urls.txt | xargs wget

xargs command

Keep in mind that the output of the first command passed at the end of the xargs command.

What if your command needs the output in the middle? Easy!

Just use {} combined with the –i parameter, like below, to replace arguments in the place where the output of the first command should go:

```
ls /etc/*.conf | xargs -i cp {} /home/myuser/Desktop/out
```
