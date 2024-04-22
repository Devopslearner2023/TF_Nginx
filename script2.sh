#!/bin/bash

sudo apt-get update -y
sudo apt install unzip -y
sudo apt install nginx -y
cd /var/www/html && wget https://www.tooplate.com/zip-templates/2133_moso_interior.zip
sudo unzip 
sudo systemctl restart nginx
