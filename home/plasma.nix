{ pkgs, ... }:
let
  konsole-themes = pkgs.fetchFromGitHub
    {
      owner = "catppuccin";
      repo = "konsole";
      rev = "master";
      sha256 = "sha256-EwSJMTxnaj2UlNJm1t6znnatfzgm1awIQQUF3VPfCTM=";
    };
in
{
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    workspace = {
      clickItemTo = "select";
      lookAndFeel = "org.kde.breezedark.desktop";
      colorScheme = "CatppuccinFrappeBlue";
      cursorTheme = "Bibata-Modern-Ice";
      iconTheme = "Papirus-Dark";
      wallpaper = "${pkgs.libsForQt5.plasma-workspace-wallpapers}/share/wallpapers/Patak";
    };
    shortcuts = {
      "kwin"."Switch to Desktop 1" = "Meta+1";
      "kwin"."Switch to Desktop 2" = "Meta+2";
      "kwin"."Switch to Desktop 3" = "Meta+3";
      "kwin"."Switch to Desktop 4" = "Meta+4";
      "kwin"."Switch to Desktop 5" = "Meta+5";
      "kwin"."Switch to Desktop 6" = "Meta+6";
      "kwin"."Switch to Desktop 7" = "Meta+7";
      "kwin"."Switch to Desktop 8" = "Meta+8";
      "kwin"."Window to Desktop 1" = "Meta+!";
      "kwin"."Window to Desktop 2" = "Meta+\"";
      "kwin"."Window to Desktop 3" = "Meta+#";
      "kwin"."Window to Desktop 4" = "Meta+¤";
      "kwin"."Window to Desktop 5" = "Meta+%";
      "kwin"."Window to Desktop 6" = "Meta+&";
      "kwin"."Window to Desktop 7" = "Meta+/";
      "kwin"."Window to Desktop 8" = "Meta+(";
    };
    dataFile = {
      "konsole/Profile 1.profile" = {
        "Appearance"."ColorScheme" = "Catppuccin-Frappe";
        "Appearance"."Font" = "FiraCode Nerd Font,11,-1,5,50,0,0,0,0,0";
        "Scrolling"."HistorySize" = 10000;
      };
    };
    configFile = {
      "krunnerrc"."General"."FreeFloating" = true;
      "kwinrc"."Desktops"."Number" = 8;
      "kwinrc"."Desktops"."Rows" = 2;
      "kwinrc"."Tiling"."padding" = 6;
      "konsolerc"."Default"."MenuBar" = "Disabled";
      "konsolerc"."Desktop Entry"."DefaultProfile" = "Profile 1.profile";
    };
  };

  home.file = {
    ".local/share/konsole/Catppuccin-Latte.colorscheme".source = "${konsole-themes}/Catppuccin-Latte.colorscheme";
    ".local/share/konsole/Catppuccin-Frappe.colorscheme".source = "${konsole-themes}/Catppuccin-Frappe.colorscheme";
  };
}
