#!/bin/bash
COMPONENT=frontend
ID=$(id -u)
if [ $ID ne 0 ]; then
    echo -e "\e[31m THis script is expted to be run by root user or by sudo \e [0m]"
    exit 1

fi
echo "Installaing Nginx"

yum install nginx -y &>> "/tmp/${COMPONENT}.log"

if [ $? -eq 0 ] ; then 
   echo "Success"
else 
   echo "Failed"
fi

echo -n "Down;oadiong the front end componenet "
curl -s -L -o /tmp/frontend.zip "# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip""
#if script is executed or as a sudo user then it ha sto proceed , if not I want to exit teh script with soem message
