#!/bin/bash

yum -y install gcc zlib-devel bzip2 bzip2-devel readline readline-devel \
  openssl openssl-devel python2-pip git

grep PYENV_ROOT ~vagrant/.bashrc > /dev/null 2>&1
if [ $? -eq 1 ]; then
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cat >> ~vagrant/.bashrc << PYENV

#-----------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
PYENV

fi
