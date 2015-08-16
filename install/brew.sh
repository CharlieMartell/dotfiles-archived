#!/bin/sh

# cli tools
which the_silver_searcher || brew install the_silver_searcher
curl || brew install curl
which fzf || (brew install fzf && echo "yy" | /usr/local/Cellar/fzf/HEAD/install)
which tree || brew install tree
which wget || brew install wget

# development tools
which git || brew install git
which hub || brew install hub
which reattach-to-user-namespace || brew install reattach-to-user-namespace
which tmux || brew install tmux
which zsh || brew install zsh
which highlight || brew install highlight
which nvm || brew install nvm
which markdown || brew install markdown
