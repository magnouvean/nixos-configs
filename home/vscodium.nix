{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    extensions = with pkgs.vscode-extensions; [
      james-yu.latex-workshop
      mkhl.direnv
      ms-python.python
      ms-toolsai.jupyter
      njpwerner.autodocstring
      streetsidesoftware.code-spell-checker
      sumneko.lua
      vscodevim.vim
    ];
  };

  home.file.".config/VSCodium/User/settings.json".source = ../files/vscodium/settings.json;
  home.file.".config/VSCodium/User/keybindings.json".source = ../files/vscodium/keybindings.json;
}
