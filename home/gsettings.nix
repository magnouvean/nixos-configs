{ config, pkgs, lib, ... }: {
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "com.raggesilver.BlackBox.desktop"
        "org.gnome.Nautilus.desktop"
      ];
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "azwallpaper@azwallpaper.gitlab.com"
        "pop-shell@system76.com"
      ];
      disable-user-extensions = false;
    };
    "org/gnome/shell/extensions/azwallpaper" = {
      bing-download-directory =
        "${config.home.homeDirectory}/Pictures/Bing Wallpapers";
      slideshow-directory =
        "${config.home.homeDirectory}/Pictures/Bing Wallpapers";
      slideshow-image-duration = 600;
      bing-wallpaper-download = true;
    };
    "org/gnome/shell/extensions/pop-shell" = {
      activate-launcher = [ ];
      active-hint = true;
      active-hint-border-radius = lib.hm.gvariant.mkUint32 12;
      gap-inner = lib.hm.gvariant.mkUint32 4;
      gap-outer = lib.hm.gvariant.mkUint32 4;
      hint-color-rgba = "rgba(120, 117, 122, 1)";
      pop-monitor-down = [ ];
      pop-monitor-left = [ ];
      pop-monitor-right = [ ];
      pop-monitor-up = [ ];
      pop-workspace-down = [ ];
      pop-workspace-up = [ ];
      tile-by-default = true;
      tile-enter = [ "<Super>a" ];
      tile-orientation = [ ];
      tile-swap-down = [ ];
      tile-swap-left = [ ];
      tile-swap-right = [ ];
      tile-swap-up = [ ];
      toggle-floating = [ "<Super>s" ];
      toggle-stacking = [ ];
      toggle-stacking-global = [ ];
      toggle-tiling = [ ];
    };
    "org/gnome/desktop/input-sources" = {
      sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "no" ]) ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      email = [ ];
      help = [ ];
      home = [ "<Super><Alt>f" ];
      magnifier = [ ];
      magnifier-zoom-in = [ ];
      magnifier-zoom-out = [ ];
      screenreader = [ ];
      screensaver = [ "<Super><Shift>s" ];
      www = [ "<Super><Alt>w" ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
      {
        binding = "<Super><Alt>Return";
        command = "gtk-launch com.raggesilver.BlackBox.desktop";
        name = "Launch terminal";
      };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" =
      {
        binding = "<Super><Alt>e";
        command = "gtk-launch codium.desktop";
        name = "Launch editor";
      };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" =
      {
        binding = "<Super><Alt>c";
        command = "gtk-launch ferdium.desktop";
        name = "Launch mail client";
      };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" =
      {
        binding = "<Super><Alt>g";
        command = "gtk-launch steam.desktop";
        name = "Launch game launcher";
      };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" =
      {
        binding = "<Super><Alt>n";
        command = "gtk-launch com.github.flxzt.rnote.desktop";
        name = "Launch note app";
      };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5" =
      {
        binding = "<Super><Alt>m";
        command = "gtk-launch com.github.neithern.g4music.desktop";
        name = "Launch music player";
      };
    "org/gnome/shell/keybindings" = {
      focus-active-notification = [ ];
      toggle-application-view = [ ];
      toggle-message-tray = [ "<Super>m" ];
      toggle-overview = [ "<Super>r" ];
      switch-to-application-1 = [ ];
      switch-to-application-2 = [ ];
      switch-to-application-3 = [ ];
      switch-to-application-4 = [ ];
      switch-to-application-5 = [ ];
      switch-to-application-6 = [ ];
      switch-to-application-7 = [ ];
      switch-to-application-8 = [ ];
      switch-to-application-9 = [ ];
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-ac-timeout = 900;
      sleep-inactive-battery-type = "suspend";
      sleep-inactive-battery-timeout = 900;
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      minimize = [ ];
      move-to-workspace-1 = [ "<Super><Shift>1" ];
      move-to-workspace-2 = [ "<Super><Shift>2" ];
      move-to-workspace-3 = [ "<Super><Shift>3" ];
      move-to-workspace-4 = [ "<Super><Shift>4" ];
      move-to-workspace-5 = [ "<Super><Shift>5" ];
      move-to-workspace-6 = [ "<Super><Shift>6" ];
      move-to-workspace-7 = [ "<Super><Shift>7" ];
      move-to-workspace-8 = [ "<Super><Shift>8" ];
      move-to-workspace-last = [ ];
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ "<Super><Shift>Tab" ];
      switch-group-backward = [ ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
      switch-to-workspace-6 = [ "<Super>6" ];
      switch-to-workspace-7 = [ "<Super>7" ];
      switch-to-workspace-8 = [ "<Super>8" ];
      toggle-maximized = [ "<Super>f" ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };
    "org/gnome/desktop/wm/preferences" = { button-layout = ":minimize,close"; };
    "org/gnome/mutter" = {
      overlay-key = "";
      workspaces-only-on-primary = false;
    };
    "org/gnome/mutter/keybindings" = {
      switch-monitor = [ ];
      toggle-tiled-left = [ ];
      toggle-tiled-right = [ ];
    };
    "com/raggesilver/BlackBox" = {
      font = "FiraCode Nerd Font 11";
      scrollback-lines = lib.hm.gvariant.mkUint32 10000;
    };
  };
}
