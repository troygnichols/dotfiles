#!/bin/bash

dotfiles=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
backup=$HOME/.dotfiles_backup
files="bin bashrc aliases zshrc zsh-nocorrect oh-my-zsh vimrc vim gitconfig gitignore gemrc tmux.conf"

echo "Creating backup directory: $backup"
mkdir -p $backup

cd $dotfiles

for file in $files; do
  if [ -e "$HOME/.$file" ]; then
    if [ -h "$HOME/.$file" ]; then
      echo "Deleting old symlink: $HOME/.$file"
      rm "$HOME/.$file"
    else
      echo "Backing up $file"
      mv $HOME/.$file $backup
    fi
  fi
  echo "Linking $file"
  ln -vsfF $dotfiles/$file $HOME/.$file
done
