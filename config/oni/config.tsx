
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
  //add custom config here, such as

  "ui.colorscheme": "nord",
  "ui.animations.enabled": true,
  "ui.fontSmoothing": "auto",
  "experimental.markdownPreview.enabled": true,
  "editor.quickOpen.execCommand": 'fzf -f ${searchString}',
  "tabs.mode": "native",
  "oni.useDefaultConfig": false,
  "editor.fontFamily": "FiraCode-Light",
  "experimental.vcs.sidebar": true,
  "autoClosingPairs.enabled": false,
  "statusbar.enabled": false
}
