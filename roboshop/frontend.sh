#!/bin/bash
ID=$(id -u)
if [$ID ne 0]; then
    echo -e "\e[31m THis script is expted to be run by root user or by sudo \e [0m]"
    exit 1

fi
echo "Installaing Nginx"
yum install nginx -y 
#if script is executed or as a sudo user then it ha sto proceed , if not I want to exit teh script with soem message
