#!/bin/sh
echo "export CAKEPHP_ENV=local" >> ~vagrant/.bashrc
sed -i 's/enforcing/disabled/g' /etc/selinux/config
setenforce 0
