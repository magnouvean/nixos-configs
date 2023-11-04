{ config, pkgs, ... }: {
  imports = [
    ./dotfiles.nix
    ./gsettings.nix
    ./mimeapps.nix
    ./neovim.nix
    ./vscodium.nix
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  # Direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Shell
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    initExtra = ''
      ${builtins.readFile ../files/zsh/zshrc}
    '';
  };

  # Syncing
  services.syncthing.enable = true;

  home.stateVersion = "23.05";
}
