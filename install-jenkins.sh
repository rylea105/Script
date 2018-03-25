#!/bin/bash

#Update CentOS 7
yum -y update

#Install wget
yum install -y wget

#get java JDK Repo
wget -p /opt/ --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz"
tar xzf /opt/jdk-8u161-linux-x64.tar.gz

#Install Java 8 with Alternatives
cd /opt/jdk1.8.0_161/
alternatives --install /usr/bin/java java /opt/jdk1.8.0_161/bin/java 2
yes '1' | alternatives --config java


alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_161/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_161/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_161/bin/jar
alternatives --set javac /opt/jdk1.8.0_161/bin/javac

#Setup Java Environment Variables
export JAVA_HOME=/opt/jdk1.8.0_161
export JRE_HOME=/opt/jdk1.8.0_161/jre
export PATH=$PATH:/opt/jdk1.8.0_161/bin:/opt/jdk1.8.0_161/jre/bin

#install jenkins
cd ~ 
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins -y

#Start and Enable Jenkins Services
systemctl start jenkins
systemctl enable jenkins
