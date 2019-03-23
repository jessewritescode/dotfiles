# dependecies
# -----------
# imgcat if macos and you want rendering in terminal, feh if linux
# mermaid.cli

if type imgcat > /dev/null; then
  display_app="imgcat" 
else
  display_app="feh"
fi

# displays a generated chart from mermaid.  Call it like mercat mychart.mmd
function mercat () {
  F="$(mktemp).png"
  mmdc -i $1 -o $F -b transparent -t dark
  $display_app $F
  rm $F
}


