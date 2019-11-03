scriptencoding utf-8

source ~/.config/nvim/pluginit.vim

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

syntax on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set ruler
set showcmd
set incsearch
set hlsearch
set backspace=indent,eol,start
set number
set modeline
set modelines=3
set nobackup
set nowritebackup
set undofile
set nolist
set virtualedit=insert,block
set timeoutlen=1000 ttimeoutlen=0
set scrolloff=4
set visualbell t_vb=
set relativenumber
set gdefault
set noshowmode " Mode is shown in Airline
set inccommand=nosplit

" don't syntax highlight hugely long lines
set synmaxcol=2048

" these two go together
set ignorecase
set smartcase

let mapleader="\<Space>"

filetype plugin indent on

nnoremap <silent> <leader><space> :let @/ = ""<cr>

noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>m :NERDTreeFind<cr>

nnoremap <tab> %
vnoremap <tab> %

" split window vertically then focus on new window
nnoremap <leader>w/ <C-w>v<C-w>l

" split window horizontally then focus on new window
nnoremap <leader>w- <C-w>s<C-w>j

" swap TWO vertically split windows for horizontal split
nnoremap <leader>wh <C-w>t<C-w>K

" swap TWO horizontally split windows for vertical split
nnoremap <leader>wv <C-w>t<C-w>H

" Window navigation shortcuts
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Shortcuts for re-sizing splits
nnoremap <leader>d :resize +10<cr>
nnoremap <leader>f :resize -10<cr>

nnoremap <m-l> :vertical resize +10<cr>
nnoremap <m-h> :vertical resize -10<cr>
nnoremap <leader>l :vertical resize +2<cr>
nnoremap <leader>h :vertical resize -2<cr>

" Select to end of file
nnoremap <leader>v V`]

" CTRL+R to find/replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Remove trailing whitespace
function! TrimWhiteSpace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

" make a command you can call like :TrimWhiteSpace
command! TrimWhiteSpace call TrimWhiteSpace()

" remove whitespace on save
autocmd BufWritePre * :call TrimWhiteSpace()

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" colorscheme tender
" highlight Visual ctermbg=66

" colorscheme hybrid
" highlight Visual ctermbg=102

""" solarized colorscheme
" colorscheme solarized
" let g:solarized_termcolors=256
" set background=dark
" hi clear SignColumn " kill ugly gray gutters
""""""""""""""""""""""""""""""""

" work with transparent bg
colorscheme darcula
hi! Normal ctermbg=NONE guibg=NONE

" Add a line above but stay in normal mode
nnoremap U O<esc>

" save/write file shortcut
inoremap <C-s> <esc>:write<cr>
nnoremap <C-s> <esc>:write<cr>

" Ctrl-C does not trigger InsertLeave by default
" This will make it trigger InsertLeave
ino <C-C> <esc>

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
au BufRead,BufNewFile *.jsx set filetype=javascript
au BufRead,BufNewFile *.eslintrc set filetype=json
au BufRead,BufNewFile *.babelrc set filetype=json
au BufRead,BufNewFile *.gyp set filetype=json
au BufRead,BufNewFile *.ejs set filetype=html
" au BufRead,BufNewFile *.coffee set filetype=javascript

" Edit vim config
noremap <leader>cc :e ~/.config/nvim/init.vim<cr>

" Edit plug config
noremap <leader>cx :e ~/.config/nvim/pluginit.vim<cr>

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
noremap <Leader>q :cclose<cr>:lclose<cr>

" Ack.vim folds results from same file
let g:ack_autofold_results = 1

" ack.vim really use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


noremap <Leader>a :Ack!<space>
noremap <Leader>z :Ack! <cword><cr>

" paste visual selection into ack search
vnoremap <leader>a y:Ack! <c-r>"

nnoremap <Leader>j :cnext<cr>
nnoremap <Leader>k :cprev<cr>

" let NERDTreeShowHidden=1
let g:NERDTreeWinPos='right'

" comment (using commentary plugin)
nmap <Leader>/ gcc
vmap <Leader>/ gc

""" Setup ALE
" use only eslint (not jshint)
let g:ale_linters = {'javascript': ['eslint']}

let g:ale_sign_warning = '•'
let g:ale_sign_error = '•'
let g:ale_sign_style_error = ''
let g:ale_sign_style_warning = ''
let g:ale_sign_column_always=1

nnoremap <leader>1 :ALEFirst<cr>
nmap <leader>] <Plug>(ale_next_wrap)
nmap <leader>[ <Plug>(ale_previous_wrap)

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" set signcolumn=yes
"""""


let g:buffergator_suppress_keymaps=1

noremap <leader>b :BuffergatorToggle<cr>

" use emmet-vim to complete a CSS abbreviation to HTML
imap <c-l> <c-y>,

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" deoplete config
let g:deoplete#enable_at_startup = 1

" UltiSnips config
let g:UltiSnipsListSnippets='<S-tab>'

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" set foldmethod=manual
" set nofoldenable
" set foldlevel=99

set cursorline

let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

set exrc
set secure

" save recent cursor position
function! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$") |
      execute 'normal! g`"zvzz' |
    endif
  end
endfunction
autocmd BufReadPost * call SetCursorPosition()

" Insert newline above/below without leaving Normal mode
nmap <M-Enter> mao<Esc>`a
" only do this maping if we are not in a Quickfix or Location window
" or we will clobber <CR>'s select functionality in some plugins like ack.vim
function! OnEnterPressed()
  if &buftype ==# 'quickfix'
    exec "normal! \<CR>"
  else
    exec "normal! maO\<Esc>`a"
  endif
endfunction
nnoremap <CR> :call OnEnterPressed()<CR>

" In visual mode - remove blank lines in selection (and remove highlights)
vnoremap <M-l> :g/^\s*$/d<cr>:let @/ = ""<cr>

" Needed to make vim-json plugin play nicely with indentLines
let g:vim_json_syntax_conceal = 0

" Don't conceal in markdown
let g:vim_markdown_conceal = 0

" Better looking indentLine character
" let g:indentLine_char = '│'
let g:indentLine_char = '┋'

" indentLine conceals things we don't want to conceal in some files
" so diable its concealing there.
autocmd Filetype markdown :IndentLinesDisable
autocmd Filetype text :IndentLinesDisable
autocmd Filetype json :IndentLinesDisable
autocmd Filetype notes :IndentLinesDisable
" set conceallevel=0


" Java Complete 2 plugin setup
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" Remove unused import on save, in java files
autocmd FileType java autocmd BufWritePre <buffer> call javacomplete#imports#RemoveUnused()
" let g:JavaComplete_CheckServerVersionAtStartup = 0
nmap <leader>ji <Plug>(JavaComplete-Imports-Add)
nmap <leader>jis <Plug>(JavaComplete-Imports-AddSmart)

"
""""""""""""""""""
" PHP
""""""""""""""""""

" linting
let g:ale_php_phpcs_standard='PSR2'

" indentation
augroup FileTypeSpecificAutocommands
  autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType make setlocal tabstop=4 softtabstop=4 shiftwidth=4 list
  autocmd FileType c setlocal list
augroup END

" insert space before (stay in normal mode)
nnoremap <leader>, i<space><esc>

" insert space after (stay in normal mode)
nnoremap <leader>. a<space><esc>

"
""""""""""""""""""
" Golang
""""""""""""""""""
"
" auto import
let g:go_fmt_command = "goimports"

set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.
" set listchars=tab:>.,trail:.,extends:\#,nbsp:.

inoremap <c-j> <down>
inoremap <c-k> <up>

let g:rustfmt_autosave=1

let g:jedi#usages_command = "<leader>u"
let g:jedi#auto_initialization = 0

nnoremap <leader>5 :%s/\v

" add debugger line above cursor in ruby files
:autocmd FileType ruby nnoremap <buffer> <leader>rr  Obinding.pry<esc>j0w
:autocmd FileType ruby nnoremap <buffer> <leader>re Obinding.remote_pry<esc>j0w

" scratch plugin config
nnoremap <leader>S :Scratch<cr>
let g:scratch_horizontal = 0
let g:scratch_filetype = 'text'
let g:scratch_height = 50

" Airline

" show ALE linting errors in airline status line
let g:airline#extensions#ale#enabled = 1

nnoremap <c-p> :FZF<cr>

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" convert a binary file to hex using xxd
nnoremap <leader>B :%!xxd<cr>

" convert hex back to binary text using xxd
nnoremap <leader>N :%!xxd -r<cr>

" Set emmet leader key
let g:user_emmet_leader_key=','

" treat .asm files as 6502 Assembly
filetype plugin indent on
augroup filetypedetect
  au BufNewFile,BufRead *.s,*.inc,*.asm call SetupNESASM()
augroup END
function! SetupNESASM()
  set filetype=nesasm
  set commentstring=;\ %s
endfunction

" Tabularize
augroup tabcomments
  au BufNewFile,BufRead *.asm nnoremap <leader>t/ :Tabularize /;/l4r1<cr>
augroup END

if exists('g:fvim_loaded')
    " set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    " set guifont=Roboto\ Mono\ for\ Powerline:h14
    set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h12
    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>

    " colorscheme tender
    " highlight Visual ctermbg=66

    colorscheme hybrid
    highlight Visual ctermbg=102

    " cd ~/Code
else
  " colorscheme tender
  " highlight Visual ctermbg=66

  " colorscheme hybrid
  " highlight Visual ctermbg=102

  """ solarized colorscheme
  colorscheme solarized
  let g:solarized_termcolors=256
  set background=dark
  hi clear SignColumn " kill ugly gray gutters
  """"""""""""""""""""""""""""""""
endif

""" vim-notes config
let g:notes_directories = ['~/Notes']
let g:notes_suffix = '.txt'
" let g:notes_smart_quotes = 0

