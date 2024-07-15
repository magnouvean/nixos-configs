{ pkgs, ... }:
let
  my-vscode-extensions = (with pkgs.vscode-extensions; [
    github.github-vscode-theme
    jnoortheen.nix-ide
    mkhl.direnv
    ms-dotnettools.csharp
    ms-pyright.pyright
    ms-python.black-formatter
    ms-python.isort
    streetsidesoftware.code-spell-checker
    vscodevim.vim
  ]) ++ (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "vscode-dotnet-runtime";
      publisher = "ms-dotnettools";
      version = "2.0.9";
      hash = "sha256-hbg6HQWkmEa7F5Wk2JKXpLVXHrnGKfu02uRjwjhJ50k=";
    }
  ]
  );
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
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
      "continue.enableTabAutocomplete" = false;
    };
  };
}
