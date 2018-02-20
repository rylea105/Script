#!/bin/bash
sudo yum install epel-release -y

sudo yum install nginx -y

sudo yum install mariadb-server mariadb -y 

sudo systemctl start mariadb
sudo systemctl enable mariadb

sudo yum install php php-mysql php-fpm -y

sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/FLAGS' /etc/php.ini

sed -i 's/127.0.0.1:9000/\/var\/run\/php-fpm\/php-fpm.sock/FLAGS' /etc/php-fpm.d/www.conf

sed -i 's/;listen.owner = nobody/listen.owner = nginx/FLAGS' /etc/php-fpm.d/www.conf
sed -i 's/;listen.group = nobody/listen.group = nginx/FLAGS' /etc/php-fpm.d/www.conf

sed -i 's/user = apache/user = nginx/FLAGS' /etc/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/FLAGS' /etc/php-fpm.d/www.conf

sudo systemctl start php-fpm
sudo systemctl enable php-fpm

sudo sudo yum install -y git

sudo git clone https://github.com/rylea105/Script.git
sudo cp phpMyAdmin.conf /etc/nginx/conf.d/

sudo systemctl start nginx
sudo systemctl enable nginx

sudo yum install phpmyadmin

sudo ln -s /usr/share/phpMyAdmin /usr/share/nginx/html

sudo systemctl restart php-fpm

sudo chmod 755 /usr/share/phpMyAdmin
sudo chmod -R nginx:nginx /usr/share/phpMyAdmin

sudo chmod 755 /var/lib/php/session

sudo setenforce 0
