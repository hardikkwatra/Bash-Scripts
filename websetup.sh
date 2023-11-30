#!/bin/bash

sudo yum install wget unzip httpd -y > /dev/null

sudo systemctl start httpd
sudo systemctl enable httpd

mkdir -p /tmp/webfiles
cd /tmp/webfiles


wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
cp -r 2098_health/* /var/www/html/

sudo systemctl restart httpd

rm -rf /tmp/webfiles

sudo systemctl status httpd
ls /var/www/html
