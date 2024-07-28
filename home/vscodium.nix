{ pkgs, ... }:
let
  my-vscode-extensions = with pkgs.vscode-extensions; [
    continue.continue
    github.github-vscode-theme
    jnoortheen.nix-ide
    mkhl.direnv
    ms-pyright.pyright
    ms-python.black-formatter
    ms-python.isort
    streetsidesoftware.code-spell-checker
    vscodevim.vim
  ];
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = my-vscode-extensions;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.codeActionsOnSave" = {
        "source.organizeImports" = "explicit";
      };
      "editor.formatOnSave" = true;
      "editor.lineNumbers" = "relative";
      "vim.useSystemClipboard" = true;
      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "GitHub Dark Default";
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "vim.highlightedyank.enable" = true;
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixpkgs-fmt" ];
          };
        };
      };
      "cSpell.enableFiletypes" = [
        "nix"
      ];
      "github.gitAuthentication" = false;
      "continue.enableTabAutocomplete" = false;
    };
  };
}
