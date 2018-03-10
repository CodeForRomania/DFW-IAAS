# Wget examples in Linux Introduction

Wget examples Introduction : This tutorial is divided into basic and advance usage of wget command. You will see some of the most interesting features of wget command here.
Wget command helps to download number of packages from  web. wget is great. It's a part of the GNU Project, it has got its name from Word wide web and get. Wget supports https, http and ftp protocols. you can download packages very easily even if your net connection is very slow. It is non-interactive(Can work in the background) and robust.. Wget is best suitable for very slow and unstable network connections. In this tutorial I will be explaining about the most important and common wget examples that a Linux administrator can use while working with it.

Wget Features summary

Wget has been the most useful tool since it was discovered. Its features has already been discussed in its introductory. Lets see its features in Summary.

1. Robust
Very robust can work under unstable and slow network.

2. Non-interactive
It is non-interactive. No user interaction is required after its started.

3. Recursive
It is recursive. Once the user specify to download recursively, it can download links, all its
pages from a web page recursively to its maximum depth.

4. Portable
It is highly portable and requires minimal dependencies on third party libraries.

5. Download through proxies
It can download through proxies and have web access through inside firewall.

6. Support SSL/TLS
It supports encrypted download through SSL/TLS.



Wget install

Wget command may not installed on your Linux. If not installed you can install it. Lets see how to find out if it is installed or not ? open the terminal and type the below command for CentOS.

###  yum list wget*
This above command will show you if wget is installed or just available (not installed)                   

wget examples
Wget examples

In my system wget is already installed, so it is showing as 'Installed Packages'. If it was not installed it would have been showing as 'Available Packages' on my system.
In Debian based system 'apt' command is used  to see the status of wget package.

### apt-cache wget                                       
Or use 'dpkg' command to see the wget status.

### dpkg -l | grep wget                               


### apt-get install wget                             To install wget
or

### dpkg -i wget                                     To install wget


1. Wget http

The below is a wget example to show how to download a tar file via http. You can download any file with wget.

### wget http://wordpress.org/latest.tar.gz

wget command  

 ### wget http://ftp.gnu.org/gnu/wget/wget-1.5.3.tar.gz

wget command

The above are the two wget examples for downloading with wget command.  

2.Download by URL'S store in file

It is very time consuming when you have to download number of packages. Just imagine the situation that you need to download many packages, so you are using wget to download one package, when the download get finished you have to use wget command again to download another package. Let the work be much easier by saving all the url's of the pakages in one file, then use wget command to download all. See the below wget examples given.

Create a file called url.txt.Use vi editor command to create and open the file and save all the url's of the package (packages you want to download) inside the file.

### vi url.txt      
  use '-i' option with wget to download from url.txt file.

 ### wget -i  url.txt

wget example
Wget examples to show download


3.Resume your downloads

With wget command you can also resume your downloads. For example you may be downloading any package and for some reason you had to stop your download in the between then next time you can again restart the download from the same place where it was stopped. You have to add an option 'c' with the wget command.   
See the below wget examples to resume your downloads.

### wget -c  http://wordpress.org/latest.tar.gz   
wget command
Wget examples resume downloads
See the below images for more clarification. Now after we resume the download

wget command  

4.Downloading with different name

When you download a package it is saved as its default name. Most of the time we need to change the name of the file after the download gets completed. Wouldn't it be better if you be able to change the name while your download is going on? Add an option 'O' with the wget and give the name of the file you want.
I have used here 'newfile.gz'  as new name of the file.

### wget -O newfile.gz http://wordpress.org/latest.tar.gz
wget command
Wget examples of changing file name while download.


5.Downloading quitely

Download quietly with wget with the option 'q' . With the 'q' option you won't see any single output on your terminal, however, the downloading persist until it is finished.

### wget -q  <Package name>
6.Download in background

Download any file in background with out any out put in the terminal. See the below wget examples.

### wget -b http://wordpress.org/latest.tar.gz
wget command

7.Check if the file exist

If you dont't want to download and just want to determine weather the remote file exist at the destination then use ' spider ' option with wget.

### wget --spider  http://wordpress.org/latest.tar.gz
The above command will just determine the file existence.

wget command
Wget examples of spider option


8. Wget version

To know your wget version use the below given wget examples.

### wget -V
or

### wget --version
9. Logging wget output to a log file

If you want you can log all your wget outputs to a file. In that case you won't see any output on the terminal.  See the below wget examples.

### wget -o logs <URL>
In the above command a file called logs will be created in the current directory where you can check your wget logs.

The option '-o' overwrites your log files to append your wget logs use option '-a'.

### wget -a logs <URL>


10. Wget ftp

Wget can be used to download any file via ftp. Look at he wget example given below.

### wget ftp://<file-path>

11. Wget download if version is newer

Wget command can also be used to download a file if the version on the server is newer than the local copy. This means that if wget command finds that that the file version of the server copy is older than your local copy, the download will be rejected. See the given wget example.

### wget --continue --timestamping http://www.example.com/file.zip

                                              Advance wget examples

The below are given some of the most important advanced wget examples.

12. Wget download gif from website

You have the option of downloading only gif from a website.


### wget -e robots=off -r -l 1 --no-parent -A .gif ftp://www.path.com/path2/
Similarly, the following wget examples shows how to download all the images from a website recursively

###  wget -nd -r -l 2 -A jpeg,jpg,gif,png http://<path>

More Information:

-e robots=off   It means execute command and ignore robots meta tags and robots.txt
-r -l 1                 Means recursively level 1
-nd                     It means assign no directory and save files to current directory
-A                       Accept all the extensions given

See another wget examples of image download

### wget -nd -r -P /home/user/Downloads/ -A jpeg,jpg,bmp,gif,png http://www.examples.com/profile/profile/
-P              Prefix directory it set the path where all the downloaded files and directories will be saved.


Say you want to download range of files that is 0 to 7, it can ba either .html or .jpeg or any other format files. See the below example

### wget -nd -P /home/user/Downloads/ http://www.example.com/profile{0..7}.jpeg

13. Wget download only pdf from specific domains

The below given wget example will show how to download only only PDF files from specific domains.

### wget -m --domains=example.org, a.example.org, b.example.org, c.example.org -A=pdf http://www.example.org/
14.Download full contents of website.

See the below wget example. It will download full content of any website rescursively.

### wget -r -l 0 http://www.<path-name>.com

15.Downloading only title page for local viewing

You also have the option of downloading  only title page with its style sheet and images for making it suitable for local vieweing.

### wget -p -k http://www.<websitename>.com
-p     This option downloads all the required files needed for proper display of HTML pages.
-k     Covert links to make it suitable for local viewing


16.Send your wget logs to a log file

While you are downloading you can send download or error logs to a log file rather than displaying on terminal. This will be helpful for post monitoring. Look at the below example where the logs are being sent to 'wgetlog.log' file.

### wget -k -p http://www.example.com ./wgetlog.log

17.Wget wait and retry

In the given wget examples wget will try maximum 5 times if there is a downloading faiulure but with the exception of 'not found' and 'connection refused' error and wait 4 secs between each download.

### wget --tries=5 --wait=4 -k -p http://www.example.com
In some cases you may want to retry refused connection and other fatal errors, use option '--retry-connrefused'.

### wget --retry-connrefused -k --read-timeout=14 -p http://www.somesite.com
--read-timeout=14                   means wget will wait for 14 secs if no data is received.


18.Wget mirror website

Mirroring your website is the best choice for off-line viewing as it recursively download all the contents and covert links suitable for off-line. See the below wget example.

### wget --mirror --page-requisites --adjust-extension --convert-links http://www.example.com
--mirror                                  Mirroring your website to exact copy
--page-requisites                Download images and CSS for displaying off-line
--adjust-extension              Adjust all the extensions like .html and .css
--convert-links                    Convert the links suitable for off-line viewing


19. Wget command use to download from password protected sites

The given wget examples will illustrate how to download files from password protected sites.

The general wget syntax for downloading from password protected site is.

--user
--password
### wget --user=user --password=password http://www.example.com
Download from password protected ftp location

Below is the wget ftp example which shows how to download from password protected ftp.

--ftp-user
--ftp-password

### wget --ftp-user=user --ftp-password=password ftp://<path>/file.zip
Download from password protected http sites

--http-user
--http-password

### wget --http-user=user --http-password=password http://www.anysite.com/file/

20. Using wget command use to download web pages which are behind login pages

### wget --keep-session-cookies --save-cookies cookies.txt --post-data 'user=username&passwrd=password' http://anywebsite.org/
### wget --mirror --load-cookies cookies.txt http://anywebsite.org/
All the above wget examples are the most common one that a Linux administrator can use while working as a Linux administrator.

That's it with the article Wget examples in Linux.
