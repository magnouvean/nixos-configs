{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [ gnome-tour ]) ++
    (with pkgs.gnome; [ cheese gnome-music gedit geary gnome-characters ]);

  environment.systemPackages = with pkgs.gnomeExtensions; [
    pop-shell
    appindicator
  ];
}
