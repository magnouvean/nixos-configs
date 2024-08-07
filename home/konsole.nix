{ pkgs, ... }:
let
  catppuccin-konsole-themes = pkgs.fetchFromGitHub {
    repo = "konsole";
    owner = "catppuccin";
    rev = "3b64040e3f4ae5afb2347e7be8a38bc3cd8c73a8";
    hash = "sha256-d5+ygDrNl2qBxZ5Cn4U7d836+ZHz77m6/yxTIANd9BU=";
  };
in
{
  programs.konsole = {
    enable = true;
    defaultProfile = "Profile 1";
    customColorSchemes.catppuccin = "${catppuccin-konsole-themes}/themes/catppuccin-mocha.colorscheme";
    profiles = {
      "Profile 1" = {
        colorScheme = "catppuccin";
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
}
