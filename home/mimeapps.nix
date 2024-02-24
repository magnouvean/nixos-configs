{ ... }:
let
  mimeDefaults = {
    "x-scheme-handler/http" = [ "brave-desktop.desktop" ];
    "x-scheme-handler/https" = [ "brave-desktop.desktop" ];
  };
in
{
  xdg.mimeApps = {
    enable = true;
    associations.added = mimeDefaults;
    defaultApplications = mimeDefaults;
  };
}
