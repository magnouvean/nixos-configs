{ pkgs, ... }:
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
      "editor.lineNumbers" = "relative";
      "vim.useSystemClipboard" = true;
      "workbench.colorTheme" = "Dracula";
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
      "julia.symbolCacheDownload" = true;
      "notebook.formatOnSave.enabled" = true;
      "vim.highlightedyank.enable" = true;
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixpkgs-fmt" ];
          };
        };
      };
    };
  };
}
