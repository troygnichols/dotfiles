# Dotiles.
Are in here.

## To install

    git clone https://github.com/troygnichols/dotfiles.git
    cd dotfiles
    git submodule init && git submodule update
    ./install.sh

## To add a new submodule (e.g. a vim plugin)

    cd vim/bundle
    git submodule add git@github.com:tpope/vim-surround.git vim-surround
