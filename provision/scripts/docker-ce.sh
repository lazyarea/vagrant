#!/bin/sh

#setenforce 0 > /dev/null 2>&1
rpm -qa | grep docker > /dev/null 2>&1
if [ $? -eq 0] ; then
  yum remove -y docker  docker-common docker-selinux docker-engine
fi
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo  https://download.docker.com/linux/centos/docker-ce.repo > /dev/null 2>&1
# yum-config-manager --enable docker-ce-edge  > /dev/null 2>&1↲
# yum-config-manager --enable docker-ce-test  > /dev/null 2>&1↲
yum install -y docker-ce

systemctl start docker
systemctl enable docker

ls /usr/local/bin/docker-compose > /dev/null 2>&1
if [ $? -ne 0 ]; then
  curl -LO https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi

