{ lib, ... }:
let
  stignoreFolders = [ "Joplin" "Ebooks" "Music" "Pictures" "Sync" "Videos" ];
  stignoreToAttrs = folder: {
    "${folder}/.stignore".source = ../files/syncthing/stignore;
  };
  stignoreAttrs = lib.mkMerge (map stignoreToAttrs stignoreFolders);
in
{
  imports = [ ./joplin.nix ./environments.nix ];
  home.file = lib.mkMerge [{
    ".config/MangoHud/MangoHud.conf".source = ../files/mangohud/MangoHud.conf;
  }
    stignoreAttrs];
}
