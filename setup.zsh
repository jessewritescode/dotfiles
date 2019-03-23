#!/bin/zsh
source ${0:a:h}/dotfile_settings.zsh

mkdir -p ${DOTFILES_VENDOR_PATH}
mkdir -p ${DOTFILES_BIN_PATH}

git clone https://github.com/zplug/zplug ${DOTFILES_VENDOR_PATH}/zplug

# this is might write to .zshrc... check, and if it does, remove it.
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

if [[ "$(uname)" = "Darwin" ]]; then
  brew install rbenv bat neovim
  rbenv init
fi

#setup bat to use the Nord theme
mkdir -p ${DOTFILES_VENDOR_PATH}/bat_themes/themes
git clone git@github.com:arcticicestudio/nord-sublime-text.git ${DOTFILES_VENDOR_PATH}/bat_themes/themes/nord-sublime-text
bat cache --source ${DOTFILES_VENDOR_PATH}/bat_themes --init

#setup neovim
ln -s ${DOTFILES_CONFIG_PATH}/init.vim ${HOME}/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

