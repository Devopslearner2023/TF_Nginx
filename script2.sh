#!/bin/bash

sudo apt-get update -y
sudo apt install nginx -y
cd /var/www/html && wget https://www.tooplate.com/zip-templates/2131_wedding_lite.zip
sudo apt install unzip
unzip 2131_wedding_lite.zip
sudo cp -pr 2131_wedding_lite /var/www/html/
sudo systemctl restart nginx
