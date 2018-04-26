#Install Zabbix-Agent
rpm -ivh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm

yum install zabbix-agent -y

sed -i 's/Server=127.0.0.1/Server=13.229.70.11/g' /etc/zabbix/zabbix_agentd.conf

sudo systemctl start zabbix-agent
sudo systemctl enable zabbix-agent
