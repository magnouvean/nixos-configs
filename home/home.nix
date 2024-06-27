{ ... }:
{
  imports = [
    ./konsole.nix
    ./mimeapps.nix
    ./plasma.nix
    ./vscode.nix
    ./zsh.nix
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  # Syncing
  services.syncthing.enable = true;

  home.stateVersion = "24.05";
}
