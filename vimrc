" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"vim needs a posix compliant shell
if &shell =~# 'fish$'
    set shell=/bin/bash
endif

"pathogen init
runtime macros/matchit.vim
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on

"prevents some security exploits having to do with modelines
set modelines=0

"tab settings
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

" Add line numbers
set number
set ruler

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set encoding
set encoding=utf-8

"color stuff
syntax on
set t_Co=256
set background=dark

let g:molokai_original = 0
colorscheme molokai
set linespace=2

let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme smyck

set showmatch

let mapleader=" "

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Shortcut to reload vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"NERDTree stuff
nmap <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['tmp', 'pkg$']
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" make uses real tabs
autocmd FileType make set noexpandtab
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
"autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
