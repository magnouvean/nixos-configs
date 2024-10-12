{ pkgs, ... }:
let
  my-vscode-extensions = with pkgs.vscode-extensions; [
    continue.continue
    github.github-vscode-theme
    jnoortheen.nix-ide
    mkhl.direnv
    ms-dotnettools.csdevkit
    ms-dotnettools.csharp
    ms-dotnettools.vscode-dotnet-runtime
    ms-dotnettools.vscodeintellicode-csharp
    ms-pyright.pyright
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
      "workbench.colorTheme" = "GitHub Dark";
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
    };
  };
}
