{ ... }:
{
  imports = [
    ./konsole.nix
    ./mimeapps.nix
    ./neovim.nix
    ./vscodium.nix
    ./plasma.nix
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

  home.stateVersion = "24.05";
}
