
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# put pg_config (PostgreSQL config file) on path, rails needs this
# export PATH=$PATH:/Library/PostgreSQL/9.1/bin/pg_config

# put Java web framework 'play' on the PATH
# export PLAY_HOME=/Users/troygnichols/workspaces/play/install/play-2.0
# export PATH=$PATH:$PLAY_HOME

# export DATABSE_URL envar for use in play apps (points to local postgres db)
#export DATABASE_URL=postgres://play:hunter2@localhost/playdb

# aliases
alias am="aquamacs"
alias emacs='open -a /Applications/Emacs.app $1'

# put SML/NJ (a programming language implementation) onto the path
export PATH="$PATH:/usr/local/smlnj-110.75/bin"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# shorter prompt
export PS1='\W \$ '
