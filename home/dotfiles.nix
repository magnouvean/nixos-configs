{ pkgs, ... }: {
  home.file = {
    ".config/git/config".source = ../files/git/config;
    ".config/zathura/zathurarc".source = ../files/zathura/zathurarc;
    ".config/godot/editor_settings-4.tres".source = ../files/godot/editor_settings-4.tres;

    "Sync/.stignore".source = ../files/syncthing/stignore;

    "Code/R/shell.nix".source = ../files/environments/R/shell.nix;
    "Code/c/shell.nix".source = ../files/environments/c/shell.nix;
    "Code/julia/shell.nix".source = ../files/environments/julia/shell.nix;
    "Code/latex/shell.nix".source = ../files/environments/latex/shell.nix;
    "Code/nix/shell.nix".source = ../files/environments/nix/shell.nix;
    "Code/python/shell.nix".source = ../files/environments/python/shell.nix;
    "Code/rust/shell.nix".source = ../files/environments/rust/shell.nix;
    "Code/scheme/shell.nix".source = ../files/environments/scheme/shell.nix;

    "Code/R/.envrc".source = ../files/environments/envrc;
    "Code/c/.envrc".source = ../files/environments/envrc;
    "Code/julia/.envrc".source = ../files/environments/envrc;
    "Code/latex/.envrc".source = ../files/environments/envrc;
    "Code/nix/.envrc".source = ../files/environments/envrc;
    "Code/python/.envrc".source = ../files/environments/envrc;
    "Code/rust/.envrc".source = ../files/environments/envrc;
    "Code/scheme/.envrc".source = ../files/environments/envrc;

    "Code/R/tmp/README.org".source = ../files/environments/README.org;
    "Code/c/tmp/README.org".source = ../files/environments/README.org;
    "Code/julia/tmp/README.org".source = ../files/environments/README.org;
    "Code/latex/tmp/README.org".source = ../files/environments/README.org;
    "Code/misc/tmp/README.org".source = ../files/environments/README.org;
    "Code/nix/tmp/README.org".source = ../files/environments/README.org;
    "Code/python/tmp/README.org".source = ../files/environments/README.org;
    "Code/rust/tmp/README.org".source = ../files/environments/README.org;
    "Code/scheme/tmp/README.org".source = ../files/environments/README.org;
  };
}
