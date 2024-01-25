{ config, ... }:
{
  home.file = {
    ".config/joplin-desktop/settings.json".text = ''
      {
      	"$schema": "https://joplinapp.org/schema/settings.json",
      	"locale": "en_GB",
      	"markdown.plugin.softbreaks": false,
      	"markdown.plugin.typographer": false,
      	"spellChecker.languages": [
      		"en-US"
      	],
      	"noteVisiblePanes": [
      		"editor",
      		"viewer"
      	],
      	"ui.layout": {
      		"key": "root",
      		"children": [
      			{
      				"key": "sideBar",
      				"width": 250,
      				"visible": true
      			},
      			{
      				"key": "noteList",
      				"width": 250,
      				"visible": true
      			},
      			{
      				"key": "editor",
      				"visible": true
      			}
      		],
      		"visible": true
      	},
      	"editor.codeView": true,
      	"theme": 1,
      	"sync.target": 2,
      	"sync.2.path": "${config.home.homeDirectory}/Joplin",
      	"editor.spellcheckBeta": true,
      	"themeAutoDetect": true,
      	"editor.keyboardMode": "vim",
      	"plugin-io.github.personalizedrefrigerator.js-draw.autosave-interval-minutes": 0,
      	"plugin-io.github.personalizedrefrigerator.js-draw.disable-editor-fills-window": false,
      	"plugin-io.github.personalizedrefrigerator.js-draw.keyboard-shortcuts": {},
      	"plugin-io.github.personalizedrefrigerator.js-draw.keyboard-shortcuts": {},
      	"style.editor.fontFamily": "FiraCode Nerd Font",
      	"style.editor.monospaceFontFamily": "FiraCode Nerd Font Mono"
      }
    '';
  };
}
