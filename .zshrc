# Set paths
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Get plugins
source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/lein", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "geometry-zsh/geometry"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


# Custom plugin to show mode status on command line
# Keep an eye onhttps://github.com/geometry-zsh/geometry/pull/184
zle -N zle-keymap-select geometry_prompt_vi-mode_render
geometry_prompt_vi-mode_setup() {}
geometry_prompt_vi-mode_check() {}
geometry_prompt_vi-mode_render() {
  # Removes previously state
  RPROMPT=${${RPROMPT/\[%{$fg[blue]%}INSERT%{$fg[grey]%}\] /}/\[%{$fg[yellow]%}NORMAL%{$fg[grey]%}\] /}
  # swaps main/INSERT, vicmd/NORMAL
  local KEY=${${KEYMAP/main/%{$fg[blue]%}INSERT}/vicmd/%{$fg[yellow]%}NORMAL}
  # Formats RPROMPT with mode + rest of prompt
  RPROMPT="%{$fg[grey]%}[$KEY%{$fg[grey]%}] $RPROMPT"
  # Resets prompt
  zle && zle reset-prompt
}


# use vi mode for movement on the cli
bindkey -v 

# and change the timeout for moving between modes from 0.4 -> 0.1s
export KEYTIMEOUT=1

# Shared zsh history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# run local ruby environment
eval "$(rbenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VISUAL=nvim
export EDITOR="${VISUAL}"
export BROWSER=google-chrome-stable

# history 
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# run local ruby environment
eval "$(rbenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source aliases
source "$HOME/.aliases"
