## Global configuration

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions ssh-agent) 
source $ZSH/oh-my-zsh.sh

## User configuration

# Neovim
export PATH="/opt/nvim/bin:$PATH"
alias vim="nvim"

# Go
export PATH="$PATH:/usr/local/go/bin"
