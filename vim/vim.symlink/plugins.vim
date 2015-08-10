" Vundle pre-setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install some vundle bundles

"Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 

"Other vim plugins
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'morhetz/gruvbox'
Plugin 'edkolev/tmuxline.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/vim-ocaml-conceal'
Plugin 'jondkinney/dragvisuals.vim'
Plugin 'kevinw/pyflakes-vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'ehamberg/vim-cute-python'
Plugin 'valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'unblevable/quick-scope'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype indent on    " required
filetype plugin on    " required
