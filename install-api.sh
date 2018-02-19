#!/bin/bash

#install epel-release
yum install -y epel-release

#install docker
yum install -y docker-ce-17.12.0.ce
systemctl start docker

#install git
yum install -y git

#clone docker-build repo
git clone https://github.com/rylea105/docker.git
