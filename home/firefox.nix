{ pkgs, ... }:
{
  home.file.".mozilla/firefox/nix-user-profile/chrome/firefox-gnome-theme".source =
    pkgs.fetchFromGitHub
      {
        owner = "rafaelmardojai";
        repo = "firefox-gnome-theme";
        rev = "823756d8ddd21cfd3a24a87dad402e490e0eb5ee";
        sha256 = "sha256-lf9MQs8+NUvQd8b5t+7c4kLqUQixGO9WwWcLa1XYuiQ=";
      };

  programs.firefox = {
    enable = true;
    profiles.nix-user-profile = {
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
      '';
      userContent = ''
        @import "firefox-gnome-theme/userContent.css";
      '';
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.uidensity" = 0;
        "svg.context-properties.content.enabled" = true;
        "browser.theme.dark-private-windows" = false;
      };
    };
  };
}
