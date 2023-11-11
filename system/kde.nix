{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };
}
