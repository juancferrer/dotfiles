#!/bin/sh

#TODO: Learn sh foo, and make it a function....
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s `pwd`/.tmux.conf ~/.tmux.conf
ln -s `pwd`/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
ln -s `pwd`/Vundle.vim ~/.vim/bundle/
ln -s `pwd`/.ssh/config ~/.ssh/config
ln -s `pwd`/.bashrc ~/.bashrc
ln -s `pwd`/.Xmodmap ~/.Xmodmap
ln -s `pwd`/.ssh/config ~/.ssh/config
