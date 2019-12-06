#!/bin/sh

mkdir -p ~vagrant/.vim/colors
cd ~vagrant/.vim
mkdir colors

git clone https://github.com/tomasr/molokai

mv molokai/colors/molokai.vim ~vagrant/.vim/colors/

cat >> ~vagrant/.vimrc << VIM

set tabstop=4↲
set shiftwidth=4↲
set number↲
set title↲
set ambiwidth=double↲
set tabstop=4↲
set expandtab↲
set shiftwidth=4↲
set smartindent↲
set list↲
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%↲
set nrformats-=octal↲
set hidden↲
set history=50↲
set virtualedit=block↲
set whichwrap=b,s,[,],<,>↲
set backspace=indent,eol,start↲
set wildmenu↲
colorscheme molokai
set t_Co=256
VIM
chown vagrant. ~vagrant/.vimrc
chown -R vagrant. ~vagrant/.vim
