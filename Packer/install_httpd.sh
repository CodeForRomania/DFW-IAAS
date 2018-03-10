#!/bin/bash
sudo yum install httpd -y
sudo yum update -y
sudo pip install ansible
sudo chkconfig httpd on
sudo sh -c 'echo "hello" >>/var/www/html/index.html'