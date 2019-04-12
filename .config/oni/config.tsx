
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
    activate,
    "ui.colorscheme": "nord",
    "editor.quickOpen.execCommand": 'fzf -f ${searchString}',
    "experimental.markdownPreview.enabled": true,
    "oni.hideMenu"             : "hidden", // Hide top bar menu
    "editor.fontFamily": "Fira Code",
    "ui.fontSmoothing": "auto",
    "ui.animations.enabled": true,
    "oni.loadInitVim"          : true, // Load user's init.vim
    "oni.useDefaultConfig"     : false, // Do not load Oni's init.vim
    "autoClosingPairs.enabled" : false, // disable autoclosing pairs
    "commandline.mode"         : false, // Do not override commandline UI
    "wildmenu.mode"            : false, // Do not override wildmenu UI,
    "tabs.mode"                : "native", // Use vim's tabline, need completely quit Oni and restart a few times
    "statusbar.enabled"        : false, // use vim's default statusline
    "sidebar.enabled"          : true, // sidebar ui is gone
    "sidebar.default.open"     : true, // the side bar collapse 
    "learning.enabled"         : false, // Turn off learning pane
    "achievements.enabled"     : false, // Turn off achievements tracking / UX
    "editor.typingPrediction"  : false, // Wait for vim's confirmed typed characters, avoid edge cases
    "editor.textMateHighlighting.enabled" : false, // Use vim syntax highlighting
}
