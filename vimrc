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
set modelines=3

"tab settings
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

" Add line numbers
set number
set ruler
"relative ruler
"set relativenumber

" disable swp files \o/ 
set noswapfile
set nobackup

"scroll when the cursor is three lines from the bottom/top
set scrolloff=3

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

"search related stuff
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"wrapping
set wrap
set showbreak=…
set linebreak

"disable arrow keys for training
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

" use double j as ESC
inoremap jj <ESC>

let mapleader=" "

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Shortcut to edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"NERDTree stuff
nmap <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['^tmp$', 'pkg$', '^.git$']
let NERDTreeShowHidden=1
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" make uses real tabs
autocmd FileType make set noexpandtab
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
"autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

if has("win32")
  command! -bar Fullscreen :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

"fugitive settings
let g:fugitive_github_domains = ['github.com', 'github.wdf.sap.corp']

"go specific stuff
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

"Enable goimports to automatically insert import paths instead of gofm
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1

let g:SuperTabDefaultCompletionType = "context"
set completeopt-=preview

"dash search mapping
:nmap <silent> <leader>d <Plug>DashSearch

"spell checking
set spelllang=en
set spellfile=$HOME/dotfiles/vim/spell/en.utf-8.add
au BufNewFile,BufRead,BufEnter *.md setlocal spell
au BufNewFile,BufRead,BufEnter *.slide setlocal spell

"open all fold by default http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file
autocmd Syntax concourse normal zR


nmap <F12> :TagbarToggle<CR>
