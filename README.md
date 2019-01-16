# My dotfiles

These are a collection of scripts I find my self reinstalling every time I use a new machine.

All scripts are loaded via `dotfiles.sh` and can be switched on or off in that file.  Additionally, `dotfiles.sh` also contains the key bindings used by the scripts.


## Dependencies
- fzf
- diff-so-fancy
- zsh
- mermaid.cli

### Linux specific
- keh

### MacOs specific
- imgcat

### Installing the dependencies on arch

assuming zsh is already installed


It might be nescary to set up global npm so that sudo isn't required. 

```
sudo pacman -S fzf diff-so-fancy, keh
npm -g install mermaid.cli

```

## Installing

Clone locally

```
git clone git@github.com:jessewritescode/dotfiles.git 
```

and reference the dotfile in ~/.zshrc
```
...
source /installpath/dotsfiles.sh
```

## Scripts
- **git_branch_preview** Fuzzy search, preview and select a branch or tag in git
- **git_commit_preview** Fuzzy search, preview and select a commit in git

## Keybings
- **ctrl-b** Fuzzy search, preview and select a branch or tag in git
- **ctrl-b ctrl-b** Fuzzy search, preview and select a commit in git

