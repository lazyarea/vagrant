#!/usr/bin/env bash

PY3_VER='3.4.9'
PY3_PJ_DIR='~/vagrant/pythonprojects'
PY3_VIRT_DIR='mysite'
my_pj_name='helloworld'

sudo -uvagrant pyenv install ${PY3_VER}

if [ -e ~/vagrant/pythonprojects ];then
  exit(0)
else
  su - vagrant
  cd ~
  mkdir -p ${PY3PY3_PJ_DIR}
  cd ${PY3PY3_PJ_DIR}
  pyenv install ${PY3_VER}
  pyenv local ${PY3_VER}
  virtualenv ${PY3_VIRT_DIR}
  cd ${PY3_VIRT_DIR}
  source bin/activate
#  pip install virtualenv

cat > FREEZE.txt << FREEZE
asn1crypto==0.24.0
cffi==1.11.5
cryptography==2.3.1
Django==2.0.9
django-debug-toolbar==1.10.1
idna==2.7
pycparser==2.19
PyMySQL==0.9.2
pytz==2018.5
six==1.11.0
sqlparse==0.2.4
uWSGI==2.0.17.1
FREEZE

  pip install -r FREEZE.txt
  django-admin startproject ${my_pj_name}
  cd ${my_pj_name}
fi
