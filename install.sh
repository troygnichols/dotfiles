#!/bin/bash

## set VERBOSE for more output, .e.g run the script this way:
## VERBOSE=yes ./install.sh

if [[ "$1" == "--help" ]]; then
  echo "Usage: $(basename "$0")"
  echo "
  Install dotfiles by symlinking them into this repo.
  Backup existing dotfiles first.
  Run with VERBOSE for details on what is being linked where., e.g.

      VERBOSE=1 ./$(basename $0)
"

  exit 0
fi


dotfiles=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
backup=$HOME/.dotfiles_backup

files=(
  bin
  bashrc
  aliases
  zshrc
  zsh-nocorrect
  oh-my-zsh
  oh-my-zsh-custom
  vimrc
  gvimrc
  vim
  gitconfig
  gitignore
  gemrc
  tmux.conf
  pythonrc
  irbrc
  pryrc
  curl-format
  user_scripts
  screenrc
  config/nvim/init.vim
  config/nvim/pluginit.vim
  zsh/completion/_docker_compose
  zsh/completion/_azure_cli
  data/_lipsum_static.txt
  p10k.zsh
)

echo "*** Creating backup directory: $backup"
mkdir -p "$backup"

[[ -n "$VERBOSE" ]] && echo "*** Changing directory to: $dotfiles" cd $dotfiles

# create the config file's parent dir if needed
make_parent_dir() {
  local filepath="$1"
  local parent_dir="${filepath%/*}"
  if ! [[ -d "$parent_dir" ]]; then
    [[ -n "$VERBOSE" ]] && echo "*** Creating parent directory: $parent_dir, for file: $filename"
    mkdir -p "$parent_dir"
  fi
}

# copy and rename the config file appropriately
copy_file() {
  local filename="$1"
  local filepath="$HOME/.$filename"

  if [ -e "$filepath" ]; then
    if [ -h "$filepath" ]; then
      [[ -n "$VERBOSE" ]] && echo "*** Deleting old symlink: $filepath"
      rm "$filepath"
    else
      [[ -n "$VERBOSE" ]] && echo "*** Backing up $filename"
      mv "$filepath" "$backup"
    fi
  fi

  make_parent_dir "$filepath"
  echo "==> Linking $filepath"

  local args=(sfF)
  [[ -n "$VERBOSE" ]] && args+="v"
  ln -"$args" "$dotfiles/$filename" "$filepath"
}

for filename in "${files[@]}"; do
  copy_file "$filename"
done
