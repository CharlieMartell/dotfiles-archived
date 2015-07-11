" Colors + Schemes
set t_Co=256
set background=dark
colorscheme molokai
syntax enable

" Spaces & Tabs
set tabstop=4       			" number of visual spaces per tab
set softtabstop=4   			" number of spaces in tab when editing
set expandtab       			" tabs are spaces

" Filetype recognition for pyflakes
filetype on                     " enables filetype detection
filetype plugin on              " enables filetype specific plugins

" UI Config
set number              		" show line numbers
set showcmd             		" show command in bottom bar
set cursorline          		" highlight current line
filetype indent on      		" load filetype-specific indent files
set wildmenu            		" visual autocomplete for command menu
set lazyredraw          		" redraw only when we need to.
set showmatch           		" highlight matching [{()}]

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

" Directories for swap, undo and bak "
set dir=~/.vim/.swap
set undodir=~/.vim/.undo
set backupdir=~/.vim/.backup

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

" Pathogen install bundles!
execute pathogen#infect()
