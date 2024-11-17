{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    geary
    gnome-calendar
    gnome-music
    xterm
  ];

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
}
