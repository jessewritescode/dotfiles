# install packages
sudo pacman -S base-devel 

# install yay
(cd ~/.config-packages && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si)

yay -S oni bat neovim rbenv the_silver_searcher python-neovim npm 

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

