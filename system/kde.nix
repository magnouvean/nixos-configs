{ pkgs, ... }:
let
  sddm-breeze-custom = pkgs.stdenv.mkDerivation {
    pname = "sddm-breeze-custom";
    version = "1.0.0";
    dontBuild = true;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes/
      cp -aR ${pkgs.kdePackages.plasma-desktop}/share/sddm/themes/breeze $out/share/sddm/themes/breeze-custom
      chmod +w $out/share/sddm/themes/breeze-custom $out/share/sddm/themes/breeze-custom/theme.conf
      cp -aR ${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Honeywave/contents/images/5120x2880.jpg $out/share/sddm/themes/breeze-custom/background.jpg
      sed -i 's/background=.*/background=background.jpg/g' $out/share/sddm/themes/breeze-custom/theme.conf
    '';
  };
in
{
  services.xserver = {
    enable = true;
    xkb.layout = "no";
  };
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze-custom";
  };
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  environment.systemPackages = with pkgs; [
    caffeine-ng
    kdePackages.sddm-kcm
    sddm-breeze-custom
  ];

  system.activationScripts.sddmSetBreezeDark.text = ''
    mkdir -p /var/lib/sddm/.config
    cp ${../files/sddm/sddm-kdeglobals} /var/lib/sddm/.config/kdeglobals
  '';
}
