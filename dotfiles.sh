scriptpath=${0:a:h}

# git scripts
#   Provides: git_branch_preview, git_commit_preview
#   Requires: fzf, diff-so-fancy
source ${scriptpath}/gitscripts.sh

# Keybindings
bindkey -s '^b' 'git_branch_preview\n'
bindkey -s '^b^b' 'git_commit_preview\n'
