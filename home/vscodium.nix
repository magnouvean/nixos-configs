{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    extensions = (with pkgs.vscode-extensions; [
      bbenoist.nix
      brettm12345.nixfmt-vscode
      james-yu.latex-workshop
      mkhl.direnv
      ms-python.python
      ms-toolsai.jupyter
      njpwerner.autodocstring
      streetsidesoftware.code-spell-checker
      sumneko.lua
      vscodevim.vim
    ]) ++ (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.8.1";
        sha256 = "sha256-ltX8LSa/344r3Z9SDjL3fKRIUddzuyMtvO8De2x91WE=";
      }
      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.52.2";
        sha256 = "sha256-I7mj+nY+MRVoWqoR2GJ1PEQ+oPwZDZnrdhTi/4L5MqY=";
      }
      {
        name = "godot-tools";
        publisher = "geequlim";
        version = "1.3.1";
        sha256 = "sha256-wJICDW8bEBjilhjhoaSddN63vVn6l6aepPtx8VKTdZA=";
      }
    ]);
  };

  home.file.".config/VSCodium/User/settings.json".source = ../files/vscodium/settings.json;
  home.file.".config/VSCodium/User/keybindings.json".source = ../files/vscodium/keybindings.json;
}
