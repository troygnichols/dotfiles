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
set relativenumber
set undofile

let mapleader=","

filetype plugin indent on

nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

nnoremap ; :

inoremap jj <ESC>

" Make ,w split window vertically then focus on new window
nnoremap <leader>w <C-w>v<C-w>l

" Make ,e split window horizontally then focus on new window
nnoremap <leader>e <C-w>s<C-w>j

" nnoremap j gj
" nnoremap k gk
map <leader>r :NERDTreeFind<cr>

au FocusLost * :wa

nnoremap <leader>v V`]

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

colorscheme molokai

