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
set scrolloff=4

" don't syntax highlight hugely long lines
set synmaxcol=2048

" these two go together
set ignorecase
set smartcase

let mapleader="\<Space>"

let g:buffergator_suppress_keymaps=1

noremap <leader>b :BuffergatorToggle<cr>

filetype plugin indent on

nnoremap <silent> <leader><space> :let @/ = ""<cr>

nnoremap <tab> %
vnoremap <tab> %

noremap <leader>rf :call RenameFile()<cr>
noremap <leader>n :NERDTreeToggle<cr>

noremap <leader>m :NERDTreeFind<cr>

cnoremap ; :
nnoremap ; :
nnoremap : ;

inoremap kj <ESC>
inoremap jk <ESC>

" Make ,w split window vertically then focus on new window
nnoremap <leader>w <C-w>v<C-w>l

" Make ,e split window horizontally then focus on new window
nnoremap <leader>e <C-w>s<C-w>j

" Window navigation shortcuts
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Shortcuts for re-sizing splits
nnoremap <leader>d :resize +10<cr>
nnoremap <leader>f :resize -10<cr>
nnoremap <leader>s :vertical resize +10<cr>
nnoremap <leader>g :vertical resize -10<cr>

au FocusLost * :wa

" Select to end of file
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

" colorscheme jellybeans
colorscheme atom-dark-256

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

" Add a line above but stay in normal mode
nnoremap U O<esc>

" save/write file shortcut
inoremap <C-s> <esc>:write<cr>
nnoremap <C-s> <esc>:write<cr>

" Ctrl-C does not trigger InsertLeave by default
" This will make it trigger InsertLeave
ino <C-C> <esc>

" Don't move the cursor backwards when returning
" to Normal Mode from Insert Mode
function! PreventEscCursorMove()
  " Don't do this when we're at the beginning of a line
  " or we'll move forward.
  let pos = getpos('.')[2]
  if pos == 1
    return
  endif
  call cursor(0, pos+1)
endfunction

" This breaks Ultisnips.  Perhaps there is a
" way to tell if we're currently in a snippet
" and don't run the code if so?
" au InsertLeave * call PreventEscCursorMove()

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:multi_cursor_start_key='\'
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-\>'
let g:multi_cursor_skip_key='<C-g>'

" Toggle paste mode
nnoremap <silent> <leader>t :call TogglePaste()<cr>
function! TogglePaste()
  if &paste == 0
    set paste
    echo "Paste On"
  else
    set nopaste
    echo "Paste Off"
  endif
endfunction

" File extension syntax highlighting mappings
au BufRead,BufNewFile *.rabl set filetype=ruby
au BufRead,BufNewFile *.axlsx set filetype=ruby
au BufRead,BufNewFile *.jbuilder set filetype=ruby
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.gyp set filetype=json
au BufRead,BufNewFile *.jst.ejs set filetype=html

" Edit vim config
noremap <leader>c :e ~/.vimrc<cr>

" Reload current file
noremap <leader>l :source %<cr>

" Copy/paste with system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

autocmd FileType make set noexpandtab
autocmd FileType go set noexpandtab

" Close quickfix window
noremap <Leader>q :cclose<cr>

" Run goimports when saving .go files
let g:go_fmt_command = "goimports"
