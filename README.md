# Dotfiles
My dotfiles, for both macos and arch.

## Installation
Installation will fail if files already exist, so check the code out to a
temporary folder and then delete it.
```
git clone --separate-git-dir=$HOME/.myconf git@github.com:jessewritescode/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp/
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```
and then you may interact with it like `config add .zshrc`, `config commit -m ...` etc

## MacOS & Linux (Manjaro)
Any configuration that is universal should be in master, while specific MacOS and Linux configs 
are kept in their own branches. Non-unique changes can be cherrypicked between each branch.  T
switch between macos & linux
```
config checkout macos
config checkout linux
```

## Theme
Everything should use Nord. Everything. Nord. https://www.nordtheme.com/

## TODO
- Migrate setup scripts
- Ccreate a branch for arch/linux
- Reconfigure dunst since I seem to have lost my config
- Verify that setups work on a new install
- Tidy these configs up

## Supported Things... (some still need to be added)

### Master
- oni
- nvim
- zsh
- nvm
- yarn

### Linux
- i3
- polybar
- dmenu
- kitty
- dunst

### Macos
- iterm2
- brew

## Disclaimer
These configurations are mine, and are shared publicly with the consideration
that others may benefit from them.  It comes with no waranty, implied
or otherwise.  yada yada yada... don't run configs if you don't know
what they do.  This could render your machine unusable.

