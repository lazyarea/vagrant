#!/bin/sh

grep CAKEPHP_ENV ~vagrant/.bashrc > /dev/null 2>&1

if [ $? -eq 1 ]; then
  echo "export CAKEPHP_ENV=local" >> ~vagrant/.bashrc
fi

grep SELINUX=disabled /etc/selinux/config > /dev/null 2>&1
if [ $? -eq 1 ]; then
  sed -ie 's/enforcing/disabled/g' /etc/selinux/config
  setenforce 0
fi
