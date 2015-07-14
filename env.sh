#!/usr/bin/env bash

# NOTE: curently this script only supports mac os
# Brew install
if ! type -p brew > /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
sudo apt-get install -y zsh vim git wget tmux

# Git config
git config --global user.name "CharlieMartell"
git config --global user.email "charliecmartell@gmail.com"

DOTFILES=~/repositories/dotfiles.git
for file in $DOTFILES
do
    if [[ $file != ~/repositories/dotfiles.git 
        && $file != ~/repositories/dotfiles. 
        && $file != ~/repositories/dotfiles.. ]] 
    then
        ln -s $file -f
    fi
done

# Vim & pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -LSso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Change shell
sudo chsh -s /bin/zsh $USER
source ~/.zlogin
source ~/.zshrc
