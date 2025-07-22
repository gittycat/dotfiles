# Fast-exit for non-interactive shells
[[ -o interactive ]] || return

# Environment & PATH -------------------------------------------------
export EDITOR=nvim
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
export PATH="/opt/homebrew/bin:$HOME/.local/bin:$PATH"

# Language / toolchains
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$MODULAR_HOME/bin:$HOME/.cargo/bin:$HOME/.codeium/windsurf/bin:$HOME/.lmstudio/bin:$PATH"

export LS_COLORS="$(vivid generate tokyonight-storm)"

source "$HOME/.cargo/env" # TODO: Use Mise instead?

# Command line Completions -------------------------------------------
if command -v brew >/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi
autoload -Uz compinit && compinit   # run after FPATH is populated

# Plugins / prompts --------------------------------------------------
eval "$(mise activate zsh)"
eval "$(zoxide init --cmd cd zsh)"  # must follow compinit for completions
eval "$(starship init zsh)"
eval "$(atuin init zsh)"

# Aliases ------------------------------------------------------------
alias ll='lsd -al'
alias ls='ls -G'
alias tree='lsd -l --group-directories-first --tree --depth=2'
alias obs='open -u "obsidian://vault/$(basename "$(pwd)")"'

# History ------------------------------------------------------------
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000                # case-sensitive special variable
setopt APPEND_HISTORY         # don’t overwrite history file
setopt SHARE_HISTORY          # implies INC_APPEND_HISTORY
setopt EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST \
       HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_VERIFY

# Misc ---------------------------------------------------------------
# Set the terminal window title
title() { echo -ne "\033]1;$1\007"; }

# Line wrapping: CTRL-x w = wrap, CTRL-x u = unwrap
wrap_on()  { printf '\e[?7h'; export WRAP_STATE="⮐"; }
wrap_off() { printf '\e[?7l'; export WRAP_STATE="⮕"; }
zle -N wrap_on   ; bindkey '^Xw' wrap_on
zle -N wrap_off  ; bindkey '^Xu' wrap_off
export WRAP_STATE="↩︎"   # This var is used in starship's prompt

# Laravel
export JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION=true
# export PATH="$HOME/.composer/vendor/bin:$PATH"  # Laravel (optional)

# Colorize man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# for updating the dotfiles git repo. Only set when needed. See README.md
setdot() {alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'}
