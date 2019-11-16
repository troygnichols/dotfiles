call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-plug' " Add vim-plug itself to get its online help

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'

" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

Plug 'jeetsukumaran/vim-buffergator'

Plug 'mileszs/ack.vim'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'SirVer/ultisnips'
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
Plug 'morhetz/gruvbox'

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

Plug 'ap/vim-css-color'

" Ruby {{{4
" Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

" Python {{{4
Plug 'davidhalter/jedi-vim',              { 'for': 'python' }
Plug 'alfredodeza/pytest.vim',            { 'for': 'python' }
" Plug 'deoplete-plugins/deoplete-jedi'

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
Plug 'godlygeek/tabular',
Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }
Plug 'junegunn/vim-xmark'

" Elixir {{{4
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Coffeescript
Plug 'kchmck/vim-coffee-script'

Plug 'junegunn/vader.vim'
Plug 'junegunn/gv.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'

Plug 'artur-shaik/vim-javacomplete2'
" Plug 'rustushki/JavaImp.vim'

Plug 'sheerun/vim-polyglot'

Plug 'mtth/scratch.vim'

Plug 'rizzatti/dash.vim'

" Plug 'maxbane/vim-asm_ca65'
Plug 'thentenaar/vim-syntax-obscure'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

Plug 'bpstahlman/txtfmt'

call plug#end()
