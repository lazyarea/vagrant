#!/bin/sh

ls /home/docker > /dev/null 2>&1
if [ $? -ne 0 ]; then
  cd /home
  git clone https://github.com/Laradock/laradock.git docker
fi

