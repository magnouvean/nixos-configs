{ pkgs, ... }:
let
  my-vscode-extensions = (with pkgs.vscode-extensions; [
    continue.continue
    dracula-theme.theme-dracula
    james-yu.latex-workshop
    jnoortheen.nix-ide
    mkhl.direnv
    ms-pyright.pyright
    ms-python.isort
    ms-python.python
    ms-toolsai.jupyter
    streetsidesoftware.code-spell-checker
    vscodevim.vim
  ]) ++
  (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "r";
      publisher = "REditorSupport";
      version = "2.8.2";
      sha256 = "sha256-FPL/JjW452KRchcQ0iHXRJarZXvS3B8PvZhXjf3rMhQ=";
    }
    {
      name = "language-julia";
      publisher = "julialang";
      version = "1.73.2";
      sha256 = "sha256-v6yOWWqqadkfBhY5GUGNfWfdsQ1Q8dX3J9AVMUdMy9E=";
    }
  ]);
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = my-vscode-extensions;
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
      "python.terminal.launchArgs" = [
        "-m"
        "IPython"
        "--no-autoindent"
      ];
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
