{ pkgs, lib, ... }:
let
  vscodeExtensions = [
    "Catppuccin.catppuccin-vsc"
    "Continue.continue"
    "James-Yu.latex-workshop"
    "REditorSupport.r"
    "geequlim.godot-tools"
    "haskell.haskell"
    "jnoortheen.nix-ide"
    "julialang.language-julia"
    "mkhl.direnv"
    "ms-pyright.pyright"
    "ms-python.black-formatter"
    "ms-python.isort"
    "ms-python.python"
    "ms-toolsai.jupyter"
    "streetsidesoftware.code-spell-checker"
    "sumneko.lua"
    "vscodevim.vim"
  ];
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
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
      "[r]" = {
        "editor.tabSize" = 2;
      };
      "[rmd]" = {
        "editor.tabSize" = 2;
      };
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "terminal.integrated.commandsToSkipShell" = [
        "language-julia.interrupt"
      ];
    };
  };

  home.activation.vscodiumPluginInstall = (lib.hm.dag.entryAfter [ "writeBoundary" ]
    (lib.concatStringsSep "\n" (map (e: "$DRY_RUN_CMD ${pkgs.vscodium}/bin/codium --install-extension ${e}") vscodeExtensions)));
}
