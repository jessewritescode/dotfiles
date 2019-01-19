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

# Keybindings
bindkey -s '^b' 'git_branch_preview\n'
bindkey -s '^b^b' 'git_commit_preview\n'
