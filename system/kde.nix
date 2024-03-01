{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.sddm = {
      theme = "Dracula";
      settings = {
        Theme = {
          CursorTheme = "Bibata-Modern-Classic";
        };
      };
      enable = true;
    };
    desktopManager.plasma6.enable = true;
    xkb.layout = "no";
  };
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };
}
