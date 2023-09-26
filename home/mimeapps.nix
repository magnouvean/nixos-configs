{ ... }:
let
  mimeDefaults = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
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
