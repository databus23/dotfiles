" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

syntax on
let g:zenburn_high_Contrast = 1
let g:liquidcarbon_high_contrast = 1
let g:molokai_original = 0
set t_Co=256
set background=dark
"colorscheme molokai
colorscheme solarized

set showmatch

let mapleader=" "

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

command -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>
