{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.defaultSession = "plasmawayland";
    displayManager.sddm = {
      theme = "Dracula";
      settings = {
        Theme = {
          CursorTheme = "Bibata-Modern-Classic";
        };
      };
      enable = true;
    };
    desktopManager.plasma5.enable = true;
    xkb.layout = "no";
  };
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };
}
