#!/bin/bash

if grep pyenv ~vagrant/.bashrc > /dev/null; then

cat > ~vagrant/.bashrc << PYENV

  #-----------------
  export PATH="~/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
PYENV

fi
