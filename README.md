# My Dotfiles and configs

Some more interesting tools installed using Homebrew. See the [.Brewfile](.Brewfile) for the full list.

I install all my languages separately through Mise, except for Rust, although they've now improved this too.

I'm mostly on [Cursor](https://cursor.com/en) these days.

### Applications
- [Ghostty](https://ghostty.org/) A new terminal from Mitchell Hashimoto
- [Maccy](https://maccy.app/) Clipboard with history
- [Obsidian](https://obsidian.md/) markdown notebook

### Development

- [OrbStack](https://orbstack.dev/) Fast VM (headless) hypervisor and Docker containers manager.
- [UTM](https://mac.getutm.app/) OOS VM hypervisor. Seldom used now. Headless VMs through OrbStack is all I need.
- [mise](https://mise.jdx.dev/) Manages multiple global environments for node, go, python, php. Decent Rust support was added recently.
- [uv](https://docs.astral.sh/uv/) Python package and virt env manager. Replaces everything from pyenv to pip. Much faster too.

### CLI tools
The Rust community is re-implementing the old unix tools for faster (multi-core support), better ui (TUI in some) and eye candy (colour schemes). Here's my current crop.

- [lsd](https://github.com/lsd-rs/lsd) A `ls` with better colours, filtering and sorting.
- [ripgrep](https://github.com/BurntSushi/ripgrep) Fast (parallel) recursive grep.
- [fd](https://github.com/sharkdp/fd) Fast parallel `find`.
- [zoxide](https://github.com/ajeetdsouza/zoxide) a `cd` command with shortcuts
- [hyperfine](https://github.com/sharkdp/hyperfine) Benchmark tool for CLI commands.
- [starship](https://starship.rs/) Prompt customisation. Use in small doses to avoid prompt lag.
- [glow](https://github.com/charmbracelet/glow) Markdown rendering on terminal.
- Others: jq, dasel, fd, hyperfine, git, gh, coreutils, gzip, openssl, rsync, wget, pandoc, exiftool, aws-cli, aws-cdk, tmux

### [Rising](https://excaliburzero.gitbooks.io/an-introduction-to-linux-ricing/content/ricing.html) it up
- [vivid](https://github.com/sharkdp/vivid) LS_COLORS generator. Combined with lsd color.yaml to cover the full colorising of the listing command.
- Themes: [Nord](https://www.nordtheme.com/ports/dircolors) or [Tokyo Night]()


## Security Settings

## About this repo

I use the __bare repo__ technique described in a [few posts online](https://www.ackama.com/articles/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/).
Dotfiles and configs are tucked away in a *bare* repo so normal git tools never notice it.

### Repo Use

```zsh
# 1 · Clone it as a bare repo
git clone --bare https://github.com/gittycat/dotfiles.git $HOME/.dotfiles

# 2 · Handy alias. I only define it when working on the repo
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# 3 · Ignore the repo itself
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
