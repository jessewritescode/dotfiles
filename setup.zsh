#!/bin/zsh
source ${0:a:h}/dotfile_settings.zsh

mkdir -p ${DOTFILES_VENDOR_PATH}
mkdir -p ${DOTFILES_BIN_PATH}


if [[ $IS_MAC_OS ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install rbenv bat neovim oni
elif [[ $IS_LINUX ]]; then
  sudo pacman -S yaourt 
  yaourt -S oni bat neovim rbenv
fi

rbenv init

git clone https://github.com/zplug/zplug ${DOTFILES_VENDOR_PATH}/zplug

# this is might write to .zshrc... check, and if it does, remove it.
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash


#setup bat to use the Nord theme
mkdir -p ${DOTFILES_VENDOR_PATH}/bat_themes/themes
git clone git@github.com:arcticicestudio/nord-sublime-text.git ${DOTFILES_VENDOR_PATH}/bat_themes/themes/nord-sublime-text
bat cache --source ${DOTFILES_VENDOR_PATH}/bat_themes --init

# setup neovim
ln -s ${DOTFILES_CONFIG_PATH}/init.vim ${HOME}/.config/nvim/init.vim

# setup oni
mv ${HOME}/.config/oni ${HOME}/.config/oni_bak
ln -s ${DOTFILES_CONFIG_PATH}/oni ${HOME}/.config/oni

