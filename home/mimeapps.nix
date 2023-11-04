{ ... }:
let
  mimeDefaults = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
    "image/jpeg" = [ "org.gnome.eog.desktop" ];
    "image/png" = [ "org.gnome.eog.desktop" ];
    "image/svg+xml" = [ "org.gnome.eog.desktop" ];
    "image/webp" = [ "org.gnome.eog.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
in {
  xdg.mimeApps = {
    enable = true;
    associations.added = mimeDefaults;
    defaultApplications = mimeDefaults;
  };
}
