# Dotiles.
Are in here.

## To install

    git clone https://github.com/troygnichols/dotfiles.git
    cd dotfiles
    git submodule init && git submodule update
    ./install.sh

## VERBOSE mode

    VERBOSE=y ./install.sh

## To update a submodule

### Get all of them:

    git submodule foreach git pull origin master

### Get a particular one:

    cd [submodule dir]
    git checkout master
    git pull

Then commit those changes to the parent project (this project) if you choose.

## To remove a submodule

https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule

## Iterm2 config

See ```iterm2/com.googlecode.iterm2.plist`. This is really just a template. Exact iTerm settings are always going to vary slightly from one machine to another. Create a dir like `$HOME/.iterm-config` and set up iTerm to use that under Preferences -> General -> Preferences -> Load preferences from a custom folder or URL. Then copy `iterm2/com.googlecode.iterm2.plist` to that dir.

## MacOS Config

Run

    ./setup_osx

for various tweaks. Look at the file first to make sure you actually want all that stuff.
