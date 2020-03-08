#!/bin/sh

yum install -y cifs-utils
grep workspace /etc/fstab > /dev/null 2>&1
if [ $? -ne 0 ]; then
echo '//192.168.33.1/Workspace /mnt/workspace cifs user=vagrant,password=vagrant,uid=1000,gid=1000 0 0' > /etc/fstab
fi
