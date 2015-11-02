" Vundle pre-setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install some vundle bundles

"Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 

"Other vim plugins
"Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/fzf'
Plugin 'unblevable/quick-scope'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'bling/vim-airline'
"Plugin 'vim-scripts/vim-ocaml-conceal'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'kevinw/pyflakes-vim'
Plugin 'rking/ag.vim'
"Plugin 'ehamberg/vim-cute-python'
Plugin 'valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype indent on    " required
filetype plugin on    " required
