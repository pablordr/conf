set clipboard=unnamed           " Use system clipboard
set t_Co=256                    " 256 colors
set ruler                       " Ruler in status line
set ttyfast                     " Faster
set encoding=utf-8              " 
set autoread                    " reload files that have not been modified
set noeb vb t_vb=               " no bells no flashes
set nocompatible                " Disregard vi compatibility
set ttymouse=xterm2             " Mouse compatibility in tmux
set mouse=a                     " Enable mouse
set splitbelow                  " Splits show up below by default
set splitright                  " Splits go to the right by default
set nobackup                    " swp files are disgusting
set nowb                        " idem
set hlsearch                    " highlight search
set ignorecase                  " ignore case when searching
set smartcase                   " smart case sensitivity when searching
set ai                          " auto indenting
set expandtab                   " inserts spaces when tab is pressed
set smarttab                    " Improves <tab> when writing code
set shiftwidth=2                " 
set backspace=eol,start,indent  " classic backspace
set showmatch                   " matches parens, quotes, etc.
set tabstop=2                   " 
set listchars=tab:»\»,eol:¬,space:· 
set formatoptions=qrn1          " line wrapping 
set textwidth=80                " idem 
set wrap                        " idem
set textwidth=79                " idem
syntax on                       " set syntax
filetype plugin on              " 
set si                         " smarter auto-indenting

set number                      "
set laststatus=2
hi ColorColumn ctermbg=233
hi clear StatusLine
hi StatusLine ctermfg=NONE ctermbg=233
hi clear StatusLineNC
hi StatusLineNC ctermfg=238 
hi LineNr ctermfg=237
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80 wrapmargin=0 formatoptions+=t linebreak

let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_liststyle=3

let mapleader=";"                     " The <leader> key is ';'
map <leader>v :vsp<CR>                " Vertical split
map <leader>h :sp<CR>                 " Horizontal split
map <silent> <C-L> :set hlsearch!<CR> " Toggle search highlighting.
map <silent> <S-L> :set list!<CR>     " Toggle list mode
map <silent> <C-N> :set number!<CR>   " Toggle number mode
map <leader>- :vertical resize -5<CR> " Reduce vertical split
map <leader>+ :vertical resize +5<CR> " Reduce vertical split
map <leader>c :set clipboard="unnamed"<CR> " Allow copy/paste to os clipboard
map <leader>t :tabnew <CR>            " New tab
map <leader>e :Lexplore<CR>           " Toggle netrw left panel

highlight VertSplit cterm=NONE
