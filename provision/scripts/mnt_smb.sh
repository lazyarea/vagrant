#!/bin/sh


grep vagrant /etc/fstab > /dev/null 2>&1
if [ $? -ne 0 ]; then
  yum install -y samba-client cifs-utils
  echo "//192.168.33.1/Workspace /mnt/workspace cifs username=vagrant,password=vagrant,uid=1000,gid=1000 0 0" >> /etc/fstab
fi
