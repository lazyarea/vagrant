#!/bin/sh
if grep CAKEPHP_ENV > /dev/null; then
  echo "export CAKEPHP_ENV=local" >> ~vagrant/.bashrc
fi
sed -ie 's/enforcing/disabled/g' /etc/selinux/config
setenforce 0
