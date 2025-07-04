# Dotfiles and configs

My macOS and zsh setup.

## Interesting tools

Here are some of the more interesting tools installed using Homebrew. See the [.Brewfile](.Brewfile) for the full list.

### Applications
- [Ghostty](https://ghostty.org/) A new terminal from Mitchell Hashimoto
- [Maccy](https://maccy.app/) Clipboard with history
- [Obsidian](https://obsidian.md/) markdown notebook

### Development

- [OrbStack](https://orbstack.dev/) Fast VM (headless) hypervisor and Docker containers manager
- [UTM](https://mac.getutm.app/) VM hypervisor.
- [mise](https://mise.jdx.dev/) Manages multiple global environments for node, go, python, php, 
- [uv](https://docs.astral.sh/uv/) Python package and virt env manager. Replaces everything from pyenv to pip. Much faster too.

### CLI tools
- [lsd](https://github.com/lsd-rs/lsd) A ls with better colours, filtering and sorting.
- [ripgrep](https://github.com/BurntSushi/ripgrep) Fast (parallel) recursive grep.
- [fzf](https://junegunn.github.io/fzf/) More powerful history command
- [glow](https://github.com/charmbracelet/glow) Markdown rendering
- Others: jq, dasel, fd, hyperfine, zoxide, git, gh, coreutils, gzip, openssl, rsync, wget, pandoc, exiftool, aws-cli, aws-cdk, tmux



### Keeping it clean and pretty
- [vivid](https://github.com/sharkdp/vivid) LS_COLORS generator
- [Nord](https://www.nordtheme.com/ports/dircolors) A subdued colour theme

## About this repo

I use the __bare repo__ technique described in a [few posts online](https://www.ackama.com/articles/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/).
Dotfiles and configs are tucked away in a *bare* repo so normal git tools never notice it.

### Installation

```zsh
# 1 · Clone it as a bare repo
git clone --bare https://github.com/gittycat/dotfiles.git $HOME/.dotfiles

# 2 · Handy alias. Only use it when working on the repo
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# 3 · Ignore the repo directory itself
echo '.dotfiles' >> $HOME/.gitignore

# 4 · Check out tracked files into $HOME
dot checkout

# 5 · Hide all files not in the repo
dot config --local status.showUntrackedFiles no
```

### Daily use

```zsh
cd ~
dot add .config/some-config-file
dot commit -m "Added some-config"
dot push
```

---

*License: MIT*
