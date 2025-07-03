# Dotfiles and configs

My macOS and zsh setup.




## About this repo

We use the __bare repo__ technique described in a [few posts online](https://www.ackama.com/articles/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/).
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
