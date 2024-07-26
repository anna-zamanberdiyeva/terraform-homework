#!/bin/bash

sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo Restaurant Menu >> /var/www/html/index.html
sudo echo Error Page >> /var/www/html/error.html