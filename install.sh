#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "Brewing all the things"
    source install/brew.sh

    echo "Updating OSX settings"
    source install/osx.sh

    # Remove solaire script for now
    #for dir in ~/.dotfiles/python/*; do
    #       sudo pip install $dir;
    #done
fi

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."
