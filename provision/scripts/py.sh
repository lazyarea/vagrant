#!/bin/bash

yum -y install gcc zlib-devel bzip2 bzip2-devel readline readline-devel \
  openssl openssl-devel python-virtualenv python2-pip

pip install --upgrade pip
