
alias ll='lsd -al'
alias obs='open -u "obsidian://vault/$(basename $(pwd))"'

# Enable / disable terminal line wrapping
alias wrap='tput smam'
alias unwrap='tput rmam'

# Command Prompt - Pure ❯
# autoload -U promptinit; promptinit
# prompt pure
# fpath+=("$(brew --prefix)/share/zsh/site-functions")

# terminal tab title
function title() {
  echo -ne "\033]1;$1\007"
}

# openssl (keg version)
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# Brew installed apps
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
export PATH="/opt/homebrew/bin:$PATH"

# Make sure Homebrew completions are on the path *before* compinit
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

# Created by `pipx` on 2024-05-08 09:18:51
export PATH="$PATH:/Users/bernard/.local/bin"

# Mojo language
export MODULAR_HOME="/Users/bernard/.modular"
export PATH="/Users/bernard/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
source /Users/bernard/.config/op/plugins.sh

# PHP Laravel
# export PATH="$PATH:$HOME/.composer/vendor/bin"

# Rust
. "$HOME/.cargo/env"

# CDK warning. Remove warning banner when using newer node versions
export JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION=true

# Added by Windsurf
export PATH="/Users/bernard/.codeium/windsurf/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/bernard/.lmstudio/bin"

export PATH="$PATH:/Users/bernard/.modular/bin"

#export LS_COLORS="$(vivid generate nord)";
export LS_COLORS="$(vivid generate tokyonight-storm)";


eval "$(zoxide init zsh)"

# Command prompt styling
eval "$(starship init zsh)"

# Mise env support for python, go, ... On by default with brew install
eval "$(mise activate zsh)"


# Command history (using Atuin)
# ----------------------------------------------------
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# Append to the history file, don't overwrite it
setopt APPEND_HISTORY
# Write to the history file immediately, not when the shell exits
setopt INC_APPEND_HISTORY
# Share history between all active shells
setopt SHARE_HISTORY
# Prevent lines that start with a space from being recorded
setopt HIST_IGNORE_SPACE

eval "$(atuin init zsh)"

# dotfiles repo
# Only enable it when dealing with the dotfiles repo
# alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
