{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = (with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      haskell.haskell
      james-yu.latex-workshop
      jnoortheen.nix-ide
      mkhl.direnv
      ms-pyright.pyright
      ms-python.black-formatter
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
      {
        name = "language-julia";
        publisher = "julialang";
        version = "1.66.2";
        sha256 = "sha256-CsrVmDOcozZ/8OV+r5SUi86LZMyQDqNk0Makmq3ayBk=";
      }
      {
        name = "godot-tools";
        publisher = "geequlim";
        version = "1.3.1";
        sha256 = "sha256-wJICDW8bEBjilhjhoaSddN63vVn6l6aepPtx8VKTdZA=";
      }
    ]);
    userSettings = {
      "editor.codeActionsOnSave" = {
        "source.organizeImports" = "explicit";
      };
      "notebook.codeActionsOnSave" = {
        "source.organizeImports" = "explicit";
      };
      "editor.formatOnSave" = true;
      "vim.useSystemClipboard" = true;
      "workbench.colorTheme" = "Catppuccin Frappé";
      "workbench.startupEditor" = "none";
      "editor.fontFamily" = "'FiraCode Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
      };
    };
  };
}
