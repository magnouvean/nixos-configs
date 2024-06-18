{ ... }:
let
  mimeDefaults = {
    "x-scheme-handler/http" = [ "brave-browser.desktop" ];
    "x-scheme-handler/https" = [ "brave-browser.desktop" ];
  };
in
{
  xdg.mimeApps = {
    enable = true;
    associations.added = mimeDefaults;
    defaultApplications = mimeDefaults;
  };
}
