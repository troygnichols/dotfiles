set nocompatible

execute pathogen#infect()

syntax on

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set backup
set ruler
set showcmd
set incsearch
set hlsearch
set backspace=indent,eol,start
set number
set ruler
set modeline
set modelines=3
set nobackup
set nowritebackup
set list

filetype plugin indent on

noremap <esc> :nohl<cr> :BuffergatorClose<cr>

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Rename the current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New filename: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

map <leader>rf :call RenameFile()<cr>

map <leader>n :NERDTreeToggle<cr>
