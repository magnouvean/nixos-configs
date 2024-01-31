{ pkgs, ... }:
let
  catppuccin-sddm = pkgs.stdenv.mkDerivation {
    pname = "sddm-catppuccin";
    name = "sddm-catppuccin";
    version = "2023-12-29";
    dontWrapQtApps = true;
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "sddm";
      rev = "main";
      sha256 = "sha256-Jmc/prRATAbtWvvbNmgl4fPdHNkI7q942+Nf6m2fauk=";
    };
    propagatedBuildInputs = with pkgs.libsForQt5.qt5; [
      qtgraphicaleffects
      qtquickcontrols2
      qtsvg
    ];
    postInstall = ''
      mkdir -p $out/share/sddm/themes
      mv ./src/catppuccin-frappe $out/share/sddm/themes/
      echo "[General]" > $out/share/sddm/themes/catppuccin-frappe/theme.conf.user
      echo "FontSize=11" >> $out/share/sddm/themes/catppuccin-frappe/theme.conf.user
      echo "CustomBackground=\"true\"" >> $out/share/sddm/themes/catppuccin-frappe/theme.conf.user
      echo "Background=\"${pkgs.libsForQt5.plasma-workspace-wallpapers}/share/wallpapers/Shell/contents/images/5120x2880.jpg\"" >> $out/share/sddm/themes/catppuccin-frappe/theme.conf.user
    '';
  };
in
{
  services.xserver = {
    enable = true;
    displayManager.defaultSession = "plasmawayland";
    displayManager.sddm = {
      theme = "catppuccin-frappe";
      settings = {
        General = {
          InputMethod = "";
        };
        Theme = {
          CursorTheme = "Bibata-Modern-Ice";
        };
      };
      enable = true;
    };
    desktopManager.plasma5.enable = true;
    layout = "no";
  };
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };
  programs.kdeconnect.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    # Applications
    k3b

    # Theme
    bibata-cursors
    catppuccin-gtk
    catppuccin-kde
    catppuccin-sddm
    papirus-icon-theme

    # Other
    plasma-pass
  ];
}
