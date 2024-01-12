{ pkgs, lib, ... }:
let
  languages = [
    "R"
    "c"
    "godot"
    "haskell"
    "julia"
    "latex"
    "nix"
    "python"
    "rust"
    "scheme"
  ];
  languageToAttrs = lang: {
    "Code/${lang}/shell.nix".source = builtins.toPath ../files/environments/${lang}/shell.nix;
    "Code/${lang}/.envrc".source = ../files/environments/envrc;
    "Code/${lang}/tmp/README.md".source = ../files/environments/README.md;
  };
  languageAttrs = lib.mkMerge (map languageToAttrs languages);

  stignoreFolders = [ "Joplin" "Ebooks" "Music" "Pictures" "Sync" "Videos" ];
  stignoreToAttrs = folder: {
    "${folder}/.stignore".source = ../files/syncthing/stignore;
  };
  stignoreAttrs = lib.mkMerge (map stignoreToAttrs stignoreFolders);
in
{
  imports = [ ./joplin.nix ];
  home.file = lib.mkMerge [{
    ".config/autostart/ferdium.desktop".source = ../files/autostart/ferdium.desktop;
    ".config/MangoHud/MangoHud.conf".source = ../files/mangohud/MangoHud.conf;
    ".config/kitty/kitty.conf".source = ../files/kitty/kitty.conf;
    ".config/godot/editor_settings-4.tres".source =
      ../files/godot/editor_settings-4.tres;
  }
    stignoreAttrs
    languageAttrs];
}
