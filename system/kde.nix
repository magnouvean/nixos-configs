{ pkgs, ... }:
let
  sddm-breeze-custom = pkgs.stdenv.mkDerivation {
    pname = "sddm-breeze-custom";
    version = "1.0.0";
    dontBuild = true;
    dontUnpack = true;
    src = pkgs.fetchurl {
      url = "https://images.pexels.com/photos/163848/road-mountains-sunset-path-163848.jpeg";
      hash = "sha256-1pLDjQfimAhA/mKE2yldDXRpFP7kEJE3A6lP1S3JKuU=";
    };
    installPhase = ''
      mkdir -p $out/share/sddm/themes/
      cp -aR ${pkgs.kdePackages.plasma-desktop}/share/sddm/themes/breeze $out/share/sddm/themes/breeze-custom
      chmod +w $out/share/sddm/themes/breeze-custom $out/share/sddm/themes/breeze-custom/theme.conf
      cp -aR $src $out/share/sddm/themes/breeze-custom/background.jpg
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

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.kate
  ];

  system.activationScripts.sddmSetBreezeDark.text = ''
    if [ -d /var/lib/sddm/.config ]; then rm -rf /var/lib/sddm/.config; fi
    mkdir -p /var/lib/sddm/.config
    cp ${../files/sddm/sddm-kdeglobals} /var/lib/sddm/.config/kdeglobals
    cp ${../files/sddm/sddm-kcminputrc} /var/lib/sddm/.config/kcminputrc
  '';
}
