# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="agnoster"

# Plugins
plugins=(git)

# Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Alias
alias q='exit'
alias vim='nvim'
alias nametmux='tmux new -s'
alias retmux='tmux attach -t'

# Remove username and hostname to zsh
export DEFAULT_USER="$(whoami)"
