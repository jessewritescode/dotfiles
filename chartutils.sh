# dependecies
# -----------
# imgcat if macos and you want rendering in terminal, feh if linux
# mermaid.cli

[[ type imgcat > /dev/null ]] && display_app="imgcat" || display_app="feh"

# displays a generated chart from mermaid.  Call it like mercat mychart.mmd
function mercat () {
  F="$(mktemp).png"
  mmdc -i $1 -o $F -b transparent -t dark
  $display_app $F
  rm $F
}


