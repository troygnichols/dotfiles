call plug#begin('~/.config/vim/plugged')

source ~/.config/nvim/pluginit.vim

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Plug 'ctrlpvim/ctrlp.vim'

" Plug 'w0rp/ale'

" Plug 'haya14busa/incsearch.vim'

" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'

" Plug 'jeetsukumaran/vim-buffergator'

" Plug 'mileszs/ack.vim'

" " Plug 'SirVer/ultisnips'
" " Plug 'honza/vim-snippets'
" " Plug 'alexbyk/vim-ultisnips-js-testing'

" " Plug 'Townk/vim-autoclose'

" Plug 'tpope/vim-fugitive'

" " deoplete + requirements
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'

" Plug 'wokalski/autocomplete-flow'

" Plug 'junegunn/vim-easy-align'

" " various colorschemes
" " http://vimcolors.com/
" Plug 'freeo/vim-kalisi'
" Plug 'w0ng/vim-hybrid'
" Plug 'bitterjug/vim-colors-bitterjug'
" Plug 'jonathanfilip/vim-lucius'
" Plug 'crusoexia/vim-monokai'
" Plug 'jacoborus/tender.vim'
" Plug 'pbrisbin/vim-colors-off'
" Plug 'muellan/am-colors'
" Plug 'blueshirts/darcula'
" Plug 'altercation/vim-colors-solarized'

" " Language Support {{{3
" " JavaScript {{{4
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'rhysd/npm-debug-log.vim'
" Plug 'AndrewRadev/ember_tools.vim'
" " Plug 'neovim/node-host',                  { 'do': 'npm install' }
" Plug 'Quramy/vim-js-pretty-template'

" " TypeScript {{{4
" Plug 'HerringtonDarkholme/yats.vim'
" " Plug 'mhartington/nvim-typescript',       { 'do': ':UpdateRemotePlugins' }

" " Elm {{{4
" Plug 'ElmCast/elm-vim'

" " HTML {{{4
" Plug 'othree/html5.vim'
" Plug 'joukevandermaas/vim-ember-hbs'
" Plug 'mattn/emmet-vim'

" " CSS {{{4
" Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }

" " Sass {{{4
" Plug 'cakebaker/scss-syntax.vim'

" " Ruby {{{4
" Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-endwise'

" " Python {{{4
" Plug 'klen/python-mode',                  { 'for': 'python' }
" Plug 'davidhalter/jedi-vim',              { 'for': 'python' }
" Plug 'alfredodeza/pytest.vim',            { 'for': 'python' }

" " Rust {{{4
" Plug 'wellbredgrapefruit/tomdoc.vim',     { 'for': 'ruby' }
" Plug 'wting/rust.vim'
" Plug 'cespare/vim-toml'

" " Go {{{4
" Plug 'fatih/vim-go'
" " Plug 'nsf/gocode',                        { 'rtp': 'nvim', 'do': './nvim/symlink.sh' }

" " Markdown {{{4
" Plug 'reedes/vim-pencil'                  " Markdown, Writing
" Plug 'godlygeek/tabular',
" Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }

" " Elixir {{{4
" Plug 'elixir-editors/vim-elixir'
" Plug 'slashmili/alchemist.vim'

" " Java
" Plug 'artur-shaik/vim-javacomplete2'

" Plug 'Yggdroot/indentLine'

" Plug 'maxbane/vim-asm_ca65'

call plug#end()

set nocompatible

" execute pathogen#infect()

" Helptags

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

" vim-airline likes this
" set laststatus=2

" don't syntax highlight hugely long lines
set synmaxcol=2048

" these two go together
set ignorecase
set smartcase

set relativenumber

let g:sparkupExecuteMapping = '<C-l>'
let g:sparkupNextMapping = '<C-k>'

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

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" cnoremap ; :
" nnoremap ; :
" nnoremap : ;

" inoremap kj <ESC>
" inoremap jk <ESC>

" split window vertically then focus on new window
nnoremap <leader>w/ <C-w>v<C-w>l

" split window horizontally then focus on new window
nnoremap <leader>w- <C-w>s<C-w>j

" swap TWO vertically split windows for horizontal split
nnoremap <leader>wh <C-w>t<C-w>K

" swap TWO horizontally split windows for vertical split
nnoremap <leader>wv <C-w>t<C-w>H

" Window navigation shortcuts
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l

nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l

" Shortcuts for re-sizing splits
nnoremap <leader>d :resize +10<cr>
nnoremap <leader>f :resize -10<cr>
nnoremap <leader>s :vertical resize +10<cr>
nnoremap <leader>g :vertical resize -10<cr>

" auto-save all files on focus-lost
" au FocusLost * :wa

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

autocmd BufEnter * :call OnEnterBuffer()

function! OnEnterBuffer()
  " :call EnableRelativeNumber()
  :call SetBuffergatorSettings()
endfunction

function! SetBuffergatorSettings()
  let g:buffergator_viewport_split_policy="B"
  let g:buffergator_hsplit_size=10
endfunction

" NERDTree handles this now.
" function! EnableRelativeNumber()
"   " Don't do it for the NERDTree buffer
"   if bufname('%') !~ 'NERD'
"     set relativenumber
"   endif
" endfunction

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

" colorscheme tender
" colorscheme tender
" only relevant with tender theme, makes highlights more visible
highlight Visual ctermbg=102

" colorscheme solarized
" let g:solarized_termcolors=256
" set background=dark

" colorscheme jellybeans
" colorscheme atom-dark-256
" colorscheme off
colorscheme gruvbox
set background=light

" UltiSnippets config
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsEditSplit="vertical"

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
let g:multi_cursor_quit_key='<C-c>'

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

" allow sparkup shorcuts on various other filetypes (besides default .html)
augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType mustache,php,htmldjango,jsx,javascript runtime! bundle/sparkup/ftplugin/html/sparkup.vim
augroup END


let g:ctrlp_custom_ignore = 'node_modules$'

" comment (using commentary plugin)
nmap <Leader>/ gcc
vmap <Leader>/ gc

" for vim-fugitive: open the output of Ggrep (git grep) in a quickfix window
" instead of raw terminal output
autocmd QuickFixCmdPost *grep* cwindow

" Command to wrap vim-fugitive's Ggrep in 'silent' to it doesn't
" flash the terminal output before opening the quickfix window.
" Call it like :Gg foo.c
command! -nargs=1 Gg silent Ggrep! <f-args>

" Open Dash.app for current word under cursor
nmap <silent> <leader>D <Plug>DashSearch

" adds a slight delay when using ctrlp
" better experience with large projects
" let g:ctrlp_lazy_update=1

" ctrlp caching
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" ctrlp use ag for searching, faster
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" ack.vim really use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Ack.vim folds results from same file
let g:ack_autofold_results = 1

" HACK ALERT: close NERDTree before starting a search to
" prevent the Quickfix window from getting all shifted around.
" This might be unncessary in a future version of ack.txt
" so you could take out the :NERDTreeClose<CR> part
noremap <Leader>a :NERDTreeClose<CR>:Ack!<space>
noremap <Leader>z :Ack! <cword><cr>

nnoremap <Leader>j :cnext<cr>
nnoremap <Leader>k :cprev<cr>

let g:airline_powerline_fonts = 1

" set-window-option -g utf8 on
" set -g default-terminal "screen-256color"

let NERDTreeShowHidden=0

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

" use emmet-vim to complete a CSS abbreviation to HTML
imap <c-l> <c-y>,

" deoplete
let g:deoplete#enable_at_startup = 1

" if we're in a Quickfix window, " <c-p> should move up, not open CtrlP
function! MaybeOpenCtrlP()
  if &buftype == 'quickfix'
    normal! k
  else
    :CtrlP
  endif
endfunction

command! MaybeOpenCtrlP call MaybeOpenCtrlP()
" let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cmd = 'MaybeOpenCtrlP'

let g:NERDTreeWinPos='right'

" Unfold everything
set foldmethod=manual
set nofoldenable
set foldlevel=99

set cursorline

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
let g:indentLine_char = '│'

" indentLine conceals things we don't want to conceal in some files
" so diable its concealing there.
autocmd Filetype markdown :IndentLinesDisable
autocmd Filetype text :IndentLinesDisable
autocmd Filetype json :IndentLinesDisable
" set conceallevel=0

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
:autocmd FileType ruby nnoremap <buffer> <leader>h Obinding.pry<esc>j0w
:autocmd FileType ruby nnoremap <buffer> <leader>r Obinding.remote_pry<esc>j0w

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
    au BufNewFile,BufRead *.s,*.inc,*.asm set ft=asm_ca65
augroup END
" Tabularize
augroup tabcomments
  au BufNewFile,BufRead *.asm nnoremap <leader><enter> :Tabularize /;/l4r1<cr>
augroup END

" Better tab completion
set wildmode=longest,list
set completeopt+=longest

" coc config
let g:coc_global_extension = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" From normal mode, add a semicolon at end of line and
" return curosor to original position, stayng in normal mode.
nnoremap ; maA;<esc>`a

" Format code with Prettier
nnoremap F :Prettier<cr>

function! FixWebDevIcons()
  if exists('g:loaded_webdevicons')
      call webdevicons#refresh()
  endif
endfunction

" after a re-source, fix syntax matching issues (concealing brackets):
" https://github.com/ryanoasis/vim-devicons/issues/154
call FixWebDevIcons()
" autocmd BufEnter * call FixWebDevIcons()

nnoremap <leader>F :NERDTreeFind<cr>

nnoremap <leader>i :IndentLinesToggle<cr>
