source ${0:a:h}/dotfile_settings.zsh

# uncomment the following, and run the command "zprof" to see performance statistics.
# zmodload zsh/zprof

# zsh plugins
# requires git, zsh, zgen 
source ${DOTFILES_CONFIG_PATH}/zsh_plugins.zsh

# configs
#   Requires: fd, fzf
source ${DOTFILES_CONFIG_PATH}/configs.zsh

# git scripts
#   Provides: git_branch_preview, git_commit_preview
#   Requires: fzf, diff-so-fancy
source ${DOTFILES_CONFIG_PATH}/gitscripts.zsh

# chart utils
#   Provides: mercat
#   Requires: mermaid.cli, either imgcat or feh
source ${DOTFILES_CONFIG_PATH}/chartutils.zsh

# file navigation /cat that sort of thing
source ${DOTFILES_CONFIG_PATH}/filenav.zsh

# Work paths ("export IS_WORK=" to turn on)
[[ -v IS_WORK ]] && source ${DOTFILES_CONFIG_PATH}/workpaths.zsh


# Keybindings
bindkey -s '^z' 'fg\n' # since ^z swtiches out of vim into the terminal, this sends us back
bindkey -s '^b' 'git_branch_preview\n'
bindkey -s '^b^b' 'git_commit_preview\n'
bindkey -s '^f' 'findcode\n'


