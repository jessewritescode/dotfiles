# Uncomment the line below to profile startup times
# STARTUP_PROFILE=1

[[ -v STARTUP_PROFILE ]] && zmodload zsh/zprof

###############################################################################
# Set paths
###############################################################################
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.npmlocal/bin
export NODE_PATH=$NODE_PATH:$HOME/.npmlocal/lib/node_modules
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

###############################################################################
# options
###############################################################################
# Shared zsh history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Apparently used by plugins
setopt promptsubst

# So window names display properly in tmux
export DISABLE_AUTO_TITLE=true

# fix: (eval):setopt:3: no such option: NO_warnnestedvar
_comp_options="${_comp_options/NO_warnnestedvar/}"

# default apps
export VISUAL=nvim
export EDITOR="${VISUAL}"
export BROWSER=google-chrome-stable

###############################################################################
# Plugins
###############################################################################
. ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

ZPLGM[MUTE_WARNINGS]=1

# Actual plugins.
zplugin ice 
zplugin light geometry-zsh/geometry

zplugin ice wait"0" atload"unalias grv" lucid
zplugin snippet OMZ::plugins/git/git.plugin.zsh

zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

zplugin ice wait'0' lucid
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" lucid
zplugin light Tarrasch/zsh-autoenv

zplugin ice wait"0" atinit"zpcompinit" lucid
zplugin light zdharma/fast-syntax-highlighting

# eof plugins
autoload -Uz compinit

###############################################################################
# Prompt Styling
###############################################################################
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

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# fuzzy search code
findcode() {
  ag --nobreak --nonumbers --noheading --ignore=*.test.js . | fzf --delimiter=: --nth=2 --preview 'bat --color=always --style=plain --theme Nord {1}' | cut -d: -f1
}

## FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# run local ruby environment
eval "$(rbenv init -)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval $(thefuck --alias)

# source aliases
source "$HOME/.aliases"

###############################################################################
# Key bindings
###############################################################################
# key bindings
bindkey -s '^f' 'findcode\n'
bindkey -s '^z' 'fg\n'

# Finally load local configs (configs that aren't committed to
# git, if you have them.
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Profiling
if [ -v STARTUP_PROFILE ]; then
  tmpfile=$(mktemp)
  zprof > ${tmpfile}
  echo "Startup profiling written to: ${tmpfile}"
fi

