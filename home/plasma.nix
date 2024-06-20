{ pkgs, ... }:
let
  wallpapers = (import ./wallpapers.nix { inherit pkgs; });
in
{
  programs.konsole = {
    enable = true;
    defaultProfile = "Profile 1";
    profiles = {
      "Profile 1" = {
        font = {
          name = "JetBrains Mono";
          size = 11;
        };
      };
    };
    extraConfig = {
      Default.MenuBar = "Disabled";
      MainWindow.State = "AAAA/wAAAAD9AAAAAQAAAAAAAAAAAAAAAPwCAAAAAvsAAAAcAFMAUwBIAE0AYQBuAGEAZwBlAHIARABvAGMAawAAAAAA/////wAAARUBAAAD+wAAACIAUQB1AGkAYwBrAEMAbwBtAG0AYQBuAGQAcwBEAG8AYwBrAAAAAAD/////AAABfAEAAAMAAAVWAAACqAAAAAQAAAAEAAAACAAAAAj8AAAAAQAAAAIAAAACAAAAFgBtAGEAaQBuAFQAbwBvAGwAQgBhAHIAAAAAAP////8AAAAAAAAAAAAAABwAcwBlAHMAcwBpAG8AbgBUAG8AbwBsAGIAYQByAAAAAAD/////AAAAAAAAAAA=";
    };
  };

  programs.plasma = {
    enable = true;
    overrideConfig = true;
    workspace = {
      colorScheme = "CatppuccinMochaBlue";
      cursor.theme = "Bibata-Modern-Amber";
      wallpaperSlideShow = {
        path = "${wallpapers}/share/wallpapers/";
        interval = 3600;
      };
      splashScreen.theme = "Catppuccin-Mocha-Blue";
    };
    kscreenlocker.wallpaperSlideShow = {
      path = "${wallpapers}/share/wallpapers/";
      interval = 3600;
    };
    kwin = {
      effects.shakeCursor.enable = true;
      virtualDesktops = {
        rows = 2;
        number = 8;
      };
    };
    panels = [
      {
        height = 28;
        location = "top";
        floating = true;
        widgets = [
          {
            name = "org.kde.plasma.kickerdash";
            config.General.icon = "nix-snowflake-white";
          }
          "org.kde.plasma.panelspacer"
          {
            digitalClock = {
              date.position = "besideTime";
              calendar.showWeekNumbers = true;
            };
          }
          "org.kde.plasma.panelspacer"
          {
            systemTray = {
              items = {
                shown = [
                  "org.kde.plasma.battery"
                  "org.kde.plasma.bluetooth"
                  "org.kde.plasma.clipboard"
                  "org.kde.plasma.networkmanagement"
                  "org.kde.plasma.volume"
                ];
                configs.battery.showPercentage = true;
              };
            };
          }
        ];
      }
      {
        height = 50;
        hiding = "dodgewindows";
        location = "bottom";
        floating = true;
        widgets = [
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General.launchers = [
                "applications:brave-browser.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:code.desktop"
                "applications:bitwarden.desktop"
              ];
            };
          }
        ];
      }
    ];
    shortcuts = {
      kwin = {
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Switch to Desktop 6" = "Meta+6";
        "Switch to Desktop 7" = "Meta+7";
        "Switch to Desktop 8" = "Meta+8";
        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+\"";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+¤";
        "Window to Desktop 5" = "Meta+%";
        "Window to Desktop 6" = "Meta+&";
        "Window to Desktop 7" = "Meta+/";
        "Window to Desktop 8" = "Meta+(";
      };
    };
    configFile = {
      kcminputrc."Libinput/2/14/ETPS\\/2 Elantech Touchpad".NaturalScroll = true;
      krunnerrc.General.FreeFloating = true;
      kwinrc."Effect-overview".BorderActivate = 9;
    };
  };
}
