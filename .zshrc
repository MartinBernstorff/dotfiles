# Load Antigen
source "$HOME/antigen.zsh"

# Add history based autocomplete
autoload -Uz compinit && compinit

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Fuzzy finding history
antigen bundle unixorn/fzf-zsh-plugin@main

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Autocomplete
antigen bundle zsh-users/zsh-autosuggestions

# Jump
antigen bundle agkozak/zsh-z

# Enable Vim mode
antigen bundle jeffreytse/zsh-vi-mode

# Tell Antigen that you're done.
antigen apply

# ANTIGEN SETUP #
# Load Starship theme
eval "$(starship init zsh)"

# ANTIGEN END #

# Fuzzy finding history
source /opt/local/share/fzf/shell/key-bindings.zsh
source /opt/local/share/fzf/shell/completion.zsh

# MKCD
function mkcd
{
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

# Expand history
setopt SHARE_HISTORY
export HISTSIZE=10_000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt HIST_EXPIRE_DUPS_FIRST

# Expand paths
export PATH="/usr/local/anaconda3/bin:$PATH"
export PATH="/Users/Leisure/.local/bin:$PATH"
export GITHUB_TOKEN="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"
export PIPENV_VENV_IN_PROJECT=1
export PATH="/Users/au484925/.local/bin:$PATH"

###########
# ALIASES #
###########
alias lg='lazygit'


# nvim aliases
CONF="~/.config/"
NVCONF="/nvim/"
NVUSER="$NVCONF/lua/user/"

alias nvini="nvim $NVCONF/init.lua"
alias nvuser="nvim $NVUSER"
alias nvkb="nvim $NVUSER/whichkey.lua"
alias rc="nvim $CONF/.zshrc"
# Created by `pipx` on 2023-08-07 16:31:22
export PATH="$PATH:/Users/Leisure/.local/bin"
