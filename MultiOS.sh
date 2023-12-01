#!/bin/bash
#############################################
Author: Hardik Kwatra
#############################################

URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART='2098_health'
TEMP="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
   echo "Running Setup on CentOS"


   sudo yum install wget unzip httpd -y > /dev/null

   sudo systemctl start httpd
   sudo systemctl enable httpd

   mkdir -p $TEMP
   cd $TEMP


   wget $URL
   unzip $ART.zip > /dev/null
 cp -r $ART/* /var/www/html/

   sudo systemctl restart httpd
   rm -rf $TEMP

   sudo systemctl status httpd
   ls /var/www/html

else
   sleep 2
   echo "Running Setup on Ubuntu"
   
   PACKAGE="apache2 wget unzip"
   SVC="apache2"
   sudo apt update
   sudo apt $PACKAGE -y > /dev/null

   sudo systemctl start $SVC
   sudo systemctl enable $SVC

   mkdir -p $TEMP
   cd $TEMP wget $URL
   unzip $ART.zip > /dev/null
   cp -r $ART/* /var/www/html/

   sudo systemctl restart $SVC


   rm -rf $TEMP

   sudo systemctl status $SVC
   ls /var/www/html
fi

echo "=============================================>"
echo
echo "THANK YOU -_-"

   
