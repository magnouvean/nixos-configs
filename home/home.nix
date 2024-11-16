{ ... }:
{
  imports = [
    ./gnome.nix
    ./mimeapps.nix
    ./vscode.nix
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
