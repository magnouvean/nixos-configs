{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    extensions = (with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      haskell.haskell
      james-yu.latex-workshop
      jnoortheen.nix-ide
      mkhl.direnv
      ms-pyright.pyright
      ms-python.isort
      ms-python.python
      ms-toolsai.jupyter
      streetsidesoftware.code-spell-checker
      sumneko.lua
      vscodevim.vim
    ]) ++ (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "r";
        publisher = "REditorSupport";
        version = "2.8.2";
        sha256 = "sha256-FPL/JjW452KRchcQ0iHXRJarZXvS3B8PvZhXjf3rMhQ=";
      }
    ]);
  };
}
