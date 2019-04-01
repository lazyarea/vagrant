#!/bin/sh


sed -ie 's/enforcing/disabled/g' /etc/selinux/config

grep SELINUX=disabled /etc/selinux/config > /dev/null 2>&1
if [ $? -eq 1 ]; then
  setenforce 0
fi

if [ -e /vagrant/provision/files/id_rsa.pub ]; then
  grep "vagrant_ssh" ~vagrant/.ssh/authorized_keys > /dev/null 2>&1
  if [ $? -eq 1 ]; then
    cat /vagrant/provision/files/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
  fi
fi
