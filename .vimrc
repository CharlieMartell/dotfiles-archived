
" Vim config file
" http://www.github.com/zysh

" Pathogen for managing vim packages
execute pathogen#infect()

"  Syntax + Filetype rules
syntax enable
syntax on
filetype on
filetype plugin on
filetype plugin indent on

" JS
au FileType javascript set sw=2
au FileType javascript set ts=2

" HTML
au FileType html set sw=2
au FileType html set ts=2

" Ruby
au FileType ruby set sw=2
au FileType ruby set ts=2
au FileType eruby set sw=2
au FileType eruby set ts=2
" CSS
au FileType css set sw=2
au FileType css set ts=2

" Alias commands for caps
command W w
command Wa wa
command Wq Wq

" Theme settings
set t_Co=456
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Color settings to match theme
hi Normal ctermbg=NONE
hi LineNr ctermbg=NONE
hi TabLine ctermbg=NONE
hi TabLineFill ctermbg=NONE
hi SpecialKey ctermbg=NONE
hi NonText ctermfg=236

" Shows line number
set number

" Tabs are now spaces
set expandtab

" Cap on open tabs
set tabpagemax=50

" Sets auto indent + spacing
set ai 
set sw=2
set ts=2

" Directories for swap, undo and bak "
set dir=~/.vim/.swap
set undodir=~/.vim/.undo
set backupdir=~/.vim/.backup

" Sets newline and tab chars
set list
set listchars=tab:▸\ ,eol:¬
