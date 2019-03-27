#!/bin/zsh
export DOTFILES_PATH=${0:a:h}
export DOTFILES_VENDOR_PATH="${DOTFILES_PATH}/vendor"
export DOTFILES_BIN_PATH="${DOTFILES_PATH}/bin"
export DOTFILES_CONFIG_PATH="${DOTFILES_PATH}/config"

[[ "$(uname)" == "Darwin" ]] && IS_MAC_OS=1 || IS_MAC_OS=0
[[ "$(uname)" == "Linux" ]] && IS_LINUX=1 || IS_LINUX=0

