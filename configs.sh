# dependecies
# -----------
# fd, nvim, antigen.zsh to be installed at .config


#
# FZF
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# configure FZF to use fd (as to respect gitignore), to follow symoblic links
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

alias vi='nvim'

alias cat='bat --style=plain --theme Nord'


# run local ruby environment
eval "$(rbenv init -)"

#
# NVM
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#
# zsh
#

# configure zsh with antigen
source ~/.config/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle colored-man
antigen bundle python
antigen bundle brew
antigen bundle osx
antigen bundle yarn

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme geometry-zsh/geometry

# Tell Antigen that you're done.
antigen apply

