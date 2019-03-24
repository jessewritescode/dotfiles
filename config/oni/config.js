"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", function () { return console.log("Control+Enter was pressed"); });
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
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
};
