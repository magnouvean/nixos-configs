{ pkgs, ... }:
let
  catppuccin-konsole = pkgs.fetchFromGitHub {
    repo = "konsole";
    owner = "catppuccin";
    rev = "7d86b8a1e56e58f6b5649cdaac543a573ac194ca";
    sha256 = "sha256-EwSJMTxnaj2UlNJm1t6znnatfzgm1awIQQUF3VPfCTM=";
  };
in
{
  programs.konsole = {
    enable = true;
    defaultProfile = "Profile 1";
    customColorSchemes."Catppuccin-Mocha" = "${catppuccin-konsole}/Catppuccin-Mocha.colorscheme";
    profiles = {
      "Profile 1" = {
        colorScheme = "Catppuccin-Mocha";
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
