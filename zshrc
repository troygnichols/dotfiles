# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Users/troygnichols/.rvm/gems/ruby-1.9.3-p392/bin:/Users/troygnichols/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/troygnichols/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/troygnichols/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/bin

# nocorrect
alias sb="nocorrect sb"
alias './config/environment'='nocorrect ./config/environment'
alias 'guard'='nocorrect guard'
alias 'ack'='nocorrect ack'
alias 'iex'='nocorrect iex'
alias 'mvim'='nocorrect mvim'

# aliases
alias 'vi'='mvim'

# add arcanist developer tool to path
export ARCANIST_HOME=/Users/troygnichols/workspaces/thirdparty/facebook/arcanist
export PATH=$PATH:/$ARCANIST_HOME/bin
source $ARCANIST_HOME/resources/shell/bash-completion

# default editor
export EDITOR=vim

# add gradle to path
export GRADLE_HOME=$HOME/gradle/gradle-1.6
export PATH=$PATH:$GRADLE_HOME/bin

# add android tools to path
export ANDROID_HOME=$HOME/android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# add portecle (Java Keystore viewer) to path
export PATH=$PATH:/opt/portecle-1.7
