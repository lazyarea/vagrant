#!/bin/sh
echo "export CAKEPHP_ENV=local" >> ~vagrant/.bashrc
sed -ie 's/enforcing/disabled/g' /etc/selinux/config
