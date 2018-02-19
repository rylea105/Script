#!/bin/bash

#install epel-release
yum install -y epel-release

#install docker
cd Script
git clone https://github.com/DeathSy/ksotis.git

#install git
yum install -y git

#clone docker-build repo
git clone https://github.com/rylea105/docker.git
