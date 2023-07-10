#!/bin/bash
COMPONENT=frontend
ID=$(id -u)
if [ $ID -ne 0 ]; then
    echo -e "\e[31m THis script is expted to be run by root user or by sudo \e [0m]"
    exit 1

fi
stats(){
if [ $? -eq 0 ] ; then 
   echo "Success"
else 
   echo "Failed"
   exit 2
fi
}
echo "Installaing Nginx"

yum install nginx -y &>> "/tmp/${COMPONENT}.log"

stats $?

echo -n "Downloadiong the front end componenet "
curl -s -L -o /tmp/frontend.zip   "https://github.com/stans-robot-project/frontend/archive/main.zip"
#if script is executed or as a sudo user then it ha sto proceed , if not I want to exit teh script with soem message

stats $?


echo -n "Performing cleaning up"
cd /usr/share/nginx/html
rm -rf * &>> "/tmp/${COMPONENT}.log"
stats $?

echo -n "Extracting ${COMPONENT}"
unzip /tmp/frontend.zip &>> "/tmp/$.{COMPONENT}.log"
mv $COMPONENT-main/* .
mv static/* . &>> "/tmp/$.{COMPONENT}.log"
rm -rf frontend-main 
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stats $?

echo "starting services"
systemctl enable nginx
start nginx
stats $?