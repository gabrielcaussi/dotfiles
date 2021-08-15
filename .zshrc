# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Remove username and hostname to zsh
export DEFAULT_USER="$(whoami)"

# Use Neovim as default editor
export EDITOR=nvim

# Theme
ZSH_THEME="agnoster"

# Plugins
plugins=(git)

# Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Alias
alias q='exit'
alias ..='cd ..'
alias ...='cd ...'
alias vim='nvim'
alias ipp='curl ipinfo.io/ip'
alias nametmux='tmux new -s'
alias retmux='tmux attach-session -t'
alias killtmux='tmux kill-session -t'
alias tmuxconf='nvim ~/.tmux.conf'
alias vimconf='nvim ~/.config/nvim/init.vim'
alias zshconf='nvim ~/.zshrc'
alias gitconf='nvim ~/.gitconfig'
alias kittyconf='nvim ~/.config/kitty/'
alias roficonf='nvim ~/.config/rofi/config.rasi'
