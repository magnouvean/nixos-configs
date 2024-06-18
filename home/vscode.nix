{ pkgs, ... }:
let
  my-vscode-extensions = (with pkgs.vscode-extensions; [
    catppuccin.catppuccin-vsc
    continue.continue
    jnoortheen.nix-ide
    ms-azuretools.vscode-docker
    ms-vscode-remote.remote-containers
    ms-vscode-remote.remote-ssh
    streetsidesoftware.code-spell-checker
    vscodevim.vim
  ]);
in
{
  programs.vscode = {
    enable = true;
    extensions = my-vscode-extensions;
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
      "editor.fontFamily" = "'JetBrains Mono', 'Droid Sans Mono', 'monospace', monospace";
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
      "continue.enableTabAutocomplete" = false;
    };
  };
}
