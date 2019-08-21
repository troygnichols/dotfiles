scriptencoding utf-8

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'dense-analysis/ale'

Plug 'haya14busa/incsearch.vim'

" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

Plug 'jeetsukumaran/vim-buffergator'

Plug 'mileszs/ack.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"
" Plug 'roxma/nvim-completion-manager'
"
" Plug 'wokalski/autocomplete-flow'

Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-fugitive'
Plug 'wesQ3/vim-windowswap'

Plug 'tpope/vim-unimpaired'

" various colorschemes
" http://vimcolors.com/
Plug 'freeo/vim-kalisi'
Plug 'w0ng/vim-hybrid'
Plug 'bitterjug/vim-colors-bitterjug'
Plug 'jonathanfilip/vim-lucius'
Plug 'crusoexia/vim-monokai'
Plug 'jacoborus/tender.vim'
Plug 'pbrisbin/vim-colors-off'
Plug 'muellan/am-colors'
Plug 'blueshirts/darcula'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'davebarkerxyz/wombat256dave'

" Language Support {{{3
" JavaScript {{{4
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rhysd/npm-debug-log.vim'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'Quramy/vim-js-pretty-template'

" TypeScript {{{4
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Elm {{{4
Plug 'ElmCast/elm-vim'

" HTML {{{4
Plug 'othree/html5.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'mattn/emmet-vim'

" CSS {{{4
Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }

" Sass {{{4
Plug 'cakebaker/scss-syntax.vim'

" Ruby {{{4
" Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

" Python {{{4
Plug 'davidhalter/jedi-vim',              { 'for': 'python' }
Plug 'alfredodeza/pytest.vim',            { 'for': 'python' }
Plug 'deoplete-plugins/deoplete-jedi'

" Rust {{{4
Plug 'wellbredgrapefruit/tomdoc.vim',     { 'for': 'ruby' }
" Plug 'wting/rust.vim'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" Go {{{4
Plug 'fatih/vim-go'
Plug 'nsf/gocode',                        { 'rtp': 'nvim', 'do': './nvim/symlink.sh' }

" Markdown {{{4
Plug 'reedes/vim-pencil'                  " Markdown, Writing
Plug 'godlygeek/tabular',                 { 'for': 'markdown' } " Needed for vim-markdown
Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }

" Elixir {{{4
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Coffeescript
Plug 'kchmck/vim-coffee-script'

Plug 'junegunn/vader.vim'
Plug 'junegunn/gv.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'

Plug 'artur-shaik/vim-javacomplete2'
" Plug 'rustushki/JavaImp.vim'

Plug 'sheerun/vim-polyglot'

call plug#end()

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

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

" Use : instead of ; (avoid a SHIFT press)
" XXX this is more trouble than it's worth.
" cnoremap ; :
" nnoremap ; :
" nnoremap : ;

" split window vertically then focus on new window
nnoremap <leader>w\| <C-w>v<C-w>l

" split window horizontally then focus on new window
nnoremap <leader>w- <C-w>s<C-w>j

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

colorscheme tender
highlight Visual ctermbg=66

" colorscheme hybrid
" highlight Visual ctermbg=102

""" solarized colorscheme
" colorscheme solarized
" let g:solarized_termcolors=256
" set background=dark
""""""""""""""""""""""""""""""""

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
noremap <leader>c :e ~/.config/nvim/init.vim<cr>

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

" ctrlp caching
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" ctrlp use ag for searching, faster
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Ack.vim folds results from same file
let g:ack_autofold_results = 1

" ack.vim really use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


noremap <Leader>a :Ack!<space>
noremap <Leader>z :Ack! <cword><cr>

nnoremap <Leader>j :cnext<cr>
nnoremap <Leader>k :cprev<cr>

" configure incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" let NERDTreeShowHidden=1
let g:NERDTreeWinPos='right'

let g:ctrlp_custom_ignore = 'node_modules$'

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
" " disable autocomplete
" " let g:deoplete#disable_auto_complete = 1
" if has("gui_running")
"     inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
" else
"     inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
" endif

" UltiSnips config
let g:UltiSnipsListSnippets='<S-tab>'


" vim-windowswap config
" prevent default bindings
let g:windowswap_map_keys = 0
" Ctrl-M to grab window, Ctrl-M again to swap w/other window
nnoremap <leader>x :call WindowSwap#EasyWindowSwap()<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Unfold everything
set foldmethod=manual
set nofoldenable
set foldlevel=99

set cursorline

let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

set exrc
set secure

" Insert newline above/below without leaving Normal mode
nmap <M-Enter> mao<Esc>`a
nmap <CR> maO<Esc>`a

" In visual mode - remove blank lines in selection (and remove highlights)
vnoremap <M-l> :g/^\s*$/d<cr>:let @/ = ""<cr>

" Needed to make vim-json plugin play nicely with indentLines
let g:vim_json_syntax_conceal = 0

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
