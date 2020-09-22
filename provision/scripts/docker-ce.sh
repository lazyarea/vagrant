#!/bin/sh

rpm -qa | grep docker > /dev/null 2>&1
if [ $? -ne 0] ; then
  yum install docker
  groupadd docker
  usermod -aG docker vagrant
  systemctl start docker
  systemctl enable docker
fi
ls /usr/local/bin/docker-compose > /dev/null 2>&1
if [ $? -ne 0 ]; then
  curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi

