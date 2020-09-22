#!/bin/sh

yum -y install kernel-devel kernel-headers dkms gcc gcc-c++
sed -ie 's/enforcing/disabled/g' /etc/selinux/config

grep SELINUX=disabled /etc/selinux/config > /dev/null 2>&1
if [ $? -eq 1 ]; then
  setenforce 0
fi

ls ~vagrant/.ssh/id_rsa > /dev/null 2>&1
if  [ $? -ne 0 ]; then
cat >> ~vagrant/.bashrc << SSHADD

#-----------------
eval `ssh-agent`
ssh-add $HOME/.ssh/id_rsa
SSHADD

fi
yum install -y kernel-devel

cat >> /etc/rc.d/rc.local << LOCAL

df -T | grep vagrant > /dev/null 2>&1
if [ \$? -eq 1 ]; then
  mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3`,dmode=777,fmode=666 vagrant /vagrant
  mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g vagrant`,dmode=777,fmode=666 vagrant /vagrant
fi
LOCAL
chmod 755 /etc/rc.d/rc.local
