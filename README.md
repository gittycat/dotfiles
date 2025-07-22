# My Dotfiles and configs

This repo focuses only on terminal tools and settings. Homebrew is used to install almost everything. See the [.Brewfile](.Brewfile) for the full list.

Programming languages are installed separately through Mise (see below), except for Rust, although they've now improved that too but I haven't tried it yet.

### Applications

- [Ghostty](https://ghostty.org/) A new but solid terminal from Mitchell Hashimoto.
- [Maccy](https://maccy.app/) Clipboard with history. Open Source and widely used (safe).
- [Obsidian](https://obsidian.md/) markdown notebook. I'm using it like a data lake for notes.

### Development

- [OrbStack](https://orbstack.dev/) Fast VM (headless) hypervisor and Docker containers manager.
- [UTM](https://mac.getutm.app/) OOS VM hypervisor. Seldom used now. Headless VMs through OrbStack is all I need.
- [mise](https://mise.jdx.dev/) Manages multiple global environments for node, go, python, php. Decent Rust support was added recently.
- [uv](https://docs.astral.sh/uv/) Python package and virt env manager. Replaces everything from pyenv to pip. Much faster too.

### CLI tools

The Rust and Go communities have re-implemented the old unix tools for faster (multi-core support), better ui (TUI in some) and eye candy (colour schemes). Here's my current crop.

- [atuin](https://atuin.sh/) A shell command history. I'm constantly using it. It's open source, widely used and I'm satisfied with its safety.
- [lsd](https://github.com/lsd-rs/lsd). A `ls` with better colours, filtering and sorting.
- [ripgrep](https://github.com/BurntSushi/ripgrep). Fast (parallel) recursive grep.
- [fd](https://github.com/sharkdp/fd). A fast parallel `find`.
- [zoxide](https://github.com/ajeetdsouza/zoxide). A `cd` command with shortcuts
- [hyperfine](https://github.com/sharkdp/hyperfine). Benchmarking tool for CLI commands.
- [glow](https://github.com/charmbracelet/glow). Markdown rendering on terminal.
- [chafa](https://hpjansson.org/chafa/) Powerful image display for terminals. It also produces high-quality ASCII art from images as a side effect of supporting terminals with no graphical capabilities.
- [entr](https://eradman.com/entrproject/) File watcher. Run arbitrary command when a file changes.
- Others (The usual suspects): jq, dasel, git, gh, coreutils, gzip, openssl, rsync, wget, pandoc, exiftool, aws-cli, aws-cdk, tmux

### Ricing

- Current Theme: [Tokyo Night Storm](https://github.com/tokyo-night/tokyo-night-vscode-theme)<br>
Used in terminals, editors.
- [vivid](https://github.com/sharkdp/vivid) LS_COLORS generator. Combine it with lsd config (color.yaml) to cover the full colorising of the listing command.
- [starship](https://starship.rs/) Prompt customisation. Use sparingly to avoid prompt lag.

## About this repo

I use the __bare repo__ technique described in a [few posts online](https://www.ackama.com/articles/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/).
Dotfiles and configs are tucked away in a *bare* repo so normal git tools never notice it.

### Cloning the repo

```zsh
# 1 · Clone it as a bare repo
git clone --bare https://github.com/gittycat/dotfiles.git $HOME/.dotfiles

# 2 · Handy alias. I only define it when working on the repo
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# 3 · Hide all files not in the repo
dot config --local status.showUntrackedFiles no

# 4 · Check out tracked files into $HOME
dot checkout
```

### Updating the repo

```zsh
# 1. Add a new config file
dot add .config/sample.conf
dot commit -m "Added sample.conf"
dot push
```
