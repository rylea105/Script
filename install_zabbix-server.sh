#Install Zabbix-Server
rpm -ivh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm

yum install zabbix-server-mysql zabbix-web-mysql -y 

yum install -y mariadb-server

systemctl start mariadb
systemctl enable mariadb

mysql_secure_installation <<EOF

password
password
y
y
y
y
y
EOF

mysql -uroot -p <<EOF
password
create database zabbix character set utf8;
grant all privileges on zabbix.* to zabbix@localhost identified by 'password';
flush privileges;
quit;
EOF

cd /usr/share/doc/zabbix-server-mysql-3.0.4/
zcat create.sql.gz | mysql -uzabbix -p zabbix <<EOF
password
EOF

sed -i 's/# DBPassword=/DBPassword=password/g' /etc/zabbix/zabbix_server.conf

sed -i 's/# php_value date.timezone Europe\/Riga/# php_value date.timezone Asia\/Bangkok/g' /etc/httpd/conf.d/zabbix.conf

sudo systemctl restart httpd
sudo systemctl start zabbix-server
sudo systemctl enable zabbix-server

#Install Zabbix-Agent
rpm -ivh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm

yum install zabbix-agent -y

sed -i 's/Server=127.0.0.1/Server=13.229.70.11/g' /etc/zabbix/zabbix_agentd.conf

sudo systemctl start zabbix-agent
sudo systemctl enable zabbix-agent
