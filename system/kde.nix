{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.defaultSession = "plasmawayland";
    displayManager.sddm = {
      theme = "breeze";
      settings = {
        General = {
          InputMethod = "";
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
  programs.kdeconnect.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    # Other
    plasma-pass
  ];

  system.activationScripts.sddmSetBreezeDark.text = ''
    mkdir -p /var/lib/sddm/.config
    cp ${../files/sddm/plasmarc} /var/lib/sddm/.config/kdeglobals
    cp ${../files/sddm/kdeglobals} /var/lib/sddm/.config/kdeglobals
  '';
}
