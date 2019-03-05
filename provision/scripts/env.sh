#!/bin/sh

grep CAKEPHP_ENV > /dev/null 2>&1

if [ $? -eq 1 ]; then
  echo "export CAKEPHP_ENV=local" >> ~vagrant/.bashrc
fi
sed -ie 's/enforcing/disabled/g' /etc/selinux/config

grep SELINUX=disabled /etc/selinux/config > /dev/null 2>&1
if [ $? -eq 1 ]; then
  setenforce 0
fi

ls ~vagrant/.ssh/id_rsa
if  [ $? -ne 0 ]; then
cat >> ~vagrant/.bashrc << SSHADD

#-----------------
eval `ssh-agent`
ssh-add $HOME/.ssh/id_rsa
SSHADD

fi
