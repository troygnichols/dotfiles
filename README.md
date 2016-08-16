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

## To update a submodule

### To live dangerously

    git submodule foreach git pull origin master

### To live carefully

    cd [submodule dir]
    git checkout master
    git pull

Then commit those changes to the parent project (this project) if you choose.
