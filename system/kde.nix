{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "no";
  };
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  environment.systemPackages = with pkgs; [
    caffeine-ng
  ];

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.kate
  ];
}
