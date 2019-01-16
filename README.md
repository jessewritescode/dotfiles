# My dotfiles

These are a collection of scripts I find my self reinstalling every time I use a new machine.

All scripts are loaded via `dotfiles.sh` and can be switched on or off in that file.  Additionally, `dotfiles.sh` also contains the key bindings used by the scripts.


## Dependencies
- fzf
- diff-so-fancy
- zsh

### Installing the dependencies on arch

assuming zsh is already installed

```
sudo pacman -S fzf diff-so-fancy
```

## installing

Clone locally

```
git clone git@github.com:jessewritescode/dotfiles.git 
```

and reference the dotfile in ~/.zshrc
```
...
source /installpath/dotsfiles.sh
```

## scripts
- **git_branch_preview** Fuzzy search, preview and select a branch or tag in git
- **git_commit_preview** Fuzzy search, preview and select a commit in git

## keybings
- **ctrl-b** Fuzzy search, preview and select a branch or tag in git
- **ctrl-b ctrl-b** Fuzzy search, preview and select a commit in git

