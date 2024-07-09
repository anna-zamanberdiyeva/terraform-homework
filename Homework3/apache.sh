#!/bin/bash

sudo apt update
sudo apt install apache2 -y
sudo systemctl start apche2
sudo systemctl enable apache2

sudo apt install git -y

echo "Hello, World!" > /var/www/html/index.html