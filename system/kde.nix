{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.defaultSession = "plasmawayland";
    displayManager.sddm = {
      theme = "breeze";
      enable = true;
    };
    desktopManager.plasma5.enable = true;
  };
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };
  programs.kdeconnect.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    plasma-pass
  ];
}
