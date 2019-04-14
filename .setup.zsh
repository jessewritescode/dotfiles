# install packages
sudo pacman -S yaourt 
yaourt -S oni bat neovim rbenv fira-code kitty polybar the_silver_searcher rofi python-neovim zathura zathura-pdf-mupdf zathura-djvu zathura-ps zathura-cb perl-anyevent-i3 perl-json-xs jq 

# setup npm and fetch packages
mkdir -p ~/.npmlocal
npm config set prefix ~/.npmlocal

npm install -g nwb

# setup npm and fetch packages
mkdir -p ~/.npmlocal
npm config set prefix ~/.npmlocal

npm install -g nwb

# install brew package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install zplug for zshplugins
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# source zshrc to continue installing zsh plugins
source ~/.zshrc

# setup git (you may want to change this)
git config --global user.email "jesse.chilcott@gmail.com"
git config --global user.name "Jesse Chilcott"

