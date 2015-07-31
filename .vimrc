"Vundle pre-setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install some vundle bundles

"Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 

"Other vim plugins
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype indent on    " required
filetype plugin on    " required

" Nertree binding
autocmd vimenter * NERDTree
map <C-m> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" utilsnips fixes
let g:UltiSnipsExpandTrigger="<c-j>"

" Filetype recognition for pyflakes
filetype on                     " enables filetype detection

"get color scheme right
set t_Co=256
set background=dark
syntax enable
colorscheme zenburn

" Spaces & Tabs
set tabstop=4       			" number of visual spaces per tab
set softtabstop=4   			" number of spaces in tab when editing
set expandtab       			" tabs are spaces

" UI Config
set number              		" show line numbers
set showcmd             		" show command in bottom bar
set wildmenu            		" visual autocomplete for command menu
set lazyredraw          		" redraw only when we need to.
set showmatch           		" highlight matching [{()}]
set cursorline                  " Shows a line under cursor

" Searching
set incsearch				    " search as characters are entered
set hlsearch				    " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding

" Set foldenable          		" enable folding
set foldlevelstart=10   		" open most folds by default
set foldnestmax=10      		" 10 nested fold max

" space open/closes folds
nnoremap <space> za
set foldmethod=indent   		" fold based on indent level

" Movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" Fix Strange backspace problem
set backspace=indent,eol,start

" Setup showing column numbers
set ruler

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

