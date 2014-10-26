set nocompatible
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on

let mapleader=","
let maplocalleader="\\"

set nowrap
set tabstop=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set pastetoggle=<F2>

" Editor layout
set termencoding=utf-8
set encoding=utf-8
set lazyredraw
set laststatus=2

" Vim behaviour
set hidden
set nobackup
set noswapfile
set wildmenu
set wildmode=list:full
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set nomodeline
set cursorline
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Some keys
nnoremap ; :
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l


" Theming
colors jellybeans
"let g:airline_theme='jellybeans'
"let g:tmuxline_theme='jellybeans'
let g:tmuxline_powerline_separators = 0
