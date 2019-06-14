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

# build javascript ctags
(cd ~/.config-packages/ctags-patterns-for-javascript && make tags)

# install zplugin zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# source zshrc to continue installing zsh plugins
source ~/.zshrc

# setup git (you may want to change this)
git config --global user.email "jesse.chilcott@gmail.com"
git config --global user.name "Jesse Chilcott"

