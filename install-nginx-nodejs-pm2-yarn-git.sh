#!/bin/bash

#install epel-release
yum install -y epel-release

#install nginx
yum install -y nginx
systemctl start nginx
systemctl enable nginx

#install git
yum install -y git

#install node
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
yum -y install nodejs

#open to connect http
setsebool -P httpd_can_network_connect 1

#move .conf
cp ./nginx.conf /etc/nginx/conf.d/
