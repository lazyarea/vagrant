#!/bin/bash

yum -y install gcc zlib-devel bzip2 bzip2-devel readline readline-devel \
  openssl openssl-devel python2-pip git libffi-devel \
  libSM libSM-devel libXrender libXrender-devel  libXext libXext-devel \
  sqlite-devel

grep PYENV_ROOT ~vagrant/.bashrc > /dev/null 2>&1
if [ $? -eq 1 ]; then
  git clone https://github.com/pyenv/pyenv.git ~vagrant/.pyenv
  sudo chown -R vagrant.  ~vagrant/.pyenv
cat >> ~vagrant/.bashrc << 'PYENV'

#-----------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
PYENV

fi
