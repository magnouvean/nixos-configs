{ pkgs, ... }:
let
  sddm-breeze-custom = pkgs.stdenv.mkDerivation {
    pname = "sddm-breeze-custom";
    version = "1.0.0";
    dontBuild = true;
    dontUnpack = true;
    src = pkgs.fetchurl {
      url = "https://images.pexels.com/photos/2860804/pexels-photo-2860804.jpeg";
      sha256 = "sha256-XPNlKvuZceluh2qp+oDcTDIhj7QyU1mHqg4Nnctbn8s=";
    };
    installPhase = ''
      mkdir -p $out/share/sddm/themes/
      cp -aR ${pkgs.kdePackages.plasma-workspace}/share/sddm/themes/breeze $out/share/sddm/themes/breeze-custom
      chmod +w $out/share/sddm/themes/breeze-custom $out/share/sddm/themes/breeze-custom/theme.conf
      cp -aR $src $out/share/sddm/themes/breeze-custom/background.jpeg
      sed -i 's/background=.*/background=background.jpeg/g' $out/share/sddm/themes/breeze-custom/theme.conf
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
