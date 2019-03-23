
# configure FZF to use fd (as to respect gitignore), to follow symoblic links
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# fuzzy search code
findcode() {
  ag --nobreak --nonumbers --noheading . | fzf --delimiter=: --nth=2 --preview 'bat --color=always --style=plain --theme Nord {1}' | cut -d: -f1
}

