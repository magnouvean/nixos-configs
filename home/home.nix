{ config, pkgs, ... }: {
  imports = [
    ./dotfiles.nix
    ./git.nix
    ./mimeapps.nix
    ./plasma.nix
    ./vscodium.nix
    ./zsh.nix
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  # Direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Syncing
  services.syncthing.enable = true;

  home.stateVersion = "23.05";
}
