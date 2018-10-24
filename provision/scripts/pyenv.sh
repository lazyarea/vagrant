#!/bin/bash

grep PYENV_ROOT ~vagrant/.bashrc > /dev/null 2>&1
if [ $? -eq 1 ]; then

cat > ~vagrant/.bashrc << PYENV

#-----------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
PYENV

fi
