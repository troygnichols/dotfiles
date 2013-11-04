# shorter prompt
export PS1='\W \$ '

# If you want machine-specific settings that don't go into source control,
# create a file called .bash-custom.sh and put them in there
if [ -e $HOME/.bash-custom.sh ]; then
  source $HOME/.bash-custom.sh
fi
