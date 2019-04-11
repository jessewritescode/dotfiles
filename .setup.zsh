# install brew package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install packages
brew install rbenv bat neovim oni zsh
sudo pip2 install --upgrade neovim

# install zplug for zshplugins
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# source zshrc to continue installing zsh plugins
source ~/.zshrc
