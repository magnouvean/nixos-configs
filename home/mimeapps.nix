{ ... }:
let
  mimeDefaults = {
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
    "text/markdown" = [ "neovide.desktop" ];
  };
in
{
  xdg.mimeApps = {
    enable = true;
    associations.added = mimeDefaults;
    defaultApplications = mimeDefaults;
  };
}
