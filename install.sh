#!/bin/bash
echo "----> Removing old vim folder"
rm -R -f ~/.vim
mkdir ~/.vim
echo "----> Cloning new vim configs"
git clone https://github.com/dehimb/vim.git ~/.vim
echo "----> Installing Vundle plugin"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "----> Installing vim plugins"
vim +PluginInstall +qall