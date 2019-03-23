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
alias ls='ls -G'

# run local ruby environment
eval "$(rbenv init -)"

#
# NVM
#
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

