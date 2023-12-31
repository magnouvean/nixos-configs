{ pkgs, ... }: {
  imports = [ ./joplin.nix ];
  home.file = {
    ".config/autostart/ferdium.desktop".source = ../files/autostart/ferdium.desktop;
    ".config/godot/editor_settings-4.tres".source =
      ../files/godot/editor_settings-4.tres;

    "Ebooks/.stignore".source = ../files/syncthing/stignore;
    "Joplin/.stignore".source = ../files/syncthing/stignore;
    "Music/.stignore".source = ../files/syncthing/stignore;
    "Pictures/.stignore".source = ../files/syncthing/stignore;
    "Sync/.stignore".source = ../files/syncthing/stignore;
    "Videos/.stignore".source = ../files/syncthing/stignore;

    "Code/R/shell.nix".source = ../files/environments/R/shell.nix;
    "Code/c/shell.nix".source = ../files/environments/c/shell.nix;
    "Code/haskell/shell.nix".source = ../files/environments/haskell/shell.nix;
    "Code/julia/shell.nix".source = ../files/environments/julia/shell.nix;
    "Code/latex/shell.nix".source = ../files/environments/latex/shell.nix;
    "Code/nix/shell.nix".source = ../files/environments/nix/shell.nix;
    "Code/python/shell.nix".source = ../files/environments/python/shell.nix;
    "Code/rust/shell.nix".source = ../files/environments/rust/shell.nix;
    "Code/scheme/shell.nix".source = ../files/environments/scheme/shell.nix;

    "Code/R/.envrc".source = ../files/environments/envrc;
    "Code/c/.envrc".source = ../files/environments/envrc;
    "Code/haskell/.envrc".source = ../files/environments/envrc;
    "Code/julia/.envrc".source = ../files/environments/envrc;
    "Code/latex/.envrc".source = ../files/environments/envrc;
    "Code/nix/.envrc".source = ../files/environments/envrc;
    "Code/python/.envrc".source = ../files/environments/envrc;
    "Code/rust/.envrc".source = ../files/environments/envrc;
    "Code/scheme/.envrc".source = ../files/environments/envrc;

    "Code/R/tmp/README.md".source = ../files/environments/README.md;
    "Code/c/tmp/README.md".source = ../files/environments/README.md;
    "Code/julia/tmp/README.md".source = ../files/environments/README.md;
    "Code/latex/tmp/README.md".source = ../files/environments/README.md;
    "Code/misc/tmp/README.md".source = ../files/environments/README.md;
    "Code/nix/tmp/README.md".source = ../files/environments/README.md;
    "Code/python/tmp/README.md".source = ../files/environments/README.md;
    "Code/rust/tmp/README.md".source = ../files/environments/README.md;
    "Code/scheme/tmp/README.md".source = ../files/environments/README.md;

    "Containers/README.md".source = ../files/containers/README.md;
  };
}
