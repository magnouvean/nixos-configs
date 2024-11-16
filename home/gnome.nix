{
  pkgs,
  config,
  lib,
  ...
}:
{
  home.packages = with pkgs.gnomeExtensions; [
    appindicator
    wallpaper-slideshow
  ];

  home.file."BingWallpapers/README".text = ''Bing wallpapers are stored in this directory'';

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        icon-theme = "Adwaita";
        gtk-theme = "Adwaita";
      };
      "org/gnome/desktop/wm/keybindings" = {
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-to-workspace-6 = [ "<Super>6" ];
        switch-to-workspace-7 = [ "<Super>7" ];
        switch-to-workspace-8 = [ "<Super>8" ];
      };
      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [ ];
        switch-to-application-2 = [ ];
        switch-to-application-3 = [ ];
        switch-to-application-4 = [ ];
        switch-to-application-5 = [ ];
        switch-to-application-6 = [ ];
        switch-to-application-7 = [ ];
        switch-to-application-8 = [ ];
      };
      "org/gnome/shell" = {
        favorite-apps = [
          "brave-browser.desktop"
          "org.gnome.Console.desktop"
          "code.desktop"
          "com.github.neithern.g4music.desktop"
        ];
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          wallpaper-slideshow.extensionUuid
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
      "org/gnome/desktop/input-sources" = {
        sources = [
          (lib.hm.gvariant.mkTuple [
            "xkb"
            "no"
          ])
        ];
      };
      "org/gnome/shell/extensions/azwallpaper" = {
        bing-download-directory = "${config.home.homeDirectory}/BingWallpapers";
        bing-wallpaper-delete-old = (
          lib.hm.gvariant.mkTuple [
            true
            14
          ]
        );
        bing-wallpaper-download = true;
        slideshow-directory = "${config.home.homeDirectory}/BingWallpapers";
        slideshow-slide-duration = (
          lib.hm.gvariant.mkTuple [
            1
            0
            0
          ]
        );
      };
    };
  };
}
