{ pkgs, ... }:
let
  dracula-konsole = pkgs.fetchFromGitHub {
    repo = "konsole";
    owner = "dracula";
    rev = "030486c75f12853e9d922b59eb37c25aea4f66f4";
    sha256 = "sha256-siMSZ6ylw/C4aX9Iv7jNmuT1hgJPtuf6o25VwQWlbYg=";
  };
in
{
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    workspace = {
      clickItemTo = "select";
      colorScheme = "Dracula";
      cursorTheme = "Bibata-Modern-Classic";
      iconTheme = "candy-icons";
      lookAndFeel = "Dracula";
      wallpaper = "${pkgs.libsForQt5.plasma-workspace-wallpapers}/share/wallpapers/Patak";
    };
    panels = [
      {
        height = 34;
        location = "bottom";
        widgets = [
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General.launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:brave-browser.desktop"
                "applications:nvim.desktop"
                "applications:@joplinapp-desktop.desktop"
              ];
            };
          }
          "org.kde.plasma.marignsseperator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];
    shortcuts = {
      kwin = {
        "Switch to Desktop 1[$i]" = "Meta+1";
        "Switch to Desktop 2[$i]" = "Meta+2";
        "Switch to Desktop 3[$i]" = "Meta+3";
        "Switch to Desktop 4[$i]" = "Meta+4";
        "Switch to Desktop 5[$i]" = "Meta+5";
        "Switch to Desktop 6[$i]" = "Meta+6";
        "Switch to Desktop 7[$i]" = "Meta+7";
        "Switch to Desktop 8[$i]" = "Meta+8";
        "Window to Desktop 1[$i]" = "Meta+!";
        "Window to Desktop 2[$i]" = "Meta+\"";
        "Window to Desktop 3[$i]" = "Meta+#";
        "Window to Desktop 4[$i]" = "Meta+¤";
        "Window to Desktop 5[$i]" = "Meta+%";
        "Window to Desktop 6[$i]" = "Meta+&";
        "Window to Desktop 7[$i]" = "Meta+/";
        "Window to Desktop 8[$i]" = "Meta+(";
      };
    };
    dataFile = {
      "konsole/Profile 1.profile" = {
        "Appearance"."ColorScheme" = "Dracula";
        "Appearance"."Font" = "FiraCode Nerd Font,11,-1,5,50,0,0,0,0,0";
        "General"."Name" = "Profile 1";
        "General"."Parent" = "FALLBACK/";
        "Scrolling"."HistorySize" = 10000;
      };
    };
    configFile = {
      "krunnerrc"."General"."FreeFloating" = true;
      "kwinrc"."Desktops"."Number" = 8;
      "kwinrc"."Desktops"."Rows" = 2;
      "konsolerc"."Default"."MenuBar" = "Disabled";
      "konsolerc"."Desktop Entry"."DefaultProfile" = "Profile 1.profile";
      "konsolerc"."MainWindow"."State" = "AAAA/wAAAAD9AAAAAQAAAAAAAAAAAAAAAPwCAAAAAvsAAAAcAFMAUwBIAE0AYQBuAGEAZwBlAHIARABvAGMAawAAAAAA/////wAAARUBAAAD+wAAACIAUQB1AGkAYwBrAEMAbwBtAG0AYQBuAGQAcwBEAG8AYwBrAAAAAAD/////AAABfAEAAAMAAAVWAAACqAAAAAQAAAAEAAAACAAAAAj8AAAAAQAAAAIAAAACAAAAFgBtAGEAaQBuAFQAbwBvAGwAQgBhAHIAAAAAAP////8AAAAAAAAAAAAAABwAcwBlAHMAcwBpAG8AbgBUAG8AbwBsAGIAYQByAAAAAAD/////AAAAAAAAAAA=";
      "gtk-3.0/settings.ini"."Settings"."gtk-theme-name" = "Dracula";
      "gtk-4.0/settings.ini"."Settings"."gtk-theme-name" = "Dracula";
    };
  };

  # Konsole colorscheme
  home.file.".local/share/konsole/Dracula.colorscheme".source = "${dracula-konsole}/Dracula.colorscheme";
}
