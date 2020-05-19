# I think tmux needed this at some point, but it seems to work without it now,
# and it messes up `M-x shell` in emacs, so commenting out for now.
# export TERM="xterm-256color"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Custom ZSH confg dir, as described here:
# https://github.com/robbyrussell/oh-my-zsh/wiki/Customization
# Not to be confused with the ~/.zsh-custom config while, which is
# just a machine-specific addition to this ~/.zshrc config file.
# Has nothing to do with that.
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Powerlevel9k config. This has to come before
# actually setting the theme to Powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_STRATEGY=Default
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
# ZSH_THEME="powerlevel9k/powerlevel9k"

if [[ "$INSIDE_EMACS" ]]; then
    # ZSH_THEME="robbyrussell"
    ZSH_THEME="powerlevel10k/powerlevel10k"
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#595959"
else
    ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

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
plugins=(git docker zsh-autosuggestions fd docker docker-compose)
export ZSH_AUTOSUGGEST_USE_ASYNC=1

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:~/.bin:~/.user_scripts

# default editor
export EDITOR="emacsclient"
export VISUAL="emacsclient"

# source $HOME/.zsh-nocorrect

source $HOME/.aliases

# Don't do XOFF on Ctrl-S
# See: http://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s
# alias vim="stty stop '' -ixoff; vim"
alias vi="vim"

# If you want machine-specific settings that don't go into source control,
# create a file called .zsh-custom and put them in there
if [ -e $HOME/.zsh-custom ]; then
  source $HOME/.zsh-custom
fi

# Use custom python environment
export PYTHONSTARTUP=~/.pythonrc
#
# Use vi mode in zsh
# bindkey -v

# reduce delay when changing modes
export KEYTIMEOUT=1

# show vi mode status (INSERT or NORMAL)
# function zle-line-init zle-keymap-select {
#   RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#   RPS2=$RPS1
#   zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

bindkey '^w' backward-kill-word

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward

# enable persistent history in erlang/elixir shell
export ERL_AFLAGS="-kernel shell_history enabled"

## experimental
# function zle-keymap-select () {
#   case $KEYMAP in
#     vicmd) print -rn -- $terminfo[cvvis];; # block cursor
#     viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
#   esac
# }

# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#     RPS2=$RPS1
#     zle reset-prompt
# }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# mkdir + cd
function mkcd() {
  DIR="$1"
  if [[ -f "$DIR" ]]; then
    >&2 echo "error: cannot create: $DIR, it is a file."
    return 1
  elif [[ -d "$DIR" ]]; then
    echo "warn: already exists, changing directory to: $DIR"
  else
    mkdir -p $DIR
  fi
  cd $DIR
}

# extra completions

# this one needs to be sourced for some reason
# source ~/.zsh/completion/_azure_cli

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# slow...
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# faster version of above NVM loader from https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
# load nvm and node laziy
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  alias nvm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && nvm'
  alias node='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && node'
  alias npm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && npm'
fi

# autoload -U +X bashcompinit && bashcompinit
# source /usr/local/etc/bash_completion.d/az

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
