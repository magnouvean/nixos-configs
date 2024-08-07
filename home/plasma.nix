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
          preferredSource = "any";
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
  gtkIniContents = {
    Settings = {
      gtk-icon-theme-name = "Papirus-Dark";
      gtk-theme-name = "Catppuccin-GTK-Dark";
    };
  };
in
{
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    workspace = {
      lookAndFeel = "Catppuccin-Mocha-Blue";
      iconTheme = "Papirus-Dark";
      cursor.theme = "Bibata-Modern-Ice";
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
      "gtk-3.0/settings.ini" = gtkIniContents;
      "gtk-4.0/settings.ini" = gtkIniContents;
      auroraerc.CatppuccinMocha-Modern.ButtonSize = 0;
    };
  };
}
