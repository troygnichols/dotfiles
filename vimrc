set nocompatible

execute pathogen#infect()

Helptags

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
set undofile
set nolist
set virtualedit=insert
set timeoutlen=1000 ttimeoutlen=0

let mapleader=","

let g:buffergator_suppress_keymaps=1

noremap <leader>b :BuffergatorToggle<cr>

filetype plugin indent on

nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

noremap <leader>rf :call RenameFile()<cr>
noremap <leader>n :NERDTreeToggle<cr>

noremap <leader>r :NERDTreeFind<cr>

cnoremap ; :
nnoremap ; :
nnoremap : ;

inoremap kj <ESC>

" Make ,w split window vertically then focus on new window
nnoremap <leader>w <C-w>v<C-w>l

" Make ,e split window horizontally then focus on new window
nnoremap <leader>e <C-w>s<C-w>j


au FocusLost * :wa

nnoremap <leader>v V`]

" CTRL+R to find/replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufEnter * :call OnEnterBuffer()

function! OnEnterBuffer()
  :call EnableRelativeNumber()
  :call SetBuffergatorSettings()
endfunction

function! SetBuffergatorSettings()
  let g:buffergator_viewport_split_policy="B"
  let g:buffergator_hsplit_size=10
endfunction

function! EnableRelativeNumber()
  " Don't do it for the NERDTree buffer
  if bufname('%') !~ 'NERD'
    set relativenumber
  endif
endfunction

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

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

" colorscheme molokai
" hi Visual ctermbg=DarkGrey guibg=DarkGrey

" set background=dark
" colorscheme solarized

" UltiSnippets config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" Tab autocomplete unless at beginning of line
" -- disabled for now - can't get it to play nice with ulti-snippets
" function! InsertTabWrapper()
"   let line = getline('.')                     " current line
"
"   let substr = strpart(line, -1, col('.')+1)  " from the start of the current
"                                               " line to one character right
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] !~ '\k'
"     return "\<tab>"
"   endif
"
"   return "\<C-n>"                     " existing text matching
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-p>

" Add a line above/below but stay in normal mode
nnoremap <C-m> o<esc>
noremap M O<esc>
