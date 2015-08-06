"Vundle pre-setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install some vundle bundles

"Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 

"Other vim plugins
Plugin 'tpope/vim-fugitive'
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
Plugin 'bling/vim-airline'
Plugin 'Townk/vim-autoclose'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype indent on    " required
filetype plugin on    " required

" Dragvisuals -------------------------
vmap  <expr>  P        DVB_Duplicate()
vmap  <expr>  H        DVB_Drag('left')
vmap  <expr>  L        DVB_Drag('right')
vmap  <expr>  J        DVB_Drag('down')
vmap  <expr>  K        DVB_Drag('up') 

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Syntastic -----------------------------
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_ocaml_checkers = ['merlin']

" Vim Airline ----------------------------

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Nertree binding ---------------------
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Utilsnips fixes ---------------------
let g:UltiSnipsExpandTrigger="<c-j>"

" Merlin for OCaml --------------------
if executable('ocamlmerlin') && has('python')
  let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/ocamlmerlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

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
highlight LineNr ctermbg=237
set showcmd             		" show command in bottom bar
set wildmenu            		" visual autocomplete for command menu
set lazyredraw          		" redraw only when we need to.
set showmatch           		" highlight matching [{()}]
set cursorline                  " Shows a line under cursor
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.*/

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
nnoremap <space> zA
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

" function for python indenting
au BufEnter *.py setf python
au BufEnter *.pyc setf python
au FileType python call FT_python()
function! FT_python()
    set tabstop=4       			" number of visual spaces per tab
    set softtabstop=4   			" number of spaces in tab when editing
    set expandtab       			" tabs are spaces
    set shiftwidth=2
    set tabstop=2
    let opamshare=system("opam config var share | tr -d '\n'")
    execute "autocmd FileType ocaml source".opamshare."/vim/syntax/ocp-indent.vim"
endfunction

" ocp-indent for OCaml indenting
execute ":source " . "/Users/mac/.opam/4.01.0/share/vim/syntax/ocp-indent.vim"
au BufEnter *.ml setf ocaml
au BufEnter *.mli setf ocaml
au FileType ocaml call FT_ocaml()
function! FT_ocaml()
    set shiftwidth=2
    set tabstop=2
    let opamshare=system("opam config var share | tr -d '\n'")
    execute "autocmd FileType ocaml source".opamshare."/vim/syntax/ocp-indent.vim"
endfunction

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

