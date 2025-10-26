{ ... }:
let
  topPanel = {
    height = 28;
    screen = "all";
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
        plasmusicToolbar = {
          panelIcon.albumCover = {
            useAsIcon = true;
            radius = 2;
          };
          musicControls.showPlaybackControls = false;
        };
      }
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
            hidden = [ "org.kde.plasma.mediacontroller" ];
            configs.battery.showPercentage = true;
          };
        };
      }
    ];
  };
in
{
  programs.konsole = {
    enable = true;
    defaultProfile = "Profile 1";
    profiles = {
      "Profile 1" = {
        font = {
          name = "JetBrainsMono Nerd Font";
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
      lookAndFeel = "org.kde.breezedark.desktop";
      wallpaperPictureOfTheDay.provider = "bing";
    };
    kscreenlocker.appearance = {
      alwaysShowClock = false;
      showMediaControls = false;
      wallpaperPictureOfTheDay.provider = "bing";
    };
    input = {
      touchpads = [
        {
          enable = true;
          name = "ETPS/2 Elantech Touchpad";
          vendorId = "0002";
          productId = "000e";
          naturalScroll = true;
        }
      ];
      keyboard = {
        repeatRate = 30.0;
        repeatDelay = 200;
      };
    };
    kwin = {
      effects.shakeCursor.enable = true;
      virtualDesktops = {
        rows = 2;
        number = 8;
      };
      cornerBarrier = false;
      edgeBarrier = 0;
    };
    powerdevil = {
      AC = {
        powerButtonAction = "sleep";
      };
      battery = {
        powerButtonAction = "sleep";
      };
    };
    panels = [
      topPanel
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
      krunnerrc.General.FreeFloating = true;
      kwinrc."Effect-overview".BorderActivate = 9;
      "onlyoffice/DesktopEditors.conf".General.UITheme = "theme-dark";
    };
  };
}
