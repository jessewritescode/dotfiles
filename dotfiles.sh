scriptpath=${0:a:h}

# configs
#   Requires: fd, fzf
source ${scriptpath}/configs.sh

# git scripts
#   Provides: git_branch_preview, git_commit_preview
#   Requires: fzf, diff-so-fancy
source ${scriptpath}/gitscripts.sh

# chart utils
#   Provides: mercat
#   Requires: mermaid.cli, either imgcat or feh
source ${scriptpath}/chartutils.sh

# file navigation /cat that sort of thing
source ${scriptpath}/filenav.sh

# Work paths ("export IS_WORK=" to turn on)
[[ -v IS_WORK ]] && source ${scriptpath}/workpaths.sh


# Keybindings
bindkey -s '^z' 'fg\n' # since ^z swtiches out of vim into the terminal, this sends us back
bindkey -s '^b' 'git_branch_preview\n'
bindkey -s '^b^b' 'git_commit_preview\n'
bindkey -s '^f' 'findcode\n'


