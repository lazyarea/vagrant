#!/bin/sh

yum install -y vim
mkdir -p ~vagrant/.vim/colors

git clone https://github.com/tomasr/molokai ~vagrant/.vim

cat >> ~vagrant/.vimrc << VIM

set tabstop=4
set shiftwidth=4
set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set nrformats-=octal
set hidden
set history=50
set hlsearch
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
colorscheme molokai
set t_Co=256
VIM
chown vagrant. ~vagrant/.vimrc
chown -R vagrant. ~vagrant/.vim
