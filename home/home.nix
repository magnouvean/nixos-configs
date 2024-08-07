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

  xdg.configFile."autostart/caffeine.desktop".source = ../files/autostart/caffeine;

  # Direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Syncing
  services.syncthing.enable = true;

  home.stateVersion = "24.05";
}
