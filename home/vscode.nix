{ pkgs, ... }:
let
  my-vscode-extensions = with pkgs.vscode-extensions; [
    catppuccin.catppuccin-vsc
    jnoortheen.nix-ide
    mkhl.direnv
    ms-vscode-remote.remote-containers
    ms-vscode-remote.remote-ssh
    pkief.material-icon-theme
    pkief.material-product-icons
    streetsidesoftware.code-spell-checker
    vscodevim.vim
  ];
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = my-vscode-extensions;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.codeActionsOnSave" = {
        "source.organizeImports" = "explicit";
      };
      "editor.formatOnSave" = true;
      "editor.lineNumbers" = "relative";
      "vim.useSystemClipboard" = true;
      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "vim.highlightedyank.enable" = true;
      "cSpell.enableFiletypes" = [
        "nix"
      ];
      "github.gitAuthentication" = false;
      "continue.enableTabAutocomplete" = false;
      "workbench.productIconTheme" = "material-product-icons";
      "workbench.iconTheme" = "material-icon-theme";
    };
  };
}
