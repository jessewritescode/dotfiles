
# setup npm and fetch packages
mkdir -p ~/.npmlocal
npm config set prefix ~/.npmlocal

npm install -g nwb

# install brew package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install packages
brew install rbenv bat neovim zsh ripgrep watchman tmux thefuck 
brew cask install oni visual-studio-code
sudo pip2 install --upgrade neovim

# nerd fonts for icons in nerd tree
brew tap caskroom/fonts
brew cask install font-hack-nerd-font<Paste>

# this might be all thats needed to enable python 3 in macos vim?
pip3 install --user pynvim tmuxp

# setup npm and fetch packages
mkdir -p ~/.npmlocal
npm config set prefix ~/.npmlocal

npm install -g nwb

# build javascript ctags
(cd ~/.config-packages/ctags-patterns-for-javascript && make tags)

# install brew package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install zplugin zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# source zshrc to continue installing zsh plugins
source ~/.zshrc

# setup git (you may want to change this)
git config --global user.email "jesse.chilcott@gmail.com"
git config --global user.name "Jesse Chilcott"

