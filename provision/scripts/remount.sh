#!/bin/bash

if [ ! -e ${HOME}/bin ]; then
  mkdir ${HOME}/bin
fi
cat > ${HOME}/bin/remount.sh << REMOUNT

#!\/bin\/sh

if [ \${EUID:-\${UID}} = 0 ]; then
    echo 'remount /vagrant'
else
    echo 'U need to DO AS root.'
fi

mount -t vboxsf -o uid=\`id -u vagrant\`,gid=\`getent group vagrant | cut -d: -f3\` vagrant /vagrant
mount -t vboxsf -o uid=\`id -u vagrant\`,gid=\`id -g vagrant\` vagrant /vagrant
REMOUNT
